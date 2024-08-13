<!--
 * @Description: ------------ 菜单 -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-12-01 10:06:00
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-15 17:21:12
 * @FilePath: /Website/WebsiteUI/src/layout/SliderMenu/index.vue
-->
<template>
  <div class="layout-slider">
    <el-menu style="border-right: 0" :collapse-transition="true" :default-active="active" :collapse="isCollapse" class="el-menu-vertical" @open="handleOpen" @close="handleClose">
      <template v-for="item in routers">
        <CustomSubMenu :item="item" :collapse="isCollapse"></CustomSubMenu>
      </template>
    </el-menu>
    <div class="sider-menu" @click="handleChangeSilder">
      <i class="iconfont" :class="isCollapse ? 'icon-zhankai' : 'icon-shouqi'"></i>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { isMobile } from '@/utils/common';
import { Ref, onUnmounted, ref, watch } from 'vue';
import { useRoute } from 'vue-router';
import CustomSubMenu from './CustomSubMenu.vue';

const route = useRoute();

const active: Ref<string> = ref(route.fullPath);
let menuBgColor = ref(usePGCStore().menuBgColor);

// 初始化 的时候是移动端就收起来
const isCollapse = ref(isMobile() ? true : false);
usePGCStore().setValue('isCollapse', isCollapse.value);

let routers = ref([]);
const store = useAppStore();

let menuList = store.getSilderMenu();
routers.value = menuList
  .filter(item => !item.hidden)
  .map(item => {
    return {
      ...item,
      meta: {
        ...item.meta,
        isTopMenu: true // 去掉折叠菜单的时候文字的不展示
      }
    };
  });

// 菜单展开/闭合
const handleChangeSilder = () => {
  (isCollapse.value as any) = !isCollapse.value;
  usePGCStore().setValue('isCollapse', isCollapse.value);
};

const resizeCallback = () => {
  if (isMobile(830)) {
    isCollapse.value = true;
  } else if (isMobile(1020)) {
    isCollapse.value = false;
  }
  usePGCStore().setValue('isCollapse', isCollapse.value);
};
window.addEventListener('resize', resizeCallback);
onUnmounted(() => {
  window.removeEventListener('resize', resizeCallback);
});

const handleOpen = () => {};

const handleClose = () => {};

watch(
  () => usePGCStore().menuBgColor,
  n => {
    menuBgColor.value = n;
  }
);

watch(
  () => route.fullPath,
  val => {
    active.value = val;
  }
);
</script>

<style lang="scss" scoped>
.el-menu-vertical-demo:not(.el-menu--collapse) {
  width: 200px;
}

.layout-slider {
  position: relative;
  background-color: v-bind(menuBgColor) !important;
  .sider-menu {
    width: 30px;
    height: 30px;
    position: absolute;
    bottom: 40px;
    right: 15px;
    .iconfont {
      font-size: 24px;
      color: #fff;
    }
  }
}
</style>
