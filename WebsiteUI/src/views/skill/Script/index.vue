<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-05-31 10:45:57
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-03 19:21:21
 * @FilePath: /Website/WebsiteUI/src/views/skill/Script/index.vue
-->
<template>
  <div class="container-warp p20">
    <h5>导出vue文件</h5>
    <br />
    <el-button type="primary" size="default" @click="handleClick">导出</el-button>
  </div>
</template>

<script lang="ts" setup>
import { downloadVueTemp, generateVue, generateVueScript, generateVueStyle, generateVueTemplate } from '@/utils/template';
let tempStr = '<div style="color:skyblue" class="box">hello word</div>';
let scriStr = 'let a:number;a=12;console.log(a)';
let stylStr = ".box {background-color:'blue'}";
const temp = generateVueTemplate(tempStr);
const scri = generateVueScript(scriStr, 'ts', true, true);
const styl = generateVueStyle(stylStr, 'scss', true);

// 生成完整的vue文件
const vueTemp = generateVue(temp, scri, styl);

// 导出文件
const handleClick = () => {
  downloadVueTemp(vueTemp);
};
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
}
</style>
