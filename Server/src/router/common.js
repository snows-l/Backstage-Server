/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-18 09:23:08
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-08 21:49:59
 * @FilePath: /webseteUI/Server/src/router/common.js
 */

const express = require('express');
// 数据库操作
const db = require('../../utils/connDB');
const router = express.Router();
const path = require('path');
const moment = require('moment');
const fs = require('fs');
// 设置token
const { verifyToken } = require('../../utils/handleToken');
const multer = require('multer');

/**
 *
 * @description: 公共上传文件接口
 * @param { File } file 上传的文件
 * @param { String } dir 上传文件保存的路径 默认为 /common
 */
let commonFileName = '';
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    const path = '../public/temp';
    // 检测路径文件夹是否存在 不存在则创建
    if (!fs.existsSync(path)) {
      fs.mkdirSync(path, { recursive: true });
    }
    cb(null, path);
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    const time = moment().format('YYYYMMDDHHmmss');
    commonFileName = file.originalname.replace(ext, '') + time + ext;
    cb(null, commonFileName);
  }
});
const upload = multer({ storage: storage });
router.post('/file', upload.single('file'), (req, res) => {
  const token = req.headers.authorization && req.headers.authorization.split(' ')[1];
  try {
    const userInfo = verifyToken(token);
    if (userInfo) {
      const targetDir = req.body.dir || '/common';
      const tempDirFile = `../public/temp/${commonFileName}`;

      // 写入目标路径
      if (targetDir) {
        if (!fs.existsSync(targetDir)) {
          fs.mkdirSync('../public' + targetDir, { recursive: true });
          // 读取临时文件
          const file = fs.readFileSync(tempDirFile);
          // 重命名
          const fileName = targetDir.split('/')[targetDir.split('/').length - 1] + '_' + commonFileName;
          // 写入到目标路径
          fs.writeFileSync(path.join(__dirname, '../../public' + targetDir + '/' + fileName), file);
          fs.rmSync(tempDirFile); // 删除临时文件

          //将图片存放的地址返回
          res.send({
            code: 200,
            msg: '上传成功',
            data: {
              path: targetDir + '/' + fileName
            }
          });
        }
      }
    }
  } catch (error) {
    res.send({
      code: 401,
      data: null,
      msg: '401 Unauthorized'
    });
  }
});

module.exports = router;
