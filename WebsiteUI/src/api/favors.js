/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-01 09:30:53
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-24 22:16:54
 * @FilePath: /Website/WebsiteUI/src/api/favors.js
 */
import request from '@/utils/request';

// 获取人情列表
export function getFavorsList(data) {
  return request({
    url: '/favors/list',
    method: 'get',
    params: data
  });
}

// 修改人情回礼
export function editFavors(data) {
  return request({
    url: '/favors/edit',
    method: 'post',
    data
  });
}

// 修改人情回礼
export function addFavors(data) {
  return request({
    url: '/favors/add',
    method: 'post',
    data
  });
}

// 修改人情回礼
export function delFavors(id) {
  return request({
    url: `/favors/del?id=${id}`,
    method: 'delete'
  });
}

// 导出人情回礼
export function exportFavors(data) {
  return request({
    url: '/favors/export',
    method: 'get',
    params: data,
    responseType: 'blob'
  });
}
