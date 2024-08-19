/*
 * @Description: ------------ 初始化全局配置 -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-05-30 16:28:08
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-19 21:34:19
 * @FilePath: /webseteUI/WebsiteUI/src/init.ts
 */

// 本地存在全局配置就更新到pinia中
import router from '@/router';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { local } from '@/utils/cache';
import { handleThemeStyle } from '@/utils/theme';
import { ElMessage } from 'element-plus';
import defaultGlobalConfig from './project.config';
import { longTimeStopScreen } from './utils/common';
import { whiteList } from './permission.js';

export default () => {
  // 初始化全局配置
  let pgc = usePGCStore();
  const projectGloabalConfig = local.get('PGC');
  pgc.updateConfig(projectGloabalConfig || defaultGlobalConfig);
  handleThemeStyle(pgc.themeColor);

  // 监听是否离开网页
  window.addEventListener('visibilitychange', () => {
    // document.hidden; // true:离开   false:回来
    // document.visibilityState; // hidden:离开   visible:回来
    if (!document.hidden) {
      document.title = '都已经是第二年的立春、又何必执着于、当年的盛​夏呢？';
      ElMessage.success('欢迎回来！');
      // $message('欢迎您回来！');
    } else {
      document.title = '劳资蜀道山、给劳资滚回来看文档！';
    }
  });

  // 监听页面停留太长时间
  window.onload = () => {
    // 定义倒计时的时长
    const time = 60 * 30; // 30分钟
    // 执行函数（回调函数）
    function fn() {
      if (whiteList.includes(local.get('CURREN_TPATH'))) {
        return;
      } else {
        if (window.confirm('你已经停留很久了，是否重新登录！')) {
          // 点击了确认 -- 清除定时器
          longTimeStopScreen(false);
          const store = useAppStore();

          // 执行其他操作逻辑
          store.Logout().then(() => {
            router.push({
              path: '/login',
              query: { redirect: router.currentRoute.fullPath }
            });
          });
        } else {
          // 点击了取消
          console.log('取消', window.__LONG_TIMER_);
        }
      }
    }
    longTimeStopScreen(true, time, fn);
  };
};

// android点击手机物理返回键退出app bug解决
document.addEventListener('plusready', function () {
  plus.key.addEventListener(
    'backbutton',
    function () {
      window.history.go(-1);
    },
    false
  );
});
