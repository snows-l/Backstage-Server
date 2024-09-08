/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-15 14:29:31
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-08 15:15:57
 * @FilePath: /webseteUI/Server/src/router/blog/article.js
 */
const createSql = require('../../../utils/sql');
const express = require('express');
const db = require('../../../utils/connDB');
const router = express.Router();
const Excel = require('exceljs');
const { verifyToken } = require('../../../utils/handleToken');
const fs = require('fs');
const path = require('path');
const axios = require('axios');

// 获取文章列表
router.get('/list', async (req, res) => {
  let { page, size, title, type, isUnPage = true } = req.query;
  let offset = (page - 1) * size;

  let sql = `SELECT id, title, subTitle, cover, createTime, updateTime, type, labels, readCount, shareCount, (SELECT COUNT(*) FROM comment WHERE type = 1 AND articleId = article.id) as commentCount FROM article WHERE 1=1 ${
    title ? `AND title LIKE '%${title}%'` : ''
  } ${type ? `AND type = '${type}'` : ''} and delFlag = 0 ${!isUnPage || isUnPage == 'false' ? `ORDER BY id DESC` : `ORDER BY id DESC LIMIT ${size} OFFSET ${offset}`}`;
  let lensql = `SELECT count('id') as total FROM article WHERE 1=1 ${title ? `AND title LIKE '%${title}%'` : ''} ${type ? `AND type = '${type}'` : ''}`;

  const params = [0];
  try {
    db.queryAsync(lensql, []).then(lenRes => {
      const total = lenRes.results[0]['total'];
      db.queryAsync(sql, params).then(ress => {
        let result = ress.results;
        res.send({
          code: 200,
          data: result,
          total: total,
          msg: '获取成功'
        });
      });
    });
  } catch (error) {
    res.send({
      code: 200,
      data: null,
      msg: '500 error=' + error
    });
  }
});

// 获取文章详情
router.get('/detail/:id', async (req, res) => {
  const { id } = req.params;
  const sql = `SELECT * FROM article WHERE id = ${id}`;

  let commentCountSql = `select* from comment where 1=1 and type = 1 and articleId =${id}`;
  try {
    db.queryAsync(sql, []).then(ress => {
      let result = ress.results[0];
      db.queryAsync(commentCountSql, []).then(commentCountRes => {
        result.commentCount = commentCountRes.results.length;
        res.send({
          code: 200,
          data: {
            ...result
          },
          msg: '获取成功'
        });
      });
      db.queryAsync(`UPDATE article SET readCount = readCount + 1 WHERE id = ${id}`, []);
    });
  } catch (error) {
    res.send({
      code: 200,
      data: null,
      msg: '500 error=' + error
    });
  }
});

// 更新评论次数
router.put('/commentCount', async (req, res) => {
  const { id } = req.body;
  const sql = `UPDATE article SET commentCount = commentCount + 1 WHERE id = ${id}`;
  try {
    db.queryAsync(sql, []).then(ress => {
      res.send({
        code: 200,
        data: null,
        msg: '更新成功'
      });
    });
  } catch (error) {
    res.send({
      code: 200,
      data: null,
      msg: '500 error=' + error
    });
  }
});

// 更新分享次数
router.put('/shareCount', async (req, res) => {
  const { id } = req.body;
  const sql = `UPDATE article SET shareCount = shareCount + 1 WHERE id = ${id}`;
  try {
    db.queryAsync(sql, []).then(ress => {
      res.send({
        code: 200,
        data: null,
        msg: '更新成功'
      });
    });
  } catch (error) {
    res.send({
      code: 200,
      data: null,
      msg: '500 error=' + error
    });
  }
});

