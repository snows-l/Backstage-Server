<!--
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-01-04 15:46:39
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2023-01-05 16:14:02
 * @FilePath: /my-vue3-vite-app/src/components/v3.vue
-->
<template>
  <div class="container-warp">
    {{ aa }}
  </div>
</template>

<script lang="ts">
import { ref } from 'vue';
export default {
  setup() {
    let aa = ref(0);

    return {
      aa
    };
  }
};
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
}
</style>
