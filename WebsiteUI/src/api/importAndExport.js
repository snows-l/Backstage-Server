/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-06-26 10:05:02
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-26 18:03:49
 * @FilePath: /Website/WebsiteUI/src/api/importAndExport.js
 */
import request from '@/utils/request';

// 获取技能list
export function getSkillList(data) {
  return request({
    url: '/sys/skill/list',
    method: 'get',
    params: data
  });
}

// 导入技能
export function importSkill(file, append = 1, name = '') {
  let formData = new FormData();
  let suffix = file.name && file.name.split('.')[1];
  let defaultName = file.name && file.name.split('.')[0];
  let fileName = name ? name.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix : defaultName.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix;
  formData.append('file', file, fileName);
  return request({
    url: '/sys/skill/import/' + append,
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

// 导出技能
export function exportSkill(data) {
  return request({
    url: '/sys/skill/export',
    method: 'post',
    data,
    responseType: 'blob'
  });
}
