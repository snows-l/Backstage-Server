/*
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-04-15 11:47:47
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-03-30 11:23:59
 * @FilePath: /Website/WebsiteUI/src/utils/jsencrypt.js
 */
import JSEncrypt from 'jsencrypt/bin/jsencrypt.min';

// 密钥对生成 http://web.chacuo.net/netrsakeypair

const publicKey = `-----BEGIN PUBLIC KEY-----
MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBANyotBECMF9jwfwuFLjcS/u075Ey4grB
y84j1TJ+sd/onQVPfAp//VLX9BeCJ405YrzXk9WkIt2JWfO2D/dT94MCAwEAAQ==
-----END PUBLIC KEY-----`;

const privateKey = `-----BEGIN RSA PRIVATE KEY-----
MIIBOwIBAAJBANyotBECMF9jwfwuFLjcS/u075Ey4grBy84j1TJ+sd/onQVPfAp/
/VLX9BeCJ405YrzXk9WkIt2JWfO2D/dT94MCAwEAAQJABi/OuKlcjNghsL3kA9jd
YoXMr8AC+XU8jx+PEzbdKt9v7v6e7e64tyTJlC9jA90b+nugbHGSUEaAt7gpkNIz
GQIhAPKPTQwvqKnDG8xYvFF6DYEdntHORANkW2oEm36pLlEpAiEA6OK9sXeOBgx+
0tVqw00uRZIuQJdLHpbPerwy+n50PMsCIQDfAq/lF2BsDK3fOGqUQrJt1qzx20If
GEMP+4J3dtbV2QIgOROJJjuE5VqeopGHrwH1ezuOdmoeEQspIo2JePcRCe0CIQCE
Jk+XZiWLXBpGopDp7r7zCHgBBCUOF4atMUfaseWgkA==
-----END RSA PRIVATE KEY-----`;

// 加密
export function encrypt(txt) {
  const encryptor = new JSEncrypt();
  encryptor.setPublicKey(publicKey); // 设置公钥
  return encryptor.encrypt(txt); // 对数据进行加密
}

// 解密
export function decrypt(txt) {
  const encryptor = new JSEncrypt();
  encryptor.setPrivateKey(privateKey); // 设置私钥
  return encryptor.decrypt(txt); // 对数据进行解密
}
