/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-01 09:35:52
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-03 17:05:53
 * @FilePath: /Website/Server/src/router/favors.js
 */
const express = require('express');
const db = require('../../utils/connDB');
const Excel = require('exceljs');
const { generateToken, verifyToken } = require('../../utils/handleToken');

const router = express.Router();

// 分页查询人情来往列表
router.get('/favors/list', (req, res) => {
  let token = req.headers.authorization && req.headers.authorization.split(' ')[1];
  const { dictType, name, page, size } = req.query;

  let offset = (page - 1) * size;
  let sql = `select * from favors limit ${size} offset ${offset};`;
  let lenSql = `select count('favors_id') from favors`;
  if (dictType) {
    sql = `select * from favors where favors_timer = '${dictType}' limit ${size} offset ${offset};`;
    lenSql = `select count('favors_id') from favors where favors_timer = '${dictType}';`;
    if (name) {
      sql = `select * from favors where favors_timer = '${dictType}' and favors_name like '%${name}%' limit ${size} offset ${offset};`;
      lenSql = `select count('favors_id') from favors where favors_timer = '${dictType}' and favors_name like '%${name}%';`;
    }
  } else {
    if (name) {
      sql = `select * from favors where favors_name like '%${name}%' limit ${size} offset ${offset}`;
      lenSql = `select count('favors_id') from favors where favors_name like '%${name}%';`;
    }
  }

  db.queryAsync(lenSql).then(count => {
    db.queryAsync(sql)
      .then(res1 => {
        let data = res1.results;
        let total = count.results[0]["count('favors_id')"];
        if (!token) {
          res.send({
            code: 200,
            data,
            msg: 'success',
            total
          });
        } else {
          const user = verifyToken(token);
          if (user.role_key === 'snow') {
            data.forEach(item => {
              item.favors_name = '******'; // 隐藏姓名
            });
          }
          res.send({
            code: 200,
            data,
            msg: 'success',
            total
          });
        }
      })
      .catch(err => {
        res.send({
          code: 500,
          data: null,
          msg: '系统异常，请联系管理员',
          total: 0
        });
      });
  });
});

// 编辑人情来往
router.post('/favors/edit', (req, res) => {
  let { favors_id, favors_name, favors_timer, favors_money, favors_backMoney, remark } = req.body;
  let mobileSql = `update favors set favors_backMoney = '${favors_backMoney}', update_time = '${new Date()}' where favors_id = '${favors_id}';`;
  let sql = `update favors set favors_name = '${favors_name}', favors_timer = '${favors_timer}', favors_money = '${favors_money}', favors_backMoney = '${favors_backMoney}', remark = '${remark}', update_time = '${new Date()}' where favors_id = '${favors_id}';`;
  db.queryAsync(favors_name ? sql : mobileSql)
    .then(res1 => {
      res.send({
        code: 200,
        data: res1.results,
        msg: 'success'
      });
    })
    .catch(err => {
      res.send({
        code: 500,
        data: null,
        msg: '系统异常，请联系管理员'
      });
    });
});

// 新增人情来往
router.post('/favors/add', (req, res) => {
  let { favors_name, favors_timer, favors_money, favors_backMoney, remark } = req.body;
  let sql = `insert into favors (favors_name, favors_timer, favors_money, favors_backMoney, remark, create_time) values ('${favors_name}', '${favors_timer}', '${favors_money}', '${favors_backMoney}', '${remark}', '${new Date()}');`;
  db.queryAsync(sql)
    .then(res1 => {
      res.send({
        code: 200,
        data: res1.results,
        msg: 'success'
      });
    })
    .catch(err => {
      res.send({
        code: 500,
        data: null,
        msg: '系统异常，请联系管理员'
      });
    });
});

// 删除
router.delete('/favors/del', (req, res) => {
  let { id } = req.query;
  let sql = `delete from favors where favors_id = '${id}';`;
  db.queryAsync(sql)
    .then(res1 => {
      res.send({
        code: 200,
        data: res1.results,
        msg: 'success'
      });
    })
    .catch(err => {
      res.send({
        code: 500,
        data: null,
        msg: '系统异常，请联系管理员'
      });
    });
});

// 导出
router.get('/favors/export', (req, res) => {
  let { dictType, name } = req.query;
  let sql = `select * from favors`;
  if (dictType) {
    sql = `select * from favors where favors_timer = '${dictType}'`;
    if (name) {
      sql = `select * from favors where favors_timer = '${dictType}' and favors_name like '%${name}%'`;
    }
  } else {
    if (name) {
      sql = `select * from favors where favors_name like '%${name}%'`;
    }
  }
  try {
    db.queryAsync(sql).then(favorsRes => {
      let data = favorsRes.results;
      dictSql = `select* from sys_dict where dictType = 'favors_time' and pid <> 0 order by sort ASC;`;
      db.queryAsync(dictSql).then(async favorsTimerRes => {
        let dictData = favorsTimerRes.results;
        console.log('------- dictData -------', dictData);
        // 处理 来往时间点 字典
        data.forEach(item => {
          item.favorsTimerStr = dictData.find(dict => dict.value === item.favors_timer).label;
        });

        const workbook = new Excel.Workbook();
        const worksheet = workbook.addWorksheet('收入明细');
        // 设置表头
        // worksheet.addRow(['标题', '月份', '收入金额', '备注', '收入截图']);
        let baseTableTitle = [
          { header: '姓名', key: 'favors_name', width: 20 },
          { header: '金额', key: 'favors_money', width: 12 },
          { header: '回礼', key: 'favors_backMoney', width: 16 },
          { header: '时间点', key: 'favors_timer', width: 12 },
          { header: '创建时间', key: 'create_time', width: 12 },
          { header: '更新时间', key: 'update_time', width: 12 },
          { header: '备注', key: 'remark', width: 24 }
        ];

        worksheet.columns = baseTableTitle;
        // 循环写入数据
        data.forEach(async (item, index) => {
          const rowData = worksheet.addRow([item.favors_name, item.favors_money, item.favors_backMoney, item.favorsTimerStr, item.create_time, item.update_time, item.remark]);
          // 指定行高
          rowData.height = 50;
        });

        const buffer = await workbook.xlsx.writeBuffer();
        // 处理中文文件名
        const realName = encodeURI('人情来往明细.xlsx', 'GBK').toString('iso8859-1');
        // 设置响应头
        res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        res.setHeader('Content-Disposition', 'attachment; filename=' + realName);
        // 发送Excel文件
        res.send(buffer);
      });
    });
  } catch (err) {
    res.send({
      code: 500,
      data: null,
      msg: '系统异常，请联系管理员'
    });
  }
});
module.exports = router;
