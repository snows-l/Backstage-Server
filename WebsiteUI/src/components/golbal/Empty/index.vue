<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-08 10:56:57
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-08 15:06:26
 * @FilePath: /Website/WebsiteUI/src/components/golbal/Empty/index.vue
-->
<template>
  <div class="custom-empty-warp">
    <el-empty :image-size="size" :image="src">
      <template #description>
        <!-- $slots $attrs 在template中可以直接使用 在js中就需要使用 useSlots()  useAttrs() 才行 -->
        <slot v-if="$slots.default"></slot>
        <!-- 特意使用 具名插槽, 看着么使用 -->
        <slot v-else-if="$slots.description" name="description"></slot>
        <span v-else>暂无数据</span>
      </template>
    </el-empty>
    <el-button type="primary" plain v-if="attrs.onRefresh" @click="handleClick">{{ btnText }}</el-button>
  </div>
</template>

<script lang="ts" setup name="Empty">
import emptyDefaultImgSrc from '@/assets/images/empty.png';
import { useSlots, useAttrs } from 'vue';

// 插槽
const slots = useSlots();
// 兜底属性 除去 defineProps， defineEmits定义过的所以属性以及事件 事件需要加上on前缀然后小驼峰
const attrs = useAttrs();

const props = defineProps({
  src: {
    type: String,
    default: emptyDefaultImgSrc
  },
  size: {
    type: Number,
    default: 200
  },
  btnText: {
    type: String,
    default: '刷新'
  }
});

// 因为我要拿到是否传了自定义 refresh 事件，用来控制是否展示按钮， 用 defineEmits 定义了 refresh， 在useAttrs 中可以获取不到了， 所以没有用到 emits
// const emits = defineEmits({
//   refresh: {
//     type: Function,
//     default: () => {}
//   }
// });
const handleClick = () => {
  // 触发自定义事件
  // emits('refresh');
  attrs.onRefresh();
};
</script>

<style lang="scss" scoped>
.custom-empty-warp {
  width: 100%;
  height: 100%;
  background-color: var(--contentBgc);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  :deep(.el-empty__description) {
    color: #999;
    font-size: 14px;
    margin-top: 10px;
  }
}
</style>
