/*
 * @Description: ------ node连接并操作mysql封装 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-04-12 15:38:57
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-18 18:20:23
 * @FilePath: /webseteUI/Server/utils/connDB.js
 */
const moment = require('moment');
class DBPool {
  constructor() {
    this.mysql = require('mysql');
    this.config = require('../db.config.json');
    //1.创建mysql连接对象
    this.pool = this.mysql.createPool(this.config);
  }
  query(sql, params, callBack) {
    //2.打开
    this.pool.getConnection((err, connection) => {
      if (err) {
        // console.log('数据库连接失败', err);
        throw err;
      }
      // console.log('数据库连接成功');
      // 3.执行sql查询
      connection.query(sql, params, (err, results, fields) => {
        // 4.释放连接
        connection.release();
        // 5.销毁连接： 当连接不需要使用且需要从连接池中移除的时候，我们可以使用destory方法，该方法使用如下所示：
        connection.destroy();
        if (err) {
          // console.log('数据库操作失败');
          throw err;
        }
        // console.log('数据库操作成功');
        callBack && callBack({ results, fields });
      });
    });
  }

  queryAsync(sql, params) {
    const self = this;
    return new Promise((resolve, reject) => {
      //2.获取连接
      this.pool.getConnection((err, connection) => {
        if (err) {
          console.log('数据库连接失败', err);
          reject(err);
          return;
        }
        // console.log('数据库连接成功');
        //3.执行sql查询
        console.log(moment().format('YYYY-MM-DD HH:mm:ss'), { sql, params });
        connection.query(sql, params, (err, results, fields) => {
          connection.release(); //释放链接
          connection.destroy(); //销毁链接
          if (err) {
            console.log('数据库操作失败', err);
            reject(err);
            return;
          }
          // console.log('数据库操作成功');
          resolve({
            results,
            fields
          });
        });
      });
    });
  }
}

module.exports = new DBPool();
