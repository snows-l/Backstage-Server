<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-24 17:51:09
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-16 23:06:18
 * @FilePath: /webseteUI/WebsiteUI/src/mlayout/index.vue
-->
<template>
  <div class="container-warp">
    <div class="nav">
      <div class="left">
        <div class="mtitle">
          <span class="title-text" @click="handleRouter({ path: '/' })">{{ appMobileHeader() }}</span>
        </div>
      </div>
      <div class="right">
        <i v-if="!state.isScreenFull" @click="handleOpenSet" :style="{ color: themeColor }" class="iconfont icon-caidan"></i>
      </div>
    </div>

    <div class="content-warp" :style="{ height: state.isBottomNav ? 'calc(100% - 100px)' : 'calc(100% - 40px)' }">
      <router-view></router-view>
    </div>
    <div class="nav-warp" v-if="state.isBottomNav" :style="{ borderTop: '1px solid' + getLightColor(themeColor, 0.6) }">
      <div
        v-for="item in routers"
        class="menu-item"
        :style="{ color: item.path.includes(state.currentPath) ? themeColor : '' }"
        :class="{ 'menu-item-active': state.currentPath == item.path }"
        @click="handleRouter(item)">
        <i class="iconfont" :class="item.meta.icon || 'icon-liebiao'"></i>
        <span class="title" :style="{ color: item.path.includes(state.currentPath) ? themeColor : '' }">{{ item.meta.title }}</span>
      </div>
    </div>
    <MSilder ref="mSilderRef" />
  </div>
</template>

<script lang="ts" setup>
import { mRouters } from '@/router/staticRoutes';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { getToken } from '@/utils/auth';
import { appMobileHeader } from '@/utils/common';
import { getLightColor } from '@/utils/theme';
import { reactive, ref, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import MSilder from './component/MSilder.vue';

const router = useRouter();
const route = useRoute();
const mSilderRef = ref();
const pgc = usePGCStore();
const appStore = useAppStore();
const themeColor = ref(pgc.themeColor);

const routers = mRouters.filter(item => {
  return !item.meta.isHide;
});

const state = reactive({
  isScreenFull: appStore.isScreenFull || false,
  currentPath: '',
  isBottomNav: pgc.isBottomNav
});

const handleOpenSet = () => {
  mSilderRef.value.drawer = true;
};

const handleRouter = item => {
  if (getToken()) {
    router.push({
      path: item.path
    });
  } else {
    router.push({
      path: `/login`,
      query: {
        redirect: item.path
      }
    });
  }
};

watch(
  () => pgc.themeColor,
  n => {
    themeColor.value = n;
  }
);
watch(
  () => pgc.isBottomNav,
  n => (state.isBottomNav = n)
);

watch(
  () => route.path,
  n => {
    state.currentPath = n;
  },
  { immediate: true }
);

watch(
  () => appStore.isScreenFull,
  n => {
    state.isScreenFull = n;
  }
);
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
  background-color: #f0f2f5;
  .nav {
    background-image: radial-gradient(transparent 1px, #ffffff 1px);
    background-size: 4px 4px;
    backdrop-filter: saturate(50%) blur(4px);
    padding-right: 20px;
    height: 40px;
    box-shadow: 2px 2px 2px #f3f3f2;
    display: flex;
    justify-content: space-between;
    align-items: center;
    .icon-caidan {
      font-size: 20px;
      cursor: pointer;
      color: #38bed2;
    }
    .left {
      background: linear-gradient(to right, v-bind(themeColor) 0%, #fff 100%);
      flex: 1;
      .mtitle {
        width: 100%;
        padding: 0 20px;
        height: 38px;
        .title-text {
          line-height: 38px;
          cursor: pointer;
          color: #fff;
          font-size: 18px;
          font-weight: 600;
        }
      }
    }
  }
  .content-warp {
    // height: calc(100% - 100px);
    max-width: var(--m-max-width);
    margin: 0 auto;
  }
  .nav-warp {
    height: 60px;
    background-color: #fff;
    margin: 0 auto;
    display: flex;
    justify-content: space-around;
    align-items: center;
    .menu-item {
      padding: 10px 0;
      cursor: pointer;
      display: flex;
      flex-direction: column;
      align-items: center;
      .title {
        margin: 0;
        margin-top: 6px;
        font-size: 12px;
      }
    }
  }
  .index-warp {
    // height: calc(100% - 100px);
    width: 100%;
  }
}
</style>
