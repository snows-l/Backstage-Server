/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-17 12:24:28
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-21 11:18:21
 * @FilePath: /Website/WebsiteUI/src/api/wages.js
 */
import request from '@/utils/request';

// 获取收入
export function getWagesList(data) {
  return request({
    url: '/sys/wages/list',
    method: 'get',
    params: data
  });
}

// 新增收入记录
export function addWages(data) {
  return request({
    url: '/sys/wages/add',
    method: 'post',
    data
  });
}

// 修改收入记录
export function editWages(data) {
  return request({
    url: '/sys/wages/edit',
    method: 'put',
    data
  });
}

// 删除收入记录
export function delWages(id) {
  return request({
    url: '/sys/wages/del/' + id,
    method: 'delete'
  });
}

// 导出
export function exportWages(data) {
  return request({
    url: '/sys/wages/export',
    method: 'get',
    params: data,
    responseType: 'blob'
    // responseType: 'buffer'
  });
}
