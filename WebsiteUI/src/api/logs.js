/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-05 21:52:00
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-05 22:04:09
 * @FilePath: /webseteUI/WebsiteUI/src/api/logs.js
 */
import request from '@/utils/request';

// 获取日志列表
export function getLogsList(data) {
  return request({
    url: '/log/list',
    method: 'get',
    params: data
  });
}

// 新增日志
export function addLogs(data) {
  return request({
    url: '/log/add',
    method: 'post',
    data
  });
}

// 导出日志
export function exportLogs(data) {
  return request({
    url: '/log/export',
    method: 'get',
    params: data,
    responseType: 'blob'
  });
}
