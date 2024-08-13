<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 16:51:49
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-11 12:16:55
 * @FilePath: /Website/WebsiteUI/src/viewsMobile/userInfo/index.vue
-->
<template>
  <div class="user-info-warp">
    <div class="user-base-info">
      <el-avatar
        :size="80"
        class="avatar"
        icon="el-icon-user-solid"
        shape="circle"
        :src="state.avaterUrl || (state.sex == 2 ? girlAvatarDefault : manAvatarDefault)"
        fit="fill"></el-avatar>
      <div class="right-info">
        <div class="info-item">
          <div class="label">用户名:</div>
          <div class="value">{{ state.user.user_name || state.user.user_id || '/' }}</div>
        </div>
        <div class="info-item">
          <div class="label">用户昵称:</div>
          <div class="value">{{ state.user.nick_name || '/' }}</div>
        </div>
        <div class="info-item">
          <div class="label">角色:</div>
          <div class="value">{{ state.user.role_str || state.user.role_key || '/' }}</div>
        </div>
        <div class="info-item">
          <div class="label">手机号码:</div>
          <div class="value">{{ state.user.phonenumber || '/' }}</div>
        </div>
      </div>
    </div>

    <div class="other-info">
      <div class="info-item" @click="handleRetPwd">
        <div class="label">修改密码</div>
        <div class="value"><i class="iconfont icon-gengduo1"></i></div>
      </div>
      <div class="info-item" @click="handleEidtUserInfo">
        <div class="label">修改资料</div>
        <div class="value"><i class="iconfont icon-gengduo1"></i></div>
      </div>
      <div class="info-item" @click="handleClick">
        <div class="label">更多功能</div>
        <div class="value"><i class="iconfont icon-gengduo1"></i></div>
      </div>
      <div class="info-item" @click="handleClick">
        <div class="label">敬请期待</div>
        <div class="value"><i class="iconfont icon-gengduo1"></i></div>
      </div>
    </div>
    <div class="logout">
      <el-button type="primary" size="default" @click="handleLogout">退出登录</el-button>
    </div>
    <RestPwd ref="restPwdRef" />
    <UserInfo ref="userInfoRef" />
  </div>
</template>

<script lang="ts" setup>
import girlAvatarDefault from '@/assets/images/girl.png';
import manAvatarDefault from '@/assets/images/man.png';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { ElMessage, ElMessageBox } from 'element-plus';
import { reactive, ref, watch } from 'vue';
import { useRouter } from 'vue-router';
import RestPwd from './restPwd.vue';
import UserInfo from './userInfo.vue';

const store = useAppStore();
const router = useRouter();
const restPwdRef = ref();
const userInfoRef = ref();

const state = reactive({
  avaterUrl: store.user.avatar ? store.avatar : '',
  sex: store.user.sex,
  titleColor: usePGCStore().themeColor,
  user: {}
});
state.user = JSON.parse(localStorage.getItem('__LOCAL__USER_INFO') || '{"user":{}}').user;

// 退出登录
const handleLogout = () => {
  ElMessageBox.confirm('确认退出登录吗?', '提示', {
    confirmButtonText: '确 认',
    cancelButtonText: '取 消',
    type: 'warning'
  })
    .then(() => {
      store.Logout().then(res => {
        ElMessage.success('退出登录成功！');
        router.push('/login');
      });
    })
    .catch(() => {
      ElMessage({
        type: 'info',
        message: '已取消'
      });
    });
};

// 修改密码
const handleRetPwd = () => {
  restPwdRef.value.init(state.user);
};

// 修改资料
const handleEidtUserInfo = () => {
  userInfoRef.value.init(state.user);
};

// 其他功能
const handleClick = () => {
  ElMessage({
    type: 'info',
    message: '敬请期待'
  });
};

watch(
  () => store.avatar,
  n => {
    state.avaterUrl = n;
  }
);
</script>

<style lang="scss" scoped>
.user-info-warp {
  height: 100%;
  padding: 15px;
  background-color: var(--contentBgc);
  .user-base-info {
    padding: 20px 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 2px 2px 2px #ccc;
    display: flex;
    align-items: center;
    .right-info {
      flex: 1;
      margin-left: 30px;
      .info-item {
        display: flex;
        padding: 8px 10px;
        justify-content: space-between;
        border-bottom: 1px solid #eee;
        .label {
          color: #606666;
        }
      }
      .info-item:first-child {
        border-top: 1px solid #eee;
      }
    }
  }
  .label,
  .value {
    color: #606666;
  }
  .other-info {
    margin-top: 10px;
    padding: 20px 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 2px 2px 2px #ccc;
    .info-item {
      padding: 15px;
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #eee;
      cursor: pointer;
    }
    .info-item:first-child {
      border-top: 1px solid #eee;
    }
  }
  .logout {
    margin-top: 20px;
    width: 100%;
    .el-button {
      width: 100%;
      border-radius: 20px;
    }
  }
}
</style>
