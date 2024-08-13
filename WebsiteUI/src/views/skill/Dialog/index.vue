<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-05-30 09:19:49
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-08 17:42:30
 * @FilePath: /Website/WebsiteUI/src/views/skill/Dialog/index.vue
-->
<template>
  <div class="container-warp p20">
    <el-button type="primary" @click="handleOpen">弹框</el-button>
    <x-dialog ref="dialog" title="Dialog" v-model="isShow" :before-open="handleOpen" :before-close="handleClose">
      <span>好的</span>
      <template #footer>
        <el-button type="info" @click="isShow = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit">确认</el-button>
      </template>
    </x-dialog>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue';
const isShow = ref(false);
const handleOpen = () => {
  isShow.value = true;
};

const handleClose = () => {
  isShow.value = false;
};

const handleSubmit = () => {
  isShow.value = false;
};
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
}
</style>
