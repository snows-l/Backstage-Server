/*
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-04-15 19:20:21
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-05-31 12:48:43
 * @FilePath: /Website/Server/utils/handleToken.js
 */

// 用于处理token
const jwt = require('jsonwebtoken');
// 获取.env中的环境变量
const dotenv = require('dotenv').config();
const jwtKey = process.env.APP_JWTKEY;

/**
 * @description: 生成token
 * @param { Object } params 用户登录数据
 * @param { Number } time token过期时间（不传默认三天）
 * @return { String } token 生成之后的token
 */
function generateToken(params, time = 60 * 60 * 24 * 3) {
  return jwt.sign({ ...params }, jwtKey, { expiresIn: time });
}

/**
 * @description: 解密token/验证token是否有效 ==> 返回对象说明解密成功token有效/返回false说明token失效
 * @param { String } token
 * @return { Object ｜ Boolean } Object：有效  Boolean:false :失效
 */
function verifyToken(token) {
  try {
    return jwt.verify(token, jwtKey);
  } catch (error) {
    console.log('-------- error --------', error);
    return false;
  }
}

module.exports = {
  generateToken,
  verifyToken
};
