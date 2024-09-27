/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-24 11:07:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-27 14:34:05
 * @FilePath: /backstage/WebsiteUI/src/utils/auth.js
 */
import Cookies from 'js-cookie';

const TokenKey = '__TOKEN__';

export function getToken() {
  return Cookies.get(TokenKey);
}

export function setToken(token) {
  return Cookies.set(TokenKey, token);
}

export function removeToken() {
  return Cookies.remove(TokenKey);
}
