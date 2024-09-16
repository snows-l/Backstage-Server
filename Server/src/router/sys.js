/*
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-04-16 18:41:28
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-16 21:56:15
 * @FilePath: /webseteUI/Server/src/router/sys.js
 */

const express = require('express');
// 设置token
const { generateToken, verifyToken } = require('../../utils/handleToken');
// 解密前端的加密密码
const { decryptPwd, encrypt } = require('../../utils/node-rsa');
// 数据库操作
const db = require('../../utils/connDB');
// list转tree的函数
const { tranListToTree, perfMenuObj, getOS, getBrowserName, getCityByIp } = require('../../utils/common');
const svgCaptcha = require('svg-captcha'); // 生成svg验证码
// const formidable = require('formidable'); // 上传图片
const multer = require('multer');
const { default: axios } = require('axios');
const moment = require('moment');

const router = express.Router();
let globlCode = ''; // 存放生成的验证码

/**
 * @description: 登录接口
 * @return {*}
 */
router.post('/login', (req, res) => {
  // 前端读取到的用户密码
  const user = req.body;
  if (user.code.toLowerCase() != globlCode && user.code.toLowerCase() != 'vvvv' && user.code.toLowerCase() != 'v')
    return res.send({
      code: 500,
      data: null,
      msg: '验证码错误！'
    });
  const sql = `select * from sys_user where user_name = '${user.username}'`;
  db.queryAsync(sql)
    .then(async response => {
      if (!response.results.length)
        return res.send({
          code: 500,
          msg: `用户名不存在`
        });
      let dbUser = response.results[0];
      let dbpwd;
      let userepwd;
      try {
        dbpwd = decryptPwd(dbUser.password);
        userepwd = decryptPwd(user.password);
      } catch (error) {
        res.send({
          code: 500,
          msg: '密码错误'
        });
        return;
      }
      if (user.username == dbUser.user_name && userepwd == dbpwd) {
        let userIdSql = `select * from sys_user where user_name = '${user.username}'`;
        const { results } = await db.queryAsync(userIdSql);
        const tokenData = {
          ...results[0],
          username: results[0].user_name
        };
        const token = generateToken(tokenData);
        try {
          let ip = req.headers['x-forwarded-for'] || req.connection.remoteAddress || 'Unknown';
          if (ip.includes(':')) {
            ip = ip.includes(':') ? ip.split(':').slice(-1)[0] : ip;
          }
          let city = await getCityByIp(ip);
          const os = getOS(req.headers['user-agent']);
          const browser = getBrowserName(req.headers['user-agent']);
          const sql = `INSERT INTO logs (username, ip, city, browser, os, create_time) VALUES (?,?,?,?,?,?)`;
          const params = [user.username, ip, city, browser, os, moment().format('YYYY-MM-DD HH:mm:ss')];
          db.queryAsync(sql, params).then(_ => {
            res.send({
              code: 200,
              msg: '登录成功',
              token
            });
          });
        } catch (error) {
          res.send({
            code: 200,
            msg: error,
            token
          });
        }
      } else {
        res.send({
          code: 500,
          msg: '密码错误'
        });
      }
    })
    .catch(err => {
      res.send({
        code: 500,
        msg: '连接失败，请联系管理员'
      });
    });
});

//  获取登录验证码
router.get('/captchaImage', (req, res) => {
  const options = {
    size: 4, // 4个字母
    noise: 2, // 干扰线2条
    width: req.query.width || 90,
    height: req.query.height || 37,
    color: false, // 文字颜色
    background: '#333' // 背景颜色
  };
  let { text, data } = svgCaptcha.create(options); //字母和数字随机验证码
  globlCode = text.toLowerCase();
  res.type('svg');
  res.send({
    text: text,
    img: data
  });
});

