<!--
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2022-09-01 11:25:19
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-03 19:21:16
 * @FilePath: /Website/WebsiteUI/src/views/skill/FontFamily/index.vue
-->
<template>
  <div class="warp p20">
    <div class="title">
      <span class="text">中国人名共和国字体样式的比较,中国人名共和国字体样式的比较中国人名共和国字体样式的比,中国人名共和国字体样式的比较,中国人名共和国字体样式的比较</span>
    </div>
    <div>
      <span class="text1">1 2 3 4 5 6 7 8 9 0</span>
    </div>
    <span>sum:{{ count }}</span>
    <button @click="handleAdd(5)">点击+1</button>
    <el-button type="text" @click="handleRereshFatherConponent">子传父</el-button>
  </div>
</template>

<script setup lang="ts">
import jsonData from '@/assets/data/json/car.json';
import { controlledRef } from '@vueuse/core';
import { onMounted, ref, watch, watchEffect } from 'vue';
let arr = {};

defineProps({
  msg: {
    type: String,
    required: true,
    validator: value => {
      return true;
    }
  },
  dataObj: Object
});

// 声明refresh自定义事件
const emits = defineEmits(['refresh']);

// 触发子传父
const handleRereshFatherConponent = () => {
  // 使用自定义事件通知父组件
  emits('refresh', '子组件穿给父组件的数据');
};

// 数字的加法
const count = ref(0);
let handleAdd = (args: number) => {
  count.value += args;
  // 如果count > 30 就停止监听
  if (count.value > 30) {
    clearWatch();
  }
};

// watchEffect监听（会自动收集依赖的数据进行监听）, 会返回一个函数，调用返回的函数则取消监听,会立即监听
const clearWatch = watchEffect(() => {
  console.log('--------watchEffect count --------', count.value);
});

// 懒监听。需要指定监听的对象， 首次不会监听（若果需要首次监听则加上immediate:true）
watch(count, (oldValue, newValue) => {
  console.log('-------- watch --------', oldValue, newValue);
});

// 生命周期 ==> 加载完成
onMounted(() => {
  console.log('挂在完成', jsonData);
});

// 写一个方法让父组件点用并穿参数（相当于vue2的this.$refs[refName].fatherFun())。 需要通过defineExpose()暴露给父组件
let fatherFun = (params: any) => {
  console.log('父组件调用了这个方法并传了数据', params);
};

controlledRef;
// 父组件需要调用的方法或数据需要通过defineExpose暴露出去才行
defineExpose({
  fatherFun,
  count
});
</script>

<style lang="scss" scoped>
.read-the-docs {
  color: #888;
}
.title {
  .text {
    color: red;
    font-size: 24px;
    font-family: 优设标题黑5;
  }
}
.msg {
  font-family: '华文行楷';
}

.text1 {
  font-family: DSDIGI;
  font-size: 40px;
}
</style>
