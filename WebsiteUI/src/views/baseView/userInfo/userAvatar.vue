<template>
  <div>
    <div class="user-info-head" @click="editCropper()"><img :src="state.options.img" title="点击上传头像" class="img-circle img-lg" /></div>
    <el-dialog :title="state.title" v-model="state.open" width="800px" append-to-body @opened="modalOpened" @close="closeDialog">
      <el-row space="20">
        <el-col :xs="24" :md="12" :style="{ height: '360px' }">
          <vue-cropper
            ref="cropperRef"
            :img="state.options.img"
            :info="true"
            :autoCrop="state.options.autoCrop"
            :autoCropWidth="state.options.autoCropWidth"
            :autoCropHeight="state.options.autoCropHeight"
            :fixedBox="state.options.fixedBox"
            :outputType="state.options.outputType"
            @realTime="realTime"
            v-if="state.visible" />
        </el-col>
        <el-col :xs="24" :md="12" :style="{ height: '360px', display: 'flex', justifyContent: 'center', alignItems: 'center' }">
          <div class="avatar-upload-preview">
            <img :src="state.previews.url" :style="state.previews.img" />
          </div>
        </el-col>
      </el-row>
      <br />
      <el-row>
        <el-col :lg="2" :sm="3" :xs="3">
          <el-upload style="height: 100%" action="#" :http-request="requestUpload" :show-file-list="false" :before-upload="beforeUpload">
            <el-button style="height: 100%">
              选择
              <el-icon style="margin-left: 5px"><Upload /></el-icon>
            </el-button>
          </el-upload>
        </el-col>
        <el-col :lg="{ span: 1, offset: 2 }" :sm="2" :xs="2">
          <el-button style="height: 100%" :icon="ZoomIn" @click="changeScale()"></el-button>
        </el-col>
        <el-col :lg="{ span: 1, offset: 1 }" :sm="2" :xs="2">
          <el-button style="height: 100%" :icon="ZoomOut" @click="changeScale(-1)"></el-button>
        </el-col>
        <el-col :lg="{ span: 1, offset: 1 }" :sm="2" :xs="2">
          <el-button style="height: 100%" :icon="RefreshLeft" @click="rotateLeft()"></el-button>
        </el-col>
        <el-col :lg="{ span: 1, offset: 1 }" :sm="2" :xs="2">
          <el-button style="height: 100%" :icon="RefreshRight" @click="rotateRight()"></el-button>
        </el-col>
        <el-col :lg="{ span: 2, offset: 6 }" :sm="2" :xs="2">
          <el-button style="height: 100%" type="primary" @click="uploadImg()">提 交</el-button>
        </el-col>
      </el-row>
    </el-dialog>
  </div>
</template>

<script setup>
import { uploadFile } from '@/api/common';
import { useAppStore } from '@/store/common';
import { debounce } from '@/utils/common';
import { RefreshLeft, RefreshRight, ZoomIn, ZoomOut } from '@element-plus/icons-vue';
import { ElMessage } from 'element-plus';
import { reactive, ref, watch } from 'vue';
import { VueCropper } from 'vue-cropper';
import 'vue-cropper/dist/index.css';

const props = defineProps({
  avatar: { type: String }
});

const store = useAppStore();

const cropperRef = ref();
const state = reactive({
  // 是否显示弹出层
  open: false,
  // 是否显示cropper
  visible: true,
  // 弹出层标题
  title: '修改头像',
  options: {
    img: '', // , //裁剪图片的地址
    autoCrop: true, // 是否默认生成截图框
    autoCropWidth: 200, // 默认生成截图框宽度
    autoCropHeight: 200, // 默认生成截图框高度
    fixedBox: true, // 固定截图框大小 不允许改变
    outputType: 'png' // 默认生成截图为PNG格式
  },
  previews: {},
  resizeHandler: null
});

// 编辑头像
const editCropper = () => {
  state.open = true;
};
// 打开弹出层结束时的回调
const modalOpened = () => {
  state.visible = true;
  if (!state.resizeHandler) {
    state.resizeHandler = debounce(() => {
      refresh();
    }, 100);
  }
  window.addEventListener('resize', state.resizeHandler);
};

// 刷新组件
const refresh = () => {
  cropperRef.value.refresh();
};

// 覆盖默认的上传行为
const requestUpload = () => {};

// 向左旋转
const rotateLeft = () => {
  cropperRef.value.rotateLeft();
};

// 向右旋转
const rotateRight = () => {
  cropperRef.value.rotateRight();
};

// 图片缩放
const changeScale = num => {
  num = num || 1;
  cropperRef.value.changeScale(num);
};

// 上传预处理
const beforeUpload = file => {
  if (file.type.indexOf('image/') == -1) {
    ElMessage.error('文件格式错误，请上传图片类型,如：JPG，PNG后缀的文件。');
  } else {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => {
      state.options.img = reader.result;
    };
  }
};

const blobToFile = (blob, fileName = '') => {
  const file = new File([blob], fileName, { type: blob.type });
  return file;
};

// 上传图片
const uploadImg = () => {
  cropperRef.value.getCropBlob(data => {
    let file = blobToFile(data);
    uploadFile(file, '/imgs/avatars').then(response => {
      state.open = false;
      state.options.img =
        import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + response.data.path : import.meta.env.VITE_PROD_BASE_SERVER + response.data.path;
      ElMessage.success('头像修改成功！');
      store.SET_AVATAR(state.options.img);
      state.visible = false;
    });
  });
};

// 实时预览
const realTime = img => {
  cropperRef.value.getCropData(data => {
    // 得到的是一个base64
    state.previews = { url: data };
  });
};

// 关闭窗口
const closeDialog = () => {
  state.visible = false;
  window.removeEventListener('resize', state.resizeHandler);
};

watch(
  () => props.avatar,
  newVal => {
    state.options.img = newVal;
  },
  { immediate: true }
);
</script>

<style scoped lang="scss">
.user-info-head {
  position: relative;
  display: inline-block;
  width: 120px;
  height: 120px;
}

.user-info-head:hover:after {
  content: '+';
  position: absolute;
  left: 0;
  top: 0;
  width: 120px;
  height: 120px;
  text-align: center;
  color: #eee;
  background: rgba(0, 0, 0, 0.5);
  font-size: 24px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  cursor: pointer;
  line-height: 120px;
  border-radius: 50%;
}

.img-lg {
  width: 120px;
  height: 120px;
  border-radius: 50%;
}
.avatar-upload-preview {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  overflow: hidden;
  margin-left: 20px;
  border: 1px solid #eee;
  img {
    width: 100% !important;
    height: 100% !important;
  }
}
</style>

<style>
.el-upload {
  height: 100%;
}
</style>