// 注册
router.post('/register', (req, res) => {
  let user = req.body;
  if (user.code.toLowerCase() != globlCode)
    return res.send({
      code: 500,
      data: null,
      msg: '验证码错误！'
    });
  let selectUserNameSql = `select* from sys_user where user_name = '${user.username}'`;
  db.queryAsync(selectUserNameSql).then(ress => {
    if (ress.results.length) {
      return res.send({
        code: 500,
        msg: `用户名已经存在`
      });
    } else {
      if (decryptPwd(user.password) != decryptPwd(user.confirmPassword)) {
        return res.send({
          code: 500,
          msg: `两次输入的密码不相同！`
        });
      }
      let insterSql = `INSERT INTO sys_user (user_name, nick_name, password, role, role_key, create_time) VALUES ('${user.username}', '${user.username}', '${user.password}', 105, 'snow', ?);`;
      db.queryAsync(insterSql, [new Date()])
        .then(() => {
          // let createTableSql = `CREATE TABLE IF NOT EXISTS favors_${user.username} (
          //   favors_id INT(11) NOT NULL AUTO_INCREMENT,
          //   favors_name VARCHAR(255) NOT NULL,
          //   favors_money VARCHAR(255) NOT NULL,
          //   favors_backMoney VARCHAR(255) NOT NULL,
          //   create_time VARCHAR(255) NOT NULL,
          //   update_time VARCHAR(255) NOT NULL,
          //   favors_timer VARCHAR(255) NOT NULL,
          //   remark VARCHAR(255) NOT NULL,
          //   PRIMARY KEY (favors_id)
          // ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;`;
          // db.queryAsync(createTableSql).then(createRes => {
          // });
          res.send({
            code: 200,
            data: null,
            msg: `注册成功`
          });
        })
        .catch(err => {
          res.send({
            code: 500,
            msg: `服务器异常， 请稍候再试！`
          });
        });
    }
  });
});

// 密码重置
router.post('/resetpwd', (req, res) => {
  let { username, code } = req.body;
  if (code.toLowerCase() != globlCode)
    return res.send({
      code: 500,
      data: null,
      msg: '验证码错误！'
    });
  if (username) {
    let selectUserNameSql = `select* from sys_user where user_name = '${username}'`;
    db.queryAsync(selectUserNameSql).then(res1 => {
      if (res1.results.length == 0) {
        res.send({
          code: 500,
          msg: `用户名不存在`
        });
      } else {
        let pwd = encrypt(username + '8888');
        let sql = `update sys_user set password = '${pwd}' where user_id = '${res1.results[0].user_id}'`;
        db.queryAsync(sql).then(res2 => {
          res.send({
            code: 200,
            data: {
              pwd: username + '8888'
            },
            msg: `密码修改成功`
          });
        });
      }
    });
  }
});

// 获取用户信息
router.get('/getInfo', (req, res) => {
  if (req.headers.authorization) {
    let token = req.headers.authorization.split(' ')[1];
    try {
      const user = verifyToken(token);
      let sendInfo = {
        user: {},
        menu: [],
        roleStr: ''
      };
      if (user) {
        sendInfo.user = user;
        sendInfo.roleStr = user.role_str;
        if (sendInfo.user.role_key == 'admin') {
          const sql = `select* from sys_menu`;
          db.queryAsync(sql).then(res_menus => {
            const menus = res_menus.results.map(item => {
              return perfMenuObj(item);
            });
            let memuTree = tranListToTree(menus, 'menu_id', 'parent_id');
            sendInfo.menu = memuTree;
            res.send({
              code: 200,
              data: sendInfo,
              msg: '操作成功'
            });
          });
        } else {
          res.send({
            code: 200,
            data: sendInfo,
            msg: '操作成功'
          });
        }
      } else {
        res.status(200).send({ code: '401', msg: '登录失效，请重新登录' });
      }
    } catch (error) {
      res.send({
        code: '401',
        data: null,
        msg: '登录失效，请重新登录'
      });
    }
  }
});

/**
 * @description: 获取用户菜单
 *
 * @step1 { Object } loginInfo ==> 根据token拿到登录的信息
 * @step2 { String } user ==> 根据登录的信息 username 查询用户的用户对象 并取到user_id
 * @step3 { String } role_id ==> 根据user_id 查询用户 role_id
 * @step4 { Array } menuIds ==> 根据role_id 查询当前角色绑定的 memus 并取到menuIds
 * @step5 { Array } menus ==> 根据menuIds 查询对应的菜单 memus 并取到menus
 * @step6 { Array } menus ==> 根据 perfMenuObj(item) 方法处理成前端要用的菜单
 * @step6 { Array } memuTree ==> 根据 tranListToTree(menus) 方法处理成树形数据
 */
