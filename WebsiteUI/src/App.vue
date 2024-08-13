<!--
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2022-09-01 11:25:19
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-22 20:45:05
 * @FilePath: /webseteUI/WebsiteUI/src/App.vue
-->
<template>
  <div class="app">
    <router-view></router-view>
    <div class="custom-music-warp" :style="{ left: state.playerIsShow ? '4px' : '-164px' }">
      <musicPlayer :themeColor="themeColor" :currentMusicId="state.currentMusicId" :playType="state.playType" />
      <div class="music-hover" @click="handlePlayerShow(false)">
        <i class="iconfont icon-yinle"></i>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import $bus from '@/bus';
import musicPlayer from '@/components/golbal/musicPlayer/index.vue';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { onMounted, reactive, ref, watch } from 'vue';
import { useRoute } from 'vue-router';
import { local } from './utils/cache';
const route = useRoute();

const pgc = usePGCStore();

let themeColor = ref(pgc.themeColor || '#000');

const state = reactive({
  playerIsShow: false,
  currentMusicId: 0,
  playType: ''
});

// 显示音乐播放器
const handlePlayerShow = type => {
  if (type) {
    state.playerIsShow = type;
  } else {
    state.playerIsShow = !state.playerIsShow;
  }
};

onMounted(() => {
  $bus.on('playMusic', ({ id, type }) => {
    state.currentMusicId = id;
    state.playType = type;
    handlePlayerShow(true);
  });
});

watch(
  () => route.path,
  n => {
    local.set('CURREN_TPATH', n);
    if (n != '/music') state.playerIsShow = false;
  }
);
watch(
  () => pgc.themeColor,
  newVal => {
    themeColor.value = newVal;
  }
);
</script>

<style scoped lang="scss">
.app {
  width: 100%;
  position: relative;
  height: 100%;
  overflow: hidden;
  .custom-music-warp {
    box-sizing: border-box;
    height: 280px;
    width: 168px;
    background-color: #ffffffbf;
    border-radius: 5px;
    position: absolute;
    z-index: 999999;
    bottom: 100px;
    display: flex;
    justify-content: flex-end;
    // overflow: hidden;
    transition: 1s all;
    .music-hover {
      border-top-right-radius: 4px;
      border-bottom-right-radius: 4px;
      width: 5px;
      height: 100%;
      background-color: v-bind(themeColor);
      cursor: pointer;
      transition: 1s all;
      .icon-yinle {
        position: absolute;
        top: 50%;
        right: -18px;
        transform: translateY(-50%);
        font-size: 16px;
        z-index: 9999999999;
        // border: 2px solid v-bind(themeColor);
        border-radius: 50%;
        padding: 3px;
        color: v-bind(themeColor);
      }
    }
  }
}
</style>
