<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" v-model="open" :size="isMobile ? '90vw' : '40vw'" :before-close="handleClose">
      <el-form :model="state.itemRecord" ref="formRef" :rules="rules" label-width="100px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="角色名称：" prop="role_name">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.role_name"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="角色key：" prop="role_key">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.role_key"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20" v-if="state.type !== 'add'">
          <el-col>
            <el-form-item label="是否启用：" prop="status">
              <el-switch v-model="state.itemRecord.status" :active-value="0" :inactive-value="1"></el-switch>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="排序：" prop="role_sort">
              <el-input-number style="width: 80%" v-model="state.itemRecord.role_sort"></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="备注：" prop="remark">
              <el-input type="textarea" clearable rows="4" style="width: 80%" v-model="state.itemRecord.remark"></el-input>
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
import { addRole, editRole } from '@/api/system/role';
import { ElMessage, ElMessageBox } from 'element-plus';
import { reactive, ref } from 'vue';

const props = defineProps({
  isMobile: Boolean,
  refreshCallBack: Function
});

let formRef = ref(null);
let open = ref(false);
const state = reactive({
  title: '新增角色',
  type: 'add',
  itemRecord: {
    role_name: '',
    role_key: '',
    status: 0, // 0 禁用 1 启用
    role_sort: 0,
    remark: ''
  },
  showPwd: false,
  roleList: [],
  dictList: [],
  sexList: []
});

const rules = {
  role_name: [{ required: true, message: '请输入角色名', trigger: 'blur' }],
  role_key: [{ required: true, message: '请输入角色key', trigger: 'blur' }]
};

// 关闭弹窗
const handleClose = () => {
  state.itemRecord = {
    role_name: '',
    role_key: '',
    status: 0, // 0 禁用 1 启用
    role_sort: 0,
    remark: ''
  };
  open.value = false;
};

// 新增
const add = () => {
  addRole({ ...state.itemRecord }).then(res => {
    ElMessage.success('新增成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 修改
const edit = () => {
  editRole(state.itemRecord).then(res => {
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
const init = (type: string, row) => {
  state.title = type == 'add' ? '新增角色' : '修改角色';
  state.type = type;

  if (type == 'add') {
    if (row) {
      state.itemRecord = {
        role_name: '',
        role_key: '',
        status: 0, // 0 禁用 1 启用
        role_sort: 0,
        remark: ''
      };
    }
  } else {
    state.itemRecord = Object.assign({}, row);
    state.itemRecord.status = state.itemRecord.status * 1;
  }
  open.value = true;
};

defineExpose({
  open,
  init
});
</script>

<style lang="scss" scoped>
.dict-dialog-container-warp {
  // width: 100%;
  // height: 100%;
  .el-form {
    // padding: 20px;
  }
  .el-form-item {
    width: 100%;
  }
}
</style>
