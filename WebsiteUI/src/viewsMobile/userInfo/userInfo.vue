<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-23 16:47:45
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-29 00:29:02
 * @FilePath: /Website/WebsiteUI/src/viewsMobile/userInfo/userInfo.vue
-->
<template>
  <div class="m-rest-pwd-warp">
    <XDialog :size="isMobile ? '90vw' : '40vw'" max-width="700px" minWidth="350px" title="基本资料" style="max-width: 400px" v-model="open" :before-close="handleClose">
      <div class="m-edit-user-info" style="padding: 20px 0">
        <el-form ref="baseFormRef" :model="state.editUser" :rules="rulesInfo" label-width="80px">
          <el-form-item label="用户昵称" prop="nick_name">
            <el-input v-model="state.editUser.nick_name" maxlength="30" />
          </el-form-item>
          <el-form-item label="手机号码" prop="phonenumber">
            <el-input v-model="state.editUser.phonenumber" maxlength="11" />
          </el-form-item>
          <el-form-item label="邮箱" prop="email">
            <el-input v-model="state.editUser.email" maxlength="50" />
          </el-form-item>
          <el-form-item label="性别">
            <el-radio-group v-model="state.editUser.sex">
              <el-radio value="1">男</el-radio>
              <el-radio value="2">女</el-radio>
              <el-radio value="3">不想透露</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="handleSubmitUserInfo">保存</el-button>
          </el-form-item>
        </el-form>
      </div>

      <template #footer>
        <span>
          <el-button @click="handleClose">取消</el-button>
          <el-button type="primary" @click="handleSubmit">确认</el-button>
        </span>
      </template>
    </XDialog>
  </div>
</template>

<script setup>
import { editUser } from '@/api/system/user';
import { useAppStore } from '@/store/common';
import { isMobile } from '@/utils/common';
import { onBeforeUnmount, reactive, ref } from 'vue';
import { useRouter } from 'vue-router';

let open = ref(false);
const store = useAppStore();
const router = useRouter();
const resetPwdFormRef = ref(null);

const state = reactive({
  isMobile: isMobile(1000),
  editUser: {}
});

const rulesInfo = {
  nick_name: [{ required: true, message: '用户昵称不能为空', trigger: 'blur' }],
  email: [
    { required: true, message: '邮箱地址不能为空', trigger: 'blur' },
    {
      type: 'email',
      message: '请输入正确的邮箱地址',
      trigger: ['blur', 'change']
    }
  ],
  phonenumber: [
    { required: true, message: '手机号码不能为空', trigger: 'blur' },
    {
      pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
      message: '请输入正确的手机号码',
      trigger: 'blur'
    }
  ]
};

const init = user => {
  state.editUser = user;
  open.value = true;
};
const handleClose = () => {
  open.value = false;
};

const handleSubmit = () => {
  resetPwdFormRef.value.validate(valid => {
    if (valid) {
      editUser(state.editUser).then(res => {
        if (res.code === 200) {
          ElMessage.success('修改成功');
          handleClose();
        }
      });
    }
  });
};

const resizeCallback = () => {
  state.isMobile = isMobile(1000);
};
window.addEventListener('resize', resizeCallback);

onBeforeUnmount(() => {
  window.removeEventListener('resize', resizeCallback);
});

defineExpose({
  init
});
</script>

<style lang="scss" scoped>
.m-rest-pwd-warp {
  width: 100%;
  height: 100%;
  padding: 20px;
}
</style>
