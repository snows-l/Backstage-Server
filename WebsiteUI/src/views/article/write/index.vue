<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-19 15:22:10
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-17 16:56:48
 * @FilePath: /webseteUI/WebsiteUI/src/views/article/write/index.vue
-->
<template>
  <div class="editor-container-warp p20" id="editor-container-warp">
    <div class="out-contet-warp">
      <div class="content-warp">
        <Toolbar class="editor-toolbar" style="border: 1px solid #ccc" :editor="editorRef" :defaultConfig="toolbarConfig" :mode="mode" />
        <div class="editor-warp">
          <div class="article-title-warp">
            <input class="input" :value="state.form.title" placeholder="标题..." clearable @change="handleTitleChange" />
          </div>
          <Editor class="editor-content-warp" v-model="valueHtml" :defaultConfig="editorConfig" :mode="mode" @onCreated="handleCreated" @customPaste="customPaste" />
        </div>
        <div class="form-warp">
          <el-form :model="state.form" ref="formRef" :rules="rules" label-width="70px">
            <el-form-item label="摘要：" prop="subTitle" style="width: 100%">
              <el-input type="textarea" :rows="10" v-model="state.form.subTitle" placeholder="请输入" :show-word-limit="true"></el-input>
            </el-form-item>

            <el-form-item label="类型：" prop="type" style="width: 100%">
              <el-select style="width: 300px" v-model="state.form.type" placeholder="请选择歌曲类型" clearable>
                <el-option v-for="item in state.typeList" :key="item.value" :label="item.label" :value="item.value"></el-option>
              </el-select>
            </el-form-item>

            <el-form-item label="封面：" prop="coverLocal" style="width: 100%">
              <el-upload class="avatar-uploader" :show-file-list="false" :before-upload="beforeUpload" :http-request="handleUpload" :on-remove="handleRemove">
                <template #trigger>
                  <img v-if="state.form.coverLocal" :src="state.form.coverLocal" class="avatar" />
                  <div v-else class="trgger-warp" style="display: flex; justify-content: center; align-items: center; height: 100%">
                    <el-icon style="font-size: 30px; color: #333"><Plus /></el-icon>
                  </div>
                </template>
              </el-upload>
            </el-form-item>
          </el-form>
          <div class="btn-warp">
            <el-button type="primary" class="btn" size="small" @click="handleSubmit">发 布</el-button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { addArticle, editArticle, getArticleDetail } from '@/api/article';
import { uploadArticleCover } from '@/api/common';
import { getDict } from '@/api/system/dict';
import { Editor, Toolbar } from '@wangeditor/editor-for-vue';
import '@wangeditor/editor/dist/css/style.css'; // 引入 css
import { ElMessage } from 'element-plus';
import { onBeforeUnmount, onMounted, reactive, ref, shallowRef } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import useWangEditorHook from './hooks';

const router = useRouter();
const route = useRoute();

// 编辑器实例，必须用 shallowRef
const editorRef = shallowRef();
const formRef = ref(null);
// 编辑模式
const mode = ref('default'); // simple | default
const valueHtml = ref('');

// 表单校验规则
const rules = {
  subTitle: [{ required: true, message: '请输入摘要', trigger: 'blur' }],
  type: [{ required: true, message: '请选择类型', trigger: 'change' }],
  coverLocal: [{ required: true, message: '请上传封面', trigger: 'change' }]
};

const state = reactive({
  form: {
    title: '',
    subTitle: '',
    type: '',
    coverLocal: '',
    cover: '',
    content: ''
  },
  typeList: []
});

const toolbarConfig = {
  // toolbarKeys: [
  //   // 一些常用的菜单 key
  //   'bold', // 加粗
  //   'italic', // 斜体
  //   'through', // 删除线
  //   'underline', // 下划线
  //   'bulletedList', // 无序列表
  //   'numberedList', // 有序列表
  //   'color', // 文字颜色
  //   'insertLink', // 插入链接
  //   'fontSize', // 字体大小
  //   'lineHeight', // 行高
  //   'uploadImage', // 上传图片
  //   'uploadVideo', //上传视频
  //   'delIndent', // 缩进
  //   'indent', // 增进
  //   'deleteImage', //删除图片
  //   'divider', // 分割线
  //   'insertTable', // 插入表格
  //   'justifyCenter', // 居中对齐
  //   'justifyJustify', // 两端对齐
  //   'justifyLeft', // 左对齐
  //   'justifyRight', // 右对齐
  //   'undo', // 撤销
  //   'redo', // 重做
  //   'clearStyle', // 清除格式
  //   'fontFamily', // 字体
  //   'code', // 代码块
  //   'quote', // 引用
  //   'emoticon', // 表情
  //   'video', // 插入视频
  //   'audio', // 插入音频
  //   'undo', // 撤销
  //   'redo', // 重做
  //   'clearFormat', // 清除格式
  //   'fullScreen' // 全屏
  // ]
};
const editorConfig = {
  placeholder: '请输入内容...',
  MENU_CONF: {}
};

