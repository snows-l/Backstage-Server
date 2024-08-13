/*
 * @Author: zs.duan
 * @Date: 2023-04-05 15:11:14
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-10 22:12:26
 * @FilePath: /webseteUI/Server/utils/sql.js
 */

/**
 * 创建sql
 * */
function createSql() {}
createSql.prototype = {
  sql: '',
  /**
   * 查询
   * @param {string} [query] 查询的语句 默认 * 选填
   * @example createSql.select("query").from("table_name").end()
   */
  select: function (query = '*') {
    this.sql = `SELECT ${query} `;
    return this;
  },
  /**
   * from 表名
   * @example createSql.select().from("table_name").end()
   * @param {string} table_name 表名称
   * */
  from: function (table_name) {
    this.sql += ` FROM ${table_name} `;
    return this;
  },
  /**
   * 左连接
   * @param {string} left_jion_table_name 左连接表名
   * @example createSql.select().from("table_name").leftJoin("left_jion_table_name").end()
   * */
  leftJoin: function (left_jion_table_name) {
    this.sql += ` LEFT JOIN ${left_jion_table_name} `;
    return this;
  },
  /**
   * join 连接
   * @param {string} join_table_name 连接表名
   * @example createSql.select().from("table_name").join("join_table_name").end()
   * */
  join: function (join_table_name) {
    this.sql += ` INNER JOIN ${join_table_name} `;
    return this;
  },
  /**
   * on
   * @param {string} on_condition on处理语句
   * @example createSql.select().from("table_name").on("on_condition").end()
   * */
  on: function (on_condition) {
    this.sql += ` ON ${on_condition} `;
    return this;
  },
  /**
   * order 通过函数排序
   * @param {string} order_condition 排序语句
   * @param {string} order_condition_two 排序语句 2 选填 如果有第二个参数 则第一个参数为开始位置
   * @example createSql.select().from("table_name").order("order_condition").end()
   * */
  order: function (order_condition, order_condition_two) {
    this.sql += order_condition_two ? ` ORDER BY ${order_condition} ${order_condition_two} ` : ` ORDER BY ${order_condition} `;
    return this;
  },
  /**
   * limit 限制条数等
   * @param {string} limit_condition 限制语句
   * @param {string} limit_condition_two 限制语句 2 选填 如果有第二个参数 则第一个参数为开始位置
   * @example createSql.select().from("table_name").limit(1 , 10).end()
   * */
  limit: function (limit_condition, limit_condition_two) {
    this.sql += limit_condition_two ? ` LIMIT ${limit_condition} , ${limit_condition_two} ` : ` LIMIT ${limit_condition} `;
    return this;
  },
  /**
   * offset 去掉几行元素
   * @param {string} offset_condition 处理语句
   * @param {string} offset_condition_two 处理语句 2 选填 如果有第二个参数 则第一个参数为开始位置
   * @example createSql.select().from("table_name").offset(1).end()
   * */
  offset: function (offset_condition, offset_condition_two) {
    this.sql += offset_condition_two ? ` OFFSET ${offset_condition} , ${offset_condition_two} ` : ` OFFSET ${offset_condition} `;
    return this;
  },
  /**
   * group 分组
   * @param {string} groupBy 分组语句
   * @example createSql.select().from("table_name").group("groupBy").end()
   * */
  group: function (groupBy) {
    this.sql += ` GROUP BY ${groupBy} `;
    return this;
  },
  /**
   * update 更新
   * @param {string} update_table_name 更新表名
   * @example createSql.update("table_name").set({key : value}).end()
   * @example createSql.update("table_name").set("set_condition").end()
   * */
  update: function (update_table_name) {
    this.sql = ` UPDATE ${update_table_name} `;
    return this;
  },
  /**
   * set 更新字段
   * @param {string | object} set_condition 更新语句/更新的对象
   * @example createSql.update("table_name").set({key : value}).end()
   * @example createSql.update("table_name").set("set_condition").end()
   * */
  set: function (set_condition) {
    if (typeof set_condition == 'string') {
      this.sql += `SET ${set_condition} `;
      return this;
    }
    this.sql += `SET ${setJsonSQL(set_condition, 'update').substring(0, setJsonSQL(set_condition, 'update').length - 2)} `;
    return this;
  },
  /**
   * 插入
   * @param {string} insert_table_name 插入表名
   * @example createSql.insert("table_name").value({key : value}).end()
   * @example createSql.insert("table_name").value("set_condition").end()
   */
  insert: function (insert_table_name) {
    this.sql = `INSERT INTO  ${insert_table_name} `;
    return this;
  },
  /**
   * value 插入数据
   * @param {string | object} value_condition 插入语句/更新的对象
   * @example createSql.insert("table_name").value({key : value}).end()
   * @example createSql.insert("table_name").value("set_condition").end()
   * */
  value: function (value_condition) {
    if (typeof value_condition == 'string') {
      this.sql += `SET ${value_condition} `;
      return this;
    }
    let fristSql = setJsonSQL(value_condition, 'insert').fristSql;
    let lastSql = setJsonSQL(value_condition, 'insert').lastSql;
    // console.log(lastSql.length - )
    this.sql += `(${fristSql.slice(0, fristSql.length - 1)}) VALUE (${lastSql.slice(0, lastSql.length - 2)})`;
    return this;
  },
  /**
   * 删除
   * @param {string} delete_table_name 删除表名
   * @example createSql.delete("delete_table_name").end()
   */
  delete: function (delete_table_name) {
    this.sql = ` DELETE FROM ${delete_table_name} `;
    return this;
  },
  /**
   * in 多条件 可用于 删除/查询等
   * @param {string} in_condition 多条件语句
   * @example createSql.delete("delete_table_name").in("in_condition").end()
   */
  in: function (in_condition) {
    this.sql += ` IN ${in_condition} `;
    return this;
  },
  /**
   * 条件
   * @param {string} where_condition 条件语句
   * @example createSql.select().from("table_name").where("where_condition").end()
   * @example createSql.delete("delete_table_name").where("where_condition").end()
   */
  where: function (where_condition) {
    this.sql += `WHERE ${where_condition} `;
    return this;
  },
  /**
   * and
   * @param {string} and_condition and语句
   * @example createSql.select().from("table_name").where("where_condition").and("and_condition").end()
   * @example createSql.delete("delete_table_name").where("where_condition").and("and_condition").end()
   * */
  and: function (and_condition) {
    this.sql += `AND ${and_condition} `;
    return this;
  },
  /**
   * or
   * @param {string} or_condition or语句
   * @example createSql.select().from("table_name").where("where_condition").or("or_condition").end()
   * @example createSql.delete("delete_table_name").where("where_condition").or("or_condition").end()
   * */
  or: function (or_condition) {
    this.sql += `OR ${or_condition} `;
    return this;
  },
  /**
   * 语句结尾
   * @example createSql.select().from("table_name").where("where_condition").end()
   * @example createSql.delete("delete_table_name").where("where_condition").end()
   * @example createSql.update("table_name").set({key : value}).end()
   * @example createSql.insert("table_name").value({key : value}).end()
   * */
  end: function () {
    return this.sql;
  },
  /**
   * 语句结尾
   * @example createSql.select().from("table_name").where("where_condition").build()
   * @example createSql.delete("delete_table_name").where("where_condition").build()
   * @example createSql.update("table_name").set({key : value}).build()
   * @example createSql.insert("table_name").value({key : value}).build()
   * */
  build: function () {
    return this.sql;
  },
  /**
   * 自定义 语句
   * @param {string} custom_condition 自定义语句
   * @example createSql.custom("custom_condition").end()
   * */
  custom: function (custom_condition) {
    this.sql += custom_condition;
    return this;
  }
};

