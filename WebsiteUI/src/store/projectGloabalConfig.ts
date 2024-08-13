/*
 * @Description: ------------ 全局配置 -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-05-30 10:33:23
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-11 09:43:09
 * @FilePath: /Website/WebsiteUI/src/store/projectGloabalConfig.ts
 */
import { local } from '@/utils/cache';
import { defineStore } from 'pinia';
import { handleThemeStyle } from '@/utils/theme';
export const usePGCStore = defineStore('projectGlobalConfig', {
  // 推荐使用 完整类型推断的箭头函数
  state: () => {
    return {
      // 所有这些属性都将自动推断其类型
      dialogOrDrawer: '',
      themeColor: '',
      isCrumb: null, // 是否展示面包屑
      isFooter: null, // 是否展footer,
      menuBgColor: '',
      isCollapse: null, //菜单是否收起来
      isShowLayoutTime: null, //菜单是否收起来,
      isTable: null, // 移动展示布局
      isBottomNav: null // 移动端底部导航
    };
  },
  actions: {
    // 改变dialog或drawer
    changeDialogOrDrawer(param: string) {
      this.dialogOrDrawer = param;
    },

    // 改变属性
    setValue(key, value) {
      this[key] = value;
      local.set('PGC', this.$state);
    },

    // 更新传过来的数据
    updateConfig(param: { [key: string]: any }): void {
      const keys = Object.keys(param);
      keys.forEach(item => {
        (this as any)[item] = param[item];
      });
      handleThemeStyle(this.themeColor);
      this.persistence();
    },

    // 数据持久化
    persistence(): void {
      local.set('PGC', this.$state);
    }
  }
});
