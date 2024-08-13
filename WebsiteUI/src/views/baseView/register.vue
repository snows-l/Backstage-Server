<template>
  <div class="register">
    <el-form
      ref="registerForm"
      :style="{ width: isMobile() ? '280px' : '460px', marginRight: isMobile() ? '' : '200px' }"
      :model="state.registerForm"
      :rules="state.registerRules"
      class="register-form">
      <h3 class="title" style="cursor:pointer" @click="$router.push('/view')"><img :src="logoUrl" style="width: 24px;height: 24px;margin-right: 10px;"></img>{{ appTitle() }} - 账号注册</h3>
      <el-form-item prop="username">
        <el-input v-model="state.registerForm.username" type="text" auto-complete="off" placeholder="账号">
          <template #prefix>
            <el-icon><User /></el-icon>
          </template>
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input :type="state.showPwd ? 'text' : 'password'" v-model="state.registerForm.password" auto-complete="off" placeholder="密码" @keyup.enter.native="handleRegister">
          <template #prefix>
            <el-icon><Lock /></el-icon>
          </template>
          <template #suffix>
            <el-icon @click="showPwd">
              <Hide v-show="state.showPwd" />
              <View v-show="!state.showPwd" />
            </el-icon>
          </template>
        </el-input>
      </el-form-item>
      <el-form-item prop="confirmPassword">
        <el-input
          :type="state.showConfirmPwd ? 'text' : 'password'"
          v-model="state.registerForm.confirmPassword"
          auto-complete="off"
          placeholder="确认密码"
          @keyup.enter.native="handleRegister">
          <template #prefix>
            <el-icon><Lock /></el-icon>
          </template>
          <template #suffix>
            <el-icon @click="showConfirmPwd">
              <Hide v-show="state.showConfirmPwd" />
              <View v-show="!state.showConfirmPwd" />
            </el-icon>
          </template>
        </el-input>
      </el-form-item>
      <el-form-item class="code-input" prop="code" v-if="state.captchaEnabled">
        <el-input v-model="state.registerForm.code" auto-complete="off" placeholder="验证码" style="width: 63%" @keyup.enter.native="handleRegister">
          <template #prefix>
            <el-icon><More /></el-icon>
          </template>
        </el-input>
        <div @click="getCode" class="code-img" v-html="state.codeUrl"></div>
      </el-form-item>
      <el-form-item style="width: 100%">
        <el-button :loading="state.loading" type="primary" style="width: 100%" @click.native.prevent="handleRegister">
          <span v-if="!state.loading">注 册</span>
          <span v-else>注 册 中...</span>
        </el-button>
        <div style="float: right; margin-top: 15px">
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
import { getCodeImg, register } from '@/api/login';
import logoUrl from '@/assets/images/logo.png';
import { appPCFooter, appTitle, isMobile } from '@/utils/common';
import { encrypt } from '@/utils/jsencrypt';
import { ElMessage } from 'element-plus';
import { reactive, ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();

let align = ref(isMobile() ? 'center' : 'flex-end');
const equalToPassword = (rule, value, callback) => {
  if (state.registerForm.password !== value) {
    callback(new Error('两次输入的密码不一致'));
  } else {
    callback();
  }
};
const state = reactive({
  codeUrl: '',
  registerForm: {
    username: '',
    password: '',
    confirmPassword: '',
    code: '',
    uuid: ''
  },
  showPwd: false,
  showConfirmPwd: false,
  registerRules: {
    username: [
      { required: true, trigger: 'blur', message: '请输入您的账号' },
      { min: 2, max: 20, message: '用户账号长度必须介于 2 和 20 之间', trigger: 'blur' }
    ],
    password: [
      { required: true, trigger: 'blur', message: '请输入您的密码' },
      { min: 5, max: 20, message: '用户密码长度必须介于 5 和 20 之间', trigger: 'blur' },
      { pattern: /^[^<>"'|\\]+$/, message: '不能包含非法字符：< > " \' \\\ |', trigger: 'blur' }
    ],
    confirmPassword: [
      { required: true, trigger: 'blur', message: '请再次输入您的密码' },
      { required: true, validator: equalToPassword, trigger: 'blur' }
    ],
    code: [{ required: true, trigger: 'change', message: '请输入验证码' }]
  },
  loading: false,
  captchaEnabled: true
});

const showPwd = () => {
  state.showPwd = !state.showPwd;
};

const showConfirmPwd = () => {
  state.showConfirmPwd = !state.showConfirmPwd;
};

const getCode = () => {
  getCodeImg().then(res => {
    state.codeUrl = (res as any).img;
  });
};
getCode();

const registerForm = ref();
const handleRegister = () => {
  registerForm.value.validate(valid => {
    if (valid) {
      state.loading = true;
      register({
        ...state.registerForm,
        password: encrypt(state.registerForm.password),
        confirmPassword: encrypt(state.registerForm.confirmPassword)
      })
        .then(res => {
          state.loading = false;
          ElMessage.success('注册成功， 将返回登录页进行登录！');
          router.push({ path: '/login' });
        })
        .catch(err => {
          state.loading = false;
          getCode();
        });
    }
  });
};
</script>

<style rel="stylesheet/scss" lang="scss">
.register {
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
  padding: 25px 25px 10px 25px;
  border: 1px solid #bfbfbf;
  box-shadow: 2px 1px 1px #bfbfbf;
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
.register-code {
  width: 33%;
  height: 38px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
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
</style>
