/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-17 12:24:28
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-20 13:28:10
 * @FilePath: /webseteUI/WebsiteUI/src/api/friendLink.js
 */
import request from '@/utils/request';

// 获取朋友圈
export function getFriendLinkList(data) {
  return request({
    url: '/sys/friendLink/list',
    method: 'get',
    params: data
  });
}

// 新增朋友圈记录
export function addFriendLink(data) {
  return request({
    url: '/sys/friendLink/add',
    method: 'post',
    data
  });
}

// 修改朋友圈记录
export function editFriendLink(data) {
  return request({
    url: '/sys/friendLink/edit',
    method: 'put',
    data
  });
}

// 删除朋友圈记录
export function delFriendLink(id) {
  return request({
    url: '/sys/friendLink/del/' + id,
    method: 'delete'
  });
}
