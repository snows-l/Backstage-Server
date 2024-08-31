/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-01-12 16:56:13
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-31 23:40:42
 * @FilePath: /webseteUI/WebsiteUI/src/main.js
 */
import '@/assets/css/base.scss';
import '@/assets/css/common.scss';
import '@/assets/css/reset.scss';
import CustomImg from '@/components/CustomImg/index.vue'; // 图片组件
import { useAppStore } from '@/store/common';
import { Boot } from '@wangeditor/editor';
import AppleMusicPlayer from 'apple-music-player';
import 'default-passive-events';
import ElementPlus from 'element-plus';
import 'element-plus/dist/index.css';
import zhCn from 'element-plus/dist/locale/zh-cn.mjs';
import { createApp } from 'vue';
import { CountTo } from 'vue3-count-to'; // 滚动数字插件
import Vue3FlipClock from 'vue3-flip-clock';
import 'vue3-flip-clock/dist/style.css';
import './assets/iconfont/iconfont.css'; // 阿里适量图标
import Empty from './components/golbal/Empty/index.vue'; // 暂无数据组件
import FlipClock from './components/golbal/FlipClock/index.vue'; // 通用弹窗组件
import IconSelect from './components/golbal/IconSelect/index.vue'; // 自定义图标选择器
import XDialog from './components/golbal/XDialog/index.vue'; // 通用弹窗组件
// with-editor-api.js文件的路径
import withEditorApi from '@/utils/with-editor-api.js';
Boot.registerPlugin(withEditorApi);

import pinia from '@/store';
import App from './App.vue';
import init from './init';
import './permission'; // 路由守卫
import router from './router';

const app = createApp(App).use(pinia);
useAppStore().isLoadingRouter = false; // 每次刷新页面，将获取菜单表标识 isLoadingRouter 重置为false
console.log('是不是开发环境', import.meta.env.DEV);

import * as ElementPlusIconsVue from '@element-plus/icons-vue';
// 注册el-icon图标
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component);
}
app.component('XDialog', XDialog);
app.component('CountTo', CountTo);
app.component('IconSelect', IconSelect);
app.component('Empty', Empty);
app.component('FlipClock', FlipClock);
app.component('Img', CustomImg);
app.use(Vue3FlipClock);
app.use(AppleMusicPlayer);

app.use(ElementPlus, {
  locale: zhCn
});
app.use(router);
app.mount('#app');

// 初始化
init();
