<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-20 12:31:40
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-27 17:31:23
 * @FilePath: /webseteUI/WebsiteUI/src/components/golbal/musicPlayer/index.vue
-->
<template>
  <div class="music-player-warp" :style="{ borderColor: themeColor }">
    <!-- <AppleMusicPlayer progressColor="rgba(211, 16, 16, 1)" diskHW="110px" :musicList="musicList" :darkTheme="darkTheme" :offsetY="14">
      <template #next><i class="iconfont icon-xiayigexiayiqu"></i></template>
      <template #last><i class="iconfont icon-shangyigeshangyiqu"></i></template>
      <template #pause><i class="iconfont icon-zanting"></i></template>
      <template #play><i class="iconfont icon-bofang"></i></template>
    </AppleMusicPlayer> -->
    <audio ref="audioRef" style="display: none" :src="state.currentMusic.src"></audio>

    <div class="controler-cover" v-if="musicList.length">
      <div class="cover" v-loading="state.isLoading">
        <img class="cover-img" :class="{ 'rotate-play': state.isPlaying }" :src="state.currentMusic.img || defaultCover" alt="" />
        <PlayingAnimation v-show="state.isPlaying" class="playing-animation" />
      </div>
      <div class="music-info">
        <div class="music-title">{{ state.currentMusic.title }}{{ state.currentMusic.artist ? '—' + state.currentMusic.artist : '' }}</div>
        <el-tag class="type" type="primary" style="font-size: 12px; height: 15px; margin-top: 6px; margin: 5px 5px">
          {{ getTypeLabel(state.currentMusic.type) }}
        </el-tag>
      </div>
      <div class="contral-warp">
        <i @click="handleControl('prev')" class="iconfont icon-shangyigeshangyiqu"></i>
        <i @click="handleControl('pause')" v-if="state.isPlaying" class="iconfont icon-zanting"></i>
        <i @click="handleControl('play')" v-else class="iconfont icon-bofang"></i>
        <i @click="handleControl('next')" class="iconfont icon-xiayigexiayiqu"></i>
        <i @click="handleControl('unMute')" v-if="!state.isMute" class="iconfont icon-cancelMute-quxiaojingyin"></i>
        <i @click="handleControl('mute')" v-else class="iconfont icon-jingyin"></i>
        <i @click="habdleTo('/music')" class="iconfont icon-gengduo2" style="font-size: 16px"></i>
      </div>
      <div class="custom-progress">
        <input type="range" name="progress" id="progress" max="100" min="0" v-model="state.progress" @change="handleProgressChange" />
        <span style="font-size: 12px; transform: scaleY(50%); font-family: DSDIGI">
          {{ Math.floor(state.currentTime / 60).toFixed(0).length == 1 ? '0' : '' }}{{ Math.floor(state.currentTime / 60) }}:
          {{ Math.floor(state.currentTime % 60).toFixed(0).length == 1 ? '0' : '' }}{{ Math.floor(state.currentTime % 60) }} /
          {{ state.duration ? (Math.floor(state.duration / 60).toFixed(0).length == 1 ? '0' : '') : '0' }}{{ state.duration ? Math.floor(state.duration / 60) : 0 }}:
          {{ state.duration ? (Math.floor(state.duration % 60).toFixed(0).length == 1 ? '0' : '') : '0' }}{{ state.duration ? Math.floor(state.duration % 60) : 0 }}
        </span>
      </div>
    </div>
    <empty v-else :size="80" @refresh="habdleTo('/music')" btnText="点击去添加">没有找到歌曲</empty>
  </div>
</template>

<script lang="ts" setup>
import { getMusicList } from '@/api/musics';
import { getDict } from '@/api/system/dict';
import defaultCover from '@/assets/images/default_cover.png';
import $bud from '@/bus';
import router from '@/router';
import { useAppStore } from '@/store/common';
import { getLightColor } from '@/utils/theme';
import { onBeforeUnmount, onMounted, reactive, ref, watch } from 'vue';
import PlayingAnimation from './playingAnimation.vue';

