<!--
 * @Description: ------------ 菜单递归组件 -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-12-04 14:42:17
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-05 16:05:53
 * @FilePath: /Website/WebsiteUI/src/layout/SliderMenu/CustomSubMenu.vue
-->
<template>
  <el-sub-menu v-if="item.children && item.children.length" :index="item.path">
    <template #title>
      <i class="iconfont menu-icon" :class="item.meta.icon || 'icon-caidan'"></i>
      <div v-if="!item.meta.isTopMenu || (item.meta.isTopMenu && !collapse)" class="sub-menu-title">{{ item.meta.title }}</div>
    </template>
    <template v-for="single in item.children">
      <CustomSubMenu :item="single"></CustomSubMenu>
    </template>
  </el-sub-menu>
  <!-- 一 -->
  <el-menu-item v-else :index="item.path" @click="handleJump(item)">
    <i class="iconfont menu-icon" :class="item.meta.icon || 'icon-caidan'"></i>
    <span>{{ item.meta.title }}</span>
  </el-menu-item>
</template>

<script lang="ts" setup name="CustomSubMenu">
import { usePGCStore } from '@/store/projectGloabalConfig';
import { ref, watch } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const props = defineProps({
  item: {
    type: Object,
    required: true
  },
  collapse: {
    typer: Boolean,
    default: false
  }
});

let themeColor = ref(usePGCStore().themeColor);
let menuBgColor = ref(usePGCStore().menuBgColor);

interface RouteInterface {
  path: string;
  name: string;
  children?: object[];
  [key: string]: any;
}

// 跳转
const handleJump = (item: RouteInterface) => {
  router.push(item.path);
};

watch(
  () => usePGCStore().menuBgColor,
  n => {
    menuBgColor.value = n;
  }
);

watch(
  () => usePGCStore().themeColor,
  n => {
    themeColor.value = n;
  }
);
</script>

<style lang="scss" scoped>
.menu-icon {
  color: #fff;
  font-size: 18px;
  font-weight: 600;
  margin-right: 10px;
}
:deep(.sub-menu-title) {
  color: #fff;
}
:deep(.sub-menu-title) + .el-sub-menu__icon-arrow {
  color: #fff;
}
.el-menu {
  .el-menu-item {
    color: #fff;
    // border-bottom: 1px solid #aeaeae;
    border-bottom: 1px solid #0080cc;
    background-color: v-bind(menuBgColor);
  }

  .el-menu-item:hover {
    background-color: #0080ccab;
  }
  .el-sub-menu {
    background-color: v-bind(menuBgColor);
    :deep(.el-sub-menu__title) {
      border-bottom: 1px solid #0080cc;
    }
    :deep(.el-sub-menu__title):hover {
      background-color: #0080ccab !important;
    }
  }
}
li.is-active {
  color: v-bind(themeColor) !important;
}
.is-active > .el-sub-menu__title {
  .sub-menu-title {
    color: v-bind(themeColor) !important;
  }
}
</style>
