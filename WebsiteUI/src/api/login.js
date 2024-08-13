/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-24 12:21:11
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-04-01 09:35:29
 * @FilePath: /Website/WebsiteUI/src/api/login.js
 */
import request from '@/utils/request';

// 登录方法
export function login(data) {
  return request({
    url: '/sys/login',
    headers: {
      isToken: false
    },
    method: 'post',
    data: data
  });
}

// 注册方法
export function register(data) {
  return request({
    url: '/sys/register',
    headers: {
      isToken: false
    },
    method: 'post',
    data: data
  });
}

// 获取用户详细信息
export function getInfo() {
  return request({
    url: '/sys/getInfo',
    method: 'get'
  });
}

// 退出方法
export function logout() {
  return request({
    url: '/sys/logout',
    method: 'post'
  });
}

// 获取用户菜单
export function getMenu() {
  return request({
    url: '/sys/getRouters',
    method: 'get'
  });
}

// 获取验证码
export function getCodeImg() {
  return request({
    url: '/sys/captchaImage',
    headers: {
      isToken: false
    },
    method: 'get',
    timeout: 20000
  });
}

// 重置密码
export function resetpwd(data) {
  return request({
    url: '/sys/resetpwd',
    method: 'post',
    data
  });
}
