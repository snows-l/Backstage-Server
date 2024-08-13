<template>
  <div class="dict-warp">
    <XDialog :title="state.title" v-model="open" :before-close="handleClose" :size="isMobile ? '90vw' : '50vw'" :style="{ width: isMobile ? '90vw' : '40vw' }">
      <el-form :model="state.itemRecord" ref="formRef" :rules="rules" label-width="80px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="姓名：" prop="favors_name">
              <el-input style="width: 90%" clearable v-model="state.itemRecord.favors_name"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="金额：" prop="favors_money">
              <el-input style="width: 90%" clearable v-model="state.itemRecord.favors_money"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="回礼：">
              <el-input style="width: 90%" placeholder="提示：多个以中文、（顿号）分隔" clearable v-model="state.itemRecord.favors_backMoney"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="时间点：" prop="favors_timer">
              <el-select style="width: 90%" v-model="state.itemRecord.favors_timer" placeholder="请选择来往时间点" clearable>
                <el-option v-for="item in state.timerLists" :key="item.value" :label="item.label" :value="item.value"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="备注：">
              <el-input style="width: 90%" clearable type="textarea" :min="2" v-model="state.itemRecord.remark"></el-input>
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
import { addFavors, editFavors } from '@/api/favors';
import { ElMessage, ElMessageBox } from 'element-plus';
import { reactive, ref } from 'vue';

const emits = defineEmits(['rereshCallback']);
const props = defineProps({
  isMobile: {
    type: Boolean,
    default: false
  }
});

let formRef = ref(null);
let open = ref(false);
const state = reactive({
  title: '新增人情来往',
  itemRecord: {
    favors_id: '',
    favors_name: '',
    favors_money: '',
    favors_backMoney: '',
    favors_timer: '',
    remark: ''
  },
  type: 'add',
  timerLists: []
});
let rules = {
  favors_name: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
  favors_money: [{ required: true, message: '请输入金额', trigger: 'blur' }],
  favors_timer: [{ required: true, message: '请选择时间点', trigger: 'blur' }]
};

const handleClose = () => {
  open.value = false;
  state.itemRecord = {
    favors_id: '',
    favors_name: '',
    favors_money: '',
    favors_backMoney: '',
    favors_timer: '',
    remark: ''
  };
};

// 初始化
const init = (type: string, row: any, timerList: any) => {
  state.timerLists = timerList;
  if (row) {
    state.itemRecord = Object.assign({}, { ...row, favors_backMoney: row.favors_backMoney || '', remark: row.remark || '' });
  }
  state.type = type;
  if (type === 'add') {
    state.title = '新增人情来往';
  } else {
    state.title = '编辑人情来往';
  }
  open.value = true;
};

// 提交
const handleSubmit = () => {
  (formRef.value as any).validate(valid => {
    if (valid) {
      if (state.type === 'edit') {
        ElMessageBox.confirm('确认修改吗？', '提示').then(() => {
          editFavors(state.itemRecord)
            .then(() => {
              ElMessage.success('修改成功');
              emits('rereshCallback');
              handleClose();
            })
            .catch(() => {
              // ElMessage.error('修改失败');
            });
        });
      } else {
        addFavors(state.itemRecord)
          .then(() => {
            ElMessage.success('添加成功');
            emits('rereshCallback'); //刷新页面
            handleClose();
          })
          .catch(() => {
            // ElMessage.error('添加失败');
          });
      }
    }
  });
  open.value = false;
};

defineExpose({
  open,
  init
});
</script>

<style lang="scss" scoped>
.dict-warp {
  width: 100%;
  .el-form {
    // padding: 20px;
  }
  .el-form-item {
    width: 100%;
  }
}
</style>
