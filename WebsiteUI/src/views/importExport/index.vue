<template>
  <div class="import-export-container-warp">
    <div class="select-warp">
      <el-form
        :model="state.form"
        ref="form"
        :label-width="state.isMobile ? '0px' : '80px'"
        :inline="true"
        style="display: flex; align-items: center"
        :style="{ justifyContent: state.isMobile ? 'space-around' : 'flex-start' }">
        <el-form-item :label="state.isMobile ? '' : '技能名称:'" :style="{ width: state.isMobile ? '46%' : '' }">
          <el-input style="width: 140px" v-model="state.queryForm.name" clearable placeholder="请输入技能名称" @blur="handleSelect"></el-input>
        </el-form-item>

        <el-form-item :label="state.isMobile ? '' : '技能等级:'" :style="{ width: state.isMobile ? '50%' : '' }">
          <el-select style="width: 160px" v-model="state.queryForm.level" placeholder="请选择技能等级" clearable @change="handleSelect">
            <el-option v-for="item in state.levelList" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item style="margin-left: 10px" v-if="!state.isMobile">
          <el-button @click="handleReset">重置</el-button>
          <el-button type="primary" @click="handleSelect">查询</el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="table-warp">
      <div class="operation-warp">
        <div class="left">
          <el-button type="primary" @click="handleImport">导 入</el-button>
        </div>
        <div class="right">
          <el-button type="primary" v-loading="state.exportLoading" plain @click="handleExport(false)">导 出</el-button>
          <el-button type="primary" v-loading="state.exportLoading" plain @click="handleExport(true)">下载模版</el-button>
        </div>
      </div>
      <div class="table-content-container">
        <el-table :data="state.tableSource" v-loading="state.tableLoading" stripe :size="state.isMobile ? 'small' : 'default'" style="height: 100%; width: 100%">
          <el-table-column v-for="col in state.columns" :prop="col.id" :key="col.id" :label="col.label" :width="col.width" align="center">
            <template #default="{ row }">
              <template v-if="col.id == 'level'">
                <span>{{ state.levelList.find(item => item.value === row.level).label }}</span>
              </template>
            </template>
          </el-table-column>

          <template #empty>
            <empty></empty>
          </template>
        </el-table>
      </div>
      <div class="footer-pagination">
        <el-pagination
          :size="state.isMobile ? 'small' : 'default'"
          :background="state.isMobile ? false : true"
          :pager-count="state.isMobile ? 5 : 9"
          v-model:current-page="state.page.page"
          v-model:page-size="state.page.size"
          :page-sizes="[20, 50, 100, 200]"
          :layout="state.isMobile ? 'total, prev, pager, next' : 'total, sizes, prev, pager, next, jumper'"
          :total="state.page.total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange" />
      </div>
    </div>

    <XDialog ref="dialog" v-model="state.dialogVisible" title="导入" :size="state.isMobile ? '90vw' : '40%'">
      <el-form style="padding: 10px 20px 10px 20px" :model="state.form" ref="formRef" :rules="rules" label-width="200px" :inline="false" label-position="top">
        <el-form-item class="custom-item-skill-upoad" label="技能表文件" prop="file" style="width: 100%">
          <el-upload style="width: 100%" :limit="1" :auto-upload="false" class="avatar-uploader" :show-file-list="true" accept=".xlsx" :on-change="handleFileChange">
            <template #trigger>
              <el-button size="small" type="primary">点击上传</el-button>
            </template>
            <template #tip>
              <div class="el-upload__tip text-red">只能上传.xlsx文件</div>
            </template>
          </el-upload>
        </el-form-item>
        <el-form-item class="custom-item-skill-append" label="追加/覆盖" prop="append" style="width: 100%; display: flex; justify-content: space-between; align-items: center">
          <!-- <el-switch v-model="state.form.append" :active-value="true" :inactive-value="false"></el-switch> -->
          <el-radio-group v-model="state.form.append">
            <el-radio :value="1">追加</el-radio>
            <el-radio :value="2">覆盖</el-radio>
          </el-radio-group>
        </el-form-item>

        <div class="tip" v-if="state.form.append === 2" style="margin-top: 20px; color: red">请注意，您选择了覆盖导入，将会清空原有技能表数据，请谨慎操作！</div>
      </el-form>
      <template #footer>
        <el-button @click="handleClose">关 闭</el-button>
        <el-button type="primary" @click="handleSubmitImport">确认导入</el-button>
      </template>
    </XDialog>
  </div>
</template>

<script lang="ts" setup>
import { exportSkill, getSkillList, importSkill } from '@/api/importAndExport';
import { isMobile } from '@/utils/common';
import { ElMessage } from 'element-plus';
import moment from 'moment';
import { onBeforeUnmount, reactive, ref } from 'vue';

const formRef = ref(null);

