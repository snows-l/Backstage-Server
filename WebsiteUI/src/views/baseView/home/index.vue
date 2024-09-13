<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-24 10:22:55
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-13 17:08:40
 * @FilePath: /backstage/WebsiteUI/src/views/baseView/home/index.vue
-->

<template>
  <div class="index-warp">
    <div class="padding-warp">
      <el-row :gutter="0">
        <el-col style="margin-bottom: 10px" :span="16" :md="16" :sm="24" :xs="24">
          <div class="left-warp" :style="{ padding: state.isMobile ? '0 12px' : '0 20px' }">
            <div class="top-total-warp" v-loading="state.totalLoading">
              <div class="total-item" :style="{ backgroundColor: item.bgColor, width: state.totalItemWidth }" v-for="item in state.totalList" :key="item.title">
                <div class="total-title">{{ item.title }}</div>
                <div class="total-value">
                  <CountTo :startVal="0" :endVal="item.value" :duration="1000" :prefix="''" :suffix="''" :decimals="2" :decimal="'.'" :separator="','"></CountTo>
                  <span class="unit">{{ item.unit }}</span>
                </div>
              </div>
            </div>
            <div class="bottom-chart-warp">
              <div class="chart-item favors-chart-item">
                <div class="title-warp">
                  <div class="title-label">人情来往统计</div>
                  <div class="more-warp" @click="handleMore('/favors')">
                    详情
                    <i class="iconfont icon-gengduo1"></i>
                  </div>
                </div>
                <BarChart
                  ref="barRef"
                  v-loading="state.favorsLoading"
                  :color="[state.themeColor, getRandomColor()]"
                  :x-axis="state.favors.xAxis"
                  :seriesM="state.favors.yAxisM"
                  :series-b="state.favors.yAxisB" />
              </div>
              <div class="chart-item">
                <div class="title-warp">
                  <div class="title-label">近一年收入统计</div>
                  <div class="more-warp" @click="handleMore('/wages')">
                    详情
                    <i class="iconfont icon-gengduo1"></i>
                  </div>
                </div>
                <LineChart
                  v-loading="state.wagesLoading"
                  ref="lineRef"
                  :color="[state.themeColor]"
                  :title="'近年收入走势'"
                  :x-axis="state.wages.xAxis"
                  :series="state.wages.series" />
              </div>
            </div>
          </div>
        </el-col>
        <el-col style="margin-bottom: 10px" :span="8" :md="8" :sm="24" :xs="24">
          <div class="right-warp" :style="{ padding: state.isMobile ? '0 12px' : '0 20px' }">
            <el-card class="info-card">
              <template #header>
                <div class="clearfix">
                  <span>个人信息</span>
                </div>
              </template>
              <div>
                <div class="avatar-warp">
                  <el-avatar
                    :size="80"
                    icon="el-icon-user-solid"
                    shape="circle"
                    :src="state.avaterUrl ? state.avaterUrl : state.user.sex == 1 ? manAvatarDefault : girlAvatarDefault"
                    fit="fill"></el-avatar>
                  <!-- <UserAvatar :avatar="state.user.avatar" /> -->
                </div>
                <ul class="list-group list-group-striped">
                  <li class="list-group-item">
                    <div class="lable">用户名</div>
                    <div class="pull-right">{{ state.user.user_name || '/' }}</div>
                  </li>
                  <li class="list-group-item">
                    <div class="lable">用户昵称</div>
                    <div class="pull-right">{{ state.user.nick_name || '/' }}</div>
                  </li>
                  <li class="list-group-item">
                    <div class="lable">手机号码</div>
                    <div class="pull-right">{{ state.user.phonenumber || '/' }}</div>
                  </li>
                  <li class="list-group-item">
                    <div class="lable">用户邮箱</div>
                    <div class="pull-right">{{ state.user.email || '/' }}</div>
                  </li>
                  <li class="list-group-item">
                    <div class="lable">所属角色</div>
                    <div class="pull-right">{{ state.user.role_str || state.user.role_key || '/' }}</div>
                  </li>
                  <li class="list-group-item">
                    <div class="lable">创建日期</div>
                    <div class="pull-right">{{ state.user.create_time ? moment(state.user.create_time).format('YYYY-MM-DD') : '/' }}</div>
                  </li>
                </ul>
              </div>
            </el-card>
            <div class="calendar-warp">
              <el-card class="info-card">
                <template #header>
                  <div class="calendar" style="display: flex; justify-content: space-between; align-items: center">
                    <span>日历</span>
                    <span>{{ moment(state.calendar).format('YYYY 年 MM 月') }}</span>
                  </div>
                </template>
                <el-calendar v-model="state.calendar" ref="calendarRef">
                  <template #header="{ date }">
                    <span></span>
                    <el-button-group>
                      <!-- <el-button size="small" @click="selectDate('prev-year')"><i><<</i></el-button> -->
                      <el-button size="small" @click="selectDate('prev-month')"><</el-button>
                      <el-button size="small" @click="selectDate('today')">今天</el-button>
                      <el-button size="small" @click="selectDate('next-month')">></el-button>
                      <!-- <el-button size="small" @click="selectDate('next-year')">>></el-button> -->
                    </el-button-group>
                  </template>
                  <template #date-cell="{ data }">
                    <div class="cell-warp" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center">
                      <p :class="data.isSelected ? 'is-selected' : ''">
                        {{ data.day.split('-')[2] }}
                        <!-- {{ data.isSelected ? '✔️' : '' }} -->
                      </p>
                    </div>
                  </template>
                </el-calendar>
              </el-card>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script setup>
