/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-18 09:23:08
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-08 21:11:55
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
 * @description: 公共上传文件中间件 指定上传的路径 也就是跟目录下的public/common
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
// 公共上传文件;
router.post('/upload', upload.single('file'), (req, res) => {
  const token = req.headers.authorization && req.headers.authorization.split(' ')[1];
  try {
    const userInfo = verifyToken(token);
    if (userInfo) {
      const targetDir = req.body.dir;
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

/**
 *
 * @description: 指定 头像 上传的路径 也就是跟目录下的public/images/avatars
 *
 */
const avatarStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    const path = '../public/imgs/avatars';
    // 检测路径文件夹是否存在 不存在则创建
    if (!fs.existsSync(path)) {
      fs.mkdirSync(path, { recursive: true });
    }
    cb(null, path);
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});
const avatarUpload = multer({ storage: avatarStorage });
// 上传头像
router.post('/upload/avatar', avatarUpload.single('file'), (req, res) => {
  const file = req.file;
  const token = req.headers.authorization && req.headers.authorization.split(' ')[1];
  try {
    const userInfo = verifyToken(token);
    if (userInfo) {
      let avatarpath = `/imgs/avatars/${file.originalname}`;
      let sql = `UPDATE sys_user SET avatar = '${avatarpath}' WHERE user_id = ${userInfo.user_id}`;
      db.queryAsync(sql).then(() => {
        //将图片存放的地址返回
        res.send({
          code: 200,
          msg: '上传成功',
          data: {
            path: avatarpath
          }
        });
      });
    }
  } catch (error) {
    res.send({
      code: 401,
      msg: '请重新登录'
    });
  }
});

/**
 *
 * @description: 指定 工资记录 上传的路径 也就是跟目录下的public/wages
 *
 */
let wagesFileName = '';
const wagesStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    const path = '../public/imgs/wages';
    // 检测路径文件夹是否存在 不存在则创建
    if (!fs.existsSync(path)) {
      fs.mkdirSync(path, { recursive: true });
    }
    cb(null, path);
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    const time = moment().format('YYYYMMDDHHmmss');
    wagesFileName = 'wages_' + file.originalname.replace(ext, '') + time + ext;
    cb(null, wagesFileName);
  }
});
const wagesUpload = multer({ storage: wagesStorage });
// 上传工资记录
router.post('/upload/wages', wagesUpload.single('file'), (req, res) => {
  try {
    const file = req.file;
    let path = `/imgs/wages/${wagesFileName}`;
    //将图片存放的地址返回
    res.send({
      code: 200,
      msg: '上传成功',
      data: {
        path
      }
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '系统异常，请稍候再试！'
    });
  }
});

/**
 *
 * @description: 指定 歌曲封面 上传的路径 也就是跟目录下的public/imgs/musics
 *
 */
let musicsFileName = '';
const musicsStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    const path = '../public/imgs/musics';
    if (!fs.existsSync(path)) {
      fs.mkdirSync(path, { recursive: true });
    }
    cb(null, path);
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    const time = moment().format('YYYYMMDDHHmmss');
    musicsFileName = 'music_cover_' + file.originalname.replace(ext, '') + time + ext;
    cb(null, musicsFileName);
  }
});
const musicsUpload = multer({ storage: musicsStorage });
// 歌曲封面
router.post('/upload/music', musicsUpload.single('file', { a: '11111' }), (req, res) => {
  try {
    const file = req.file;
    let path = `/imgs/musics/${musicsFileName}`;
    //将图片存放的地址返回
    res.send({
      code: 200,
      msg: '上传成功',
      data: {
        path
      }
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '系统异常，请稍候再试！'
    });
  }
});

/**
 *
 * @description: 指定 文章 上传的路径 也就是跟目录下的public/imgs/article
 *
 */
let articleFileName = '';
const articleStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    const path = '../public/imgs/article';
    if (!fs.existsSync(path)) {
      fs.mkdirSync(path, { recursive: true });
    }
    cb(null, path);
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    const time = moment().format('YYYYMMDDHHmmss');
    articleFileName = 'article_cover_' + file.originalname.replace(ext, '') + time + ext;
    cb(null, articleFileName);
  }
});
const articleUpload = multer({ storage: articleStorage });
// 文章封面
router.post('/upload/article', articleUpload.single('file'), (req, res) => {
  try {
    const file = req.file;
    let path = `/imgs/article/${articleFileName}`;
    //将图片存放的地址返回
    res.send({
      code: 200,
      msg: '上传成功',
      data: {
        path
      }
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '系统异常，请稍候再试！'
    });
  }
});

/**
 *
 * @description: 指定 歌曲上传的路径 也就是跟目录下的public/mp3
 *
 */
let musicSrcFileName = '';
const musicSrcStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    const path = '../public/mp3';
    if (!fs.existsSync(path)) {
      fs.mkdirSync(path, { recursive: true });
    }
    cb(null, path);
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    const time = moment().format('YYYYMMDDHHmmss');
    musicSrcFileName = 'music_src_' + file.originalname.replace(ext, '') + time + ext;
    cb(null, musicSrcFileName);
  }
});
const musicSrcUpload = multer({ storage: musicSrcStorage });
// 上传工资记录
router.post('/upload/mp3', musicSrcUpload.single('file'), (req, res) => {
  try {
    const file = req.file;
    let path = `/mp3/${musicSrcFileName}`;
    //将图片存放的地址返回
    res.send({
      code: 200,
      msg: '上传成功',
      data: {
        path
      }
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '系统异常，请稍候再试！'
    });
  }
});

/**
 *
 * @description: 指定 空间 上传的路径 也就是跟目录下的public/imgs/zone
 *
 */
let zoneFileName = '';
const zoneStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    const path = '../public/imgs/zone';
    if (!fs.existsSync(path)) {
      fs.mkdirSync(path, { recursive: true });
    }
    cb(null, path);
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    const time = moment().format('YYYYMMDDHHmmss');
    zoneFileName = 'zone_cover_' + file.originalname.replace(ext, '') + time + ext;
    cb(null, zoneFileName);
  }
});
const zoneUpload = multer({ storage: zoneStorage });
// 文章封面
router.post('/upload/zone', zoneUpload.single('file'), (req, res) => {
  try {
    const file = req.file;
    let path = `/imgs/zone/${zoneFileName}`;
    //将图片存放的地址返回
    res.send({
      code: 200,
      msg: '上传成功',
      data: {
        path
      }
    });
  } catch (error) {
    res.send({
      code: 500,
      data: null,
      msg: '系统异常，请稍候再试！'
    });
  }
});

module.exports = router;
