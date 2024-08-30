/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-25 14:34:48
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-30 22:04:04
 * @FilePath: /webseteUI/Server/src/router/menu.js
 */
const express = require('express');
const db = require('../../utils/connDB');

const router = express.Router();

// 菜单查询
router.get('/list', async (req, res) => {
  const { menu_name, status } = req.query;
  let sql = `SELECT * FROM sys_menu`;
  if (menu_name) {
    sql += ` WHERE menu_name LIKE '%${menu_name}%'`;
  }
  if (status) {
    sql += menu_name ? ` AND status = ${status}` : ` WHERE status = ${status}`;
  }
  const ressltSql = sql + (!menu_name && !status ? ' WHERE status = 1 ORDER BY menu_sort ASC' : ` ORDER BY menu_sort ASC`);
  db.queryAsync(ressltSql).then(result => {
    res.send({
      code: 200,
      data: result.results,
      msg: '查询成功'
    });
  });
});

// 菜单新增
router.post('/add', async (req, res) => {
  const { menu_name, parent_id, menu_type, icon, status, menu_sort, path, component, query, visible } = req.body;

  const sql = `INSERT INTO sys_menu (menu_name, parent_id, menu_type, icon, status, menu_sort, path,component, query, visible, create_time) VALUES ('${menu_name}', ${parent_id}, '${menu_type}', '${icon}', ${status}, ${menu_sort}, '${path}', '${component}', '${query}', '${visible}', ?)`;
  db.queryAsync(sql, [new Date()]).then(result => {
    res.send({
      code: 200,
      data: result.insertId,
      msg: '新增成功'
    });
  });
});

// 菜单修改
router.put('/edit', async (req, res) => {
  const { menu_id, menu_name, parent_id, menu_type, icon, status, menu_sort, path, component, query, visible } = req.body;

  const sql = `UPDATE sys_menu SET menu_name = '${menu_name}', parent_id = ${parent_id}, menu_type = '${menu_type}', icon = '${icon}', status = ${status},menu_sort = ${menu_sort}, path = '${path}', component = '${component}', query = '${query}', visible = ${visible},create_time = ? WHERE menu_id = ${menu_id}`;
  db.queryAsync(sql, [new Date()]).then(result => {
    res.send({
      code: 200,
      data: result.affectedRows,
      msg: '修改成功'
    });
  });
});

// 菜单删除
router.delete('/delete/:menu_id', async (req, res) => {
  const { menu_id } = req.params;

  const sql = `DELETE FROM sys_menu WHERE menu_id = ${menu_id}`;
  db.queryAsync(sql).then(result => {
    res.send({
      code: 200,
      data: result.affectedRows,
      msg: '删除成功'
    });
  });
});

module.exports = router;
