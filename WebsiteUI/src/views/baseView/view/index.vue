<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-24 17:51:09
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-26 20:53:07
 * @FilePath: /webseteUI/WebsiteUI/src/views/baseView/view/index.vue
-->
<template>
  <div class="content-container" style="width: 100vw">
    <div class="container-warp">
      <div class="header">
        <div class="header-left"></div>
      </div>
      <div
        class="main"
        :style="
          state.isScreenFull
            ? state.isMobile
              ? 'display: flex; flex-direction: column; align-items: center; justify-content: center; transform: scale(1.6);'
              : 'display: flex; flex-direction: column; align-items: center; justify-content: center; transform: scale(3)'
            : ''
        ">
        <div class="content-container-center">
          <div class="time-select">
            <div class="clock-warp" @click="handleFullScreen">
              <Vue3FlipClock :size="state.clockSize"></Vue3FlipClock>
            </div>
            <div class="date">
              <span>{{ state.currentDate }}</span>
              <span style="margin: 0 10px">{{ weekConfig[state.week] }}</span>
              <span>{{ state.lunar }}</span>
            </div>
          </div>
          <div class="select-warp" v-if="!state.isScreenFull">
            <el-input size="large" v-model="state.keyword" @keyup.enter="handleSelect" placeholder="请输入搜索内容" clearable>
              <template #prepend>
                <div class="type-icon">
                  <i v-if="state.type == 1" class="iconfont icon-baidu" style="color: #ff0000"></i>
                  <i v-if="state.type == 2" class="iconfont icon-biying" style="color: #3f9eff"></i>
                  <i v-if="state.type == 3" class="iconfont icon-google" style="color: #34a853"></i>
                </div>

                <el-select ref="typeRef" class="select-type-warp" size="large" v-model="state.type" placeholder="" style="opacity: 0; padding: 0 10px">
                  <el-option :value="1"><i class="iconfont icon-baidu" style="color: #ff0000"></i></el-option>
                  <el-option :value="2"><i class="iconfont icon-biying" style="color: #3f9eff"></i></el-option>
                  <el-option :value="3"><i class="iconfont icon-google" style="color: #34a853"></i></el-option>
                </el-select>
              </template>
              <template #append>
                <el-button :icon="Search" @click="handleSelect" />
              </template>
            </el-input>
          </div>

          <div class="to-warp" v-if="!state.isScreenFull" style="width: 100%; display: flex; justify-content: center; margin-top: 30px; align-items: center">
            <img class="to" @click="handleTo('/m/favors')" style="width: 20px; height: 20px; margin-right: 20px" src="../../../assets/icon/华为mate40pro.png" alt="" srcset="" />
            <i :style="{ color: state.themeColor, fontSize: '22px' }" @click="handleTo('/index')" class="iconfont to icon-PC"></i>
            <el-popover placement="bottom" title="APP下载" width="300" trigger="hover">
              <div class="qr">
                <div class="tip" style="font-size: 12px; margin-bottom: 10px; width: 100%; color: #999">请扫描下载APP或者点击下方按钮直接下载</div>
                <el-image width="300px" height="150px" :src="qrImg" :preview-src-list="[qrImg]" fit="fill"></el-image>
                <el-button style="margin-top: 40px" type="primary" size="default" link @click="handleDownloadApp">点击下载APP</el-button>
              </div>
              <template #reference>
                <i title="点击下载 app" :style="{ color: state.themeColor, marginLeft: '20px', fontSize: '18px' }" class="iconfont to download-app icon-APK"></i>
              </template>
            </el-popover>
          </div>
        </div>
      </div>
      <div class="footer">
        <span
          class="sub-title"
          :style="{
            color: state.themeColor
          }"
          @click="handleRefreshSaying">
          {{ state.saying || appViweFooter() }}
        </span>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { appViweFooter, getLunar, isMobile } from '@/utils/common';
import { getLightColor } from '@/utils/theme';
import { Search } from '@element-plus/icons-vue';
import axios from 'axios';
import { ElNotification } from 'element-plus';
import moment from 'moment';
import { reactive, ref, watch } from 'vue';
import { useRouter } from 'vue-router';
import qrImg from '../../../assets/images/app-qr.png';

const router = useRouter();

const weekConfig = {
  1: '星期一',
  2: '星期二',
  3: '星期三',
  4: '星期四',
  5: '星期五',
  6: '星期六',
  7: '星期天'
};
let typeRef = ref();

const pgc = usePGCStore();
const appStore = useAppStore();

