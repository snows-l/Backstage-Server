<template>
  <div class="container-warp p20">
    <div ref="el" :style="style" style="position: fixed">Drag me! I am at {{ x }}, {{ y }}</div>
  </div>
</template>

<script lang="ts" setup>
import { useDraggable } from '@vueuse/core';
import { ref } from 'vue';

const el = ref<HTMLElement | null>(null);

const { x, y, style } = useDraggable(el, {
  initialValue: { x: 40, y: 40 }
});
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
}
</style>
