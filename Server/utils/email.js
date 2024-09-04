/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-09-03 22:13:51
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-04 14:49:04
 * @FilePath: /backstage/Server/utils/email.js
 */

const base64 = `data:image/jpeg;base64,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`;

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
   * path: 路径
   * comment 评论内容
   * username 评论者用户名,
   * isBack: 回复/评论
   */
  const options = {
    ...defaultMailOptions,
    to: mailOptions.to,
    subject: `snows_l's BLOG 评论${mailOptions.isBack ? '回复' : ''}通知`,
    html: `<div id="email-content" style="border:1px solid #ccc;border-radius:10px;box-shadow:2px 2px 5px #ccc;background:linear-gradient(-45deg, #23a6d5, #23d5ab);background-image:url(${base64});background-repeat:no-repeat;background-size:cover;background-position:center;max-width:500px;display:inline-block;background-size: 100% 100%;">
            <div style="font-size:16px;line-height:1.5; padding:10px 10px;">您有新的评论${mailOptions.isBack ? '回复' : '评论'}</div>
            <div style="padding:0 30px 20px 30px">
              <div style="font-size:14px;line-height:1.5;margin-bottom:6px">
                ${mailOptions.username} 在 snows_l's BLOG ${
      mailOptions.isBack ? '回复了您' : '给您的文章评论了'
    }：请前往 <a style="text-decoration: none" target="_blank" href="http://124.223.41.220${mailOptions.path ? mailOptions.path : ''}">snows_l's BLOG</a> 查看
              </div>
              <div style="color:#333;font-size:12px;line-height:20px;wdith:100%;display: -webkit-box;-webkit-box-orient: vertical;-webkit-line-clamp: 2;overflow: hidden;text-overflow: ellipsis;">评论内容：${
                mailOptions.comment
              }</div>
            </div>
            <div style="padding:10px 0;display:flex;justify-content:center;align-items:center;border-top:1px solid #ccc;font-size:16px">
              <a style="text-decoration: none" target="_blank" href="http://124.223.41.220${mailOptions.path ? mailOptions.path : ''}">立即前往</a>
            </div>
          </div>
    `
  };
  return new Promise((resolve, reject) => {
    if (mailOptions.isMobile) {
      const container = document.getElementById('email-content');
      if (container) {
        container.style.background = 'linear-gradient(-45deg, #ee7752, #ce3e75, #23a6d5, #23d5ab)';
        container.style.backgroundSize = '400% 400%';
      }
    }
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
