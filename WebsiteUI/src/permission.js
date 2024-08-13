/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-24 11:01:38
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-20 15:33:41
 * @FilePath: /webseteUI/WebsiteUI/src/permission.js
 */
import router from '@/router';
import { useAppStore } from '@/store/common';
import { getToken } from '@/utils/auth';
import NProgress from 'nprogress';
import 'nprogress/nprogress.css';
import { generateRoutes } from './utils/common';

NProgress.configure({ showSpinner: false });

// 白名单
export const whiteList = ['/login', '/register', '/resetpwd', '/view', '/m/favor'];

// 路由前置守卫 (移动与pc路由的分离) isAdd: 是否已经添加路由
function routeNext(to, next, store, isAdd) {
  // 分移动端还是pc端逻辑
  // if (isMobile()) {
  //   if (to.path === '/login' || to.path === '/') {
  //     next({ path: '/m/index' });
  //   } else {
  //     if (isAdd) {
  //       next({ ...to, replace: true });
  //       store.isLoadingRouter = true;
  //     } else {
  //       next();
  //     }
  //   }
  // } else {
  //   if (to.path === '/login' || to.path === '/') {
  //     next({ path: '/index' });
  //   } else {
  //     if (isAdd) {
  //       next({ ...to, replace: true });
  //       store.isLoadingRouter = true;
  //     } else {
  //       next();
  //     }
  //   }
  // }

  if (to.path === '/login' || to.path === '/') {
    next({ path: '/view' });
  } else {
    if (isAdd) {
      next({ ...to, replace: true });
      store.isLoadingRouter = true;
    } else {
      next();
    }
  }
}

// 路由后置守卫
router.beforeEach((to, from, next) => {
  console.log('-------- to --------', to.path);
  NProgress.start();
  if (getToken()) {
    const store = useAppStore();
    // 白名单
    if (!store.isLoadingRouter && whiteList.indexOf(to.path) === -1) {
      store.GET_USER_MENU().then(res => {
        const menus = generateRoutes(res);
        // pc菜单权限
        if (menus[0].children.length) {
          menus.forEach((item, index) => {
            item.children &&
              item.children.forEach(subItem => {
                router.addRoute(index == 0 ? 'RouterView' : 'mRouterView', subItem);
              });
          });
          if (!router.hasRoute('NotFound')) {
            router.addRoute({
              name: 'NotFound',
              path: '/:pathMatch(.*)*',
              redirect: '/404'
            });
          }
          // 添加了路由
          routeNext(to, next, store, true);
        } else {
          router.push({ path: '/403' });
          store.isLoadingRouter = true;
        }
      });
    } else {
      routeNext(to, next, store);
    }
  } else {
    if (whiteList.indexOf(to.path) !== -1) {
      // 在免登录白名单，直接进入
      next();
    } else {
      // 分移动端还是pc端逻辑
      // if (isMobile()) {
      //   if (to.path === '/' || to.path === '/m') {
      //     next({ path: '/m/index' });
      //   } else {
      //     next(`/login?redirect=${to.fullPath}`); // 否则全部重定向到登录页
      //   }
      // } else {
      //   next(`/login?redirect=${to.fullPath}`); // 否则全部重定向到登录页
      // }

      if (to.path === '/') {
        next({ path: '/view' });
      } else {
        next(`/login?redirect=${to.fullPath}`); // 否则全部重定向到登录页
      }
    }
  }
});

router.afterEach(() => {
  NProgress.done();
});
