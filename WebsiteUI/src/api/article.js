/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-17 12:24:28
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-10 18:57:46
 * @FilePath: /webseteUI/WebsiteUI/src/api/article.js
 */
import request from '@/utils/request';

// 获取文章
export function getArticleList(data) {
  return request({
    url: '/article/list',
    method: 'get',
    params: data
  });
}

// 获取文章详情
export function getArticleDetail(id) {
  return request({
    url: '/article/detail/' + id,
    method: 'get'
  });
}

// 新增文章记录
export function addArticle(data) {
  return request({
    url: '/article/add',
    method: 'post',
    data
  });
}

// 修改文章记录
export function editArticle(data) {
  return request({
    url: '/article/edit',
    method: 'put',
    data
  });
}

// 删除文章记录
export function delArticle(id) {
  return request({
    url: '/article/del/' + id,
    method: 'delete'
  });
}
