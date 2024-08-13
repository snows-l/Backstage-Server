/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-25 14:57:05
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-27 18:08:59
 * @FilePath: /Website/WebsiteUI/src/api/system/dict.js
 */
import request from '@/utils/request';
// 获取字典
export function getDict(data) {
  return request({
    url: '/sys/dict/list',
    method: 'get',
    params: data
  });
}

// 新增字典
export function addDict(data) {
  return request({
    url: '/sys/dict/add',
    method: 'post',
    data
  });
}

// 修改字典
export function updateDict(data) {
  return request({
    url: '/sys/dict/edit',
    method: 'post',
    data
  });
}

// 删除字典
export function deleteDict(data) {
  return request({
    url: '/sys/dict/delete',
    method: 'delete',
    data
  });
}
