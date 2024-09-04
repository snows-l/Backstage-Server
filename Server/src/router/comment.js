/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-08-13 19:33:14
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-04 13:22:11
 * @FilePath: /backstage/Server/src/router/comment.js
 */
const createSql = require('../../utils/sql');
const express = require('express');
const db = require('../../utils/connDB');
const router = express.Router();
const IP2Region = require('ip2region').default;
const { getOS, getBrowserName } = require('../../utils/common');
const moment = require('moment');
const { sendEmail } = require('../../utils/email');

// 获取留言列表
router.get('/list', (req, res) => {
  let { page = 1, size = 5, comment, type } = req.query;
  let offset = (page - 1) * size;
  let sql =
    'select* from comment where 1=1 and isPrivacy = 0 ' +
    (type ? ` and type = ${type}` : '') +
    (comment ? ` and comment like '%${comment}%'` : '') +
    ` order by time desc limit ${size} offset ${offset}`;
  let lenSql = 'select count(*) as total from comment where 1=1 and isPrivacy = 0 ' + (type ? ` and type = ${type}` : '') + (comment ? ` and comment like '%${comment}%'` : '');
  try {
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
  } catch (error) {
    res.send({
      code: 200,
      data: [],
      msg: '500 error=' + error,
      total: 0
    });
  }
});

// 获取评论列表
router.get('/list2', (req, res) => {
  let { articleId } = req.query;
  let sql = 'select* from comment where 1=1 and type = 1 and isPrivacy = 0' + (articleId ? ` and articleId = ${articleId}` : '') + ` order by time asc`;
  try {
    db.queryAsync(sql).then(result => {
      res.send({
        code: 200,
        data: result.results,
        msg: 'success'
      });
    });
  } catch (error) {
    res.send({
      code: 200,
      data: [],
      msg: '500 error=' + error,
      total: 0
    });
  }
});

// 新增评论
router.post('/add', (req, res) => {
  let { qq, nickName, comment, avatarUrl, email, websiteUrl, isPrivacy, isEmailFeekback, type = 0, pId = 0, articleId, toQQ, toEmail, toNickName } = req.body;
  isPrivacy = isPrivacy ? 1 : 0;
  isEmailFeekback = isEmailFeekback ? 1 : 0;
  const os = getOS(req.headers['user-agent']);
  const browser = getBrowserName(req.headers['user-agent']);
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
  let id = (type == 1 ? 'PL' : 'LY') + moment().format('YYYYMMDDHHmmss');

  let sql = createSql
    .insert('comment')
    .set({
      id,
      qq,
      nickName,
      comment,
      avatarUrl,
      email,
      websiteUrl,
      isPrivacy,
      isEmailFeekback,
      os,
      browser,
      type,
      pId,
      articleId,
      city,
      ip,
      toEmail,
      toQQ,
      toNickName,
      time: moment().format('YYYY-MM-DD HH:mm:ss')
    })
    .end();
  try {
    db.queryAsync(sql).then(result => {
      res.send({
        code: 200,
        data: null,
        msg: 'success'
      });
      if (type == 1 && isEmailFeekback == 1) {
        if (pId != 0) {
          let toEmail = toEmail ? toEmail : toQQ + '@qq.com';
          sendEmail({
            to: toEmail,
            path: '/article/detail?id=' + articleId,
            comment: comment,
            username: toNickName,
            isBack: true
          });
        } else {
          sendEmail({
            to: 'snows_l@163.com',
            path: '/article/detail?id=' + articleId,
            comment: comment,
            username: nickName,
            isBack: false
          });
        }
      }
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '500 error=' + error
    });
  }
});

// 编辑留言
router.put('/edit', (req, res) => {
  let { id, qq, nickName, comment, avatarUrl, email, websiteUrl, isPrivacy, isEmailFeekback } = req.body;
  isPrivacy = isPrivacy ? 1 : 0;
  isEmailFeekback = isEmailFeekback ? 1 : 0;

  let sql = createSql
    .update('comment')
    .set({ qq, nickName, comment, avatarUrl, email, websiteUrl, isPrivacy, isEmailFeekback })
    .where('id=' + `'${id}'`)
    .end();
  try {
    db.queryAsync(sql).then(result => {
      res.send({
        code: 200,
        data: null,
        msg: 'success'
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

// 删除留言
router.delete('/del/:id', (req, res) => {
  let { id } = req.params;
  let sql = `DELETE FROM comment WHERE id='${id}'`;
  try {
    db.queryAsync(sql).then(result => {
      res.send({
        code: 200,
        data: null,
        msg: 'success'
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