import { getFavorsList, getTotal, getWageCurrentYear } from '@/api/home';
import { getDict } from '@/api/system/dict';
import girlAvatarDefault from '@/assets/images/girl.png';
import manAvatarDefault from '@/assets/images/man.png';
import router from '@/router';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { isMobile } from '@/utils/common';
import { getLightColor, getRandomColor } from '@/utils/theme';
import _ from 'lodash';
import moment from 'moment';
import { onUnmounted, reactive, ref, watch } from 'vue';
import BarChart from './components/BarChart.vue';
import LineChart from './components/LineChart.vue';

const pgc = usePGCStore();
const app = useAppStore();
const lineRef = ref(null);
const barRef = ref(null);
const calendarRef = ref(null);

let themeColor = ref(pgc.themeColor);
let lightThemeColor = ref(getLightColor(themeColor.value, 0.3));

// 总收入、支出、收益、总资产
const state = reactive({
  favorsLoading: false,
  wagesLoading: false,
  isMobile: isMobile(993),
  totalItemWidth: isMobile(470) ? '100%' : isMobile(993) ? '40%' : '20%',
  themeColor: pgc.themeColor,
  totalList: [
    { title: '总收入', value: 0, unit: '元', bgColor: getRandomColor() },
    { title: '年收入', value: 0, unit: '元', bgColor: getRandomColor() },
    { title: '人情总额', value: 0, unit: '元', bgColor: getRandomColor() },
    { title: '人情归还', value: 0, unit: '元', bgColor: getRandomColor() }
  ],
  calendar: new Date(),
  user: app.user,
  avaterUrl: app.user.avatar ? app.avatar : '',
  timerList: [],
  timerListPage: [],
  timer: '2',
  wages: {
    xAxis: [],
    series: []
  },
  allFavors: [],
  favors: {
    xAxis: [],
    yAxisM: [],
    yAxisB: []
  },
  intervalr: null
});

// 整理数据
const formatData = i => {
  state.favors.xAxis = state.allFavorsPage[i].map(item => item.favors_name);
  state.favors.yAxisM = state.allFavorsPage[i].map(item => item.favors_money || 0);
  state.favors.yAxisB = state.allFavorsPage[i].map(item => item.favors_backMoney || 0);
  state.favorsLoading = false;
};

// 处理人情轮询展示数据
const next = () => {
  let i = 0;
  formatData(i);
  state.intervalr = setInterval(() => {
    i++;
    if (i >= state.allFavorsPage.length) {
      i = 0;
    }
    formatData(i);
  }, 5000);
};

// 获取人情列表
const getFovorsListFn = () => {
  state.favorsLoading = true;
  getFavorsList({ timer: state.timer }).then(res => {
    if (res.code === 200) {
      state.allFavors = res.data;
      state.allFavorsPage = _.chunk(res.data, 12);
      next();
    }
  });
};

// 接口初始化
const init = () => {
  state.wagesLoading = true;
  state.totalLoading = true;
  getDict({ dictType: 'favors_time' }).then(res => {
    if (res.code === 200) {
      state.timerList = res.data;
    }
  });
  getTotal()
    .then(res => {
      if (res.code === 200) {
        state.totalList[0].value = res.data.wagesSum;
        state.totalList[1].value = res.data.currentYearWagesSum;
        state.totalList[2].value = res.data.favorsSum;
        state.totalList[3].value = res.data.favarsBackSum;
      }
    })
    .finally(() => {
      state.totalLoading = false;
    });
  getWageCurrentYear()
    .then(res => {
      if (res.code == 200) {
        let series = [];
        let xAxis = [];
        res.data.forEach(item => {
          series.push(item.money);
          xAxis.push(item.date);
        });
        state.wages.series = series;
        state.wages.xAxis = xAxis;
      }
    })
    .finally(() => {
      state.wagesLoading = false;
    });
  getFovorsListFn();
};

