/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-24 10:22:55
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-21 21:27:56
 * @FilePath: /webseteUI/WebsiteUI/src/store/common.js
 */
import { getInfo, getMenu, login } from '@/api/login';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { getToken, removeToken, setToken } from '@/utils/auth';
import { local, session } from '@/utils/cache';
import { defineStore } from 'pinia';

export const useAppStore = defineStore('app', {
  state: () => {
    return {
      token: getToken(),
      user: {},
      avatar: '',
      menu: [],
      isLoadingRouter: false,
      isScreenFull: false,
      isMusicPlaying: false,
      currentPlayingMusicId: ''
    };
  },

  actions: {
    SET_TOKEN(token) {
      this.token = token;
    },
    SET_USER(user) {
      this.user = user;
    },
    SET_AVATAR(path) {
      this.avatar = path;
    },
    SET_MENU(menu) {
      this.menu = menu;
    },
    SET_ISLOADINGROUTER(flag) {
      this.isLoadingRouter = flag;
    },

    SET_ISSCREENFULL(flag) {
      this.isScreenFull = flag;
    },

    SET_ISMUSICPLAYING(flag) {
      this.isMusicPlaying = flag;
    },
    SET_CURRENTPLAYINGMUSICID(id) {
      this.currentPlayingMusicId = id;
    },

    // 登录
    LOGIN(data) {
      return new Promise((resolve, reject) => {
        login(data)
          .then(res => {
            session.set('TOKEN', res.token);
            this.SET_TOKEN(res.token);
            setToken(res.token);
            this.GET_USER_INFO();
            resolve();
          })
          .catch(err => {
            reject(err);
          });
      });
    },
    // 获取用户信息
    GET_USER_INFO() {
      return new Promise((resolve, reject) => {
        getInfo()
          .then(res => {
            if (res.data.user.app_config) {
              usePGCStore().updateConfig(JSON.parse(res.data.user.app_config));
            }
            this.SET_USER(res.data.user);
            this.SET_AVATAR(
              import.meta.env.MODE == 'development' ? import.meta.env.VITE_DEV_BASE_SERVER + res.data.user.avatar : import.meta.env.VITE_PROD_BASE_SERVER + res.data.user.avatar
            );
            resolve();
          })
          .catch(error => {
            reject(error);
          });
      });
    },
    // 获取用户菜单
    GET_USER_MENU() {
      return new Promise((resolve, reject) => {
        getMenu()
          .then(res => {
            this.SET_MENU(res.data);
            resolve(res.data);
          })
          .catch(error => {
            reject(error);
          });
      });
    },

    Logout() {
      return new Promise((resolve, reject) => {
        session.remove('token');
        local.clear();
        this.SET_MENU([]);
        this.SET_TOKEN('');
        this.SET_AVATAR('');
        this.SET_USER({});
        removeToken();
        resolve();
        this.SET_ISLOADINGROUTER(false);
      });
    },
    getSilderMenu() {
      return this.menu[0].children;
    }
  },

  persist: {
    enabled: true,
    strategies: [
      {
        key: '__LOCAL__USER_INFO',
        storage: localStorage,
        paths: ['token', 'user', 'avatar', 'menu'] //指定要长久化的字段
      }
    ]
  }
});
