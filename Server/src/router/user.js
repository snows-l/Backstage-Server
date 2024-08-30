/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-15 14:29:31
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-30 22:02:35
 * @FilePath: /webseteUI/Server/src/router/user.js
 */
const express = require('express');
const db = require('../../utils/connDB');
const { name } = require('body-parser');
const { generateToken, verifyToken } = require('../../utils/handleToken');
// 解密前端的加密密码
const { decryptPwd } = require('../../utils/node-rsa');

const router = express.Router();

// 获取user列表
router.get('/list', (req, res) => {
  if (req.headers.authorization) {
    let token = req.headers.authorization.split(' ')[1];
    const { page = 1, size = 10, role, name } = req.query;
    let offset = (page - 1) * size;
    let sql = `SELECT * FROM sys_user`;
    let lensql = `SELECT count('user_id') FROM sys_user`;
    if (name) {
      sql += ` WHERE user_name LIKE '%${name}%'`;
      lensql += ` WHERE user_name LIKE '%${name}%'`;
    }
    if (role) {
      sql += ` ${name ? 'AND' : 'WHERE'} role = ${role}`;
      lensql += ` ${name ? 'AND' : 'WHERE'} role = ${role}`;
    }

    selectSql = `${sql} LIMIT ${size} OFFSET ${offset} `;

    const params = [size, offset];
    try {
      const user = verifyToken(token);
      db.queryAsync(lensql).then(count => {
        db.queryAsync(selectSql, params).then(result => {
          let userList = result.results;
          let userNames = ['admin', 'snows_l', 'eternals_l'];
          userList.forEach(item => {
            item.password = '******';
            if (user.role_key == 'snow' && userNames.includes(item.user_name)) {
              item.user_name = '******';
            }
          });

          res.send({
            code: 200,
            data: userList,
            msg: 'success',
            total: count.results[0]["count('user_id')"]
          });
        });
      });
    } catch (error) {}
  }
});

// 新增用户
router.post('/add', (req, res) => {
  const { user_name, password, role = 2, roke_key = 'common', email, phonenumber, sex, nick_name } = req.body;
  db.queryAsync(`SELECT * FROM sys_user WHERE user_name = '${user_name}'`).then(res2 => {
    if (res2.results.length > 0) {
      return res.send({
        code: 500,
        data: null,
        msg: '用户名已存在'
      });
    }

    const sql = `INSERT INTO sys_user (user_name, password, role, role_key, email, phonenumber, sex, nick_name, create_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);`;
    const params = [user_name, password, role, roke_key, email, phonenumber, sex, nick_name, new Date()];

    db.queryAsync(sql, params).then(result => {
      res.send({
        code: 200,
        data: result,
        msg: 'success'
      });
    });
  });
});

// 修改资料
router.put('/edit', (req, res) => {
  const { user_id, user_name, role, role_str, role_key, email, phonenumber, sex, nick_name } = req.body;
  const sql = `UPDATE sys_user SET role = ?, role_str = ?, role_key = ?, email = ?, phonenumber = ?, sex = ?, nick_name = ?, user_name = ?, update_time = ? WHERE user_id = ?;`;
  const params = [role, role_str, role_key, email, phonenumber, sex, nick_name, user_name, new Date(), user_id];

  db.queryAsync(sql, params).then(result => {
    res.send({
      code: 200,
      data: [],
      msg: 'success'
    });
  });
});

// 修改密码
router.put('/pwd/edit', (req, res) => {
  const { user_id, new_password, old_password } = req.body;
  const pwdSql = `SELECT password FROM sys_user WHERE user_id = ?`;
  const pwdparams = [user_id];
  db.queryAsync(pwdSql, pwdparams).then(pwd => {
    try {
      const userNewPassword = decryptPwd(old_password);
      const dbPwd = decryptPwd(pwd.results[0].password);
      if (userNewPassword !== dbPwd) {
        return res.send({
          code: 500,
          data: null,
          msg: '密码错误'
        });
      }
      const sql = `UPDATE sys_user SET password = ?, update_time = ? WHERE user_id = ?;`;
      const params = [new_password, new Date(), user_id];
      db.queryAsync(sql, params).then(result => {
        res.send({
          code: 200,
          data: [],
          msg: 'success'
        });
      });
    } catch (error) {
      res.send({
        code: 500,
        data: null,
        msg: '系统异常， 请稍后再试！'
      });
    }
  });
});

// 删除
router.delete('/del/:id', (req, res) => {
  const { id } = req.params;
  if (id == 1 || id == 2) {
    return res.send({
      code: 500,
      data: null,
      msg: '不能删除系统内置管理员'
    });
  }
  const sql = `DELETE FROM sys_user WHERE user_id = ?`;
  const params = [id];

  db.queryAsync(sql, params).then(result => {
    res.send({
      code: 200,
      data: [],
      msg: 'success'
    });
  });
});

router.get('/info', (req, res) => {
  if (req.headers.authorization) {
    let token = req.headers.authorization.split(' ')[1];
    try {
      const user = verifyToken(token);
      if (user) {
        res.send({
          code: 200,
          data: user,
          msg: 'success'
        });
      } else {
        res.status(200).send({ code: '401', msg: '登录失效，请重新登录' });
      }
    } catch (error) {
      res.status(200).send({ code: '401', msg: '登录失效，请重新登录' });
    }
  } else {
    res.status(200).send({ code: '401', msg: '登录失效，请重新登录' });
  }
});

module.exports = router;
