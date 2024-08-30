/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-07 14:41:16
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-21 11:46:21
 * @FilePath: /webseteUI/Server/src/router/dict.js
 */
const express = require('express');
const { generateToken, verifyToken } = require('../../utils/handleToken');
// 数据库操作
const db = require('../../utils/connDB');

// 工具函数
const router = express.Router();
// list转tree的函数
const { tranListToTree } = require('../../utils/common');

// 获取字典
router.get('/dict/list', (req, res) => {
  let token = req.headers.authorization && req.headers.authorization.split(' ')[1];
  const reqParams = req.query;
  let params = {
    name: reqParams.name || '',
    dictType: reqParams.dictType || '',
    isAll: reqParams.isAll || false
  };

  let dictSql = 'select* from sys_dict order by sort ASC;';
  if (params.name) {
    let sql = `select * from sys_dict where label like '%${params.name}%' or dictType like '%${params.name}%' order by sort ASC;`;
    db.queryAsync(sql).then(res1 => {
      if (!res1.results.length)
        return res.send({
          code: 200,
          data: [],
          msg: 'success'
        });
      let userTypeArr = [];
      res1.results.forEach(item => {
        userTypeArr.push("'" + item.dictType + "'");
      });
      let userTypeArrStr = userTypeArr.join(',');
      let resultSql = `select * from sys_dict where dictType in (${userTypeArrStr}) order by sort ASC;`;
      db.queryAsync(resultSql)
        .then(res2 => {
          let source = res2.results;
          let data = tranListToTree(source, 'id', 'pid');
          if (!token) {
            res.send({
              code: 200,
              data,
              msg: 'success'
            });
          } else {
            const user = verifyToken(token);
            if (user.role_key === 'snow') {
              source.forEach((item, index) => {
                if (item.dictType == 'favors_time') {
                  if (item.pid == 0) {
                    item.label = '来往时间点';
                  } else {
                    item.label = `时间节点${item.value}`;
                    item.remark = `小秘密${item.value}，不能偷看的`;
                  }
                }
                if (item.dictType == 'wages_source') {
                  if (!item.pid == 0) {
                    item.label = `企业${item.value}`;
                    item.remark = `小秘密${item.value}，不能偷看的`;
                  }
                }
              });
            }
            res.send({
              code: 200,
              data: tranListToTree(source, 'id', 'pid'),
              msg: 'success'
            });
          }
        })
        .catch(err => {
          res.send({
            code: 500,
            data: null,
            msg: err
          });
        });
    });
  } else {
    if (params.dictType) {
      dictSql = `select* from sys_dict where dictType = '${params.dictType}' and pid <> 0 order by sort ASC;`;
    }
    db.queryAsync(dictSql)
      .then(dict_res => {
        let source = dict_res.results;
        if (!token) {
          res.send({
            code: 200,
            data: tranListToTree(source, 'id', 'pid'),
            msg: '请求成功'
          });
        } else {
          const user = verifyToken(token);
          if (user.role_key === 'snow') {
            source.forEach((item, index) => {
              if (item.dictType == 'favors_time') {
                if (item.pid == 0) {
                  item.label = '来往时间点';
                } else {
                  item.label = `时间节点${item.value}`;
                  item.remark = `小秘密${item.value}，不能偷看的`;
                }
              }
              if (item.dictType == 'wages_source') {
                if (!item.pid == 0) {
                  item.label = `企业${item.value}`;
                  item.remark = `小秘密${item.value}，不能偷看的`;
                }
              }
            });
          }
          res.send({
            code: 200,
            data: tranListToTree(source, 'id', 'pid'),
            msg: 'success'
          });
        }
      })
      .catch(err => {
        res.send({
          code: 500,
          data: null,
          msg: err
        });
      });
  }
});

// 删除字典
router.delete('/dict/delete', (req, res) => {
  const reqParams = req.body;
  let params = {
    id: reqParams.id
  };

  let selectSql = `select * from sys_dict where id=${params.id}`;
  let deleteSql = `delete from sys_dict where id=${params.id}`;
  db.queryAsync(selectSql)
    .then(res1 => {
      if (!res1.results.length) {
        return res.send({
          code: 200,
          data: 0,
          msg: '字典不存在'
        });
      }
      // 如果删除顶级字典，则删除其下级字典
      if (res1.results[0].pid == 0) {
        let selectDictSql = `select * from sys_dict where dictType='${res1.results[0].dictType}';`;
        db.queryAsync(selectDictSql).then(res2 => {
          let ids = res2.results.map(item => item.id).join(',');
          deleteSql = `delete from sys_dict where id in (${ids})`;
          db.queryAsync(deleteSql)
            .then(res2 => {
              res.send({
                code: 200,
                data: res2.affectedRows,
                msg: '删除成功'
              });
            })
            .catch(err => {
              res.send({
                code: 500,
                data: null,
                msg: err
              });
            });
        });
      } else {
        db.queryAsync(deleteSql)
          .then(res2 => {
            res.send({
              code: 200,
              data: res2.affectedRows,
              msg: '删除成功'
            });
          })
          .catch(err => {
            res.send({
              code: 500,
              data: null,
              msg: err
            });
          });
      }
    })
    .catch(err => {
      res.send({
        code: 500,
        data: null,
        msg: err
      });
    });
});

// 新增字典
router.post('/dict/add', (req, res) => {
  const reqParams = req.body;
  let params = {
    label: reqParams.label,
    value: reqParams.value,
    dictType: reqParams.dictType,
    pid: reqParams.pid || 0,
    sort: reqParams.sort || 0,
    remark: reqParams.remark || ''
  };
  let sql = `insert into sys_dict (label, value, dictType, pid, sort, remark,  createTime) values ('${params.label}', '${params.value}', '${params.dictType}', ${params.pid}, ${params.sort}, '${params.remark}', ?);`;
  db.queryAsync(sql, [new Date()])
    .then(res1 => {
      res.send({
        code: 200,
        data: res1.insertId,
        msg: '新增成功'
      });
    })
    .catch(err => {
      res.send({
        code: 500,
        data: null,
        msg: err
      });
    });
});

// 修改字典
router.post('/dict/edit', (req, res) => {
  const reqParams = req.body;
  let params = {
    id: reqParams.id,
    label: reqParams.label,
    value: reqParams.value == 'undefined' || reqParams.value == 'null' ? '' : reqParams.value || '',
    dictType: reqParams.dictType,
    pid: reqParams.pid || 0,
    sort: reqParams.sort || 0,
    remark: reqParams.remark || ''
  };
  let sql = `update sys_dict set label='${params.label}', value='${params.value}', dictType='${params.dictType}', pid=${params.pid}, sort=${params.sort}, remark='${params.remark}', updateTime=? where id=${params.id};`;
  db.queryAsync(sql, [new Date()])
    .then(res1 => {
      res.send({
        code: 200,
        data: res1.affectedRows,
        msg: '修改成功'
      });
    })
    .catch(err => {
      res.send({
        code: 500,
        data: null,
        msg: err
      });
    });
});

module.exports = router;