// 新增文章
router.post('/add', async (req, res) => {
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
    let { title, subTitle, cover, content, type, isPreview, labels } = req.body;
    let sql = createSql
      .insert('article')
      .set({
        title,
        subTitle,
        cover,
        content: encodeURIComponent(content),
        type,
        createTime: new Date(),
        status: 1,
        delFlag: 0,
        isPreview,
        labels
      })
      .end();
    // const sql = `INSERT INTO article (title, subTitle, cover, content, type, createTime, status, delFlag) VALUES ('${title}', '${subTitle}', '${cover}', '${content}', ${type}, ?, ?, ?);`;
    const params = [new Date(), 1, 0];
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

// 修改文章
router.put('/edit', async (req, res) => {
  let { id, title, subTitle, cover, content, type, isPreview, labels } = req.body;
  let data = {
    title,
    subTitle,
    cover,
    content: encodeURIComponent(content),
    type,
    isPreview,
    labels,
    updateTime: new Date()
  };

  const sql = createSql
    .update('article')
    .set(data)
    .where('id=' + id)
    .build();
  const params = [new Date()];
  try {
    db.queryAsync(sql, [params]).then(ress => {
      res.send({
        code: 200,
        data: null,
        msg: '修改成功'
      });
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '修改失败'
    });
  }
});

// 删除文章
router.delete('/del/:id', async (req, res) => {
  const { id } = req.params;
  const sql = `UPDATE article SET delFlag = 1 WHERE id = ${id}`;
  const params = [1];
  try {
    db.queryAsync(sql, [params]).then(ress => {
      res.send({
        code: 200,
        data: null,
        msg: '删除成功'
      });
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '删除失败'
    });
  }
});

// 导出  // 没有实现
router.get('/export', async (req, res) => {
  let { eDate, sDate, source, includePic } = req.query;
  let sql = `SELECT * FROM article`;
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
      dictSql = `select* from sys_dict where dictType = 'article_source' and pid <> 0 order by sort ASC;`;
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
        // XLSX.utils.book_append_sheet(wb, ws, '文章');
        // //生成Excel文件的二进制数据
        // const excelBuffer = XLSX.write(wb, {
        //   type: 'buffer',
        //   bookType: 'xlsx'
        // });
        // const realName = encodeURI('文章报表.xlsx', 'GBK').toString('iso8859-1');
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
        const worksheet = workbook.addWorksheet('文章明细');
        // 设置表头
        // worksheet.addRow(['标题', '月份', '文章金额', '备注', '文章截图']);
        let baseTableTitle = [
          { header: '标题', key: 'title', width: 20 },
          { header: '月份', key: 'date', width: 12 },
          { header: '文章金额（元）', key: 'money', width: 16 },
          { header: '就职于', key: 'source', width: 12 },
          { header: '备注', key: 'remark', width: 24 }
        ];
        if (includePic == 'true') {
          baseTableTitle.push({ header: '文章截图', key: 'pic', width: 16 });
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
        const realName = encodeURI('文章报表.xlsx', 'GBK').toString('iso8859-1');
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

// 预览 文章 html
router.get('/preview/:id', async (req, res) => {
  const { id } = req.params;
  const sql = `SELECT content FROM article WHERE id = ${id}`;
  try {
    db.queryAsync(sql, []).then(ress => {
      let content = ress.results[0].content;
      content = decodeURIComponent(content);
      let reg = /<!DOCTYPE html>.*<\/html>/s;
      content = content.replace(/&#39;/g, "'");
      content = content.replace(/&gt;/g, '>');
      content = content.replace(/&lt;/g, '<');
      content = content.replace(/&#39;/g, "'");
      let htmlstr = content.match(reg) ? content.match(reg)[0] : '';
      let pathstr = path.resolve(__dirname, '../../../public/html/preview.html');
      fs.readFile(pathstr, 'utf8', (err, data) => {
        if (err) {
          return res.send({
            code: 500,
            data: null,
            msg: '500 error=' + error
          });
        }
        fs.writeFile(pathstr, htmlstr, 'utf8', err => {
          if (err) {
            return res.send({
              code: 500,
              data: null,
              msg: '500 error=' + error
            });
          }
          const url = 'http://124.223.41.220:3333/html/preview.html';
          res.send({
            code: 200,
            data: url,
            msg: '预览成功'
          });
        });
      });
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '500 error=' + error
    });
  }
});

module.exports = router;
