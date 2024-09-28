<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-25 20:11:54
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-28 17:34:40
 * @FilePath: /webseteUI/WebsiteUI/src/layout/Header/index.vue
-->
<template>
  <div class="header">
    <div class="header-left" :style="{ width: isMobile(800) ? 'calc(100% - 300px)' : 'calc(100% - 300px)' }">
      <div class="logo-warp" @click="handleTo('/')" :style="{ width: state.isCollapse && state.isWidth500 ? '54px' : '190px' }">
        <img style="width: 40px; height: 40px" src="../../assets/images/logo.png" alt="" srcset="" />
        <span v-if="!state.isWidth500">{{ appTitle() }}</span>
      </div>
    </div>
    <div class="header-right">
      <div class="time-select" v-if="state.isShowLayoutTime">
        <div class="date" v-if="!isMobile(800)">
          <div style="margin: 3px 0">
            <span>{{ state.currentDate }}</span>
          </div>
          <div style="margin: 3px 0">
            <span style="margin: 0 10px">{{ weekConfig[state.week] }}</span>
            <span>{{ state.lunar }}</span>
          </div>
        </div>
        <span class="time" v-if="!state.isWidth500">
          {{ state.currentTime }}
        </span>
      </div>
      <div class="operation">
        <div class="sub-menu">
          <!-- <div class="tool-item" @click="handleTo('/')"><i style="margin-right: 5px; font-size: 20px" class="iconfont to icon-home"></i></div> -->
          <div class="tool-item" @click="handleTo('/m/favors')"><img style="width: 20px; height: 20px; margin-right: 5px" src="../../assets/icon/华为mate40pro.png" /></div>
          <div class="tool-item" v-if="state.isScreenFull" @click="handleToggleFullscreen">
            <img style="width: 20px; height: 20px; margin-right: 5px" src="../../assets/icon/unfullscreen.svg" />
          </div>
          <div class="tool-item" v-else @click="handleToggleFullscreen"><img style="width: 20px; height: 20px; margin-right: 5px" src="../../assets/icon/fullscreen.svg" /></div>
          <div class="tool-item">
            <project-config-dialog>
              <i style="font-size: 16px" class="iconfont icon-shezhi" />
            </project-config-dialog>
          </div>
        </div>
        <div class="user-name">{{ state.userName }}</div>
      </div>
      <el-dropdown>
        <div class="avtar" style="display: flex; align-items: center">
          <el-avatar icon="el-icon-user-solid" shape="circle" :src="state.avatarUrl || (state.sex == 2 ? girlAvatarDefault : manAvatarDefault)" fit="fill"></el-avatar>
          <el-icon class="el-icon--right" style="font-size: 16px"><arrow-down /></el-icon>
        </div>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="handleTo('/user-info')">个人中心</el-dropdown-item>
            <!-- <el-dropdown-item @click="handleTo('/')">
              <i style="margin-right: 5px; font-size: 20px" class="iconfont to icon-home"></i>
              首页
            </el-dropdown-item>
            <el-dropdown-item @click="handleTo('/m')">
              <img @click="handleTo" style="width: 20px; height: 20px; margin-right: 5px" src="../../assets/icon/华为mate40pro.png" alt="" srcset="" />
              移动端
            </el-dropdown-item>
            <el-dropdown-item>
              <project-config-dialog>
                <i style="font-size: 16px" class="iconfont icon-shezhi" />
                项目配置
              </project-config-dialog>
            </el-dropdown-item> -->

            <el-dropdown-item @click="handleLogout">退出登录</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<script setup>
import girlAvatarDefault from '@/assets/images/girl.png';
import manAvatarDefault from '@/assets/images/man.png';
import ProjectConfigDialog from '@/components/ProjectConfigDialog/index.vue';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { appTitle, getLunar, isMobile } from '@/utils/common';
import { ElMessage, ElMessageBox } from 'element-plus';
import moment from 'moment';
import { onUnmounted, reactive, ref, watch } from 'vue';
import { useRouter } from 'vue-router';

const store = useAppStore();
const pgc = usePGCStore();
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

