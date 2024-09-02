/*
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-04-15 19:00:39
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-02 20:54:40
 * @FilePath: /webseteUI/Server/src/index.js
 */

const path = require('path');
const express = require('express');
// 对post请求的请求体进行解析
const bodyParser = require('body-parser');
// 主要用来解决客户端请求与服务端的跨域问题
const cors = require('cors');

// 引入路由
const sysRouter = require('./router/sys');
const favorsRouter = require('./router/favors');
const dictRouter = require('./router/dict');
const userRouter = require('./router/user');
const roleRouter = require('./router/role');
const menuRouter = require('./router/menu');
const musicsRouter = require('./router/music');
const wagesRouter = require('./router/wages');
const commonRouter = require('./router/common');
const skillRouter = require('./router/skill');
const homeRouter = require('./router/home');
const logRouter = require('./router/log');
const articleRouter = require('./router/blog/article');
const commentRouter = require('./router/comment');
const zoneRouter = require('./router/blog/zone');
const friendLindkRouter = require('./router/blog/friendLink');
const blogRouter = require('./router/blog/index');

// 获取.env中的环境变量
const dotenv = require('dotenv').config({ path: './.env' });
// console.log('-------- dotenv --------', dotenv);
const jwtKey = process.env.APP_JWTKEY;
// console.log('-------- jwtKey --------', jwtKey);

const app = express();
app.use(bodyParser.json({ limit: '500mb' })); // 允许上传的最大文件为50MB
app.use(bodyParser.urlencoded({ limit: '500mb', extended: true }));
// app.use(bodyParser.json());
app.use(cors());

// 访问服务的接口
app.get('/', (req, res) => {
  res.send('hello node server');
});

// 路由
app.use('/sys', sysRouter);
app.use('/file', commonRouter);
app.use('/dict', dictRouter);
app.use('/favors', favorsRouter);
app.use('/user', userRouter);
app.use('/role', roleRouter);
app.use('/menu', menuRouter);
app.use('/musics', musicsRouter);
app.use('/wages', wagesRouter);
app.use('/skill', skillRouter);
app.use('/home', homeRouter);
app.use('/log', logRouter);
app.use('/article', articleRouter);
app.use('/comment', commentRouter);
app.use('/zone', zoneRouter);
app.use('/friendLink', friendLindkRouter);
app.use('/blog', blogRouter);

//设置静态资源访问路径   这样就可以直接通过 http://localhost:3333/[path]/[filename] 访问public目录下的静态资源文件
app.use(express.static(path.join(__dirname, '../public')));

// 服务启动在3333端口
app.listen(3333, '0.0.0.0', () => {
  console.log('-------- 服务启动了，运行在http://localhost:3333 --------');
});
