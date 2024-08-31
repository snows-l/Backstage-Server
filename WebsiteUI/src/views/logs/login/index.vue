<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-31 18:10:41
 * @FilePath: /webseteUI/WebsiteUI/src/views/logs/login/index.vue
-->
<template>
  <div class="container-warp">
    <div class="select-warp">
      <el-form
        :model="state.form"
        ref="form"
        :rules="state.rules"
        :inline="true"
        :label-width="state.isMobile ? '0px' : '90px'"
        style="display: flex; align-items: center"
        :style="{ justifyContent: state.isMobile ? 'space-around' : 'flex-start' }">
        <el-form-item :style="{ width: state.isMobile ? '46%' : '' }" :label="state.isMobile ? '' : '登录账号:'">
          <el-input style="width: 160px" v-model="state.form.username" placeholder="请输入登录账号" clearable @blur="handleSelect"></el-input>
        </el-form-item>

        <el-form-item :style="{ width: state.isMobile ? '50%' : '' }" :label="state.isMobile ? '' : '登录地点:'">
          <el-input style="width: 160px" v-model="state.form.city" placeholder="请输入登录地点" clearable @blur="handleSelect"></el-input>
        </el-form-item>

        <el-form-item v-if="!state.isMobile" :style="{ margin: state.isMobile ? '0 10px 0 0' : '10px 0 10px 20px' }">
          <el-button @click="handleReset">重置</el-button>
          <el-button type="primary" @click="handleSelect">查询</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-warp">
      <div class="operation-warp" style="margin-bottom: 15px">
        <el-button type="primary" v-loading="state.exportLoading" @click="handleExport">导 出</el-button>
      </div>
      <div class="table-content">
        <el-table stripe :data="state.tableSource" style="width: 100%; height: 100%" v-loading="state.loading" :size="state.isMobile ? 'small' : ''">
          <el-table-column
            v-for="col in columns"
            :prop="col.prop"
            :key="col.id"
            :label="col.label"
            :minWidth="col.minWidth"
            :align="col.align || 'center'"
            :fixed="col.fixed || null">
            <template #default="{ row }">
              <template v-if="col.prop == 'operation'">
                <el-button :size="state.isMobile ? 'small' : ''" type="primary" link @click="handleEdit(row)">编辑</el-button>
                <el-button :size="state.isMobile ? 'small' : ''" type="primary" link @click="handleDel(row)">删除</el-button>
              </template>
              <template v-if="col.prop == 'create_time'">
                {{ parseTime(row[col.prop]) }}
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
          :pager-count="state.isMobile ? 5 : 9"
          :background="state.isMobile ? false : true"
          v-model:current-page="pagination.page"
          v-model:page-size="pagination.size"
          :page-sizes="[20, 50, 100, 200]"
          :layout="state.isMobile ? 'total, prev, pager, next' : 'total, sizes, prev, pager, next, jumper'"
          :total="pagination.total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"></el-pagination>
      </div>
    </div>
  </div>
</template>

<script setup>
import { exportLogs, getLogsList } from '@/api/logs';
import { isMobile, parseTime } from '@/utils/common';
import { ElMessage } from 'element-plus';
import moment from 'moment';
import { onUnmounted, reactive, ref } from 'vue';
let state = reactive({
  isMobile: isMobile(1000),
  loading: false,
  form: {
    username: '',
    city: ''
  },
  tableSource: [],
  rules: {},
  timerList: [],
  exportLoading: false
});

const pagination = reactive({
  page: 1,
  size: 20,
  total: 0
});

let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');

const columns = [
  { id: 1, label: 'ID', minWidth: '60px', prop: 'id', align: 'center' },
  { id: 2, label: '登录账号', minWidth: '100px', prop: 'username', align: 'center' },
  { id: 3, label: '主机IP', minWidth: '140px', prop: 'ip', align: 'center' },
  { id: 4, label: '登录地点', minWidth: '80px', prop: 'city', align: 'center' },
  { id: 5, label: '操作系统', minWidth: '90px', prop: 'os', align: 'center' },
  { id: 6, label: '浏览器', minWidth: '120px', prop: 'browser', align: 'center' },
  { id: 8, label: '登录时间', minWidth: '180px', prop: 'create_time', align: 'center' }
];

// 获取列表
const getListFn = () => {
  state.loading = true;
  let params = {
    username: state.form.username,
    city: state.form.city,
    type: 0,
    page: pagination.page,
    size: pagination.size
  };
  getLogsList(params)
    .then(res => {
      state.tableSource = res.data;
      pagination.total = res.total;
      state.loading = false;
    })
    .catch(() => {
      state.loading = false;
    });
};
getListFn();

const handleSizeChange = size => {
  pagination.page = 1;
  pagination.size = size;
  getListFn();
};

const handleCurrentChange = page => {
  pagination.page = page;
  getListFn();
};

// 查询
const handleSelect = () => {
  pagination.page = 1;
  getListFn();
};

const handleReset = () => {
  state.form.city = '';
  state.form.username = '';
  getListFn();
};

//   导出
const handleExport = () => {
  state.exportLoading = true;
  let params = {
    username: state.form.username,
    city: state.form.city,
    type: 0
  };
  exportLogs(params)
    .then(res => {
      const link = document.createElement('a');
      const blob = new Blob([res], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
      link.style.display = 'none';
      link.href = URL.createObjectURL(blob);
      link.download = '登录日志_' + moment().format('YYYYMMDDHHmmss') + '.xlsx';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      ElMessage.success('导出成功！');
    })
    .finally(() => {
      state.exportLoading = false;
    });
};

const resizeCallback = () => {
  state.isMobile = isMobile(1000);
  tableHeight.value = state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)';
};
window.addEventListener('resize', resizeCallback);

onUnmounted(() => {
  window.removeEventListener('resize', resizeCallback);
});
</script>

<style lang="scss" scoped>
.container-warp {
  width: 100%;
  height: 100% !important;
  overflow: hidden;
  background-color: var(--containerBgc);
  .select-warp {
    padding: 10px 20px;
    background-color: var(--contentBgc);
    .el-form-item {
      margin: 10px 0;
    }
  }
  .table-warp {
    height: v-bind(tableHeight);
    margin-top: 10px;
    padding: 20px 20px;
    background-color: var(--contentBgc);
    overflow: hidden;
    .table-content {
      height: calc(100% - 99px);
      overflow-y: auto;
    }
  }
}
.footer-pagination {
  border-top: 1px solid #ccc;
  padding: 20px 0px 0 20px;
  display: flex;
  justify-content: flex-end;
}
</style>

<style>
.el-table .back-money {
  --el-table-tr-bg-color: #61d8b0ae !important;
}
</style>
