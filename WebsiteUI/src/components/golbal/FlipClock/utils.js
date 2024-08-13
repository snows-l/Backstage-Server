/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-10 09:40:51
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-10 10:07:45
 * @FilePath: /Website/WebsiteUI/src/components/golbal/FlipClock/utils.js
 */
/**
 * @description: 剩余时间
 */
export function getTimeArr(now = new Date()) {
  const h = now.getHours();
  const m = now.getMinutes();
  const s = now.getSeconds();
  return [...toArr(h), ...toArr(m), ...toArr(s)];
}

// 更换数组类型
function toArr(n) {
  return n >= 10 ? ('' + n).split('').map(item => Number(item)) : [0, n];
}
