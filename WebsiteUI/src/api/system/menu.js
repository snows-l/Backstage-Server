/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-25 14:44:02
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-27 18:09:48
 * @FilePath: /Website/WebsiteUI/src/api/system/menu.js
 */
import request from '@/utils/request';

// 获取菜单列表
export function getMenuList(data) {
  return request({
    url: '/sys/menu/list',
    method: 'get',
    params: data
  });
}

// 新增菜单
export function addMenu(data) {
  return request({
    url: '/sys/menu/add',
    method: 'post',
    data
  });
}

// 修改菜单
export function updateMenu(data) {
  return request({
    url: '/sys/menu/edit',
    method: 'put',
    data
  });
}

// 删除菜单
export function deleteMenu(id) {
  return request({
    url: '/sys/menu/delete/' + id,
    method: 'delete'
  });
}
