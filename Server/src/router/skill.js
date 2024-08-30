/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-26 10:20:25
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-30 22:09:05
 * @FilePath: /webseteUI/Server/src/router/skill.js
 */
const express = require('express');
const db = require('../../utils/connDB');
const Excel = require('exceljs');
const multer = require('multer');

const router = express.Router();

// 获取技能列表
router.get('/list', (req, res) => {
  const { page = 1, size = 20, name, level } = req.query;
  let offset = (page - 1) * size;
  let sql = 'SELECT * FROM skill';
  let lenSql = `SELECT count('id') FROM skill`;
  if (name) {
    sql += ` WHERE name LIKE '%${name}%'`;
    lenSql += ` WHERE name LIKE '%${name}%'`;
  }
  if (level) {
    sql += ` ${name ? 'AND' : 'WHERE'} level = ${level}`;
    lenSql += ` ${name ? 'AND' : 'WHERE'} level = ${level}`;
  }
  sql += ` ORDER BY id ASC LIMIT ${size} OFFSET ${offset};`;
  db.queryAsync(lenSql).then(lenRes => {
    db.queryAsync(sql)
      .then(result => {
        res.send({
          code: 200,
          data: result.results,
          total: lenRes.results[0]["count('id')"],
          msg: 'success'
        });
      })
      .catch(err => {
        console.log(err);
        res.send({
          code: 500,
          data: null,
          total: 0,
          msg: '系统异常， 请联系管理员'
        });
      });
  });
});

// 导出技能
router.post('/export', (req, res) => {
  const { template } = req.body;
  const sql = 'SELECT * FROM skill';
  db.queryAsync(sql)
    .then(async result => {
      const data = result.results;
      const workbook = new Excel.Workbook();
      const worksheet = workbook.addWorksheet('收入明细');
      // 设置表头
      // worksheet.addRow(['标题', '月份', '收入金额', '备注', '收入截图']);
      let baseTableTitle = [
        { header: '技能名称', key: 'name', width: 12 },
        { header: '技能等级', key: 'level', width: 10 },
        { header: '技能描述', key: 'description', width: 20 },
        { header: '技能类型', key: 'type', width: 12 },
        { header: '技能效果', key: 'effect', width: 18 },
        { header: '技能消耗', key: 'cost', width: 18 },
        { header: '技能持续时间', key: 'duration', width: 20 },
        { header: '技能范围', key: 'ranges', width: 20 },
        { header: '技能目标', key: 'target', width: 20 }
      ];
      worksheet.columns = baseTableTitle;
      // 循环写入数据 如果不是模板，则默认写入数据
      if (!template) {
        data.forEach(async (item, index) => {
          const rowData = worksheet.addRow([item.name, item.level, item.description, item.type, item.effect, item.cost, item.duration, item.ranges, item.target]);
          // 指定行高
          rowData.height = 50;
        });
      } else {
        const rowData = worksheet.addRow(['大刀斩', '5', '技能描述', '大招', '亚瑟王那样的大招', '10000', '10', '500', '目标：亚瑟王']);
        // 指定行高
        rowData.height = 50;
      }
      const buffer = await workbook.xlsx.writeBuffer();
      // 处理中文文件名
      const realName = encodeURI('技能报表.xlsx', 'GBK').toString('iso8859-1');
      // 设置响应头
      res.setHeader('Content-Type', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
      res.setHeader('Content-Disposition', 'attachment; filename=' + realName);
      // 发送Excel文件
      res.send(buffer);
    })
    .catch(err => {
      console.log(err);
      res.send({
        code: 500,
        msg: 'failed'
      });
    });
});

/**
 * @description: 上传技能
 * @param {Object} req 请求对象
 * @param {Object} res 响应对象
 * @param {Function} next 中间件函数
 */
// 配置 multer 存储
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, '../public/common');
  },
  filename: function (req, file, cb) {
    cb(null, 'skill_' + file.originalname);
  }
});
const upload = multer({ storage: storage });
// 导入技能
router.post('/import/:append', upload.single('file'), (req, res) => {
  const { append } = req.params;

  // 下一步
  function next(params) {
    const workbook = new Excel.Workbook();
    const filePath = req.file.path;
    // 读取文件
    workbook.xlsx
      .readFile(filePath)
      .then(async () => {
        const worksheet = workbook.getWorksheet(1);
        const data = [];
        worksheet.eachRow({ includeEmpty: false }, (row, rowNumber) => {
          if (rowNumber === 1) return; // 跳过表头
          const rowData = row.values.slice(1); // 去掉第一列的索引
          data.push(rowData);
        });
        // 处理sql语句
        let sql = 'INSERT INTO skill (name, level, description, type, effect, cost, duration, ranges, target) VALUES ?';
        const params = data.map(item => [item[0], item[1], item[2], item[3], item[4], item[5], item[6], item[7], item[8]]);

        db.queryAsync(sql, [params])
          .then(result => {
            res.send({
              code: 200,
              data: data,
              msg: '导入成功'
            });
          })
          .catch(err => {
            console.log(err);
            res.send({
              code: 500,
              data: null,
              msg: '导入失败'
            });
          });
      })
      .catch(err => {
        console.log(err);
        res.send({
          code: 500,
          data: null,
          msg: '导入失败'
        });
      });
  }

  // 判断是否是追加导入
  if (append == 2) {
    let cleanSql = 'TRUNCATE TABLE skill;';
    db.queryAsync(cleanSql).then(() => {
      next();
    });
  } else {
    next();
  }
});

module.exports = router;