const { fullScreen } = useWangEditorHook();

// // 上传图片配置
editorConfig.MENU_CONF['uploadImage'] = {
  server: null, // 自定义 上传图片的接口地址
  // server: '/api/upload-img-10s', // test timeout
  // server: '/api/upload-img-failed', // test failed
  // server: '/api/xxx', // test 404

  timeout: 5 * 1000, // 5s
  fieldName: 'file',
  // meta: {},
  withCredentials: true,
  metaWithUrl: false, // join params to url'Content-Type': 'multipart/form-data' },
  maxFileSize: 5 * 1024 * 1024, // 10M
  base64LimitSize: 5 * 1024, // insert base64 format, if file's size less than 5kb

  onBeforeUpload(file) {
    console.log('onBeforeUpload', file);

    return file; // will upload this file
  },
  onProgress(progress) {
    console.log('onProgress', progress);
  },
  onSuccess(file, res) {
    console.log('onSuccess', file, res);
  },
  onFailed(file, res) {
    console.log('onFailed', file, res);
  },
  onError(file, err, res) {
    console.error('onError', file, err, res);
  },
  async customUpload(file, interImg) {
    uploadArticleCover(file, file.name).then(res => {
      if (res.code === 200) {
        let url = import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + res.data.path : import.meta.env.VITE_PROD_BASE_SERVER + res.data.path;
        interImg(url);
      } else {
        ElMessage.error('上传失败');
        return false;
      }
    });
  }
};

const customPaste = (editor, event) => {
  // 获取粘贴的html部分（？？没错粘贴word时候，一部分内容就是html），该部分包含了图片img标签
  let html = event.clipboardData.getData('text/html');

  // 获取rtf数据（从word、wps复制粘贴时有），复制粘贴过程中图片的数据就保存在rtf中
  const rtf = event.clipboardData.getData('text/rtf');

  if (html && rtf) {
    // 该条件分支即表示要自定义word粘贴

    // 列表缩进会超出边框，直接过滤掉
    html = html.replace(/text\-indent:\-(.*?)pt/gi, '');

    // 从html内容中查找粘贴内容中是否有图片元素，并返回img标签的属性src值的集合
    const imgSrcs = findAllImgSrcsFromHtml(html);

    // 如果有
    if (imgSrcs && Array.isArray(imgSrcs) && imgSrcs.length) {
      // 从rtf内容中查找图片数据
      const rtfImageData = extractImageDataFromRtf(rtf);

      // 如果找到
      if (rtfImageData.length) {
        // TODO：此处可以将图片上传到自己的服务器上

        // 执行替换：将html内容中的img标签的src替换成ref中的图片数据，如果上面上传了则为图片路径
        html = replaceImagesFileSourceWithInlineRepresentation(html, imgSrcs, rtfImageData);
        editor.dangerouslyInsertHtml(html);
      }
    }

    // 阻止默认的粘贴行为
    event.preventDefault();
    return false;
  } else {
    return true;
  }
};

// 字体列表
editorConfig.MENU_CONF['fontFamily'] = {
  fontFamilyList: [
    { name: '优设标题黑', value: '优设标题黑5' },
    { name: 'apple', value: 'apple' },
    { name: '华文行楷', value: '华文行楷' },
    { name: 'DSDIGI', value: 'DSDIGI' }
  ]
};

// 全屏
editorConfig.MENU_CONF['fullScreen'] = {
  enable: false,
  dom: document.getElementById('#editor-container-warp')
};

