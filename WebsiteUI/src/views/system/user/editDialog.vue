<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" v-model="open" :size="isMobile ? '90vw' : '40vw'" :before-close="handleClose">
      <el-form :model="state.itemRecord" ref="formRef" :rules="rules" label-width="100px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="用户名：" prop="user_name" style="width: 100%">
              <el-input style="width: 80%" clearable :disabled="state.type === 'edit'" v-model="state.itemRecord.user_name"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item prop="password" label="密码：" v-if="state.type === 'add'" style="width: 100%">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.password" :type="state.showPwd ? 'text' : 'password'" auto-complete="off" placeholder="密码">
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
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="角色：" prop="role" style="width: 100%">
              <el-select v-model="state.itemRecord.role" clearable placeholder="请选择角色" style="width: 80%">
                <el-option v-for="item in state.roleList" :key="item.role_id" :label="item.role_name" :value="item.role_id"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="昵称：" prop="nick_name" style="width: 100%">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.nick_name"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="性别：" prop="sex" style="width: 100%">
              <el-select clearable v-model="state.itemRecord.sex" placeholder="请选择角色" style="width: 80%">
                <el-option v-for="item in state.sexList" :key="item.value" :label="item.label" :value="item.value"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="手机号码：" prop="phonenumber" style="width: 100%">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.phonenumber"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="邮箱：" prop="email" style="width: 100%">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.email"></el-input>
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
import { addUser, editUser } from '@/api/system/user';
import { encrypt } from '@/utils/jsencrypt';
import { ElMessage, ElMessageBox } from 'element-plus';
import { reactive, ref } from 'vue';

const props = defineProps({
  isMobile: Boolean,
  refreshCallBack: Function
});

let formRef = ref(null);
let open = ref(false);
const state = reactive({
  title: '新增',
  type: 'add',
  itemRecord: {
    user_name: '',
    nick_name: '',
    role: 2,
    sex: '1',
    phonenumber: '',
    email: ''
  },
  showPwd: false,
  roleList: [],
  dictList: [],
  sexList: []
});

const rules = {
  user_name: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  role: [{ required: true, message: '请选择用户角色', trigger: 'change' }]
};

const showPwd = () => {
  state.showPwd = !state.showPwd;
};

// 关闭弹窗
const handleClose = () => {
  state.itemRecord = {
    password: '',
    user_name: '',
    nick_name: '',
    role: 2,
    sex: '1',
    phonenumber: '',
    email: ''
  };
  open.value = false;
};

// 新增
const add = () => {
  let params = {
    ...state.itemRecord,
    role_str: state.roleList.find(item => item.role_id === state.itemRecord.role).role_name,
    role_key: state.roleList.find(item => item.role_id === state.itemRecord.role).role_key,
    password: encrypt(state.itemRecord.password)
  };
  addUser(params).then(res => {
    ElMessage.success('新增成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 修改
const edit = () => {
  let params = {
    ...state.itemRecord,
    role_str: state.roleList.find(item => item.role_id === state.itemRecord.role).role_name,
    role_key: state.roleList.find(item => item.role_id === state.itemRecord.role).role_key
  };
  editUser(params).then(res => {
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
const showDialog = (type: string, row, roleList, sexList) => {
  state.title = type == 'add' ? '新增用户' : '修改用户';
  state.type = type;
  state.roleList = roleList;
  state.sexList = sexList;

  if (type == 'add') {
    if (row) {
      state.itemRecord = {
        user_name: '',
        nick_name: '',
        role: 2,
        sex: 1,
        phonenumber: '',
        email: ''
      };
    }
  } else {
    state.itemRecord = Object.assign({}, row);
  }
  open.value = true;
};

defineExpose({
  open,
  showDialog
});
</script>

<style lang="scss" scoped></style>
