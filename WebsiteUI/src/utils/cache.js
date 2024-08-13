/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-24 11:10:20
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-11 09:48:51
 * @FilePath: /Website/WebsiteUI/src/utils/cache.js
 */
export const session = {
  prefix: '__SESSION__',
  /**
   * @description:获指定的本地存储
   * @param { string }  key 获取的key值
   * @retrun 返回获取到的数据
   */
  get(key) {
    return JSON.parse(sessionStorage.getItem(this.prefix + key) ? sessionStorage.getItem(this.prefix + key) : '{"value":null}').value;
  },

  /**
   * @description:  设置本地存储
   * @param {*} key 设置的key
   * @param {*} value 设置的值
   */
  set(key, value) {
    sessionStorage.setItem(this.prefix + key, JSON.stringify({ value }));
  },

  /**
   * @description: 删除本地存储的指定项
   * @param {*} key 删除的key
   */
  remove(key) {
    sessionStorage.removeItem(this.prefix + key);
  },

  /**
   * @description: 清空本地存储
   */
  clear() {
    sessionStorage.clear();
  }
};

export const local = {
  prefix: '__LOCAL__',
  /**
   * @description:获指定的本地存储
   * @param { string }  key 获取的key值
   * @retrun 返回获取到的数据
   */
  get(key) {
    return JSON.parse(localStorage.getItem(this.prefix + key) ? localStorage.getItem(this.prefix + key) : '{"value":null}').value;
  },

  /**
   * @description:  设置本地存储
   * @param {*} key 设置的key
   * @param {*} value 设置的值
   */
  set(key, value) {
    localStorage.setItem(this.prefix + key, JSON.stringify({ value }));
  },

  /**
   * @description: 删除本地存储的指定项
   * @param {*} key 删除的key
   */
  remove(key) {
    localStorage.removeItem(this.prefix + key);
  },

  /**
   * @description: 清空本地存储
   */
  clear() {
    localStorage.clear();
  }
};

export default { session, local };