const props = defineProps({
  themeColor: {
    type: String,
    default: '#418DB5'
  },
  currentMusicId: {
    type: Number,
    default: 0
  },
  playType: {
    type: String,
    default: ''
  }
});

const appStore = useAppStore();
const audioRef = ref(null);
const musicList = ref([]);

const lightThemeColor = ref(getLightColor(props.themeColor, 0.8));

const state = reactive({
  currentIndex: 0,
  currentMusic: {
    title: '',
    artist: '',
    img: '',
    src: '',
    type: '',
    id: ''
  },
  isFirst: false,
  isPlaying: false,
  isMute: false,
  volume: 1,
  duration: 0,
  currentTime: 0,
  progress: 0,
  isLoading: true,
  playList: []
});

const getMusicListFn = () => {
  getMusicList({ isUnPage: false }).then(res => {
    musicList.value = res.data.map(item => {
      let cover = '';
      if (item.cover) cover = import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + item.cover : import.meta.env.VITE_PROD_BASE_SERVER + item.cover;
      return {
        id: item.id,
        title: item.title,
        artist: item.artist,
        type: item.type,
        img: cover,
        src: import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + item.src : import.meta.env.VITE_PROD_BASE_SERVER + item.src
      };
    });

    state.currentMusic = musicList.value.length > 0 && musicList.value[state.currentIndex];
  });
};
getMusicListFn();

getDict({ dictType: 'music_type' }).then(res => {
  state.playList = res.data;
});

const getTypeLabel = type => {
  let label = '';
  state.playList.forEach(item => {
    if (item.value == type) {
      label = item.label;
    }
  });
  return label;
};

// 当前歌曲播放结束回调
const endedCallback = () => {
  handleControl('next');
};

// 当前歌曲播放进度回调
const timeupdateCallback = () => {
  state.currentTime = audioRef.value.currentTime;
  state.duration = audioRef.value.duration;
  state.progress = parseInt((state.currentTime / state.duration) * 100) || 0;
};

// 当前歌曲音量变化回调
const volumechangeCallback = () => {
  if (audioRef.value.volume == 0) {
    state.isMute = true;
  } else {
    state.isMute = false;
  }
};

// 当前歌曲播放出错回调
const errorCallback = err => {
  console.log('music player errorCallback', err);
};

// 当前歌曲可以播放回调
const canplayCallback = () => {
  state.isLoading = false;
  if (state.isFirst) controlMusic('play');
};

// 当前歌曲开始播放回调
const playingCallback = () => {
  state.isPlaying = true;
  state.isLoading = false;
};

// 当前歌曲暂停播放回调
const pauseCallback = () => {
  state.isPlaying = false;
};

// 拖动进度条变化回调
const handleProgressChange = e => {
  audioRef.value.currentTime = (e.target.value / 100) * state.duration;
};

onMounted(() => {
  audioRef.value.addEventListener('ended', endedCallback);
  audioRef.value.addEventListener('timeupdate', timeupdateCallback);
  audioRef.value.addEventListener('volumechange', volumechangeCallback);
  audioRef.value.addEventListener('error', errorCallback);
  audioRef.value.addEventListener('canplay', canplayCallback);
  audioRef.value.addEventListener('playing', playingCallback);
  audioRef.value.addEventListener('pause', pauseCallback);

  $bud.on('refreshMusicList', () => {
    getMusicListFn();
  });
});

onBeforeUnmount(() => {
  audioRef.value.removeEventListener('ended', endedCallback);
  audioRef.value.removeEventListener('timeupdate', timeupdateCallback);
  audioRef.value.removeEventListener('volumechange', volumechangeCallback);
  audioRef.value.removeEventListener('error', errorCallback);
  audioRef.value.removeEventListener('canplay', canplayCallback);
  audioRef.value.removeEventListener('playing', playingCallback);
  audioRef.value.removeEventListener('pause', pauseCallback);
});

const habdleTo = path => {
  router.push(path);
};

// 控制播放/暂停
const controlMusic = type => {
  if (type === 'pause') {
    audioRef.value.pause();
  } else if (type === 'play') {
    audioRef.value.pause();
    setTimeout(() => {
      state.isFirst = true;
      audioRef.value.play();
    }, 0);
  }
};

