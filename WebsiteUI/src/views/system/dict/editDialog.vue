<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" :size="isMobile ? '90vw' : '40vw'" :visible.sync="open" v-model="open" width="40%" :before-close="handleClose">
      <el-form :model="state.itemRecord" ref="formRef" :rules="rules" label-width="100px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="父级字典：" prop="pid">
              <el-select style="width: 80%" v-model="state.itemRecord.pid" placeholder="请选择父级字典" clearable>
                <el-option v-for="item in state.dictParentList" :key="item.id" :label="item.label" :value="item.id"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="字典名称：" prop="label">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.label"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20" v-if="state.itemRecord.pid == 0">
          <el-col>
            <el-form-item label="字典标识：" prop="dictType">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.dictType"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20" v-if="state.itemRecord.pid != 0">
          <el-col>
            <el-form-item label="字典值：" prop="value">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.value"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="排序：" prop="sort">
              <el-input style="width: 80%" v-model="state.itemRecord.sort"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="备注：">
              <el-input style="width: 80%" clearable type="textarea" :min="2" v-model="state.itemRecord.remark"></el-input>
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
import { addDict, getDict, updateDict } from '@/api/system/dict';
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
    pid: 0,
    id: '',
    dictType: '',
    label: '',
    value: '',
    sort: 0,
    remark: ''
  },
  dictList: [],
  dictParentList: []
});

const rules = {
  pid: [{ required: true, message: '请输入父级字典', trigger: 'blur' }],
  dictType: [{ required: true, message: '请输入字典标识', trigger: 'blur' }],
  label: [{ required: true, message: '请输入字典名称', trigger: 'blur' }],
  value: [{ required: true, message: '请输入字典值', trigger: 'blur' }]
};

// 关闭弹窗
const handleClose = () => {
  state.itemRecord = {
    pid: 0,
    id: '',
    dictType: '',
    label: '',
    value: '',
    sort: 0,
    remark: ''
  };
  open.value = false;
};

// 新增
const add = () => {
  addDict(state.itemRecord).then(res => {
    ElMessage.success('新增成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 修改
const edit = () => {
  updateDict(state.itemRecord).then(res => {
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

// 获取父级字典列表
const getDictParentList = () => {
  getDict().then(res => {
    state.dictParentList = [{ label: '顶级字典', id: 0 }, ...res.data];
  });
};

// 打开弹窗
const showDialog = (type: string, row) => {
  if (type == 'add') {
    if (row) {
      state.itemRecord = {
        pid: row.id,
        dictType: row.dictType,
        sort: 0
      };
    }
  } else {
    state.itemRecord = row;
  }
  state.title = type == 'add' ? '新增' : '修改';
  state.type = type;
  getDictParentList();
  open.value = true;
};

defineExpose({
  open,
  showDialog
});
</script>

<style lang="scss" scoped>
.dict-dialog-container-warp {
  // width: 100%;
  // height: 100%;
  .el-form {
    // padding: 20px 0;
  }
  .el-form-item {
    width: 100%;
  }
}
</style>
