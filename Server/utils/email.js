/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-09-03 22:13:51
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-03 23:34:46
 * @FilePath: /webseteUI/Server/utils/email.js
 */
const nodemailer = require('nodemailer');

// 创建邮件发送器
const transporter = nodemailer.createTransport({
  host: 'smtp.qq.com', // 例如 'gmail', 'hotmail'
  port: 465, // SMTP端口，465为SSL端口
  secure: true, // true for 465, false for other ports
  auth: {
    user: 'snows_l@qq.com',
    pass: 'ihaowucezjbibgdd' // 授权码或者密码
  }
});
// 163:PKVQDDCKNKSVCHLQ
// qq:ihaowucezjbibgdd

// 邮件信息
const defaultMailOptions = {
  from: 'snows_l@qq.com', // 发件人
  to: 'snows_l@163.com', // 收件人
  subject: "snows_l's BLOG评论回复通知", // 邮件标题"
  text: '', // 文本内容
  html: `<div>您有新的评论回复，请前往<a href="http://124.223.41.220">snows_l的博客</a>查看</div>` // HTML内容
};

// 发送邮件函数
function sendEmail(mailOptions) {
  /**
   * mailOptions {}
   * to: 收件人
   * articleTitle: 文章标题
   * articleId: 文章ID
   * comment 评论内容
   * username 评论者用户名
   */
  const options = {
    ...defaultMailOptions,
    to: mailOptions.to,
    subject: `${mailOptions.username}在 snows_l's BLOG 回复了您`,
    html: `<div style="font-size:14px;line-height:1.5;color:#333; border:1px solid #f00;padding:10px;margin:10px 0;background-color:#f7f7f7;">您有新的评论回复，请前往<a href="http://124.223.41.220/article/detail?id=${mailOptions.articleId}">snows_l的博客 - ${mailOptions.articleTitle}</a>查看</div>
        <div>${mailOptions.username} 回复了您的评论：${mailOptions.comment}</div>`
  };
  return new Promise((resolve, reject) => {
    transporter.sendMail(options, (error, info) => {
      if (error) {
        reject(error);
      } else {
        resolve(info);
      }
    });
  });
}

function verifyEmail() {
  // 验证服务器是否可用
  transporter.verify((error, success) => {
    if (error) {
      console.log(error);
    } else {
      console.log('Server is ready to take our messages');
    }
  });
}

module.exports = {
  sendEmail,
  verifyEmail
};
