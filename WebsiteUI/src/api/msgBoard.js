/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-17 12:24:28
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-20 15:17:59
 * @FilePath: /webseteUI/WebsiteUI/src/api/msgBoard.js
 */
import request from '@/utils/request';

// 获取朋友圈
export function getMsgBoardList(data) {
  return request({
    url: '/sys/comment/list',
    method: 'get',
    params: data
  });
}

// 新增朋友圈记录
export function addMsgBoard(data) {
  return request({
    url: '/sys/comment/add',
    method: 'post',
    data
  });
}

// 修改朋友圈记录
export function editMsgBoard(data) {
  return request({
    url: '/sys/comment/edit',
    method: 'put',
    data
  });
}

// 删除朋友圈记录
export function delMsgBoard(id) {
  return request({
    url: '/sys/comment/del/' + id,
    method: 'delete'
  });
}