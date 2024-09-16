/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-08-13 19:33:14
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-16 21:52:30
 * @FilePath: /webseteUI/Server/src/router/comment.js
 */
const createSql = require('../../utils/sql');
const express = require('express');
const db = require('../../utils/connDB');
const router = express.Router();
const IP2Region = require('ip2region').default;
const { getOS, getBrowserName, getCityByIp } = require('../../utils/common');
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
router.post('/add', async (req, res) => {
  let { qq, nickName, comment, avatarUrl, email, websiteUrl, isPrivacy, isEmailFeekback, type = 0, pId = 0, toNickName, articleId, toId = 0 } = req.body;
  isPrivacy = isPrivacy || isPrivacy == 'true' ? 1 : 0;
  isEmailFeekback = isEmailFeekback || isEmailFeekback == 'true' ? 1 : 0;
  const os = getOS(req.headers['user-agent']);
  const browser = getBrowserName(req.headers['user-agent']);
  let ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress || 'Unknown';
  if (ip.includes(':')) {
    ip = ip.includes(':') ? ip.split(':').slice(-1)[0] : ip;
  }
  let city = await getCityByIp(ip);
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
      toId,
      toNickName,
      articleId,
      city,
      ip,
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
      // 评论
      if (type == 1) {
        if (toId != 0 && toId != '') {
          let sql2 = 'select* from comment where 1=1 and id =' + `'${toId}'`;
          db.queryAsync(sql2).then(result2 => {
            // 回复并且允许邮件通知
            if (result2.results[0].isEmailFeekback == 1) {
              let toEmail = result2.results[0].email ? result2.results[0].email : result2.results[0].qq + '@qq.com';
              // 回复并且允许邮件通知
              const params = {
                to: toEmail,
                path: '/article/detail?id=' + articleId,
                comment: comment,
                username: nickName,
                isBack: true,
                isComment: true
              };
              sendEmail(params);
            }
          });
        } else {
          // 有人评论 通知博主
          const params = {
            to: 'snows_l@163.com',
            path: '/article/detail?id=' + articleId,
            comment: comment,
            username: nickName,
            isBack: false,
            isComment: true
          };
          sendEmail(params);
        }
      } else {
        if (toId != 0 && toId != '') {
          let sql2 = 'select* from comment where 1=1 and id =' + `'${toId}'`;
          db.queryAsync(sql2).then(result2 => {
            // 回复并且允许邮件通知
            if (result2.results[0].isEmailFeekback == 1) {
              let toEmail = result2.results[0].email ? result2.results[0].email : result2.results[0].qq + '@qq.com';
              // 回复并且允许邮件通知
              const params = {
                to: toEmail,
                path: '/msg-board',
                comment: comment,
                username: nickName,
                isBack: true,
                isComment: false
              };
              sendEmail(params);
            }
          });
        } else {
          // 留言
          const params = {
            to: 'snows_l@163.com',
            path: '/msg-board',
            comment: comment,
            username: nickName,
            isBack: false,
            isComment: false
          };
          sendEmail(params);
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
  isPrivacy = isPrivacy || isPrivacy == 'true' ? 1 : 0;
  isEmailFeekback = isEmailFeekback || isEmailFeekback == 'true' ? 1 : 0;

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