const state = reactive({
  timer: null,
  isScreenFull: false,
  currentTime: moment().format('HH:mm:ss'),
  currentDate: moment().format('MM月DD日'),
  week: moment().day(),
  lunar: getLunar(moment().format('YYYY-MM-DD')),
  avatarUrl: store.user.avatar ? store.avatar : '',
  sex: store.user.sex,
  userName: store.user.nick_name || store.user.user_name,
  titleColor: pgc.themeColor,
  isShowLayoutTime: pgc.isShowLayoutTime,
  isWidth500: isMobile(500),
  isCollapse: pgc.isCollapse
});

// 更新时间
state.timer = setInterval(() => {
  state.currentTime = moment().format('HH:mm:ss');
}, 1000);

let titleColor = ref(pgc.themeColor);

const handleLogout = () => {
  ElMessageBox.confirm('确认退出登录吗?', '提示', {
    confirmButtonText: '确 认',
    cancelButtonText: '取 消',
    type: 'warning'
  })
    .then(() => {
      store.Logout().then(res => {
        ElMessage.success('退出登录成功！');
        router.push('/login');
      });
    })
    .catch(() => {
      ElMessage({
        type: 'info',
        message: '已取消'
      });
    });
};

// 切换全屏/退出全屏
const handleToggleFullscreen = () => {
  if (!document.fullscreenElement) {
    // 进入全屏
    var requestMethod =
      document.documentElement.requestFullScreen || //W3C
      document.documentElement.webkitRequestFullScreen || //Chrome等
      document.documentElement.mozRequestFullScreen || //FireFox
      document.documentElement.msRequestFullscreen; //IE11

    if (requestMethod) {
      requestMethod.call(document.documentElement);
    } else if (typeof window.ActiveXObject !== 'undefined') {
      var wscript = new ActiveXObject('WScript.Shell');
      if (wscript !== null) {
        wscript.SendKeys('{F11}');
      }
    }
    state.isScreenFull = true;
  } else {
    // 退出全屏
    if (document.exitFullscreen) {
      document.exitFullscreen();
      state.isScreenFull = false;
    }
  }
};

watch(
  () => pgc.themeColor,
  n => {
    titleColor.value = n;
  }
);
watch(
  () => pgc.isShowLayoutTime,
  n => {
    state.isShowLayoutTime = n;
  }
);

watch(
  () => pgc.isCollapse,
  n => {
    console.log('------- 1 -------', n);
    state.isCollapse = n;
  }
);
watch(
  () => store.avatar,
  n => {
    state.avatarUrl = n;
  }
);

const resizeCallback = () => {
  state.isWidth500 = isMobile(500);
};
window.addEventListener('resize', resizeCallback);

const handleTo = path => {
  router.push({ path });
};

onUnmounted(() => {
  window.removeEventListener('resize', resizeCallback);
  state.timer = null;
  clearInterval(state.timer);
});
</script>

<style lang="scss" scoped>
.header {
  height: 60px;
  background-image: radial-gradient(transparent 1px, #ffffff 1px);
  background-size: 4px 4px;
  backdrop-filter: saturate(50%) blur(4px);
  padding: 0 20px 0 10px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 2px 2px 2px #b6b1af;
  .header-left {
    flex: 1;
    min-width: 60px;
    .logo-warp {
      height: 40px;
      display: flex;
      align-items: center;
      cursor: pointer;
      // justify-content: center;
      img {
        width: 40px;
        height: 40px;
        margin-right: 10px;
      }
      span {
        font-size: 18px;
        font-weight: 600;
        color: v-bind(titleColor);
        margin-left: 5px;
      }
    }
    .x-title {
      width: 100%;
      font-size: 20px;
      font-weight: 600;
      color: v-bind(titleColor);
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  }
  .header-right {
    display: flex;
    align-items: center;
    .time-select {
      display: flex;
      justify-content: center;
      align-items: center;
      color: #000;
      margin-right: 20px;
      .date {
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        align-items: center;
        width: 150px;
        font-size: 14px;
        font-weight: 500;
        font-family: DSDIGI;
        color: #908e8e;
      }
      .time {
        width: 120px;
        font-family: DSDIGI;
        font-size: 30px;
        font-weight: 900;
        color: v-bind(titleColor);
      }
    }
    .operation {
      display: flex;
      align-items: center;
      margin-right: 10px;
      .sub-menu {
        display: flex;
        align-items: center;
        margin-right: 20px;
        .tool-item {
          margin: 0 5px;
          cursor: pointer;
        }
        .tool-item:hover {
          color: v-bind(titleColor);
        }
      }
    }
  }
}
</style>