/**
 * 处理传过来的sql语句
 * @param {object} data 需要处理的对象函数
 * @param {'insert' | 'update'} type 处理类型
 * @return {string} 处理好的sql
 * */
const setJsonSQL = (data, type) => {
  let reslut = {
    fristSql: '',
    lastSql: ''
  };
  for (const key in data) {
    if (Object.hasOwnProperty.call(data, key)) {
      const element = data[key];
      if (type == 'insert') reslut.fristSql += ` ${key} ,`;
      if (element !== 'false' && element !== 'true' && element !== false && element !== true) {
        if (type == 'update') reslut.fristSql += ` ${key} = '${data[key]}' , `;
        if (type == 'insert') reslut.lastSql += ` '${data[key]}' ,`;
      } else {
        switch (element) {
          case '':
            if (type == 'update') reslut.fristSql += ` ${key} = '' , `;
            if (type == 'insert') reslut.lastSql += `''`;
            break;
          case 'false':
            if (type == 'update') reslut.fristSql += ` ${key} = ${false} , `;
            if (type == 'insert') reslut.lastSql += ` ${false} , `;
            break;
          case 'true':
            if (type == 'update') reslut.fristSql += ` ${key} = ${true} , `;
            if (type == 'insert') reslut.lastSql += ` ${true} , `;
            break;
          default:
            if (type == 'update') reslut.fristSql += ` ${key} = ${element} , `;
            if (type == 'insert') reslut.lastSql += ` ${element} , `;
            break;
        }
      }
    }
  }
  if (type == 'update') return reslut.fristSql;
  if (type == 'insert') return reslut;
  return ' ';
};

/**
 * 创建sql语句
 * @author zs.duan <zs.duan@qq.com>
 * @param {Function} build 创建sql语句
 * @param {Function} end 创建sql语句
 * @return {object} {sql : sql} 返回对象sql语句
 * */
module.exports = new createSql();
