/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-08-13 19:33:14
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-13 20:46:36
 * @FilePath: /webseteUI/Server/src/router/comment.js
 */
const createSql = require('../../utils/sql');
const express = require('express');
const db = require('../../utils/connDB');
const router = express.Router();
const { getOS, getBrowserName } = require('../../utils/common');
const moment = require('moment');

// 获取评论列表
router.get('/comment/list', (req, res) => {
  let { page = 1, size = 5, comment } = req.query;
  let offset = (page - 1) * size;
  let sql = 'select* from comment where 1=1 ' + (comment ? ` and comment like '%${comment}%'` : '') + `order by time desc limit ${size} offset ${offset}`;
  let lenSql = 'select count(*) as total from comment where isPrivacy = 0 ' + (comment ? ` and comment like '%${comment}%'` : '');
  db.queryAsync(sql).then(result => {
    db.queryAsync(lenSql).then(lenResult => {
      res.send({
        code: 200,
        data: result.results,
        msg: 'success',
        total: lenResult.results[0].total
      });
    });
  });
});

// 新增评论
router.post('/comment/add', (req, res) => {
  let { qq, nickName, comment, avatarUrl, email, websiteUrl, isPrivacy, isEmailFeekback } = req.body;
  isPrivacy = isPrivacy ? 1 : 0;
  isEmailFeekback = isEmailFeekback ? 1 : 0;
  const os = getOS(req.headers['user-agent']);
  const browser = getBrowserName(req.headers['user-agent']);

  let sql = createSql
    .insert('comment')
    .set({ qq, nickName, comment, avatarUrl, email, websiteUrl, isPrivacy, isEmailFeekback, os, browser, time: moment().format('YYYY-MM-DD HH:mm:ss') });
  db.queryAsync(sql).then(result => {
    res.send({
      code: 200,
      data: null,
      msg: 'success'
    });
  });
});

module.exports = router;
