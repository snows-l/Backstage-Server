<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" v-model="open" :before-close="handleClose" :size="isMobile ? '90vw' : '40vw'" :style="{ width: isMobile ? '90vw' : '50vw' }">
      <el-form :model="state.form" ref="formRef" :rules="rules" label-width="120px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="内容：" prop="comment" style="width: 100%">
              <el-input type="textarea" rows="4" style="width: 80%" clearable v-model="state.form.comment" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="qq" prop="qq" style="width: 100%">
              <div class="qq-avatar" style="position: relative; width: 100%">
                <el-input type="text" style="width: 80%" clearable v-model="state.form.qq" placeholder="请输入" @blur="handleGetInfoByQQ"></el-input>
                <img style="position: absolute; top: 2px; left: calc(80% + 10px); width: 30px; height: 30px; border-radius: 50%" :src="state.form.avatarUrl || defaultAvatar" />
              </div>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="昵称" prop="nickName" style="width: 100%">
              <el-input type="text" style="width: 80%" clearable v-model="state.form.nickName" placeholder="输入QQ自动获取"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="邮箱" prop="email" style="width: 100%">
              <el-input type="text" style="width: 80%" clearable v-model="state.form.email" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="网站" prop="websiteUrl" style="width: 100%">
              <el-input type="text" style="width: 80%" clearable v-model="state.form.websiteUrl" placeholder="请输入"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="私密评论：" prop="isPrivacy" style="width: 100%">
              <el-radio-group v-model="state.form.isPrivacy">
                <el-radio :value="1">是</el-radio>
                <el-radio :value="0">否</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="邮件通知：" prop="isEmailFeekback" style="width: 100%">
              <el-radio-group v-model="state.form.isQQ">
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
import { addMsgBoard, editMsgBoard } from '@/api/msgBoard';
import defaultAvatar from '@/assets/images/default_avatar.png';
import axios from 'axios';
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
    comment: '',
    qq: '',
    avatarUrl: '',
    nickName: '',
    email: '',
    websiteUrl: '',
    isPrivacy: 0,
    isEmailFeekback: 0
  }
});

const rules = {
  comment: [{ required: true, message: '请输入', trigger: 'blur' }],
  qq: [{ required: true, message: '请输入', trigger: 'blur' }],
  nickName: [{ required: true, message: '请输入', trigger: 'blur' }],
  email: [{ required: true, message: '请输入', trigger: 'blur' }],
  websiteUrl: [{ required: true, message: '请输入', trigger: 'blur' }]
};

// 根据qq获取用户信息 并更新 昵称 头像 邮箱
const handleGetInfoByQQ = () => {
  let url = 'https://www.moeshou.com/wp-json/sakura/v1/qqinfo/json?qq=' + state.form.qq + '&_wpnonce=7ccc55456e';
  axios.get(url).then(res => {
    state.form.avatarUrl = res.data.avatar;
    state.form.nickName = res.data.name;
    state.form.email = state.form.qq + '@qq.com';
  });
};

// 关闭弹窗
const handleClose = () => {
  state.form = {
    id: '',
    qq: '',
    comment: '',
    avatarUrl: '',
    nickName: '',
    email: '',
    websiteUrl: '',
    isPrivacy: 0,
    isEmailFeekback: 0
  };
  open.value = false;
};

// 新增
const add = () => {
  let params = {
    ...state.form,
    type: 0
  };
  addMsgBoard(params).then(res => {
    ElMessage.success('新增成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 修改
const edit = () => {
  let params = {
    ...state.form,
    type: 0
  };
  editMsgBoard(params).then(() => {
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
      comment: '',
      qq: '',
      avatarUrl: '',
      nickName: '',
      email: '',
      websiteUrl: '',
      isPrivacy: 0,
      isEmailFeekback: 0
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
