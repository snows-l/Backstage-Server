<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" v-model="open" :before-close="handleClose" :size="isMobile ? '90vw' : '40vw'" :style="{ width: isMobile ? '90vw' : '50vw' }">
      <el-form style="width: 100%" :model="state.itemRecord" ref="formRef" :rules="rules" label-position="top" label-width="0px" :inline="false">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="内容：" prop="text" style="width: 100%">
              <el-input type="textarea" :rows="12" style="width: 100%" clearable v-model="state.itemRecord.text" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="图片：" prop="file" style="width: 100%">
              <el-upload
                class="avatar-uploader"
                list-type="picture-card"
                :file-list="state.itemRecord.file"
                :before-upload="beforeUpload"
                :http-request="handleUpload"
                :on-remove="handleRemove">
                <el-icon><Plus /></el-icon>
              </el-upload>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="音频/视频：" prop="fileA" style="width: 100%">
              <el-upload class="avatar-uploader" :file-list="state.itemRecord.fileA" :before-upload="beforeUploadA" :http-request="handleUploadA" :on-remove="handleRemoveA">
                <el-button type="primary" size="small">
                  <el-icon><Upload /></el-icon>
                  上传
                </el-button>
              </el-upload>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="备注：" prop="remark" style="width: 100%">
              <el-input type="textarea" :rows="4" clearable style="width: 100%" placeholder="请输入备注" v-model="state.itemRecord.remark"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <template #footer>
        <span>
          <el-button @click="handleClose">取消</el-button>
          <el-button type="primary" @click="handleSubmit">确认</el-button>
        </span>
      </template>
    </XDialog>
  </div>
</template>

<script lang="ts" setup>
import { uploadFile } from '@/api/common';
import { addZone, editZone } from '@/api/zone';
import { ElMessage, ElMessageBox } from 'element-plus';
import { reactive, ref } from 'vue';

const props = defineProps({
  isMobile: {
    type: Boolean,
    default: false
  },

  refreshCallBack: Function
});

let formRef = ref(null);
let open = ref(false);
const state = reactive({
  title: '新增',
  type: 'add',
  typeList: [],
  itemRecord: {
    text: '',
    file: [],
    fileA: [],
    remark: ''
  }
});

const rules = {
  text: [{ required: true, message: '请输入收标题', trigger: 'blur' }]
};

const handleUpload = (file: any) => {
  let name = file.file.name && file.file.name.split('.')[0];
  uploadFile(file.file, '/imgs/zone', name).then(res => {
    state.itemRecord.file.push({
      name: file.file.name,
      url: import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + res.data.path : import.meta.env.VITE_PROD_BASE_SERVER + res.data.path,
      src: res.data.path
    });
  });
};

const handleRemove = (file: any, fileList: any) => {
  state.itemRecord.file = fileList;
};

const beforeUpload = (file: any) => {
  if (!/\.(jpg|jpeg|png|gif)$/.test(file.name)) {
    ElMessage.error('请上传图片!');
    return false;
  }
  if (file.size / 1024 / 1024 > 20) {
    ElMessage.error('附件不能大于10M!');
    return false;
  }
  return true;
};

const handleUploadA = (file: any) => {
  let name = file.file.name && file.file.name.split('.')[0];
  uploadFile(file.file, '/imgs/zone', name).then(res => {
    state.itemRecord.fileA.push({
      name: file.file.name,
      url: import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + res.data.path : import.meta.env.VITE_PROD_BASE_SERVER + res.data.path,
      src: res.data.path
    });
  });
  console.log('------- state.itemRecord.fileA -------', state.itemRecord.fileA);
};

const handleRemoveA = (file: any, fileList: any) => {
  state.itemRecord.fileA = fileList;
};

const beforeUploadA = (file: any) => {
  if (!/\.(mp3|mp4)$/.test(file.name)) {
    ElMessage.error('请上传音频、视频文件!');
    return false;
  }
  if (file.size / 1024 / 1024 > 20) {
    ElMessage.error('附件不能大于20M!');
    return false;
  }
  return true;
};

// 关闭弹窗
const handleClose = () => {
  state.itemRecord = {
    text: '',
    file: [],
    fileA: [],
    remark: ''
  };
  open.value = false;
};

// 新增
const add = () => {
  let atts = [...state.itemRecord.fileA, ...state.itemRecord.file].map(item => item.src).join(',');
  let params = {
    text: state.itemRecord.text,
    imgs: atts,
    remark: state.itemRecord.remark
  };
  addZone(params).then(res => {
    ElMessage.success('新增成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 修改
const edit = () => {
  let atts = [...state.itemRecord.fileA, ...state.itemRecord.file].map(item => item.src).join(',');
  let params = {
    id: state.itemRecord.id,
    text: state.itemRecord.text,
    imgs: atts,
    remark: state.itemRecord.remark
  };
  editZone(params).then(() => {
    ElMessage.success('修改成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 提交
const handleSubmit = () => {
  let tipText = state.type === 'add' ? '确认新增嘛？' : '确认修改嘛？';
  (formRef.value as any).validate((valid: any) => {
    if (valid) {
      ElMessageBox.confirm(tipText, '提示').then(() => {
        state.type === 'add' ? add() : edit();
      });
    }
  });
};

// 打开弹窗
const showDialog = row => {
  console.log('------- row -------', row);
  if (!row) {
    state.title = '新增';
    state.type = 'add';
    state.itemRecord = {
      text: '',
      file: [],
      fileA: [],
      remark: ''
    };
  } else {
    state.title = '修改';
    state.type = 'edit';
    state.itemRecord = Object.assign({}, row);
    state.itemRecord.file = state.itemRecord.images.map((item, i) => {
      return {
        name: item.split('/')[item.split('/').length - 1],
        url: item,
        src: state.itemRecord.imageName[i]
      };
    });
    state.itemRecord.fileA = [...state.itemRecord.mp3s, ...state.itemRecord.mp4s].map((item, i) => {
      return {
        name: item.split('/')[item.split('/').length - 1],
        url: item,
        src: state.itemRecord.audioName[i]
      };
    });
  }
  open.value = true;
};

defineExpose({
  open,
  showDialog
});
</script>

<style lang="scss" scoped>
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>
