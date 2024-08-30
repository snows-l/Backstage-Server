/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-15 14:26:40
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-11 11:25:44
 * @FilePath: /Website/WebsiteUI/src/api/system/user.js
 */
import request from '@/utils/request';

// 获取用户列表
export function getUser(data) {
  return request({
    url: '/user/list',
    method: 'get',
    params: data
  });
}

// 新增用户
export function addUser(data) {
  return request({
    url: '/user/add',
    method: 'post',
    data
  });
}

// 编辑用户
export function editUser(data) {
  return request({
    url: '/user/edit',
    method: 'put',
    data
  });
}

// 修改密码
export function editPwd(data) {
  return request({
    url: '/user/pwd/edit',
    method: 'put',
    data
  });
}

// 删除用户
export function delUser(id) {
  return request({
    url: `/user/del/${id}`,
    method: 'delete'
  });
}

// 获取用户信息
export function getUserInfo() {
  return request({
    url: `/user/info`,
    method: 'get'
  });
}
