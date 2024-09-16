/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-05 15:45:41
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-16 21:50:41
 * @FilePath: /webseteUI/Server/src/router/log.js
 */
const { getOS, getBrowserName, getCityByIp } = require('../../utils/common');
const express = require('express');
const { verifyToken } = require('../../utils/handleToken');
// 数据库操作
const db = require('../../utils/connDB');
const Excel = require('exceljs');

const router = express.Router();

// 新增日志
router.post('/add', async (req, res) => {
  try {
    if (req.headers.authorization) {
      let token = req.headers.authorization.split(' ')[1];
      const user = verifyToken(token);
      let ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress || 'Unknown';
      if (ip.includes(':')) {
        ip = ip.includes(':') ? ip.split(':').slice(-1)[0] : ip;
      }
      let city = await getCityByIp(ip);
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
router.get('/list', (req, res) => {
  const { page, size, city, username, type } = req.query;
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

// 统计34个省份的访问统计
router.get('/province', (req, res) => {
  let citys = [
    '北京',
    '天津',
    '河北',
    '山西',
    '内蒙古',
    '辽宁',
    '吉林',
    '黑龙江',
    '上海',
    '江苏',
    '浙江',
    '安徽',
    '福建',
    '江西',
    '山东',
    '河南',
    '湖北',
    '湖南',
    '广东',
    '广西',
    '海南',
    '重庆',
    '四川',
    '贵州',
    '云南',
    '西藏',
    '陕西',
    '甘肃',
    '青海',
    '宁夏',
    '新疆',
    '台湾',
    '香港',
    '澳门'
  ];
  // const sql = `SELECT city, COUNT(*) as total FROM logs WHERE 1=1 and type = 1 GROUP BY city ORDER BY total DESC LIMIT 34`;
  let sql = ``;
  citys.forEach(city => {
    sql += `SELECT '${city}' as city, COUNT(*) as total FROM logs WHERE 1=1 and type = 1 AND city LIKE '%${city}%' UNION `;
  });
  sql = sql.substring(0, sql.length - 7);
  try {
    db.queryAsync(sql, []).then(ress => {
      res.send({
        code: 200,
        msg: 'success',
        data: ress.results
      });
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '服务器错误'
    });
  }
});

// 删除日志
router.post('/del/:id', (req, res) => {
  const { id } = req.params;
  const sql = `DELETE FROM logs WHERE id = ?`;
  const params = [id];
  try {
    db.queryAsync(sql, params).then(_ => {
      res.send({
        code: 200,
        msg: 'success'
      });
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '服务器错误'
    });
  }
});

// 日志导出
router.get('/export', (req, res) => {
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
