<template>
  <div class="reset">
    <el-form
      ref="resetpwdFormRef"
      :style="{ width: isMobile() ? '280px' : '460px', marginRight: isMobile() ? '' : '200px' }"
      :model="registerForm"
      :rules="state.registerRules"
      class="register-form">
      <h3 class="title" style="cursor:pointer" @click="$router.push('/view')"><img :src="logoUrl" style="width: 24px;height: 24px;margin-right: 10px;"></img>{{ appTitle() }} - 重置密码</h3>
      <el-form-item prop="username">
        <el-input v-model="registerForm.username" type="text" auto-complete="off" placeholder="账号">
          <template #prefix>
            <el-icon><User /></el-icon>
          </template>
        </el-input>
      </el-form-item>

      <el-form-item class="code-input" prop="code" v-if="state.captchaEnabled">
        <el-input v-model="registerForm.code" auto-complete="off" placeholder="验证码" style="width: 63%" @keyup.enter.native="handleRegister">
          <template #prefix>
            <el-icon><More /></el-icon>
          </template>
        </el-input>
        <div @click="getCode" class="code-img" v-html="state.codeUrl"></div>
      </el-form-item>
      <el-form-item style="width: 100%">
        <el-button :loading="state.loading" type="primary" style="width: 100%" @click.native.prevent="handleRegister">
          <span v-if="!state.loading">重置密码</span>
          <span v-else>密码重置中...</span>
        </el-button>
        <div style="float: right; margin-top: 10px">
          <router-link class="link-type" :to="'/login'">使用已有账户登录</router-link>
        </div>
      </el-form-item>
    </el-form>
    <!--  底部  -->
    <div class="el-register-footer">
      <span>{{ appPCFooter() }}</span>
    </div>
  </div>
</template>

<script setup lang="ts">
import { getCodeImg, resetpwd } from '@/api/login';
import logoUrl from '@/assets/images/logo.png';
import { appPCFooter, appTitle, isMobile } from '@/utils/common';
import { ElMessageBox } from 'element-plus';
import { reactive, ref } from 'vue';

let align = ref(isMobile() ? 'center' : 'flex-end');
const registerForm = reactive({
  username: '',
  code: '',
  uuid: ''
});
const state = reactive({
  codeUrl: '',

  loading: false,
  captchaEnabled: true,

  registerRules: {
    username: [
      { required: true, trigger: 'blur', message: '请输入您的账号' },
      { min: 2, max: 20, message: '用户账号长度必须介于 2 和 20 之间', trigger: 'blur' }
    ],
    code: [{ required: true, trigger: 'change', message: '请输入验证码' }]
  }
});

const getCode = () => {
  getCodeImg().then(res => {
    state.codeUrl = (res as any).img;
  });
};

const resetpwdFormRef = ref();
const handleRegister = () => {
  resetpwdFormRef.value.validate(valid => {
    if (valid) {
      state.loading = true;
      resetpwd(registerForm)
        .then(res => {
          state.loading = false;
          ElMessageBox.confirm(`密码重置成功！重置之后的密码为 ${res.data.pwd} `, '重置确认提示', {
            confirmButtonText: '确 认',
            type: 'success'
          }).then(() => {
            getCode();
          });
        })
        .catch(err => {
          state.loading = false;
          // ElMessage.error(err.message);
          if (state.captchaEnabled) {
            getCode();
          }
        });
    }
  });
};

getCode();
</script>

<style rel="stylesheet/scss" lang="scss">
.reset {
  display: flex;
  justify-content: v-bind(align);
  align-items: center;
  height: 100%;
  background-image: url('../../assets/images/login-background.png');
  background-size: cover;
}
.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
  display: flex;
  align-items: center;
  justify-content: center;
}

.register-form {
  border-radius: 6px;
  background: #ffffff;
  background-image: url('../../assets/images/form_bg.png');
  background-size: 100% 100%;
  width: 400px;
  padding: 25px 25px 5px 25px;
  .el-input {
    height: 38px;
    input {
      height: 38px;
    }
  }
  .input-icon {
    height: 39px;
    width: 14px;
    margin-left: 2px;
  }
}
.register-tip {
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}

.code-input {
  display: flex;
  align-items: center;
  .el-input {
    flex: 1;
  }
  .code-img {
    height: 38px;
    width: 90px;
    margin-left: 10px;
  }
}

.el-register-footer {
  height: 40px;
  line-height: 40px;
  position: fixed;
  bottom: 0;
  width: 100%;
  text-align: center;
  color: #fff;
  font-family: Arial;
  font-size: 12px;
  letter-spacing: 1px;
}
</style>
