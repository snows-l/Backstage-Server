/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-15 14:29:31
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-23 20:15:10
 * @FilePath: /webseteUI/Server/src/router/music.js
 */
const express = require('express');
const db = require('../../utils/connDB');
const router = express.Router();
const { generateToken, verifyToken } = require('../../utils/handleToken');
const XLSX = require('xlsx');
const XlsxPopulate = require('xlsx-populate');
const Excel = require('exceljs');
const fs = require('fs');
const axios = require('axios');
const moment = require('moment');
const path = require('path');

// 获取音乐列表
router.get('/musics/list', async (req, res) => {
  let { page, size, title, type, isUnPage = true } = req.query;
  let offset = (page - 1) * size;

  let sql = `SELECT * FROM musics WHERE 1=1 ${title ? `AND title LIKE '%${title}%'` : ''} ${type ? `AND type = '${type}'` : ''} ${
    !isUnPage || isUnPage == 'false' ? `ORDER BY id DESC` : `ORDER BY id DESC LIMIT ${size} OFFSET ${offset}`
  }`;
  let lensql = `SELECT count('id') as total FROM musics WHERE 1=1 ${title ? `AND title LIKE '%${title}%'` : ''} ${type ? `AND type = '${type}'` : ''}`;

  const params = [0];
  db.queryAsync(lensql, []).then(lenRes => {
    const total = lenRes.results[0]['total'];
    db.queryAsync(sql, params).then(ress => {
      res.send({
        code: 200,
        data: ress.results,
        total: total,
        msg: '获取成功'
      });
    });
  });
});

// 新增收入
router.post('/musics/add', async (req, res) => {
  const token = req.headers.authorization.split(' ')[1];
  try {
    const user = verifyToken(token);
    if (!user) {
      return res.send({
        code: 401,
        data: null,
        msg: '请先登录'
      });
    }
    const { title, artist, src, cover, remark, type } = req.body;
    const sql = `INSERT INTO musics (title, artist, src, cover, remark, cretor, type, create_time) VALUES ('${title}', '${artist}', '${src}', '${cover}', '${remark}', '${user.user_name}', '${type}', ?);`;
    const params = [new Date()];
    db.queryAsync(sql, params).then(ress => {
      res.send({
        code: 200,
        data: null,
        msg: '新增成功'
      });
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '新增失败'
    });
  }
});

// 修改收入
router.put('/musics/edit', async (req, res) => {
  const { id, title, artist, src, cover, remark, type } = req.body;
  const sql = `UPDATE musics SET title = '${title}', artist = '${artist}', src = '${src}', cover = '${cover}', remark = '${remark}', type = '${type}', update_time = ? WHERE id = ${id}`;
  const params = [new Date()];
  db.queryAsync(sql, [params]).then(ress => {
    res.send({
      code: 200,
      data: null,
      msg: '修改成功'
    });
  });
});

// 删除收入
router.delete('/musics/del/:id', async (req, res) => {
  const { id } = req.params;
  const sql = `DELETE from musics  WHERE id = ${id}`;
  db.queryAsync(sql).then(ress => {
    res.send({
      code: 200,
      data: null,
      msg: '删除成功'
    });
  });
});

// 导出
router.get('/musics/export', async (req, res) => {
  let { eDate, sDate, source, includePic } = req.query;
  let sql = `SELECT * FROM musics`;
  if (eDate && sDate) {
    sql += ` WHERE date >= '${sDate}-01' AND date <= '${eDate}-28'`;
  }
  if (source) {
    sql += ` ${eDate && sDate ? 'AND' : 'WHERE'}  source = '${source}'`;
  }
  sql += ` ${(eDate && sDate) || source ? 'and' : 'where'} del_flag = ? ORDER BY date DESC`;
  const params = [0];
  try {
    db.queryAsync(sql, params).then(ress => {
      const data = ress.results;
      dictSql = `select* from sys_dict where dictType = 'musics_source' and pid <> 0 order by sort ASC;`;
      db.queryAsync(dictSql).then(async dictRes => {
        const dictData = dictRes.results;
        // 处理就职于字典
        data.forEach(item => {
          item.sourceStr = dictData.find(dict => dict.value === item.source).label;
        });
        /**
         * 使用 XLSX 库导出excel文件 支持普通的xlsx格式
         */
        // 将数据转换为工作表
        // const ws = XLSX.utils.json_to_sheet(data);
        // // 创建工作簿并添加工作表
        // const wb = XLSX.utils.book_new();
        // XLSX.utils.book_append_sheet(wb, ws, '收入');
        // //生成Excel文件的二进制数据
        // const excelBuffer = XLSX.write(wb, {
        //   type: 'buffer',
        //   bookType: 'xlsx'
        // });
        // const realName = encodeURI('收入报表.xlsx', 'GBK').toString('iso8859-1');
        // // 设置响应头
        // res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        // res.setHeader('Content-Disposition', 'attachment; filename=' + realName);
        // // 发送Excel文件
        // res.send(excelBuffer);

        /**
         * 使用 exceljs 库导出excel文件
         */
        // 下载图片并保存到临时文件
        const downloadImage = async (url, filePath) => {
          const response = await axios.get(url, { responseType: 'arraybuffer' });
          fs.writeFileSync(filePath, response.data);
        };

        const workbook = new Excel.Workbook();
        const worksheet = workbook.addWorksheet('收入明细');
        // 设置表头
        // worksheet.addRow(['标题', '月份', '收入金额', '备注', '收入截图']);
        let baseTableTitle = [
          { header: '标题', key: 'title', width: 20 },
          { header: '月份', key: 'date', width: 12 },
          { header: '收入金额（元）', key: 'money', width: 16 },
          { header: '就职于', key: 'source', width: 12 },
          { header: '备注', key: 'remark', width: 24 }
        ];
        if (includePic == 'true') {
          baseTableTitle.push({ header: '收入截图', key: 'pic', width: 16 });
        }

        worksheet.columns = baseTableTitle;
        // 循环写入数据
        data.forEach(async (item, index) => {
          const rowData = worksheet.addRow([item.title, item.date, item.money, item.sourceStr, item.remark]);
          // 指定行高
          rowData.height = 50;
        });

        // 插入图片
        if (includePic == 'true') {
          for (let i = 0; i < data.length; i++) {
            // 插入图片到Excel
            const imageId = workbook.addImage({
              filename: '../public' + data[i].pic, // 图片路径 不能出现中文名字
              extension: 'jpeg'
            });
            // E代表第5列，i+2代表第i+2行，E${i+2}:E${i+2}代表第i+2行第5
            worksheet.addImage(imageId, `F${i + 2}:F${i + 2}`);
          }
        }

        const buffer = await workbook.xlsx.writeBuffer();
        // 处理中文文件名
        const realName = encodeURI('收入报表.xlsx', 'GBK').toString('iso8859-1');
        // 设置响应头
        res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        res.setHeader('Content-Disposition', 'attachment; filename=' + realName);
        // 发送Excel文件
        res.send(buffer);
      });
    });
  } catch (error) {
    return res.send({
      code: 500,
      data: null,
      msg: '导出失败'
    });
  }
});

module.exports = router;
