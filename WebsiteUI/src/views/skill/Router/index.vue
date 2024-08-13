<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-11-13 14:44:58
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-03 19:21:11
 * @FilePath: /Website/WebsiteUI/src/views/skill/Router/index.vue
-->
<template>
  <div class="container-warp p20">
    <el-button type="primary" size="default" @click="handleClick">to Login params</el-button>
    <el-button type="primary" size="default" @click="handleToR">to Register query</el-button>
  </div>
</template>

<script lang="ts" setup>
import { useRouter } from 'vue-router';
const router = useRouter();
const handleClick = () => {
  router.push({
    name: 'Login',
    params: {
      id: 1
    }
  });
};

const handleToR = () => {};
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
}
</style>
