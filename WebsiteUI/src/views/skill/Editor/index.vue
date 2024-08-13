<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-19 15:22:10
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-10 15:25:11
 * @FilePath: /webseteUI/WebsiteUI/src/views/skill/Editor/index.vue
-->
<template>
  <div class="editor-container-warp p20">
    <div class="content-warp">
      <Toolbar class="editor-toolbar" style="border: 1px solid #ccc" :editor="editorRef" :defaultConfig="toolbarConfig" :mode="mode" />
      <div class="editor-warp">
        <div class="article-title-warp">
          <input class="input" :value="state.form.title" placeholder="标题" clearable />
        </div>
        <Editor class="editor-content-warp" v-model="valueHtml" :defaultConfig="editorConfig" :mode="mode" @onCreated="handleCreated" />
        <el-form :model="state.form" ref="formRef" :rules="rules" label-width="120px">
          <el-form-item label="歌名：" prop="title" style="width: 100%">
            <el-input style="width: 80%" clearable v-model="state.form.title" placeholder="请输入歌名"></el-input>
          </el-form-item>

          <el-form-item label="歌名：" prop="title" style="width: 100%">
            <el-input style="width: 80%" clearable v-model="state.form.title" placeholder="请输入歌名"></el-input>
          </el-form-item>
        </el-form>
        <div class="btn-warp">
          <el-button type="primary" size="small" @click="handleSubmit">发布</el-button>
        </div>
        <div class="yue" v-html="valueHtml"></div>
      </div>
    </div>
  </div>
</template>

<script setup>
import '@wangeditor/editor/dist/css/style.css'; // 引入 css
import { reactive } from 'vue';

import { Editor, Toolbar } from '@wangeditor/editor-for-vue';
import { onBeforeUnmount, onMounted, ref, shallowRef } from 'vue';
// 编辑器实例，必须用 shallowRef
const editorRef = shallowRef();
// 编辑模式
const mode = ref('wysiwyg');
// 内容 HTML
const valueHtml = ref('');

const rules = {};
const formRef = ref(null);

const state = reactive({
  form: {
    title: ''
  }
});

const handleSubmit = () => {
  formRef.value.validate(valid => {
    if (valid) {
      console.log('submit');
      console.log('-------- valueHtml --------', valueHtml.value);
    } else {
      console.log('error submit');
      return false;
    }
  });
};

// 模拟 ajax 异步获取内容
onMounted(() => {
  // setTimeout(() => {
  //   valueHtml.value = '<p>模拟 Ajax 异步设置内容</p>';
  // }, 1500);
});

const toolbarConfig = {};
const editorConfig = { placeholder: '请输入内容...' };

// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
  const editor = editorRef.value;
  if (editor == null) return;
  editor.destroy();
});

const handleCreated = editor => {
  editorRef.value = editor; // 记录 editor 实例，重要！
  console.log('-------- editor --------', editorRef.value.getMenuConfig('uploadImage'));
};
</script>

<style lang="scss" scoped>
.editor-container-warp {
  width: 100%;
  height: 100%;
  position: relative;
  overflow: hidden;
  .content-warp {
    width: 100%;
    height: 100%;
    overflow-y: auto;
    overflow-x: hidden;
    .editor-toolbar {
      position: sticky;
      top: 0px;
      left: 0;
      z-index: 9999;
      width: 100%;
    }
    .editor-warp {
      max-width: 850px;
      padding: 20px 50px 50px;
      border: 1px solid #e8e8e8;
      box-shadow: 0 2px 10px rgb(0 0 0 / 12%);
      margin: 40px auto;
      .article-title-warp {
        height: 85px;
        padding: 20px 0;
        border-bottom: 1px solid #e8e8e8;
        .input {
          border: 0px;
          height: 100%;
          width: 100%;
          font-size: 20px;
          outline: none;
        }
      }
      .editor-content-warp {
        width: 100%;
        background-color: #fff;
        min-height: 1077px;
      }
    }
  }
}
</style>
