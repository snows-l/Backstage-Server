<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" v-model="open" :before-close="handleClose" :size="isMobile ? '90vw' : '40vw'" :style="{ width: isMobile ? '90vw' : '50vw' }">
      <el-form :model="state.form" ref="formRef" :rules="rules" label-width="140px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="网页名称：" prop="name" style="width: 100%">
              <el-input type="text" style="width: 80%" clearable v-model="state.form.name" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="网址：" prop="name" style="width: 100%">
              <el-input type="text" style="width: 80%" clearable v-model="state.form.url" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="简介：" prop="name" style="width: 100%">
              <el-input type="textarea" rows="4" style="width: 80%" clearable v-model="state.form.profile" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="logo地址/QQ：" prop="name" style="width: 100%">
              <el-input type="text" style="width: 80%" clearable v-model="state.form.logo" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="是否QQ获取头像：" prop="isQQ" style="width: 100%">
              <el-radio-group v-model="state.form.isQQ">
                <el-radio :value="1">是</el-radio>
                <el-radio :value="0">否</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="是否启用" prop="status" style="width: 100%">
              <el-radio-group v-model="state.form.status">
                <el-radio :value="1">是</el-radio>
                <el-radio :value="0">否</el-radio>
              </el-radio-group>
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
import { addFriendLink, editFriendLink } from '@/api/friendLink';
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
  form: {
    id: '',
    name: '',
    profile: '',
    url: '',
    logo: '',
    isQQ: 1,
    status: 1
  }
});

const rules = {
  name: [{ required: true, message: '请输入', trigger: 'blur' }]
};

// 关闭弹窗
const handleClose = () => {
  state.form = {
    name: '',
    profile: '',
    url: '',
    logo: '',
    isQQ: 1,
    status: 1,
    id: ''
  };
  open.value = false;
};

// 新增
const add = () => {
  let params = {
    ...state.form
  };
  addFriendLink(params).then(res => {
    ElMessage.success('新增成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 修改
const edit = () => {
  let params = {
    ...state.form
  };
  editFriendLink(params).then(() => {
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
    state.form = {
      id: '',
      name: '',
      profile: '',
      url: '',
      logo: '',
      isQQ: 1,
      status: 1
    };
  } else {
    state.title = '修改';
    state.type = 'edit';
    state.form = Object.assign({}, row);
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
