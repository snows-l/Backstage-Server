/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-08-18 16:49:23
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-30 22:17:08
 * @FilePath: /webseteUI/Server/src/router/blog/friendLink.js
 */
const express = require('express');
const db = require('../../../utils/connDB');
const router = express.Router();
const moment = require('moment');

// 获取友情连接列表
router.get('/list', (req, res) => {
  let { name, startTime, endTime, isAll } = req.query;
  let sql = `select * from friend_link where 1 = 1 ${isAll ? '' : 'and status = 1'} ${name ? `and name like '%${name}%'` : ''} ${
    startTime && endTime ? `and createTime between '${startTime}' and '${endTime}'` : ''
  } order by createTime asc`;
  let sqlCount = `select count(*) as total from friend_link where 1 = 1 ${isAll ? '' : 'and status = 1'} ${name ? `and name like '%${name}%'` : ''} ${
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

// 新增友情连接
router.post('/add', (req, res) => {
  let { name, url, profile, isQQ, logo, status } = req.body;

  let sql = `insert into friend_link (name, url, profile, isQQ, logo, createTime, status) values (?, ?, ?, ?, ?, ?, ?)`;
  let params = [name, url, profile, isQQ, logo, moment().format('YYYY-MM-DD HH:mm:ss'), status];
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
          msg: err
        });
      });
  } catch (err) {
    res.send({
      code: 500,
      data: [],
      msg: err
    });
  }
});

// 编辑友情连接
router.put('/edit', (req, res) => {
  let { id, name, url, profile, isQQ, logo, status } = req.body;
  let sql = `update friend_link set name = ?, url = ?, profile = ?, isQQ = ?, logo = ?, status = ? where id = ?`;
  let params = [name, url, profile, isQQ, logo, status, id];
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
          msg: err
        });
      });
  } catch (err) {
    res.send({
      code: 500,
      data: [],
      msg: err
    });
  }
});

// 删除友情连接
router.delete('/del/:id', (req, res) => {
  let { id } = req.params;
  let sql = `delete from friend_link where id = ?`;
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
          msg: err
        });
      });
  } catch (err) {
    res.send({
      code: 500,
      data: [],
      msg: err
    });
  }
});

module.exports = router;
