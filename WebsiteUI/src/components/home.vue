<!--
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2022-12-30 10:41:38
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2023-01-05 16:57:59
 * @FilePath: /my-vue3-vite-app/src/components/home.vue
-->
<template>
  <div ref="target">当前鼠标的位置:{{ x }}-{{ y }}-是否在当前div之外{{ isOutside }}</div>
  <input type="text" v-model="form.value1" />
  <input type="text" v-model="form.value2" />
  <input type="text" v-model="form.value3" />
  <input type="text" v-model="form.value4" />
  <input type="text" v-model="form.forms.value" />
  <br />
  <button @click="currentFormData">当前的form数据</button>
</template>

<script setup lang="ts">
import { useActiveElement, useMouseInElement, useToString } from '@vueuse/core';
import { reactive, ref, watch } from 'vue';

const target = ref<HTMLDivElement | null>(null);

let number = ref<number>(2.0);
const str = useToString(number);

console.log(555, str.value);

const { x, y, isOutside } = useMouseInElement(target);
let num = ref<number>(0);
interface Form {
  value1: number;
  [propertyName: string]: any;
}
let form = reactive<Form>({
  value1: 0,
  value2: 1,
  value3: 2,
  value4: 3,
  forms: {
    value: 9
  }
});

const currentFormData = () => {
  console.log('===currentFormData===', form);
  console.log('===currentFormData>forms===', form.forms.value);
};
const activeElement = useActiveElement();
watch(activeElement, el => {
  console.log('focus changed to', (el as HTMLInputElement).value);
});

watch(
  () => form.value1,
  function (news, oldvalue) {
    console.log(news, oldvalue, 222);
  }
);

watch(
  () => form.forms.value,
  function (news, oldvalue) {
    console.log(news, oldvalue, 555);
  },
  {
    immediate: true
  }
);
</script>

<style></style>
