/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-17 12:24:28
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-20 21:31:00
 * @FilePath: /webseteUI/WebsiteUI/src/api/musics.js
 */
import request from '@/utils/request';

// 获取收入
export function getMusicList(data) {
  return request({
    url: '/musics/list',
    method: 'get',
    params: data
  });
}

// 新增收入记录
export function addMusic(data) {
  return request({
    url: '/musics/add',
    method: 'post',
    data
  });
}

// 修改收入记录
export function editMusic(data) {
  return request({
    url: '/musics/edit',
    method: 'put',
    data
  });
}

// 删除收入记录
export function delMusic(id) {
  return request({
    url: '/musics/del/' + id,
    method: 'delete'
  });
}

// 导出
export function exportMusic(data) {
  return request({
    url: '/musics/export',
    method: 'get',
    params: data,
    responseType: 'blob'
    // responseType: 'buffer'
  });
}
