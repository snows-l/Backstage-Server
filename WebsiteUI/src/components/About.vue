<template>
  <div class="container-warp">
    <button @click="decrease">-</button>
    <input type="text" v-model="number" />
    <button @click="increase">+</button>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue';
let number = ref<number>(0);

const increase = () => {
  number.value++;
};

const decrease = () => {
  number.value--;
};
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
}
</style>
