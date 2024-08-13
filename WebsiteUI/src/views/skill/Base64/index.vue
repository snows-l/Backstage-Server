<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-10-29 11:08:46
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-10 00:12:14
 * @FilePath: /webseteUI/WebsiteUI/src/views/skill/Base64/index.vue
-->
<template>
  <div class="container-warp p20">
    <div class="btn-upload-box">
      <label for="upload">上传文件</label>
      <input type="file" id="upload" @change="handleUpload" />
    </div>
    <div class="base-64 ccc">
      {{ base64String }}
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue';
const base64String = ref('');
const handleUpload = e => {
  let file = e.target.files[0];
  let suffix = file.name.split('.').pop();
  if (window.FileReader) {
    let reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (event) {
      base64String.value = event.target.result;
      // 此处可对该base64进行获取赋值传入后端
      console.log('bese64编码：', base64String.value);
    };
  }
};
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100%;
}
.btn-upload-box {
  label {
    padding: 8px 10px;
    border: 1px solid #eee;
    font-size: 12px;
  }
  input {
    display: none;
  }
}
.btn-upload-box:hover label {
  border-color: #009;
}
.base-64 {
  padding: 20px;
  border: 1px solid #eee;
  margin-top: 20px;
  overflow-y: auto;
  font-size: 12px;
  word-wrap: break-word;
}
</style>
