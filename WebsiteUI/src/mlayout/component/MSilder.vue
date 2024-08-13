<!--
 * @Description: ------------ fileDescription ----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 15:15:52
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-16 23:32:57
 * @FilePath: /webseteUI/WebsiteUI/src/mlayout/component/MSilder.vue
-->
<template>
  <el-drawer modal-class="m-menu-warp" size="70px" v-model="drawer" :with-header="false" :direction="direction" :before-close="handleClose">
    <div class="content-container">
      <div class="top">
        <el-avatar
          @click="handleTo('/m/user-infos')"
          class="avatar"
          icon="el-icon-user-solid"
          shape="circle"
          :src="state.avaterUrl || (state.sex == 2 ? girlAvatarDefault : manAvatarDefault)"
          fit="fill"></el-avatar>
        <div class="menu-warp">
          <div
            class="menu-item"
            :style="{ color: item.path.includes(state.currentPath) ? state.themeColor : '' }"
            :class="{ 'menu-item-active': state.currentPath == item.path }"
            v-for="item in routers"
            @click="handleRouter(item)">
            <i class="iconfont" :class="item.meta.icon || 'icon-liebiao'"></i>
            <span class="title" :style="{ color: item.path.includes(state.currentPath) ? state.themeColor : '' }">{{ item.meta.title }}</span>
          </div>
        </div>
      </div>
      <div class="bottom">
        <!-- <i :style="{ color: state.themeColor }" @click="handleTo('/')" class="iconfont icon-home"></i> -->
        <i :style="{ color: state.themeColor }" @click="handleTo('/index')" class="iconfont icon-PC"></i>
        <!-- <i @click="handleTo('/m/user-infos')" class="iconfont icon-shezhi"></i> -->
        <project-config-dialog @successCallback="handleClose">
          <i :style="{ color: state.themeColor }" class="iconfont icon-shezhi" />
        </project-config-dialog>
      </div>
    </div>
  </el-drawer>
</template>

<script lang="ts" setup>
import girlAvatarDefault from '@/assets/images/girl.png';
import manAvatarDefault from '@/assets/images/man.png';
import ProjectConfigDialog from '@/components/ProjectConfigDialog/index.vue';
import { mRouters } from '@/router/staticRoutes';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { getToken } from '@/utils/auth';
import { local } from '@/utils/cache';
import { reactive, ref, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const store = useAppStore();
const pgc = usePGCStore();
const router = useRouter();
const route = useRoute();

let routers = mRouters.filter(item => {
  return !item.meta.isHide;
});

const direction = 'rtl';
const userInfo = local.get('userInfo');
let drawer = ref(false);

const state = reactive({
  currentPath: '/m/favors',
  avaterUrl: store.user.avatar ? store.avatar : '',
  sex: store.user.sex,
  themeColor: pgc.themeColor
});

let themeColor = ref(pgc.themeColor);

const handleClose = () => {
  drawer.value = false;
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
  handleClose();
};

const handleTo = path => {
  handleClose();
  router.push({
    path
  });
};

watch(
  () => store.avatar,
  n => {
    state.avaterUrl = n;
  }
);
watch(
  () => pgc.themeColor,
  n => {
    state.themeColor = n;
    themeColor.value = n;
  }
);
watch(
  () => route.path,
  n => {
    state.currentPath = n;
  },
  { immediate: true }
);

defineExpose({
  drawer
});
</script>

<style lang="scss">
.m-menu-warp .el-drawer .el-drawer__body {
  padding: 20px 0 !important;
}
.menu-warp {
  width: 90%;
  margin-top: 40px;
  .menu-item {
    border-top: 1px solid #ccc;
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
  .menu-item:last-child {
    border-bottom: 1px solid #ccc;
  }
  .menu-item:hover {
    background-color: #f6e9e0;
    color: #1f2d2d;
    .title {
      color: #1f2d2d;
    }
  }
}
</style>

<style lang="scss" scoped>
.content-container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  align-items: center;
  .top {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    .avatar {
      cursor: pointer;
    }
  }

  .bottom {
    padding-top: 50px;
    display: flex;
    flex-direction: column;

    .iconfont {
      margin-bottom: 15px;
      cursor: pointer;
    }
    .iconfont:hover {
      color: #91c4ef;
    }
  }
}
.iconfont {
  font-size: 24px;
}
</style>
