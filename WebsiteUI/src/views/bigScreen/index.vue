<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-11-16 11:12:36
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2023-11-16 13:01:44
 * @FilePath: /vue3+vite+pinia_classicsCase/src/views/bigScreen/index.vue
-->
<template>
  <div class="bigScreenContainer" id="bigScreenContainer">
    <div class="secend-container">大屏</div>
  </div>
</template>

<script lang="ts" setup>
import { useBigScreenAdapter } from '@/utils/bigScreenAdapterHook';
// import { useBigScreenAdapter } from 'snows-utils';

let scale = useBigScreenAdapter();
</script>

<style lang="scss" scoped>
.bigScreenContainer {
  padding: 20px;
  font-size: 18px;
  .secend-container {
    width: 100%;
    height: 100%;
    border: 1px solid #f45;
    text-align: center;
    line-height: 100%;
  }
}
</style>
