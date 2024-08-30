/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-08-18 16:49:23
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-30 22:11:45
 * @FilePath: /webseteUI/Server/src/router/blog/zone.js
 */
const { getOS, getBrowserName } = require('../../../utils/common');
const createSql = require('../../../utils/sql');
const express = require('express');
const db = require('../../../utils/connDB');
const router = express.Router();
const Excel = require('exceljs');
const { verifyToken } = require('../../../utils/handleToken');
const fs = require('fs');
const axios = require('axios');
const moment = require('moment');
const IP2Region = require('ip2region').default;

// 获取朋友圈列表
router.get('/list', (req, res) => {
  let { page, size, text, startTime, endTime } = req.query;
  let offset = (page - 1) * size;
  let sql = `select * from zone where status = 1 ${text ? `and text like '%${text}%'` : ''} ${
    startTime && endTime ? `and createTime between '${startTime}' and '${endTime}'` : ''
  } order by createTime desc limit ${size} offset ${offset}`;
  let sqlCount = `select count(*) as total from zone where status = 1 ${text ? `and text like '%${text}%'` : ''} ${
    startTime && endTime ? `and createTime between '${startTime}' and '${endTime}'` : ''
  }`;
  db.queryAsync(sqlCount, [])
    .then(result => {
      let total = result.results[0].total;
      db.queryAsync(sql, [])
        .then(result => {
          res.send({
            code: 200,
            data: result.results,
            total: total
          });
        })
        .catch(err => {
          res.send({
            code: 200,
            data: [],
            total: 0,
            msg: '500 服务器错误'
          });
        });
    })
    .catch(err => {
      res.send({
        code: 200,
        data: [],
        total: 0,
        msg: '500 服务器错误'
      });
    });
});

// 新增朋友圈
router.post('/add', (req, res) => {
  let { text, imgs, remark } = req.body;

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

  let sql = `insert into zone (text, imgs, createTime, city, remark, os, browser, status) values (?, ?, ?, ?, ?, ?, ?, 1)`;
  let params = [text, imgs, moment().format('YYYY-MM-DD HH:mm:ss'), city, remark, os, browser];
  try {
    db.queryAsync(sql, params)
      .then(result => {
        res.send({
          code: 200,
          data: null,
          msg: '新增成功'
        });
      })
      .catch(err => {
        res.send({
          code: 500,
          data: [],
          msg: 'err'
        });
      });
  } catch (error) {
    res.send({
      code: 500,
      data: [],
      msg: 'err'
    });
  }
});

// 删除朋友圈
router.delete('/del/:id', (req, res) => {
  let { id } = req.params;
  let sql = `delete from zone where id = ?`;
  let params = [id];
  try {
    db.queryAsync(sql, params)
      .then(result => {
        res.send({
          code: 200,
          data: null,
          msg: '删除成功'
        });
      })
      .catch(err => {
        res.send({
          code: 500,
          data: [],
          msg: 'err'
        });
      });
  } catch (error) {
    res.send({
      code: 500,
      data: [],
      msg: 'err'
    });
  }
});

// 编辑朋友圈
router.put('/edit', (req, res) => {
  let { id, text, imgs, remark } = req.body;
  let sql = `update zone set text = ?, imgs = ?, remark = ? where id = ?`;
  let params = [text, imgs, remark, id];
  try {
    db.queryAsync(sql, params)
      .then(result => {
        res.send({
          code: 200,
          data: null,
          msg: '编辑成功'
        });
      })
      .catch(err => {
        res.send({
          code: 500,
          data: [],
          msg: 'err'
        });
      });
  } catch (error) {
    res.send({
      code: 500,
      data: [],
      msg: 'err'
    });
  }
});

module.exports = router;
