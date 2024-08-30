/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-15 14:26:40
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-27 18:11:50
 * @FilePath: /Website/WebsiteUI/src/api/system/role.js
 */
import request from '@/utils/request';

// 获取角色列表
export function getRoleList(data) {
  return request({
    url: '/sys/role/list',
    method: 'get',
    params: data
  });
}

// 新增角色
export function addRole(data) {
  return request({
    url: '/sys/role/add',
    method: 'post',
    data
  });
}

// 编辑角色
export function editRole(data) {
  return request({
    url: '/sys/role/edit',
    method: 'put',
    data
  });
}

// 编辑角色权限
export function editAuth(data) {
  return request({
    url: '/sys/role/auth/edit',
    method: 'post',
    data
  });
}

// 删除角色
export function delRole(id) {
  return request({
    url: `/sys/role/del/${id}`,
    method: 'delete'
  });
}
