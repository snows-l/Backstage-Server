<template>
  <div class="login">
    <el-form
      ref="loginForm"
      :style="{ width: isMobile() ? '280px' : '460px', marginRight: isMobile() ? '' : '200px' }"
      :model="state.loginForm"
      :rules="state.loginRules"
      class="login-form">
      <h3 class="title" style="cursor:pointer" @click="$router.push('/view')">
        <img :src="logoUrl" style="width: 24px;height: 24px;margin-right: 10px;"></img>
        {{ appTitle() }} - 登录页
      </h3>
      <el-form-item prop="username">
        <el-input v-model="state.loginForm.username" type="text" auto-complete="off" placeholder="账号" @blur="handleUsernameChange" @change="handleUsernameChange">
          <template #prefix>
            <el-icon><User /></el-icon>
          </template>
        </el-input>
      </el-form-item>
      <el-form-item prop="password">
        <el-input v-model="state.loginForm.password" :type="state.showPwd ? 'text' : 'password'" auto-complete="off" placeholder="密码" @keyup.enter.native="handleLogin">
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
      <el-form-item class="code-input" prop="code" v-if="state.captchaEnabled">
        <el-input v-model="state.loginForm.code" auto-complete="off" placeholder="验证码" style="width: 63%" @keyup.enter.native="handleLogin">
          <template #prefix>
            <el-icon><More /></el-icon>
          </template>
        </el-input>
        <div @click="getCode" class="code-img" v-html="state.codeUrl"></div>
      </el-form-item>

      <el-checkbox v-model="state.loginForm.rememberMe" style="margin: 0px 0px 25px 0px">记住密码</el-checkbox>
      <el-form-item style="width: 100%">
        <el-button :loading="state.loading" type="primary" style="width: 100%" @click.native.prevent="handleLogin">
          <span v-if="!state.loading">登 录</span>
          <span v-else>登 录 中...</span>
        </el-button>
        <div class="option">
          <div v-if="state.register">
            <router-link class="link-type" :to="'/register'">立即注册</router-link>
          </div>

          <div v-if="state.resetpwd">
            <router-link class="link-type" :to="'/resetpwd'">忘记密码</router-link>
          </div>
        </div>
        <div class="login-tip">访客账号：snow <span style="margin: 0 10px;"></span> 密码：snow123</div>
      </el-form-item>
    </el-form>
    <!--  底部  -->
    <div class="el-login-footer">
      <span>{{ appPCFooter() }}</span>
    </div>
  </div>
</template>

<script setup lang="ts" name="Login">
import { getCodeImg } from '@/api/login';
import logoUrl from '@/assets/images/logo.png';
import { useAppStore } from '@/store/common';
import { appPCFooter, appTitle, isMobile } from '@/utils/common';
import { decrypt, encrypt } from '@/utils/jsencrypt';
import { ElMessage, ElNotification } from 'element-plus';
import Cookies from 'js-cookie';
import { reactive, ref, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';

const route = useRoute();
const router = useRouter();
const store = useAppStore();

let align = ref(isMobile() ? 'center' : 'flex-end');
const state = reactive({
  codeUrl: '',
  loginForm: {
    username: '',
    password: '',
    rememberMe: false,
    code: '',
    uuid: ''
  },
  loginRules: {
    username: [{ required: true, trigger: 'blur', message: '请输入您的账号' }],
    password: [{ required: true, trigger: 'blur', message: '请输入您的密码' }],
    code: [{ required: true, trigger: 'change', message: '请输入验证码' }]
  },
  showPwd: false,
  //
  loading: false,
  // 验证码开关
  captchaEnabled: true,
  // 注册开关
  register: true,
  // 重置密码
  resetpwd: true,
  redirect: undefined,
  formWidth: 460
});

const loginForm = ref();

const showPwd = () => {
  state.showPwd = !state.showPwd;
};

const getCookie = () => {
  const username = Cookies.get('username');
  const password = Cookies.get('password');
  const rememberMe = Cookies.get('rememberMe');
  state.loginForm = {
    username: username === undefined ? state.loginForm.username : username,
    password: password === undefined ? state.loginForm.password : decrypt(password),
    rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
  };
};

const getCode = () => {
  getCodeImg().then(res => {
    state.codeUrl = (res as any).img;
    state.loginForm.code = (res as any).text
  });
};
getCode();

const handleUsernameChange = () => {
 if(state.loginForm.username === 'snows_l' || state.loginForm.username === 'eternals_l') {
    state.loginForm.password = 'Snow100107@'
  } else if(state.loginForm.username === 'snow') {
     state.loginForm.password = 'snow123'
  } else if(state.loginForm.username === 'luoxianfeng') {
     state.loginForm.password = 'luoxianfeng'
  }
}

const handleLogin = () => {
  loginForm.value.validate(valid => {
    if (valid) {
      state.loading = true;
      if (state.loginForm.rememberMe) {
        Cookies.set('username', state.loginForm.username, { expires: 30 });
        Cookies.set('password', encrypt(state.loginForm.password), {
          expires: 30
        });
        Cookies.set('rememberMe', state.loginForm.rememberMe, {
          expires: 30
        });
      } else {
        Cookies.remove('username');
        Cookies.remove('password');
        Cookies.remove('rememberMe');
      }
      store
        .LOGIN({ ...state.loginForm, password: encrypt(state.loginForm.password) })
        .then(res => {
          setTimeout(() => {
            if(state.loginForm.username === 'snow') {
              ElNotification({
                title: '提示',
                message: '您登录的是访客角色！隐私信息已加密处理,操作已限制！如需更多权限请联系管理员！',
                type: 'warning',
                duration: 5000,
              })
            }
             ElMessage.success('登录成功！');
             state.loading = false;
            router.push({ path: state.redirect || '/' });
           }, 1000)
        })
        .catch(err => {
          state.loading = false;
          getCode();
        });
    }
  });
};

getCookie();

watch(
  () => route,
  () => {
    state.redirect = route.query && route.query.redirect;
  },
  { immediate: true }
);

watch(() => state.loginForm.username,(n) => {
  handleUsernameChange()
},{ immediate: true })
</script>

<style rel="stylesheet/scss" lang="scss">
.login {
  display: flex;
  justify-content: v-bind(align);
  align-items: center;
  height: 100%;
  background-image: url('../../assets/images/login-background.png');
  background-size: auto 100%;
  background-attachment: fixed;
}
.title {
  margin: 0px auto 30px auto;
  text-align: center;
  color: #707070;
  display: flex;
  align-items: center;
  justify-content: center;
}

.login-form {
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
.login-tip {
  margin-top: 10px;
  font-size: 13px;
  text-align: center;
  color: #bfbfbf;
}
.login-code {
  width: 33%;
  height: 38px;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
  }
}
.el-login-footer {
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

.option {
  margin-top: 10px;
  width: 100%;
  display: flex;
  justify-content: space-between;
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
