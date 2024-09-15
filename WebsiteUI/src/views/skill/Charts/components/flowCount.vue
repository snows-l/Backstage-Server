<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-11-30 15:26:14
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-15 19:40:53
 * @FilePath: /webseteUI/WebsiteUI/src/views/skill/Charts/components/flowCount.vue
-->
<template>
  <div class="charts-warp">
    <el-form :model="form" ref="form" :rules="rules" label-width="60px" :inline="true">
      <el-form-item label="日期">
        <el-date-picker v-model="form.date" type="datetimerange" range-separator="至" start-placeholder="开始时间" end-placeholder="结束时间" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">查询</el-button>
      </el-form-item>
    </el-form>
    <div class="chart-warp">
      <BarChart :yAxis="yAxis" :assigned="shangxing" :used="xiaxing"></BarChart>
      <LineCharts code="l_left_charts" :yAxis="leftyAxis" :xAxis="rightxAxis" name="" color="#4095E5"></LineCharts>
      <PieChart :code="'pie'"></PieChart>
      <MapChart></MapChart>
    </div>
  </div>
</template>

<script setup>
import BarChart from '@/components/charts/bar/index.vue';
import LineCharts from '@/components/charts/line/index.vue';
import MapChart from '@/components/charts/map/index.vue';
import PieChart from '@/components/charts/pie/index.vue';
import { ref } from 'vue';

const form = ref({
  date: []
});

const shangxing = ref([150, 160, 3, 1]);
// const xiaxing = ref([3, 3.6, 0.5, 0.2]);
const xiaxing = ref([101, 103, 87, 113]);
const yAxis = ref(['移动', '联通', '电信', '华数']);

// 功能二
// CPU使用率
// const leftyAxis = ref([2050, 2215, 7171, 5788, 6084, 5425, 4329, 7512, 5277, 5980, 2550, 6187]);
const leftyAxis = ref([1, 2, 3, 4, 5, 6, 7, 8, 9, 9, 9, 9]);
const rightxAxis = ref([
  '2023-11-30 12:30:00',
  '2023-11-30 12:35:00',
  '2023-11-30 12:40:00',
  '2023-11-30 12:45:00',
  '2023-11-30 12:50:00',
  '2023-11-30 12:55:00',
  '2023-11-30 13:00:00',
  '2023-11-30 13:05:00',
  '2023-11-30 13:10:00',
  '2023-11-30 13:15:00',
  '2023-11-30 13:20:00',
  '2023-11-30 13:25:00'
]);
// const rightxAxis = ref(['爱奇艺', '淘宝', '淘宝', '天猫', '百度云APP', '绝地求生', 'Xbox Top10']);

let arr = [];
const sjs = (n, m) => {
  return Math.random() * (m - n) + n;
};
for (let i = 1; i <= 12; i++) {
  arr.push(parseInt(sjs(20, 60)));
}
leftyAxis.value = arr;

const rules = ref([]);

const onSubmit = () => {};
</script>

<style lang="scss" scoped>
.containcharts-warper-warp {
  width: 100%;
  height: 100%;
  background-color: #ffffff;
  .chart-warp {
    height: 800px;
  }
}
</style>