init();

// 切换时间段
// const handleChangeTimer = () => {
//   clearInterval(state.intervalr);
//   getFovorsListFn();
// };

// 点击详情
const handleMore = path => {
  router.push(path);
};

// 日历改变
const selectDate = val => {
  if (!calendarRef.value) return;
  calendarRef.value.selectDate(val);
};

const resizeCallback = () => {
  lineRef.value.resize();
  barRef.value.resize();
  state.isMobile = isMobile(993);
  if (isMobile(470)) {
    state.totalItemWidth = '100%';
  } else if (!isMobile(470) && isMobile(993)) {
    state.totalItemWidth = '40%';
  } else {
    state.totalItemWidth = '20%';
  }
};
window.addEventListener('resize', resizeCallback);

onUnmounted(() => {
  clearInterval(state.intervalr);
  state.intervalr = null;
  window.removeEventListener('resize', resizeCallback);
});

watch(
  () => pgc.themeColor,
  n => {
    state.themeColor = n;
    themeColor.value = n;
    lightThemeColor.value = getLightColor(n, 0.3);
    state.totalList[0].bgColor = getRandomColor();
    state.totalList[1].bgColor = getRandomColor();
    state.totalList[2].bgColor = getRandomColor();
    state.totalList[3].bgColor = getRandomColor();
  }
);
</script>

<style scoped lang="scss">
.index-warp {
  height: 100%;
  width: 100%;
  padding: 20px 8px;
  /* background-image: url('@/assets/images/index.png'); */
  /* background-size: 100% 100%; */
  overflow: hidden;
  .padding-warp {
    width: 100%;
    height: 100%;
    overflow-y: auto;
    overflow-x: hidden;
    .left-warp {
      display: flex;
      flex-direction: column;
      .top-total-warp {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        align-items: center;
        .total-item {
          min-width: 145px;
          padding: 15px 10px;
          margin: 8px 0;
          border-radius: 5px;
          border: 1px solid #eee;
          width: 20%;
          box-shadow: 0 0 10px #eee;
          display: flex;
          flex-direction: column;
          justify-content: center;
          color: #fff;
          .total-title {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
            text-wrap: nowrap;
          }
          .total-value {
            font-size: 20px;
            font-weight: bold;
            font-family: DSDIGI;
            text-align: center;
            text-wrap: nowrap;
            .unit {
              font-size: 12px;
              font-weight: normal;
              margin-left: 5px;
            }
          }
        }
      }
      .bottom-chart-warp {
        width: 100%;
        flex: 1;
        margin-top: 20px;
        display: flex;
        flex-direction: column;
        .chart-item {
          margin: 30px 0;
          width: 100%;
          flex: 1;
          .title-warp {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            .title-label {
              font-size: 15px;
              font-weight: bold;
              display: flex;
              align-items: center;
            }
            .title-label::before {
              content: '';
              display: inline-block;
              width: 5px;
              height: 15px;
              margin-right: 5px;
              background-color: v-bind(themeColor);
            }
            .more-warp {
              display: flex;
              align-items: center;
              color: v-bind(lightThemeColor);
              cursor: pointer;
              font-size: 12px;
              i {
                font-size: 12px;
                margin-left: 5px;
              }
            }
            .more-warp:hover {
              color: v-bind(themeColor);
            }
          }
        }
        // .favors-chart-item {
        //   position: relative;
        //   .search {
        //     position: absolute;
        //     top: 0;
        //     right: 10px;
        //     z-index: 999;
        //   }
        // }
      }
    }
    .right-warp {
      .info-card {
        width: 100%;
        .list-group-striped li {
          width: 100%;
          height: 40px;
          line-height: 40px;
          border-bottom: 1px solid #f0f0f0;
          display: flex;
          justify-content: space-between;
          align-items: center;
        }
        .list-group-striped li:first-child {
          border-top: 1px solid #f0f0f0;
        }
        .avatar-warp {
          display: flex;
          justify-content: center;
          align-items: center;
          padding: 20px;
          padding-top: 0;
        }
      }
      .calendar-warp {
        margin-top: 20px;
        margin-bottom: 15px;
        :deep(.el-calendar-day) {
          height: 40px;
        }
      }
    }
  }
}
</style>
