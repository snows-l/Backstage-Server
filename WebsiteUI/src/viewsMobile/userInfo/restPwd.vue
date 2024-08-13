<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-23 16:47:45
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-29 00:29:10
 * @FilePath: /Website/WebsiteUI/src/viewsMobile/userInfo/restPwd.vue
-->
<template>
  <div class="m-rest-pwd-warp">
    <XDialog :size="isMobile ? '90vw' : '40vw'" :title="'修改密码'" maxWidth="700px" v-model="open" :before-close="handleClose">
      <div class="m-ret-pwd-content" style="padding: 20px 30px">
        <el-form ref="resetPwdFormRef" :model="state.user" :rules="rules" label-width="80px">
          <el-form-item label="旧密码" prop="oldPassword">
            <el-input v-model="state.user.oldPassword" placeholder="请输入旧密码" type="password" show-password />
          </el-form-item>
          <el-form-item label="新密码" prop="newPassword">
            <el-input v-model="state.user.newPassword" placeholder="请输入新密码" type="password" show-password />
          </el-form-item>
          <el-form-item label="确认密码" prop="confirmPassword">
            <el-input v-model="state.user.confirmPassword" placeholder="请确认新密码" type="password" show-password />
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
import { editPwd } from '@/api/system/user';
import { useAppStore } from '@/store/common';
import { isMobile } from '@/utils/common';
import { encrypt } from '@/utils/jsencrypt';
import { ElMessageBox } from 'element-plus';
import { onBeforeUnmount, reactive, ref } from 'vue';
import { useRouter } from 'vue-router';

let open = ref(false);
const store = useAppStore();
const router = useRouter();
const resetPwdFormRef = ref(null);

const state = reactive({
  isMobile: isMobile(1000),
  user: {
    oldPassword: '',
    newPassword: '',
    confirmPassword: ''
  }
});

const equalToPassword = (rule, value, callback) => {
  if (state.user.newPassword !== value) {
    callback(new Error('两次输入的密码不一致'));
  } else {
    callback();
  }
};

const rules = {
  oldPassword: [{ required: true, message: '旧密码不能为空', trigger: 'blur' }],
  newPassword: [
    { required: true, message: '新密码不能为空', trigger: 'blur' },
    { min: 6, max: 20, message: '长度在 6 到 20 个字符', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '确认密码不能为空', trigger: 'blur' },
    { required: true, validator: equalToPassword, trigger: 'blur' }
  ]
};

const init = user => {
  state.user = user;
  open.value = true;
};
const handleClose = () => {
  open.value = false;
};

const handleSubmit = () => {
  resetPwdFormRef.value.validate(valid => {
    if (valid) {
      const { oldPassword, newPassword } = state.user;
      const data = {
        user_id: state.user.user_id,
        new_password: encrypt(newPassword),
        old_password: encrypt(oldPassword)
      };
      editPwd(data).then(res => {
        if (res.code === 200) {
          ElMessageBox.confirm('密码修改成功，请重新登录？').then(() => {
            store.Logout().then(res => {
              router.push({ path: '/login', query: { redirect: '/m/user-infos' } });
            });
          });
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
