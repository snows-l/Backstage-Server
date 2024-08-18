/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-17 12:24:28
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-18 17:10:46
 * @FilePath: /webseteUI/WebsiteUI/src/api/zone.js
 */
import request from '@/utils/request';

// 获取朋友圈
export function getZoneList(data) {
  return request({
    url: '/sys/zone/list',
    method: 'get',
    params: data
  });
}

// 获取朋友圈详情
export function getZoneDetail(id) {
  return request({
    url: '/sys/zone/detail/' + id,
    method: 'get'
  });
}

// 新增朋友圈记录
export function addZone(data) {
  return request({
    url: '/sys/zone/add',
    method: 'post',
    data
  });
}

// 修改朋友圈记录
export function editZone(data) {
  return request({
    url: '/sys/zone/edit',
    method: 'put',
    data
  });
}

// 删除朋友圈记录
export function delZone(id) {
  return request({
    url: '/sys/zone/del/' + id,
    method: 'delete'
  });
}
