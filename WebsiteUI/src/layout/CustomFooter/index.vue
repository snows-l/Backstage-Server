<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-12-04 12:27:54
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-04-02 15:51:52
 * @FilePath: /Website/WebsiteUI/src/layout/CustomFooter/index.vue
-->
<template>
  <div class="footer-warp">
    <span>{{ appPCFooter() }}</span>
  </div>
</template>

<script lang="ts" setup>
import { appPCFooter } from '@/utils/common';
</script>

<style lang="scss" scoped>
.footer-warp {
  width: 100%;
  height: 100%;
  padding: 5px 20px;
  background-color: var(--contentBgc);
  display: flex;
  justify-content: center;
  align-items: center;
  span {
    text-align: center;
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
  }
}
</style>
