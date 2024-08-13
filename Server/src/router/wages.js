/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-15 14:29:31
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-25 19:21:20
 * @FilePath: /webseteUI/Server/src/router/wages.js
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

// 获取收入列表
router.get('/wages/list', async (req, res) => {
  let token = req.headers.authorization && req.headers.authorization.split(' ')[1];

  let { page, size, source, eDate, sDate } = req.query;
  let offset = (page - 1) * size;

  let sql = `SELECT * FROM wages`;
  let lensql = `SELECT count('id') FROM wages`;
  let sumSql = `SELECT SUM(money) as sum FROM wages`;
  if (eDate && sDate) {
    sql += ` WHERE date >= '${sDate}-01 00:00:00' AND date <= '${eDate}-28 23:59:59'`;
    lensql += ` WHERE date >= '${sDate}-01 00:00:00' AND date <= '${eDate}-28 23:59:59'`;
    sumSql += ` WHERE date >= '${sDate}-01 00:00:00' AND date <= '${eDate}-28 23:59:59'`;
  }
  if (source) {
    sql += ` ${eDate && sDate ? 'AND' : 'WHERE'}  source = '${source}'`;
    lensql += ` ${eDate && sDate ? 'AND' : 'WHERE'} source= '${source}'`;
    sumSql += ` ${eDate && sDate ? 'AND' : 'WHERE'} source= '${source}'`;
  }

  let selectSql = `${sql} ${(eDate && sDate) || source ? 'and' : 'where'} del_flag = ? ORDER BY date DESC LIMIT ${size} OFFSET ${offset} `;
  let selectLenSql = `${lensql} ${(eDate && sDate) || source ? 'and' : 'where'} del_flag = ?`;
  let selectSumSql = `${sumSql} ${(eDate && sDate) || source ? 'and' : 'where'} del_flag = ?`;
  const params = [0];
  try {
    db.queryAsync(selectLenSql, params).then(lensRes => {
      db.queryAsync(selectSql, params).then(wagesRes => {
        db.queryAsync(selectSumSql, params).then(sumRes => {
          let data = wagesRes.results;
          let total = lensRes.results[0]["count('id')"];
          let sum = sumRes.results[0]['sum'];
          // 处理就职于字典
          if (!token) {
            res.send({
              code: 200,
              data,
              msg: '获取成功',
              total,
              sum
            });
          } else {
            const user = verifyToken(token);
            if (user.role_key !== 'admin') {
              data.forEach(item => {
                item.title = '不准偷看金额'; // 隐藏标题
                item.date = moment().format('YYYY-MM-DD HH:mm:ss'); // 隐藏日期
                item.money = '******'; // 隐藏金额
                item.pic = '/imgs/wages/oneyi.png'; // 隐藏图片
                item.remark = '隐私信息不能偷看哟'; // 隐藏备注
              });
              sum = 100000000; // 隐藏金额
            }
            res.send({
              code: 200,
              data,
              msg: '获取成功',
              total,
              sum
            });
          }
        });
      });
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '获取失败'
    });
  }
});

// 新增收入
router.post('/wages/add', async (req, res) => {
  const { title, money, date, pic, source, remark } = req.body;
  let time = moment().format('HH:MM:ss');
  const sql = `INSERT INTO wages (title, money, date, pic, source, remark, del_flag, create_time) VALUES ('${title}', '${money}', '${date}-15 ${time}', '${pic}', '${source}', '${remark}', ?, ?);`;
  const params = [0, new Date()];
  db.queryAsync(sql, params).then(ress => {
    res.send({
      code: 200,
      data: null,
      msg: '新增成功'
    });
  });
});

// 修改收入
router.put('/wages/edit', async (req, res) => {
  let time = moment().format('HH:MM:ss');
  const { id, title, money, date, pic, source, remark } = req.body;
  const sql = `UPDATE wages SET title = '${title}', money = '${money}', date = '${date}-15 ${time}', pic = '${pic}', source = '${source}', remark = '${remark}' WHERE id = ${id}`;
  db.queryAsync(sql).then(ress => {
    res.send({
      code: 200,
      data: null,
      msg: '修改成功'
    });
  });
});

// 删除收入
router.delete('/wages/del/:id', async (req, res) => {
  const { id } = req.params;
  const sql = `UPDATE wages SET del_flag = 1 WHERE id = ${id}`;
  db.queryAsync(sql).then(ress => {
    res.send({
      code: 200,
      data: null,
      msg: '删除成功'
    });
  });
});

// 导出
router.get('/wages/export', async (req, res) => {
  let { eDate, sDate, source, includePic } = req.query;
  let sql = `SELECT * FROM wages`;
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
      dictSql = `select* from sys_dict where dictType = 'wages_source' and pid <> 0 order by sort ASC;`;
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
