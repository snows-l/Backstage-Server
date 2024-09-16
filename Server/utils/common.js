/*
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-04-17 09:36:26
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-16 21:48:32
 * @FilePath: /webseteUI/Server/utils/common.js
 */

const moment = require('moment');
const IP2Region = require('ip2region').default;
const db = require('../utils/connDB');
const { decryptToken } = require('../utils/handleToken');
const axios = require('axios');

/**
 * @description: 根据token获取当前用户的用户信息
 * @param { String } token
 * @return { Object } 当前登录用户的用户信息
 */
function getUserInfoByToken(token) {
  decryptToken(token).then(user => {
    const sql = `select* from sys_user where user_name = '${user.username}'`;
    db.queryAsync(sql).then(res => {
      return res.results[0];
    });
  });
}

/**
 * @description 构造树型结构数据
 * @param { Array } data 数据源
 * @param { String } id id字段 默认 'id'
 * @param { String } parentId 父节点字段 默认 'parentId'
 * @param { String } children 孩子节点字段 默认 'children'
 */
function tranListToTree(data, id, parentId, children) {
  let config = {
    id: id || 'id',
    parentId: parentId || 'parentId',
    childrenList: children || 'children'
  };
  var childrenListMap = {};
  var nodeIds = {};
  var tree = [];
  for (let d of data) {
    let parentId = d[config.parentId];
    if (childrenListMap[parentId] == null) {
      childrenListMap[parentId] = [];
    }
    nodeIds[d[config.id]] = d;
    childrenListMap[parentId].push(d);
  }
  for (let d of data) {
    let parentId = d[config.parentId];
    if (nodeIds[parentId] == null) {
      tree.push(d);
    }
  }
  for (let t of tree) {
    adaptToChildrenList(t);
  }
  function adaptToChildrenList(o) {
    if (childrenListMap[o[config.id]] !== null) {
      o[config.childrenList] = childrenListMap[o[config.id]];
    }
    if (o[config.childrenList]) {
      for (let c of o[config.childrenList]) {
        adaptToChildrenList(c);
      }
    }
  }
  function setLevel(t, level) {
    t.__level__ = level;
    if (!t.children || !t.children.length) return;
    t.children.forEach(t => setLevel(t, level + 1));
  }
  tree.forEach(t => setLevel(t, 0));
  return tree;
}

/**
 * @description: 将数据库获取的菜单改为前端可用菜单
 * @param { Object } singleMenuObj
 * @return { Object } Object
 */
function perfMenuObj(singleMenuObj) {
  return {
    component: singleMenuObj.component,
    meta: {
      title: singleMenuObj.menu_name,
      icon: singleMenuObj.icon
    },
    sort: singleMenuObj.menu_sort,
    hidden: singleMenuObj.visible == 1 ? false : singleMenuObj.visible == 0 ? true : false,
    name: singleMenuObj.path,
    path: singleMenuObj.path,
    menu_id: singleMenuObj.menu_id,
    parent_id: singleMenuObj.parent_id
  };
}

// 解析User-Agent获取操作系统信息
function getOS(userAgent) {
  const osList = [
    { name: 'Windows', regex: /Windows NT/ },
    { name: 'HarmonyOS', regex: /Harmony/ },
    { name: 'iOS', regex: /iPhone/ },
    { name: 'iPadOS', regex: /iPad/ },
    { name: 'Android', regex: /Android/ },
    { name: 'Windows Phone', regex: /Windows Phone/ },
    { name: 'MacOS', regex: /Macintosh/ },
    { name: 'Linux', regex: /Linux/ }
  ];
  for (const os of osList) {
    if (os.regex.test(userAgent)) {
      return os.name;
    }
  }
  return 'Unknown';
}

function getBrowserName(userAgent) {
  if (!userAgent) return 'Unknown';
  let browserName = '';
  let userAgentMap = userAgent.split(' ');
  for (let i = 0; i < userAgentMap.length; i++) {
    if (userAgentMap[i].includes('Firefox')) {
      browserName = 'Mozilla ' + userAgentMap[i];
      break;
    } else if (userAgentMap[i].includes('Chrome')) {
      browserName = 'Google ' + userAgentMap[i];
      break;
    } else if (userAgentMap[i].includes('Safari')) {
      browserName = 'Apple ' + userAgentMap[i];
      break;
    } else if (userAgentMap[i].includes('Opera')) {
      browserName = 'Opera' + userAgentMap[i];
      break;
    } else if (userAgentMap[i].includes('Edge')) {
      browserName = 'Microsoft ' + userAgentMap[i];
      break;
    } else if (userAgentMap[i].includes('Trident')) {
      browserName = 'Internet ' + userAgentMap[i];
      break;
    }
  }
  return browserName;
}

async function getCityByIp(ip) {
  return new Promise(async (resolve, reject) => {
    try {
      const cityMap = new IP2Region().search(ip);
      let city = '';
      if (cityMap) {
        cityMap.country = cityMap.country ? cityMap.country + '-' : '';
        cityMap.province = cityMap.province ? cityMap.province + '-' : '';
        city = cityMap.province + cityMap.city;
      }
      if (!city) {
        const cityObj = await axios.get('https://qifu-api.baidubce.com/ip/geo/v1/district?ip=' + ip);
        const cityData = cityObj.data.data;
        city = (cityData.prov ? cityData.prov : '') + (cityData.prov ? '-' : '') + (cityData.city ? cityData.city : '');
      }
      resolve(city);
    } catch (error) {
      reject(error);
    }
  });
}

module.exports = {
  getUserInfoByToken,
  tranListToTree,
  perfMenuObj,
  getOS,
  getBrowserName,
  getCityByIp
};