// 控制静音/取消静音
const controlVolume = type => {
  if (type === 'mute') {
    audioRef.value.volume = 0;
  } else if (type === 'unMute') {
    audioRef.value.volume = 1;
  }
};

const handleControl = type => {
  if (type == 'pause' || type == 'play') {
    controlMusic(type);
  } else if (type == 'unMute' || type == 'mute') {
    controlVolume(type);
  } else if (type == 'prev') {
    state.isFirst = true;
    state.isPlaying = false;
    state.isLoading = true;
    if (state.currentIndex == 0) {
      state.currentIndex = musicList.value.length - 1;
    } else {
      state.currentIndex--;
    }
    state.currentMusic = musicList.value[state.currentIndex];
  } else if (type == 'next') {
    state.isFirst = true;
    state.isPlaying = false;
    state.isLoading = true;
    if (state.currentIndex == musicList.value.length - 1) {
      state.currentIndex = 0;
    } else {
      state.currentIndex++;
    }
    state.currentMusic = musicList.value[state.currentIndex];
  }
};

watch(
  () => props.currentMusicId,
  id => {
    if (id) {
      const index = musicList.value.findIndex(item => item.id == id);
      if (index !== -1) {
        state.currentIndex = index;
        state.currentMusic = musicList.value[index];
        state.isPlaying = false;
        state.isLoading = true;
        state.isFirst = true;
      }
    }
  }
);

watch(
  () => state.currentMusic.id,
  n => {
    if (n) {
      appStore.SET_CURRENTPLAYINGMUSICID(n);
    }
  },
  { immediate: true }
);

watch(
  () => state.isPlaying,
  n => {
    appStore.SET_ISMUSICPLAYING(n);
  }
);
</script>

<style lang="scss" scoped>
.music-player-warp {
  border: 1px solid;
  height: 280px;
  width: 163px;
  padding: 10px;
  background-color: #f5f5f57a;
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
  .controler-cover {
    width: 140px;
    .cover {
      position: relative;
      .playing-animation {
        width: 100px;
        position: absolute;
        top: 0px;
        right: 0;
        bottom: 0;
        left: 0;
        margin: auto;
      }
      .cover-img {
        width: 140px;
        height: 140px;
        border-radius: 50%;
        transition: 2s all;
      }
      .rotate-play {
        animation: spin 5s linear infinite;
      }
    }
    .contral-warp {
      height: 40px;
      display: flex;
      justify-content: space-around;
      align-items: center;
      .iconfont {
        font-size: 20px;
      }
    }
    .music-info {
      width: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      margin-top: 10px;
      .music-title {
        font-size: 12px;
        text-align: center;
        color: v-bind(themeColor);
      }
    }
    .custom-progress {
      display: flex;
      justify-content: center;
      flex-direction: column;
      align-items: center;
      height: 16px;
      // overflow: hidden;
      input[type='range'] {
        -webkit-appearance: none;
        appearance: none;
        margin: 0;
        outline: 0;
        background-color: transparent;
        border-radius: 3px;
      }
      /* 定义range控件轨道的样式 */
      [type='range']::-webkit-slider-runnable-track {
        height: 6px;
        background-color: #f5f5f57a;
      }

      /* 定义range控件容器的样式 已激活 */
      [type='range' i]::-webkit-slider-container {
        height: 6px;
        background-color: v-bind(lightThemeColor);
        border-radius: 3px;
        overflow: hidden;
      }

      /* 定义range控件拇指的样式 当前值 */
      [type='range']::-webkit-slider-thumb {
        -webkit-appearance: none;
        appearance: none;
        width: 3px;
        height: 6px;
        border-radius: 50%;
        background-color: v-bind(themeColor);
        /* 使用border-image属性给拇指添加渐变边框 */
        border-image: linear-gradient(#f44336, #f44336) 0 fill / 8 20 8 0 / 0px 0px 0 2000px;
      }
    }
  }
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
.iconfont {
  cursor: pointer;
}
.iconfont:hover {
  color: v-bind(themeColor);
}
</style>