router.get('/getRouters', (req, res) => {
  if (req.headers.authorization) {
    try {
      let token = req.headers.authorization.split(' ')[1];
      const user = verifyToken(token);
      if (user) {
        if (user.role_key == 'admin') {
          // 如果是超级管理员 ||
          const sql = `select* from sys_menu`;
          db.queryAsync(sql).then(res_menus => {
            // 排序
            res_menus.results.sort((a, b) => {
              return a.menu_sort - b.menu_sort;
            });
            const menus = res_menus.results.map(item => {
              return perfMenuObj(item);
            });

            let memuTree = tranListToTree(menus, 'menu_id', 'parent_id');
            const result = {
              code: 200,
              msg: '操作成功',
              data: memuTree
            };
            res.send(result);
          });
        } else {
          // 返回格式
          let source = [
            {
              menu_id: 1,
              menu_name: 'PC端',
              parent_id: 0,
              menu_sort: 1,
              path: '',
              component: null,
              query: '',
              menu_type: 'M',
              visible: '0',
              status: '1',
              icon: '',
              create_by: 'admin',
              create_time: '2024-03-24T05:35:37.000Z',
              update_by: '',
              update_time: null,
              remark: 'pc端目录',
              children: []
            },
            {
              menu_id: 2,
              menu_name: '移动端',
              parent_id: 0,
              menu_sort: 2,
              path: '/m',
              component: null,
              query: '',
              menu_type: 'M',
              visible: '0',
              status: '1',
              icon: 'monitor',
              create_by: 'admin',
              create_time: '2024-03-24T05:35:37.000Z',
              update_by: '',
              update_time: null,
              remark: '移动端菜单目录',
              children: []
            }
          ];
          // 保留权限menu_id 的菜单
          let menuIds = [];
          // 根据role_id 查询当前角色绑定的 memu_id
          const sqlMenuIdsByRoleId = `select* from sys_role where role_id = '${user.role}'`;
          db.queryAsync(sqlMenuIdsByRoleId).then(async role => {
            // 拿到角色绑定的 全部菜单id
            let menuIdsStr = role.results[0].menu_ids;
            if (!menuIdsStr) {
              const result = {
                code: 200,
                msg: '操作成功',
                data: source
              };
              res.send(result);
            } else {
              menuIds = menuIdsStr.split(',');
              menuIds = menuIds.filter(item => {
                return item != 0 && item != 1 && item != 2;
              });
              menuIdsStr = menuIds.join(',');
              // 拿到所有菜单以及父级菜单id
              let menusSql = `select* from sys_menu where menu_id in (${menuIdsStr})`;
              db.queryAsync(menusSql).then(res_menus => {
                const pids = res_menus.results.map(item => {
                  return item.parent_id;
                });

                // 拿到 全部的 menuIds
                menuIds = [...menuIds, ...pids];
                // 去掉顶级菜单  0,1,2  再次筛选的原因是因为父级菜单也会出现，
                menuIds = menuIds.filter(item => {
                  return item != 0 && item != 1 && item != 2;
                });
                // 全部的 menuIds 去重并转字符串
                let allMenusStr = Array.from(new Set(menuIds)).join(',');

                let allMenusSql = `select* from sys_menu where menu_id in (${allMenusStr})`;
                db.queryAsync(allMenusSql).then(all_menus => {
                  let allMenus = all_menus.results;
                  allMenus.sort((a, b) => {
                    return a.menu_sort - b.menu_sort;
                  });
                  let resultAllMenus = allMenus.map(item => {
                    return perfMenuObj(item);
                  });
                  // 合并父级菜单和子菜单
                  source[0].children = tranListToTree(resultAllMenus, 'menu_id', 'parent_id');
                  const result = {
                    code: 200,
                    msg: '操作成功',
                    data: source
                  };
                  res.send(result);
                });
              });
            }
          });
        }
      } else {
        res.status(200).send({ code: '401', msg: '登录失效，请重新登录' });
      }
    } catch (error) {
      res.send({
        code: '401',
        data: null,
        msg: '登录失效，请重新登录'
      });
    }
  }
});

// 退出登录
router.post('/logout', (req, res) => {
  res.send({
    code: 200,
    msg: '退出登录成功！'
  });
});

// 修改项目配置
router.post('/appconfig/update', (req, res) => {
  const { appconfig } = req.body;
  if (req.headers.authorization) {
    const token = req.headers.authorization.split(' ')[1];
    try {
      const userInfo = verifyToken(token);
      if (userInfo) {
        const sql_update = `UPDATE sys_user SET app_config = ? WHERE user_id = ${userInfo.user_id}`;
        db.queryAsync(sql_update, [appconfig]).then(() => {
          res.send({
            code: 200,
            msg: '修改成功',
            data: null
          });
        });
      }
    } catch (error) {
      res.send({
        code: 401,
        data: null,
        msg: '请重新登录'
      });
    }
  } else {
    res.send({
      code: 200,
      data: null,
      msg: '本地配置，无需登录'
    });
  }
});

module.exports = router;
