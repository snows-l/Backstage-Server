/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-05 15:45:41
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-30 18:34:20
 * @FilePath: /webseteUI/Server/src/router/log.js
 */
const { getOS, getBrowserName } = require('../../utils/common');
const express = require('express');
const { generateToken, verifyToken } = require('../../utils/handleToken');
// 数据库操作
const db = require('../../utils/connDB');
const Excel = require('exceljs');
const IP2Region = require('ip2region').default;

const router = express.Router();

// 新增日志
router.post('/log/add', (req, res) => {
  try {
    if (req.headers.authorization) {
      let token = req.headers.authorization.split(' ')[1];
      const user = verifyToken(token);
      let ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress || 'Unknown';
      if (ip.includes(':')) {
        ip = ip.includes(':') ? ip.split(':').slice(-1)[0] : ip;
      }
      const cityMap = new IP2Region().search(ip);
      let city = '';
      if (cityMap) {
        cityMap.country = cityMap.country ? cityMap.country + '-' : '';
        cityMap.province = cityMap.province ? cityMap.province + '-' : '';
        city = cityMap.province + cityMap.city;
      }
      const os = getOS(req.headers['user-agent']);
      const browser = getBrowserName(req.headers['user-agent']);
      const sql = `INSERT INTO logs (username, ip, city, browser, os, create_time, type) VALUES (?,?,?,?,?,?)`;
      const params = [user.username, ip, city, browser, os, moment().format('YYYY-MM-DD HH:mm:ss'), 0];
      db.queryAsync(sql, params).then(_ => {
        res.send({
          code: 200,
          msg: 'success',
          token
        });
      });
    }
  } catch (error) {
    res.send({
      code: 200,
      msg: 'success',
      data: null
    });
  }
});

// 日志列表
router.get('/log/list', (req, res) => {
  const { page, size, city, username, type } = req.query;
  console.log('-------- type --------', type);
  let offset = (page - 1) * size;
  const sql = `SELECT * FROM logs WHERE 1=1 ${type ? `AND type = ${type}` : ''} ${city ? `AND city LIKE '%${city}%'` : ''} ${
    username ? `AND username LIKE '%${username}%'` : ''
  } ORDER BY id DESC LIMIT ${size} OFFSET ${offset}`;
  let totalSql = `SELECT COUNT(*) as total FROM logs WHERE 1=1 ${type ? `AND type = ${type}` : ''} ${city ? `AND city LIKE '%${city}%'` : ''} ${
    username ? `AND username LIKE '%${username}%'` : ''
  }`;
  try {
    db.queryAsync(sql, []).then(logRes => {
      db.queryAsync(totalSql, []).then(totalRes => {
        res.send({
          code: 200,
          msg: 'success',
          data: logRes.results,
          total: totalRes.results[0].total
        });
      });
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '服务器错误',
      total: 0
    });
  }
});

// 日志导出
router.get('/log/export', (req, res) => {
  const { city, username } = req.query;
  const sql = `SELECT * FROM logs WHERE 1=1 ${city ? `AND city LIKE '%${city}%'` : ''} ${username ? `AND username LIKE '%${username}%'` : ''} ORDER BY id DESC`;
  db.queryAsync(sql, []).then(async logRes => {
    let data = logRes.results;
    const workbook = new Excel.Workbook();
    const worksheet = workbook.addWorksheet('登录日志');
    // 设置表头
    let baseTableTitle = [
      { header: '登录账号', key: 'username', width: 20 },
      { header: 'IP', key: 'ip', width: 20 },
      { header: '登录城市', key: 'city', width: 12 },
      { header: '登录浏览器', key: 'browser', width: 12 },
      { header: 'os', key: 'os', width: 12 },
      { header: '登录时间', key: 'create_time', width: 12 }
    ];
    worksheet.columns = baseTableTitle;
    // 循环写入数据
    data.forEach(async (item, index) => {
      const rowData = worksheet.addRow([item.username, item.ip, item.city, item.browser, item.os, item.create_time]);
      // 指定行高
      rowData.height = 50;
    });

    const buffer = await workbook.xlsx.writeBuffer();
    // 处理中文文件名
    const realName = encodeURI('人情来往明细.xlsx', 'GBK').toString('iso8859-1');
    // 设置响应头
    res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    res.setHeader('Content-Disposition', 'attachment; filename=' + realName);
    // 发送Excel文件
    res.send(buffer);
  });
});
module.exports = router;