// 获取文章详情
if (route.query.id) {
  state.id = route.query.id;
  getArticleDetail(route.query.id).then(res => {
    if (res.code === 200) {
      state.form.title = res.data.title;
      state.form.subTitle = res.data.subTitle.replace(/&#39;/g, "'");
      state.form.type = res.data.type + '';
      state.form.coverLocal =
        import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + res.data.cover : import.meta.env.VITE_PROD_BASE_SERVER + res.data.cover;
      state.form.cover = res.data.cover;
      state.form.content = res.data.content.replace(/&#39;/g, "'");
      valueHtml.value = decodeURIComponent(state.form.content);
    }
  });
}

//   标题输入框内容变化
const handleTitleChange = e => {
  state.form.title = e.target.value;
};

// 获取 文章 类型列表
getDict({ dictType: 'article_type' }).then(res => {
  state.typeList = res.data;
});

// 上传文章封面之前的校验
const beforeUpload = file => {
  if (file.type !== 'image/jpeg' && file.type !== 'image/png' && file.type !== 'image/jpg') {
    ElMessage.error('请上传jpeg, jpg, png格式的图片!');
    return false;
  } else if (file.size / 1024 / 1024 > 10) {
    ElMessage.error('附件不能大于10M!');
    return false;
  }
  return true;
};

// 上传文章封面
const handleUpload = file => {
  let name = file.file.name && file.file.name.split('.')[0];
  uploadArticleCover(file.file, name).then(res => {
    state.form.coverLocal =
      import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + res.data.path : import.meta.env.VITE_PROD_BASE_SERVER + res.data.path;
    state.form.cover = res.data.path;
  });
};

// 移除文章封面
const handleRemove = () => {
  state.form.coverLocal = '';
  state.form.cover = '';
};

// 编辑器创建完成
const handleCreated = editor => {
  editorRef.value = editor; // 记录 editor 实例，重要！
};

// 发布文章
const handleSubmit = () => {
  if (!state.form.title) {
    ElMessage.error('请填写标题');
    return false;
  }

  if (!valueHtml.value) {
    ElMessage.error('请输入内容');
    return false;
  }
  formRef.value.validate(valid => {
    if (valid) {
      let params = {
        title: state.form.title,
        // subTitle: state.form.subTitle,
        subTitle: state.form.subTitle.replace(/'/g, '&#39;'),
        type: state.form.type,
        cover: state.form.cover,
        // content: valueHtml.value
        content: valueHtml.value.replace(/'/g, '&#39;')
      };
      if (state.id) {
        params.id = state.id;
        editArticle(params).then(res => {
          if (res.code === 200) {
            ElMessage.success('修改成功');
            // 跳转到文章列表
            router.push('/article/list');
          } else {
            ElMessage.error('修改失败');
          }
        });
      } else {
        addArticle(params).then(res => {
          if (res.code === 200) {
            ElMessage.success('发布成功');
            // 重置表单
            state.form.title = '';
            state.form.subTitle = '';
            state.form.type = '';
            state.form.coverLocal = '';
            state.form.cover = '';
            // 重置编辑器
            editorRef.value.clear();
            // 跳转到文章列表
            router.push('/article/list');
          } else {
            ElMessage.error('发布失败');
          }
        });
      }
    } else {
      console.log('error submit');
      return false;
    }
  });
};

// 模拟 ajax 异步获取内容
onMounted(() => {});

// 组件销毁时，也及时销毁编辑器
onBeforeUnmount(() => {
  const editor = editorRef.value;
  if (editor == null) return;
  editor.destroy();
});
</script>

<style lang="scss" scoped>
.editor-container-warp {
  width: 100%;
  height: 100%;
  padding: 20px;
  overflow: hidden;
  .out-contet-warp {
    width: 100%;
    height: 100%;
    overflow: hidden;
    .content-warp {
      width: 100%;
      height: 100%;
      overflow-x: hidden;
      overflow-y: auto;
      position: relative;
      background-color: #fff;
      .editor-toolbar {
        position: sticky !important;
        top: 0px;
        left: 0;
        z-index: 999;
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
      .form-warp {
        max-width: 850px;
        margin: 0 auto;
        .btn-warp {
          margin-top: 50px;
          margin-bottom: 30px;
          padding: 10px;
          display: flex;
          justify-content: center;
          .btn {
            height: 40px;
            padding: 15px 30px;
            min-width: 200px;
            border: 5px;
          }
        }
      }
    }
  }
}
</style>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  width: 300px;
  height: 200px;
  transition: var(--el-transition-duration-fast);
  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
}
</style>