const state = reactive({
  isMobile: isMobile(1000),
  page: {
    page: 1,
    size: 20,
    total: 0
  },
  queryForm: {
    name: '',
    level: ''
  },
  levelList: [
    { value: 1, label: '一级' },
    { value: 2, label: '二级' },
    { value: 3, label: '三级' },
    { value: 4, label: '四级' },
    { value: 5, label: '五级' }
  ],
  form: {
    file: null,
    append: 1
  },

  dialogVisible: false,
  tableSource: [],
  selectedRows: [],
  columns: [
    { id: 'id', label: 'ID', width: '60px' },
    { id: 'name', label: '技能名称', minWidth: '120px' },
    { id: 'level', label: '技能等级', minWidth: '120px' },
    { id: 'description', label: '技能描述', minWidth: '120px' },
    { id: 'type', label: '技能类型', minWidth: '120px' },
    { id: 'effect', label: '技能效果', minWidth: '120px' },
    { id: 'cost', label: '技能消耗', minWidth: '120px' },
    { id: 'duration', label: '技能持续时间', minWidth: '120px' },
    { id: 'ranges', label: '技能范围', minWidth: '120px' },
    { id: 'target', label: '技能目标', minWidth: '120px' }
  ],
  tableLoading: false,
  exportLoading: false
});

let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');
const rules = {
  file: [{ required: true, message: '请选择文件', trigger: 'change' }],
  append: [{ required: true, message: '请选择是否追加', trigger: 'change' }]
};

const getSkillListFn = () => {
  state.tableLoading = true;
  getSkillList({ ...state.queryForm, page: state.page.page, size: state.page.size })
    .then(res => {
      if (res.code === 200) {
        state.tableSource = res.data;
        state.page.total = res.total;
      } else {
        ElMessage.error('获取技能列表失败！' + res.message);
      }
    })
    .finally(() => {
      state.tableLoading = false;
    });
};
getSkillListFn();

// 改变分页
const handleSizeChange = (size: number) => {
  state.page.page = 1;
  state.page.size = size;
  getSkillListFn();
};

// 改变当前页
const handleCurrentChange = (page: number) => {
  state.page.page = page;
  getSkillListFn();
};

// 重置查询条件
const handleReset = () => {
  state.page.page = 1;
  state.queryForm.name = '';
  state.queryForm.level = '';
  getSkillListFn();
};

// 查询
const handleSelect = () => {
  state.page.page = 1;
  getSkillListFn();
};

// 上传文件之前的校验
// const beforeUpload = (file: File) => {
//   const isExcel = file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' || file.name.endsWith('.xlsx');
//   if (!isExcel) {
//     ElMessage.error('请上传.xlsx文件！');
//     return false;
//   }
//   return true;
// };

// 选择文件
const handleFileChange = file => {
  if (file) {
    state.form.file = file;
    formRef.value.validateField('file');
  }
};

// 点击导入按钮
const handleImport = () => {
  state.dialogVisible = true;
};

const handleSubmitImport = () => {
  (formRef.value as any).validate((valid: boolean) => {
    if (valid) {
      importSkill(state.form.file.raw, state.form.append).then(res => {
        if (res.code === 200) {
          ElMessage.success('导入成功！');
          state.dialogVisible = false;
          getSkillListFn();
        } else {
          ElMessage.error('导入失败！' + res.message);
        }
      });
    }
  });
};

const handleClose = () => {
  state.dialogVisible = false;
  getSkillListFn();
};

// 导出技能表
const handleExport = (template: boolean = false) => {
  state.exportLoading = true;
  exportSkill({ template })
    .then(res => {
      const link = document.createElement('a');
      const blob = new Blob([res], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
      link.style.display = 'none';
      link.href = URL.createObjectURL(blob);
      link.download = template ? '技能表模板_' : '技能表_' + moment().format('YYYYMMDDHHmmss') + '.xlsx';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      ElMessage.success(template ? '技能表模板下载成功！' : '技能表导出成功！');
    })
    .finally(() => {
      state.exportLoading = false;
    });
};

const resizeCallback = () => {
  state.isMobile = isMobile(1000);
};
window.addEventListener('resize', resizeCallback);

onBeforeUnmount(() => {
  window.removeEventListener('resize', resizeCallback);
});
</script>

<style lang="scss" scoped>
.import-export-container-warp {
  width: 100%;
  height: 100%;
  background-color: var(--containerBgc);
  .select-warp {
    padding: 10px 10px;
    background-color: var(--contentBgc);
    .el-form-item {
      margin: 10px 0;
      margin-right: 20px;
    }
  }
  .table-warp {
    height: v-bind(tableHeight);
    margin-top: 10px;
    padding: 20px 20px;
    background-color: var(--contentBgc);
    overflow: hidden;
    .table-content-container {
      height: calc(100% - 105px);
      overflow-y: auto;
    }
  }
}
.operation-warp {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}
.table-content-container-warp {
  margin-top: 20px;
}
.custom-item-skill-upoad {
  :deep(.el-form-item__content) {
    padding-left: 30px;
  }
}
.custom-item-skill-append {
  :deep(.el-form-item__content) {
    display: flex;
    justify-content: flex-end;
    align-items: center;
  }
  :deep(.el-form-item__label) {
    margin-bottom: 0px;
  }
}

.footer-pagination {
  border-top: 1px solid #ccc;
  padding: 20px 20px 0 20px;
  display: flex;
  justify-content: flex-end;
}
</style>
