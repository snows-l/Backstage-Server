<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" v-model="open" :before-close="handleClose" :size="isMobile ? '90vw' : '40vw'" :style="{ width: isMobile ? '90vw' : '50vw' }">
      <el-form :model="state.itemRecord" ref="formRef" :rules="rules" label-width="120px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="内容：" prop="text" style="width: 100%">
              <el-input type="textarea" rows="6" style="width: 80%" clearable v-model="state.itemRecord.text" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="照片/视频：" prop="file" style="width: 100%">
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
            <el-form-item label="备注：" prop="remark" style="width: 100%">
              <el-input type="textarea" rows="4" clearable style="width: 80%" placeholder="请输入备注" v-model="state.itemRecord.remark"></el-input>
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

const handleRemove = () => {
  state.itemRecord.file = [];
};

const beforeUpload = (file: any) => {
  if (file.size / 1024 / 1024 > 20) {
    ElMessage.error('附件不能大于10M!');
    return false;
  }
  return true;
};

// 关闭弹窗
const handleClose = () => {
  state.itemRecord = {
    text: '',
    file: [],
    remark: ''
  };
  open.value = false;
};

// 新增
const add = () => {
  let params = {
    text: state.itemRecord.text,
    imgs: state.itemRecord.file.map(item => item.src).join(','),
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
  let params = {
    id: state.itemRecord.id,
    text: state.itemRecord.text,
    imgs: state.itemRecord.file.map(item => item.src).join(','),
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
  if (!row) {
    state.title = '新增';
    state.type = 'add';
    state.itemRecord = {
      text: '',
      file: [],
      remark: ''
    };
  } else {
    state.title = '修改';
    state.type = 'edit';
    state.itemRecord = Object.assign({}, row);
    state.itemRecord.file = state.itemRecord.imgSrcs.map((item, i) => {
      return {
        name: '',
        url: item,
        src: state.itemRecord.imgs[i]
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
