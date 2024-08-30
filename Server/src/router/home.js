/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-02 17:47:57
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-30 22:09:41
 * @FilePath: /webseteUI/Server/src/router/home.js
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

// 首页统计
router.get('/count', async (req, res) => {
  let token = req.headers.authorization && req.headers.authorization.split(' ')[1];
  try {
    const resData = {
      wagesSum: 0,
      currentYearWagesSum: 0,
      favorsSum: 0,
      favarsBackSum: 0
    };
    // 总收入
    let sql = `SELECT SUM(money) as sum FROM wages WHERE del_flag = ?`;
    const params = [0];
    const { results } = await db.queryAsync(sql, params);
    resData.wagesSum = results[0].sum;

    // 近年收入
    let currentYearWagesSumSql = `SELECT SUM(money) as sum FROM wages WHERE del_flag = ? AND date >= '${moment().format('YYYY')}-01-01' AND date <= '${moment().format(
      'YYYY'
    )}-12-31'`;
    const { results: currentYearWagesRes } = await db.queryAsync(currentYearWagesSumSql, params);
    resData.currentYearWagesSum = currentYearWagesRes[0].sum;

    // 总人情  已还人情
    let favorSumSql = `SELECT SUM(favors_money) as sumM ,SUM(favors_backMoney) as sumB FROM favors`;
    const { results: favorRes } = await db.queryAsync(favorSumSql);
    resData.favorsSum = favorRes[0].sumM;
    resData.favarsBackSum = favorRes[0].sumB;

    if (!token) {
      res.send({
        code: 200,
        data: resData,
        msg: '获取成功'
      });
    } else {
      const user = verifyToken(token);
      if (user.role_key == 'admin') {
        res.send({
          code: 200,
          data: resData,
          msg: '获取成功'
        });
      } else {
        res.send({
          code: 200,
          // data: resData,
          data: {
            wagesSum: 0, // 隐藏金额
            currentYearWagesSum: 0, // 隐藏金额
            favorsSum: resData.favorsSum, // 隐藏金额
            favarsBackSum: resData.favarsBackSum // 隐藏金额
          },
          msg: '获取成功'
        });
      }
    }
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '获取失败'
    });
  }
});

// 近年收入统计
router.get('/yearIncome', async (req, res) => {
  let token = req.headers.authorization && req.headers.authorization.split(' ')[1];
  try {
    let currentMonth = moment().format('YYYY-MM') + '-28';
    let preYearMonth = moment().subtract(1, 'year').format('YYYY-MM') + '-01';

    let sql = `SELECT date, money FROM wages WHERE del_flag = ? AND date >= ? AND date <= ? ORDER BY date ASC`;
    const params = [0, preYearMonth, currentMonth];
    db.queryAsync(sql, params).then(wagesRes => {
      wagesRes.results.forEach(item => {
        item.date = moment(item.date).format('YYYY-MM');
      });
      if (!token) {
        res.send({
          code: 200,
          data: wagesRes.results,
          msg: '获取成功'
        });
      } else {
        const user = verifyToken(token);
        if (user.role_key == 'admin') {
          res.send({
            code: 200,
            data: wagesRes.results,
            msg: '获取成功'
          });
        } else {
          res.send({
            code: 200,
            data: wagesRes.results.map(item => {
              return {
                date: item.date,
                money: 0 // 隐藏金额
              };
            }),
            msg: '获取成功'
          });
        }
      }
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '获取失败'
    });
  }
});

//  获取人情来往
router.get('/favors/list', async (req, res) => {
  // const { timer = 2 } = req.query;
  let token = req.headers.authorization && req.headers.authorization.split(' ')[1];

  try {
    let sql = `SELECT favors_name, favors_money, favors_backMoney, favors_timer FROM favors ORDER BY favors_id ASC`;
    db.queryAsync(sql).then(favorsRes => {
      if (!token) {
        res.send({
          code: 200,
          data: favorsRes.results,
          msg: '获取成功'
        });
      } else {
        const user = verifyToken(token);
        if (user.role_key !== 'snow') {
          res.send({
            code: 200,
            data: favorsRes.results,
            msg: '获取成功'
          });
        } else {
          res.send({
            code: 200,
            data: favorsRes.results.map(item => {
              return {
                favors_name: '隐私', // 隐藏姓名
                favors_money: item.favors_money, // 隐藏金额
                favors_backMoney: item.favors_backMoney // 隐藏金额
              };
            }),
            msg: '获取成功'
          });
        }
      }
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '获取失败'
    });
  }
});
module.exports = router;
