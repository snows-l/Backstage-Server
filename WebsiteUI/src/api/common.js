/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-28 15:20:41
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-18 18:00:55
 * @FilePath: /webseteUI/WebsiteUI/src/api/common.js
 */
import request from '@/utils/request';
import moment from 'moment';

// 公共上上传接口「上传图片」
export function uploadCommon(file, name) {
  // let suffix = file.type && file.type.split('')[1];
  let suffix = file.name && file.name.split('.')[1];
  let defaultName = file.name && file.name.split('.')[0];
  let formData = new FormData();
  // 去掉中文
  let fileName = name ? name.replace(/[\u4e00-\u9fa5]/g, '') + '__.' + suffix : defaultName.replace(/[\u4e00-\u9fa5]/g, '') + '__.' + suffix;
  formData.append('file', file, fileName);
  return request({
    url: '/sys/file/upload/common',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

//  上传头像
export function uploadAvatar(file) {
  let suffix = file.name && file.name.split('.')[1];
  let formData = new FormData();
  let timeFormat = moment().format('YYYYMMDDHHmmss');
  let fileName = 'avatar_' + timeFormat + '.' + suffix;
  formData.append('file', file, fileName);
  return request({
    url: '/sys/file/upload/avatar',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

//  上传 工资 文件
export function uploadWages(file, name) {
  let suffix = file.name && file.name.split('.')[1];
  let defaultName = file.name && file.name.split('.')[0];
  let formData = new FormData();
  // 去掉中文
  let fileName = name ? name.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix : defaultName.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix;
  formData.append('file', file, fileName);
  return request({
    url: '/sys/file/upload/wages',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

//  上传 歌曲封面 文件
export function uploadMusicCover(file, name) {
  let suffix = file.name && file.name.split('.')[1];
  let defaultName = file.name && file.name.split('.')[0];
  let formData = new FormData();
  // 去掉中文
  let fileName = name ? name.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix : defaultName.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix;
  formData.append('file', file, fileName);
  return request({
    url: '/sys/file/upload/music',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

//  上传 文章封面 文件
export function uploadArticleCover(file, name) {
  let suffix = file.name && file.name.split('.')[1];
  let defaultName = file.name && file.name.split('.')[0];
  let formData = new FormData();
  // 去掉中文
  let fileName = name ? name.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix : defaultName.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix;
  formData.append('file', file, fileName);
  return request({
    url: '/sys/file/upload/article',
    method: 'post',
    data: formData,
    // bug: 这里的 headers 去掉，否则会报错
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

//  上传 歌曲 文件
export function uploadMp3(file, name) {
  let suffix = file.name && file.name.split('.')[1];
  let defaultName = file.name && file.name.split('.')[0];
  let formData = new FormData();
  // 去掉中文
  let fileName = name ? name.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix : defaultName.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix;
  formData.append('file', file, fileName);
  return request({
    url: '/sys/file/upload/mp3',
    method: 'post',
    data: formData,
    headers: {
      'Content-Type': 'multipart/form-data'
    }
  });
}

//  上传 文章封面 文件
export function uploadZoneCover(file, name) {
  let suffix = file.name && file.name.split('.')[1];
  let defaultName = file.name && file.name.split('.')[0];
  let formData = new FormData();
  // 去掉中文
  let fileName = name ? name.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix : defaultName.replace(/[\u4e00-\u9fa5]/g, '') + '.' + suffix;
  formData.append('file', file, fileName);
  return request({
    url: '/sys/file/upload/zone',
    method: 'post',
    data: formData,
    // bug: 这里的 headers 去掉，否则会报错
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
