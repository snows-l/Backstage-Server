<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-10 09:39:56
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-10 12:19:49
 * @FilePath: /Website/WebsiteUI/src/components/golbal/FlipClock/index.vue
-->
<template>
  <div class="clock-container" :style="{ transform: `scale(${props.size})` }">
    <flip-item :total="2" :current="timeArr[0]" />
    <flip-item :total="9" :current="timeArr[1]" />
    <div class="colon"></div>
    <flip-item :total="5" :current="timeArr[2]" />
    <flip-item :total="9" :current="timeArr[3]" />
    <div class="colon"></div>
    <flip-item :total="5" :current="timeArr[4]" />
    <flip-item :total="9" :current="timeArr[5]" />
  </div>
  <div></div>
</template>

<script setup>
import { onBeforeUnmount, ref } from 'vue';
import FlipItem from './FlipItem.vue';
import { getTimeArr } from './utils';

const props = defineProps({
  size: {
    type: Number,
    default: 1
  }
});

const timeArr = ref(getTimeArr());
var timer;

const startTimer = () => {
  timer = setInterval(() => {
    timeArr.value = getTimeArr();
  }, 1000);
};
startTimer();

onBeforeUnmount(() => {
  clearInterval(timer);
});
</script>
<style scoped>
.clock-container {
  display: flex;
  align-items: center;
}

.colon {
  height: 50px;
  padding: 0 10px;
  display: flex;
  justify-content: space-around;
  flex-direction: column;
}

.colon::after,
.colon::before {
  content: '';
  display: block;
  width: 10px;
  height: 10px;
  background: rgba(255, 255, 255, 0.7);
  border-radius: 50%;
}
</style>
