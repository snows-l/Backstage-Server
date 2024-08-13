/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-01-12 16:56:04
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-15 17:27:49
 * @FilePath: /Website/WebsiteUI/src/router/index.ts
 *
 */

import Layout from '@/layout/index.vue';
import mLayout from '@/mlayout/index.vue';
import Login from '@/views/baseView/login.vue';
import Register from '@/views/baseView/register.vue';
import Resetpwd from '@/views/baseView/resetpwd.vue';
import View from '@/views/baseView/view/index.vue';
import { mRouters } from './staticRoutes';
import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router';

// 路由
const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    name: 'Home',
    redirect: { name: 'Viwe' }
  },
  {
    path: '/view',
    name: 'Viwe',
    component: View,
    meta: {
      title: '首页',
      icon: 'icon-home',
      isBottomHide: true
    }
  },

  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/big-screen',
    name: 'BigScreen',
    component: () => import('@/views/bigScreen/index.vue')
  },

  {
    path: '/register',
    name: 'Register',
    component: Register
  },
  {
    path: '/resetpwd',
    name: 'Resetpwd',
    component: Resetpwd
  },
  // PC端路由 - 顶级
  {
    path: '',
    name: 'RouterView',
    component: Layout,
    // children: whiteRouters
    children: [
      {
        path: '/user-info',
        name: 'UserInfo',
        component: () => import('@/views/baseView/userInfo/index.vue'),
        meta: { title: '用户中心', icon: 'icon-home', isHide: true }
      }
    ]
  },
  // 移动端路由 - 顶级
  {
    path: '/m',
    name: 'mRouterView',
    redirect: { name: 'MFavorRecord' },
    component: mLayout,
    children: mRouters
  },
  // 404
  {
    path: '/404',
    component: () => import('@/views/error-page/404.vue')
  },
  // 403
  {
    path: '/403',
    component: () => import('@/views/error-page/403.vue')
  }
];
const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
