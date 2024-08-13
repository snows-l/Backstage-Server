<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-11-30 15:22:13
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-07 18:57:38
 * @FilePath: /webseteUI/WebsiteUI/src/views/skill/Charts/index.vue
-->
<template>
  <div class="container-warp">
    <div class="content-p20">
      <el-form :model="form" ref="form" :rules="rules" label-width="120px" :inline="true">
        <el-form-item s label="时间：">
          <el-date-picker v-model:value="form.date" type="datetimerange" range-separator="至" start-placeholder="开始时间" end-placeholder="结束时间" />
        </el-form-item>
        <el-form-item s label="URL地址：">
          <el-input v-model="form.type" placeholder="请输入URL地址" clearable @change=""></el-input>
        </el-form-item>
        <el-form-item style="">
          <el-button type="primary" @click="onSubmit">查询</el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="content-p20">
      <el-table :data="tableData" style="width: 100%">
        <el-table-column align="center" prop="jname" label="时间" />
        <el-table-column align="center" prop="name" label="用户地址" />
        <el-table-column align="center" prop="address" label="目的地址" />
        <el-table-column align="center" prop="ssyy" label="URL地址" />
      </el-table>
    </div>

    <div class="content-p20">
      <FlowCount></FlowCount>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { reactive, ref } from 'vue';
import FlowCount from './components/flowCount.vue';
const form = reactive({
  date: [],
  type: null
});
const rules = ref({
  date: []
});
let flag = ref('flag1');

const onSubmit = () => {};

const tableData = [
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' },
  { jname: '2023-11-30 15:11:12', name: '7.5.12.31', address: '120.19.2.3', ssyy: 'http://xbox.com/sje.html' }
];
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
  background-color: #f5f2f0;
  .content-p20 {
    padding: 20px;
    background-color: #fff;
    margin-bottom: 10px;
  }
  .btn {
    display: block;
    margin-top: 20px;
    margin-left: 400px;
  }
}
.space {
  width: 100%;
  height: 16px;
  background-color: #f5f2f0;
}

.charts-out-warp {
  height: 100%;
  margin-top: 10px;
}
</style>
