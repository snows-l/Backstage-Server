/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-15 14:29:31
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-27 18:11:47
 * @FilePath: /Website/Server/src/router/role.js
 */
const express = require('express');
const db = require('../../utils/connDB');

const router = express.Router();

router.get('/role/list', (req, res) => {
  const { page, size, roleKey, name } = req.query;
  let offset = (page - 1) * size;
  let sql = `SELECT * FROM sys_role`;
  let lensql = `SELECT count('role_id') FROM sys_role`;

  if (name) {
    sql += ` WHERE role_name LIKE '%${name}%'`;
    lensql += ` WHERE role_name LIKE '%${name}%'`;
  }
  if (roleKey) {
    sql += ` ${name ? 'AND' : 'WHERE'} role_key LIKE '%${roleKey}%'`;
    lensql += ` ${name ? 'AND' : 'WHERE'} role_key LIKE '%${roleKey}%'`;
  }

  let pageSql = `${sql} ORDER BY role_sort ASC LIMIT ${size} OFFSET ${offset};`;
  let resuleSql = `${page && size ? pageSql : sql + ' ORDER BY role_sort ASC'}`;

  db.queryAsync(lensql).then(count => {
    db.queryAsync(resuleSql).then(result => {
      res.send({
        code: 200,
        data: result.results,
        msg: 'success',
        total: count.results[0]["count('role_id')"]
      });
    });
  });
});

// 角色编辑
router.put('/role/edit', (req, res) => {
  const { role_id, role_name, role_key, role_sort, remark, status } = req.body;
  const sql = `UPDATE sys_role SET role_name = '${role_name}', role_key = '${role_key}', role_sort = ${role_sort}, remark = '${remark}', status = ${status}, update_time = ?WHERE role_id = ${role_id}`;
  let params = [new Date()];
  db.queryAsync(sql, params).then(result => {
    res.send({
      code: 200,
      data: result.results,
      msg: 'success'
    });
  });
});

// 角色权限编辑
router.post('/role/auth/edit', (req, res) => {
  const { role_id, menu_ids } = req.body;
  const sql = `UPDATE sys_role SET menu_ids = '${menu_ids}', update_time = ?WHERE role_id = ${role_id}`;
  let params = [new Date()];
  db.queryAsync(sql, params).then(result => {
    res.send({
      code: 200,
      data: result.results,
      msg: 'success'
    });
  });
});

// 角色新增
router.post('/role/add', (req, res) => {
  const { role_name, role_key, role_sort, status, remark } = req.body;
  db.queryAsync(`SELECT* FROM sys_role where role_key = '${role_key}'`).then(resKey => {
    if (resKey.results.length > 0) {
      return res.send({
        code: 500,
        data: [],
        msg: '角色key已存在'
      });
    }

    const sql = `INSERT INTO sys_role (role_name, role_key, role_sort, remark, status, create_time) VALUES ('${role_name}', '${role_key}', ${role_sort}, '${remark}', ?, ?)`;
    let params = [status, new Date()];
    db.queryAsync(sql, params).then(result => {
      res.send({
        code: 200,
        data: result.results,
        msg: 'success'
      });
    });
  });
});

// 角色删除
router.delete('/role/del/:id', (req, res) => {
  const { id } = req.params;
  if (id == 1 || id == 2) {
    return res.send({
      code: 500,
      data: [],
      msg: '系统角色, 不允许删除'
    });
  }
  const sql = `DELETE FROM sys_role WHERE role_id = ${id}`;
  db.queryAsync(sql).then(result => {
    res.send({
      code: 200,
      data: result.results,
      msg: 'success'
    });
  });
});

module.exports = router;
