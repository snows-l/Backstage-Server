/*
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-04-16 12:31:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-03-30 11:19:24
 * @FilePath: /Website/Server/utils/node-rsa.js
 */
const NodeRSA = require('node-rsa');
const publicKey = `-----BEGIN PUBLIC KEY-----
MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBANyotBECMF9jwfwuFLjcS/u075Ey4grB
y84j1TJ+sd/onQVPfAp//VLX9BeCJ405YrzXk9WkIt2JWfO2D/dT94MCAwEAAQ==
-----END PUBLIC KEY-----`;

// 密钥对生成 http://web.chacuo.net/netrsakeypair
const _priKey = `-----BEGIN RSA PRIVATE KEY-----
MIIBOwIBAAJBANyotBECMF9jwfwuFLjcS/u075Ey4grBy84j1TJ+sd/onQVPfAp/
/VLX9BeCJ405YrzXk9WkIt2JWfO2D/dT94MCAwEAAQJABi/OuKlcjNghsL3kA9jd
YoXMr8AC+XU8jx+PEzbdKt9v7v6e7e64tyTJlC9jA90b+nugbHGSUEaAt7gpkNIz
GQIhAPKPTQwvqKnDG8xYvFF6DYEdntHORANkW2oEm36pLlEpAiEA6OK9sXeOBgx+
0tVqw00uRZIuQJdLHpbPerwy+n50PMsCIQDfAq/lF2BsDK3fOGqUQrJt1qzx20If
GEMP+4J3dtbV2QIgOROJJjuE5VqeopGHrwH1ezuOdmoeEQspIo2JePcRCe0CIQCE
Jk+XZiWLXBpGopDp7r7zCHgBBCUOF4atMUfaseWgkA==
-----END RSA PRIVATE KEY-----`;

/**
 * 加密
 * @description: 对前端加密（jsencrypt加密）的密码进行解密
 * @param { String } txt 加密后的密码
 * @return { String } 解密后的密码
 */
function decryptPwd(txt) {
  const decrypt = new NodeRSA(_priKey); // 使用node-rsa
  decrypt.setOptions({ encryptionScheme: 'pkcs1' }); // 因为vue中使用jsencrypt，jsencrypt自身使用的是pkcs1加密方案, nodejs需要修改成pkcs1
  return decrypt.decrypt(txt, 'utf8');
}

// 使用公钥加密
// 加密
function encrypt(txt) {
  const encrypt = new NodeRSA(publicKey);
  encrypt.setOptions({ encryptionScheme: 'pkcs1' });
  return encrypt.encrypt(txt, 'base64');
}

module.exports = {
  encrypt,
  decryptPwd
};
