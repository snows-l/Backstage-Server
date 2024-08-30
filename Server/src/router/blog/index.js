/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-08-30 17:03:07
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-30 19:01:41
 * @FilePath: /webseteUI/Server/src/router/blog/index.js
 */
const { getOS, getBrowserName } = require('../../../utils/common');
const express = require('express');
const db = require('../../../utils/connDB');
const router = express.Router();
const moment = require('moment');
const IP2Region = require('ip2region').default;

router.get('/blog/visit/add', (req, res) => {
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

  try {
    let querySql = `select * from logs where ip='${ip}' and create_time >= '${moment().format('YYYY-MM-DD')} 00:00:00' AND create_time <= '${moment().format(
      'YYYY-MM-DD'
    )} 23:59:59'`;
    db.queryAsync(querySql).then(result => {
      if (result.results.length === 0) {
        let insertSql = `insert into logs (ip, city, os, browser, create_time, type) values ('${ip}', '${city}', '${os}', '${browser}', '${moment().format(
          'YYYY-MM-DD HH:mm:ss'
        )}', ${1})`;
        db.queryAsync(insertSql).then(result => {
          res.send({
            code: 200,
            msg: 'add visit success',
            data: {
              ip
            }
          });
        });
      } else {
        res.send({
          code: 200,
          msg: 'ip has been visited today',
          data: {
            ip
          }
        });
      }
    });
  } catch (error) {
    console.log(error);
    res.send({
      code: 500,
      msg: 'failed to add visit',
      data: {
        ip
      }
    });
  }
});

router.get('/blog/visit/total', async (req, res) => {
  let today = 0;
  let yeasterday = 0;
  let currentMonth = 0;
  let sum = 0;
  try {
    let querySql = `select count(*) as total from logs where type = ${1} AND create_time >= '${moment().format('YYYY-MM-DD')} 00:00:00' AND create_time <= '${moment().format(
      'YYYY-MM-DD'
    )} 23:59:59'`;
    const result = await db.queryAsync(querySql);
    today = result.results[0].total;

    let yesterdaySql = `select count(*) as total from logs where type = ${1} AND create_time >= '${moment()
      .subtract(1, 'days')
      .format('YYYY-MM-DD')} 00:00:00' AND create_time <= '${moment().subtract(1, 'days').format('YYYY-MM-DD')} 23:59:59'`;
    const yesterdayResult = await db.queryAsync(yesterdaySql);
    yeasterday = yesterdayResult.results[0].total;

    let currentMonthSql = `select count(*) as total from logs where type = ${1} AND create_time >= '${moment()
      .startOf('month')
      .format('YYYY-MM-DD')} 00:00:00' AND create_time <= '${moment().endOf('month').format('YYYY-MM-DD')} 23:59:59'`;
    const currentMonthResult = await db.queryAsync(currentMonthSql);
    currentMonth = currentMonthResult.results[0].total;

    let sumSql = `select count(*) as total from logs where type = ${1}`;
    const sumResult = await db.queryAsync(sumSql);
    sum = sumResult.results[0].total;

    res.send({
      code: 200,
      msg: 'get visit total success',
      data: {
        today,
        yeasterday,
        currentMonth,
        sum
      }
    });
  } catch (error) {
    console.log(error);
    res.send({
      code: 500,
      msg: 'get visit total failed',
      data: {}
    });
  }
});

module.exports = router;
