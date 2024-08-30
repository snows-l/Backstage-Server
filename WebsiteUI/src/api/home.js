/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-02 17:31:52
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-02 20:18:06
 * @FilePath: /webseteUI/WebsiteUI/src/api/home.js
 */
import request from '@/utils/request';

// 获取首页统计
export function getTotal(data) {
  return request({
    url: '/home/count',
    method: 'get',
    params: data
  });
}

// 获取近年年收入
export function getWageCurrentYear(data) {
  return request({
    url: '/home/yearIncome',
    method: 'get',
    params: data
  });
}

// 获取人情来往
export function getFavorsList(data) {
  return request({
    url: '/home/favors/list',
    method: 'get',
    params: data
  });
}
