<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-04-15 11:47:47
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-03 19:57:23
 * @FilePath: /webseteUI/WebsiteUI/src/views/baseView/userInfo/index.vue
-->
<template>
  <div class="app-container" style="width: 100%; overflow: hidden">
    <el-row :gutter="20">
      <el-col style="margin-bottom: 10px" :span="12" :xs="24">
        <el-card class="box-card">
          <template #header>
            <div class="clearfix">
              <span>个人信息</span>
            </div>
          </template>
          <div>
            <div class="text-center">
              <!-- <el-avatar :size="80" icon="el-icon-user-solid" shape="circle" :src="state.avaterUrl" fit="fill"></el-avatar> -->
              <UserAvatar :avatar="state.user.avatar" />
            </div>
            <ul class="list-group list-group-striped">
              <li class="list-group-item">
                <div class="lable">用户名</div>
                <div class="pull-right">{{ state.user.user_name || '/' }}</div>
              </li>
              <li class="list-group-item">
                <div class="lable">用户昵称</div>
                <div class="pull-right">{{ state.user.nick_name || '/' }}</div>
              </li>
              <li class="list-group-item">
                <div class="lable">手机号码</div>
                <div class="pull-right">{{ state.user.phonenumber || '/' }}</div>
              </li>
              <li class="list-group-item">
                <div class="lable">用户邮箱</div>
                <div class="pull-right">{{ state.user.email || '/' }}</div>
              </li>
              <li class="list-group-item">
                <div class="lable">所属角色</div>
                <div class="pull-right">{{ state.user.role_str || state.user.role_key || '/' }}</div>
              </li>
              <li class="list-group-item">
                <div class="lable">创建日期</div>
                <div class="pull-right">{{ state.user.create_time || '/' }}</div>
              </li>
            </ul>
          </div>
        </el-card>
      </el-col>
      <el-col style="margin-bottom: 10px" :span="12" :xs="24">
        <el-card>
          <template #header>
            <div class="clearfix">
              <span>基本资料</span>
            </div>
          </template>

          <el-tabs v-model="state.activeTab">
            <el-tab-pane label="基本资料" name="userinfo">
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
            </el-tab-pane>
            <el-tab-pane label="修改密码" name="resetPwd">
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
                <el-form-item>
                  <el-button type="primary" @click="submit">保存</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { editPwd, editUser, getUserInfo } from '@/api/system/user';
import router from '@/router';
import { useAppStore } from '@/store/common';
import { encrypt } from '@/utils/jsencrypt';
import { ElMessage, ElMessageBox } from 'element-plus';
import moment from 'moment';
import { reactive, ref } from 'vue';
import avaterUrl from '../../../assets/images/bule.png';
import UserAvatar from './userAvatar.vue';
const state = reactive({
  avaterUrl: avaterUrl,
  user: {},
  editUser: {},
  activeTab: 'userinfo'
});

const baseFormRef = ref(null);
const resetPwdFormRef = ref(null);
const store = useAppStore();

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

const getUserInfoFn = () => {
  getUserInfo().then(res => {
    state.editUser = Object.assign({}, res.data);
    res.data.create_time = res.data.create_time && moment(res.data.create_time).format('YYYY-MM-DD HH:mm:ss');
    state.user = res.data;
    let server = import.meta.env.MODE == 'development' ? import.meta.env.VITE_DEV_BASE_SERVER : import.meta.env.VITE_PROD_BASE_SERVER;
    state.user.avatar = state.user.avatar && server + state.user.avatar;
  });
};
getUserInfoFn();

const handleSubmitUserInfo = () => {
  baseFormRef.value.validate(valid => {
    if (valid) {
      editUser(state.editUser).then(res => {
        if (res.code === 200) {
          getUserInfoFn();
          ElMessage.success('修改成功');
        }
      });
    }
  });
};

// 修改密码
const submit = () => {
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
          ElMessageBox.confirm('密码修改成功，是否重新登录？').then(() => {
            store.Logout().then(res => {
              router.push({ path: '/login', query: { redirect: '/user-info' } });
            });
          });
        }
      });
    }
  });
};
</script>
<style scoped>
.list-group-striped li {
  width: 100%;
  height: 40px;
  line-height: 40px;
  border-bottom: 1px solid #f0f0f0;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.list-group-striped li:first-child {
  border-top: 1px solid #f0f0f0;
}

.text-center {
  width: 100%;
  /* height: 160px; */
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px 0 30px 0;
}

.app-container {
  padding: 20px;
}
</style>

<style lang="scss">
.el-icon {
  svg {
    width: 14px;
    height: 14px;
  }
}
</style>
