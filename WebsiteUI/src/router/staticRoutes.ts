import { RouteRecordRaw } from 'vue-router';
// 移动端
export const mRouters: Array<RouteRecordRaw> = [
  {
    path: '/m/favors',
    name: 'MFavorRecord',
    component: () => import('@/viewsMobile/favors/index.vue'),
    meta: {
      title: '人情来往',
      icon: 'icon-renqing'
    }
  },
  {
    path: '/m/favor',
    name: 'MF',
    component: () => import('@/viewsMobile/favors/index.vue'),
    meta: {
      title: '人情来往',
      icon: 'icon-renqing',
      isHide: true
    }
  },
  {
    path: '/m/wages',
    name: 'MWages',
    component: () => import('@/viewsMobile/wages/index.vue'),
    meta: {
      title: '收入明细',
      icon: 'icon-qitashouru'
    }
  },
  {
    path: '/m/logs',
    name: 'ML',
    component: () => import('@/viewsMobile/logs/index.vue'),
    meta: {
      title: '登录日志',
      icon: 'icon-denglurizhi'
    }
  },
  {
    path: '/m/user-infos',
    name: 'MUseInfo',
    component: () => import('@/viewsMobile/userInfo/index.vue'),
    meta: {
      title: '用户中心',
      icon: 'icon-usersss'
    }
  }
];

// pc菜单路由
export const whiteRouters: Array<RouteRecordRaw> = [
  {
    path: '/index',
    name: 'Index',
    component: () => import('@/views/baseView/home/index.vue'),
    meta: { title: '首页', icon: 'icon-home' }
  },
  {
    path: '/user-info',
    name: 'UserInfo',
    component: () => import('@/views/baseView/userInfo/index.vue'),
    meta: { title: '用户中心', icon: 'icon-home', isHide: true }
  },
  {
    path: '/favors',
    name: 'FavorsRecord',
    component: () => import('@/views/favors/index.vue'),
    meta: { title: '人情来往', icon: 'icon-renqing' }
  },
  {
    path: '/system',
    name: 'System',
    component: () => import('@/views/system/index.vue'),
    meta: { title: '系统设置', icon: 'icon-shezhi' },
    children: [
      {
        path: '/system/user',
        name: 'SystemUser',
        component: () => import('@/views/system/user/index.vue'),
        meta: { title: '用户管理', icon: 'icon-yonghu' }
      },
      {
        path: '/system/role',
        name: 'SystemRole',
        component: () => import('@/views/system/role/index.vue'),
        meta: { title: '角色管理', icon: 'icon-yonghu' }
      },
      {
        path: '/system/menu',
        name: 'SystemMenu',
        component: () => import('@/views/system/menu/index.vue'),
        meta: { title: '菜单管理', icon: 'icon-yonghu' }
      },
      {
        path: '/system/dict',
        name: 'SystemDict',
        component: () => import('@/views/system/dict/index.vue'),
        meta: { title: '字典管理', icon: 'icon-shujuzidian' }
      }
    ]
  },
  {
    path: '/skill',
    name: 'Skill',
    redirect: { name: 'Dialog' },
    component: () => import('@/views/skill/index.vue'),
    meta: { title: '小技巧', icon: 'icon-wxbgongju' },
    children: [
      {
        path: '/skill/editor',
        name: 'SkillEditor',
        component: () => import('@/views/skill/Editor/index.vue'),
        meta: { title: 'Editor' }
      },
      {
        path: '/skill/dialog',
        name: 'SkillDialog',
        component: () => import('@/views/skill/Dialog/index.vue'),
        meta: { title: 'Dialog' }
      },
      {
        path: '/skill/script',
        name: 'SkillScript',
        component: () => import('@/views/skill/Script/index.vue'),
        meta: { title: 'Script' }
      },
      {
        path: '/skill/base64',
        name: 'SkillBase64',
        component: () => import('@/views/skill/Base64/index.vue'),
        meta: { title: 'Base64' }
      },
      {
        path: '/skill/vueuse',
        name: 'SkillVueuse',
        component: () => import('@/views/skill/Vueuse/index.vue'),
        meta: { title: 'Vueuse' }
      },
      {
        path: '/skill/router',
        name: 'SkillRouter',
        component: () => import('@/views/skill/Router/index.vue'),
        meta: { title: 'Router' }
      },
      {
        path: '/skill/charts',
        name: 'SkillCharts',
        component: () => import('@/views/skill/Charts/index.vue'),
        meta: { title: 'Charts' }
      },
      {
        path: '/skill/font',
        name: 'SkillFont',
        component: () => import('@/views/skill/FontFamily/index.vue'),
        meta: { title: 'FontFamily' }
      }
    ]
  },
  {
    path: '/menu',
    name: 'menu',
    meta: { title: 'menu' },
    children: [
      {
        path: '/menu/menu1',
        name: 'menu1',
        component: () => import('@/views/menu/index.vue'),
        meta: { title: 'menu1' }
      },
      {
        path: '/menu/menu2',
        name: 'menu2',
        meta: { title: 'Menu2' },
        children: [
          {
            path: '/menu/menu2/menu21',
            name: 'menu21',
            component: () => import('@/views/menu/menu21.vue'),
            meta: { title: 'menu21' }
          },
          {
            path: '/menu/menu2/menu22',
            name: 'menu22',
            component: () => import('@/views/menu/menu22.vue'),
            meta: { title: 'menu22' },
            children: [
              {
                path: '/menu/menu2/menu22/menu221',
                name: 'menu221',
                component: () => import('@/views/menu/menu221.vue'),
                meta: { title: 'menu221' }
              },
              {
                path: '/menu/menu2/menu22/menu222',
                name: 'menu222',
                component: () => import('@/views/menu/menu222.vue'),
                meta: { title: 'menu222' },
                children: [
                  {
                    path: '/menu/menu2/menu22/menu222/menu2221',
                    name: 'menu2221',
                    component: () => import('@/views/menu/menu221.vue'),
                    meta: { title: 'menu2221' }
                  }
                ]
              }
            ]
          }
        ]
      }
    ]
  }
];
