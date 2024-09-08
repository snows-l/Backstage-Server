/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-28 15:20:41
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-08 21:47:24
 * @FilePath: /webseteUI/WebsiteUI/src/api/common.js
 */
import request from '@/utils/request';

/**
 * @description: 公共上传接口
 * @param {*} file 上传的文件
 * @param {*} dir 上传到服务器哪个目录 如：/upload/image
 * @param {*} name
 * @returns
 */
// 公共上上传接口「上传图片」
export function uploadFile(file, dir, name) {
  const fileName = (name || file.name).replace(/[\u4e00-\u9fa5]/g, '_');
  formData.append('file', file, fileName);
  formData.append('dir', dir);

  return request({
    url: '/upload/file',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

// 修改项目配置
export function updateProjectConfig(data) {
  return request({
    url: '/sys/appconfig/update',
    method: 'post',
    data
  });
}
