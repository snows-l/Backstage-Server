<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" v-model="open" :before-close="handleClose" :size="isMobile ? '90vw' : '40vw'" :style="{ width: isMobile ? '90vw' : '50vw' }">
      <el-form :model="state.itemRecord" ref="formRef" :rules="rules" label-width="120px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="标题：" prop="title" style="width: 100%">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.title" placeholder="请输入标题"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="收入金额：" prop="money" style="width: 100%">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.money" placeholder="请输入收入金额"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item prop="date" label="日期：" style="width: 100%">
              <el-date-picker style="width: 80%" clearable v-model="state.itemRecord.date" type="month" placeholder="请选择日期" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="工资截图：" prop="picLocal" style="width: 100%">
              <el-upload class="avatar-uploader" :show-file-list="false" :before-upload="beforeUpload" :http-request="handleUpload">
                <img v-if="state.itemRecord.picLocal" :src="state.itemRecord.picLocal" class="avatar" />
                <el-icon v-else class="avatar-uploader-icon"><Plus /></el-icon>
              </el-upload>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="就职于：" prop="source" style="width: 100%">
              <el-select v-model="state.itemRecord.source" clearable placeholder="请选择就职于" style="width: 80%">
                <el-option v-for="item in state.companyList" :key="item.value" :label="item.label" :value="item.value"></el-option>
              </el-select>
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
import { uploadWages } from '@/api/common';
import { addWages, editWages } from '@/api/wages';
import { ElMessage, ElMessageBox } from 'element-plus';
import moment from 'moment';
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
  itemRecord: {
    title: '',
    money: '',
    date: '',
    pic: '',
    picLocal: '',
    source: '',
    remark: ''
  },
  companyList: []
});

const rules = {
  title: [{ required: true, message: '请输入收标题', trigger: 'blur' }],
  money: [{ required: true, message: '请输入收入', trigger: 'blur' }],
  date: [{ required: true, message: '请输选择收入月份', trigger: 'change' }],
  picLocal: [{ required: true, message: '请上传收入截图', trigger: 'change' }],
  source: [{ required: true, message: '请选择收入来源', trigger: 'change' }]
};

const handleUpload = (file: any) => {
  let name = file.file.name && file.file.name.split('.')[0];
  uploadWages(file.file, name).then(res => {
    state.itemRecord.picLocal =
      import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + res.data.path : import.meta.env.VITE_PROD_BASE_SERVER + res.data.path;
    state.itemRecord.pic = res.data.path;
  });
};

const beforeUpload = (file: any) => {
  if (file.type !== 'image/jpeg' && file.type !== 'image/png' && file.type !== 'image/jpg') {
    ElMessage.error('请上传jpeg, jpg, png格式的图片!');
    return false;
  } else if (file.size / 1024 / 1024 > 10) {
    ElMessage.error('附件不能大于10M!');
    return false;
  }
  return true;
};

// 关闭弹窗
const handleClose = () => {
  state.itemRecord = {
    title: '',
    money: '',
    date: '',
    pic: '',
    source: '',
    remark: ''
  };
  open.value = false;
};

// 新增
const add = () => {
  addWages({ ...state.itemRecord, date: moment(state.itemRecord.date).format('YYYY-MM') }).then(() => {
    ElMessage.success('新增成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 修改
const edit = () => {
  editWages({ ...state.itemRecord, date: moment(state.itemRecord.date).format('YYYY-MM') }).then(() => {
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
const showDialog = (type: string, row, companyList) => {
  state.title = type == 'add' ? '新增收入记录' : '修改收入记录';
  state.type = type;
  state.companyList = companyList;

  if (type == 'add') {
    if (row) {
      state.itemRecord = {
        title: '',
        money: '',
        date: '',
        pic: '',
        picLocal: '',
        source: '',
        remark: ''
      };
    }
  } else {
    state.itemRecord = Object.assign({}, row);
    state.itemRecord.picLocal =
      import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + state.itemRecord.pic : import.meta.env.VITE_PROD_BASE_SERVER + state.itemRecord.pic;
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