let themeColor = getLightColor(pgc.themeColor, 0.5);

let state = reactive({
  themeColor: pgc.themeColor,
  timer: 0,
  isMobile: isMobile(800),
  currentTime: moment().format('HH:mm:ss'),
  currentDate: moment().format('MM月DD日'),
  week: moment().day(),
  lunar: getLunar(moment().format('YYYY-MM-DD')),
  keyword: '',
  type: 1,
  isScreenFull: appStore.isScreenFull || false,
  clockSize: isMobile(800) ? 0.5 : 0.7,
  saying: ''
});

// 获取名言名句
const getSaying = () => {
  axios.get('https://api.xygeng.cn/one', {}).then(response => {
    let res = response.data;
    if (res.code == 200) {
      state.saying = res.data.content;
    }
  });
};
// 刷新名言名句
getSaying();
const handleRefreshSaying = () => {
  getSaying();
};

// 更新时间
// state.timer = setInterval(() => {
//   state.currentTime = moment().format('HH:mm:ss');
// }, 1000);

const handleSelect = () => {
  let urlObj = {
    1: `https://www.baidu.com/s?wd=${state.keyword}`,
    2: `https://www.baidu.com/s?wd=${state.keyword}`,
    3: `https://cn.bing.com/search?q=${state.keyword}`
  };
  let url = urlObj[state.type];
  window.open(url);
};

// 跳转到pc端
const handleTo = path => {
  router.push({
    path
  });
  if (path == '/index' && isMobile(600)) {
    ElNotification({
      title: '提示',
      message: '用PC端访问效果更佳哦',
      type: 'info',
      duration: 5000
    });
  }
};

// 全屏/退出全屏 兼容性处理
const handleFullScreen = () => {
  if (state.isScreenFull) {
    document.exitFullscreen();
  } else {
    document.documentElement.requestFullscreen();
  }
  state.isScreenFull = !state.isScreenFull;
  appStore.SET_ISSCREENFULL(state.isScreenFull);
};

// 下载app
const handleDownloadApp = () => {
  window.location.href = import.meta.env.VITE_APP_DOWNLOAD_URL;
};

// onUnmounted(() => {
//   state.timer = 0;
//   clearInterval(state.timer);
// });

watch(
  () => pgc.themeColor,
  newVal => {
    state.themeColor = newVal;
  }
);
</script>

<style lang="scss" scoped>
.content-container {
  height: 100%;
  overflow-y: auto;
  background-image: url('../../../assets/images/bg.png');
  background-size: cover;
  padding: 15px;

  .container-warp {
    height: 100%;
    display: flex;
    flex-direction: column;
    overflow: hidden;
    .header {
      height: 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      .title {
        height: 40px;
        line-height: 40px;
        background-color: #000;
        color: #fff;
        font-size: 18px;
        text-align: center;
        font-weight: 600;
      }
      .download-app {
        margin-right: 20px;
        font-size: 12px;
        cursor: pointer;
      }
    }
    .main {
      width: 100%;
      flex: 1;
      display: flex;
      position: relative;
      .content-container-center {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -100%);
      }
      .time-select {
        display: flex;
        flex-direction: column;
        align-items: center;
        color: #fff;
        .clock-warp {
          cursor: pointer;
        }
        .time {
          font-family: DSDIGI;
          font-size: 60px;
          font-weight: 900;
        }
        .date {
          margin-top: 10px;
          font-size: 16px;
          font-weight: 500;
          font-family: DSDIGI;
        }
      }
      .to {
        cursor: pointer;
      }
      .to:hover {
        color: v-bind(themeColor);
      }
      .select-warp {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-top: 30px;
        padding: 0 20px;
        .el-input {
          max-width: 350px;
        }
      }
    }
    .footer {
      height: 40px;
      display: flex;
      justify-content: center;
      align-items: center;

      .sub-title {
        padding: 2px 5px;
        font-size: 14px;
        background-color: #fcffff2d;
        text-align: center;
        cursor: pointer;
      }
    }
  }
}
.pc,
.mobile {
  margin-left: 20px;
  border-left: 1px solid #ccc;
  padding-left: 10px;
  cursor: pointer;
}
.mobile {
  margin-left: 10px;
}

.qr {
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>

<style lang="scss">
.select-warp {
  .el-input-group__prepend {
    width: 60px;
    position: relative;
    padding: 0 30px !important;
    .select-type-warp {
      position: absolute;
      left: 5px;
    }
  }
}
</style>
