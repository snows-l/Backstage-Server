/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-18 09:23:08
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-18 18:10:40
 * @FilePath: /webseteUI/Server/src/router/common.js
 */

const express = require('express');
// 数据库操作
const db = require('../../utils/connDB');
const router = express.Router();
const path = require('path');
const moment = require('moment');
// 设置token
const { generateToken, verifyToken } = require('../../utils/handleToken');

const multer = require('multer');
/**
 *
 * @description: 公共上传文件中间件 指定上传的路径 也就是跟目录下的public/common
 */
let commonFileName = '';
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, '../public/common');
  },
  filename: function (req, file, cb) {
    const ext = path.extname(file.originalname);
    const time = moment().format('YYYYMMDDHHmmss');
    commonFileName = 'common_file_' + file.originalname.replace(ext, '') + time + ext;
    cb(null, commonFileName);
  }
});
const upload = multer({ storage: storage });
// 公共上传文件;
router.post('/file/upload/common', upload.single('file'), (req, res) => {
  try {
    const file = req.file;
    let path = `/common/${commonFileName}`;
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
 * @description: 指定 头像 上传的路径 也就是跟目录下的public/images/avatars
 *
 */
const avatarStorage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, '../public/imgs/avatars');
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  }
});
const avatarUpload = multer({ storage: avatarStorage });
// 上传头像
router.post('/file/upload/avatar', avatarUpload.single('file'), (req, res) => {
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
    cb(null, '../public/imgs/wages');
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
router.post('/file/upload/wages', wagesUpload.single('file'), (req, res) => {
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
    cb(null, '../public/imgs/musics');
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
router.post('/file/upload/music', musicsUpload.single('file'), (req, res) => {
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
    cb(null, '../public/imgs/article');
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
router.post('/file/upload/article', articleUpload.single('file'), (req, res) => {
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
    cb(null, '../public/mp3');
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
router.post('/file/upload/mp3', musicSrcUpload.single('file'), (req, res) => {
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
    cb(null, '../public/imgs/zone');
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
router.post('/file/upload/zone', zoneUpload.single('file'), (req, res) => {
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
