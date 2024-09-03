<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-03 19:20:41
 * @FilePath: /webseteUI/WebsiteUI/src/views/favors/index.vue
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
        <el-form-item :style="{ width: state.isMobile ? '46%' : '' }" :label="state.isMobile ? '' : '来往时间点:'">
          <el-select style="width: 160px" v-model="state.form.dictType" placeholder="请选择来往时间点" clearable @change="handleSelect">
            <el-option v-for="item in state.timerList" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item :style="{ width: state.isMobile ? '50%' : '' }" :label="state.isMobile ? '' : '姓名:'">
          <el-input style="width: 160px" v-model="state.form.name" clearable placeholder="请输入姓名" @blur="handleSelect"></el-input>
        </el-form-item>

        <el-form-item v-if="!state.isMobile" :style="{ margin: state.isMobile ? '0 10px 0 0' : '10px 0 10px 20px' }">
          <el-button @click="handleReset">重置</el-button>
          <el-button type="primary" @click="handleSelect">查询</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-warp">
      <div class="operation-warp" style="margin-bottom: 15px">
        <el-button type="primary" @click="handleAdd">添 加</el-button>
        <el-button type="primary" v-loading="state.exportLoading" @click="handleExport">导 出</el-button>
      </div>
      <div class="table-content-container">
        <el-table
          :data="state.tableSource"
          stripe
          :row-class-name="tableRowClassName"
          style="width: 100%; height: 100%"
          v-loading="state.loading"
          :size="state.isMobile ? 'small' : ''">
          <el-table-column
            v-for="col in columns"
            :prop="col.prop"
            :key="col.id"
            :label="col.label"
            :minWidth="col.minWidth"
            :align="col.align || 'center'"
            :fixed="col.fixed || null">
            <template #default="{ row }">
              <template v-if="col.prop == 'favors_timer'">
                <el-tag :type="timerType[row[col.prop]].type || 'info'" :effect="timerType[row[col.prop]].effect || 'light'">
                  {{ state.timerObj[row[col.prop]] }}
                </el-tag>
              </template>

              <template v-if="col.prop == 'remark'">
                <el-tooltip v-if="row[col.prop]" :content="row[col.prop]" placement="top" effect="dark">
                  <div
                    class="remark-warp"
                    style="height: 30px; line-height: 15px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical">
                    {{ row[col.prop] }}
                  </div>
                </el-tooltip>
                <span v-else></span>
              </template>

              <template v-if="col.prop == 'operation'">
                <el-button :size="state.isMobile ? 'small' : ''" type="primary" link @click="handleEdit(row)">编辑</el-button>
                <el-button :size="state.isMobile ? 'small' : ''" type="primary" link @click="handleDel(row)">删除</el-button>
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
          v-model:current-page="state.page.page"
          v-model:page-size="state.page.size"
          :page-sizes="[20, 50, 100, 200]"
          :layout="state.isMobile ? 'total, prev, pager, next' : 'total, sizes, prev, pager, next, jumper'"
          :total="state.page.total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange" />
      </div>
    </div>
    <EditDialog ref="editRef" @rereshCallback="getListFn" :is-mobile="state.isMobile" />
  </div>
</template>

<script setup>
import { delFavors, exportFavors, getFavorsList } from '@/api/favors';
import { getDict } from '@/api/system/dict';
import { local } from '@/utils/cache';
import { isMobile } from '@/utils/common';
import { ElMessage, ElMessageBox } from 'element-plus';
import moment from 'moment';
import { onUnmounted, reactive, ref } from 'vue';
import EditDialog from './editDialog.vue';

const timerType = {
  1: { type: 'primary', effect: 'light' },
  2: { type: 'warning', effect: 'light' },
  3: { type: 'warning', effect: 'light' },
  4: { type: 'info', effect: 'light' }
};
let state = reactive({
  isMobile: isMobile(1000),
  loading: false,
  exportLoading: false,
  form: {
    name: '',
    dictType: '2'
  },
  tableSource: [],
  rules: {},
  timerList: [],
  page: {
    page: 1,
    size: 50,
    total: 0
  },
  timerObj: {}
});

let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');

const columns = [
  { id: 2, label: '姓名', minWidth: '80px', prop: 'favors_name', align: 'center' },
  { id: 3, label: '金额', minWidth: '80px', prop: 'favors_money', align: 'center' },
  { id: 4, label: '回礼', minWidth: '80px', prop: 'favors_backMoney', align: 'center' },
  { id: 5, label: '时间点', minWidth: '90px', prop: 'favors_timer' },
  { id: 6, label: '创建时间', minWidth: '120px', prop: 'createTime' },
  { id: 8, label: '更新时间', minWidth: '120px', prop: 'updateTime' },
  { id: 7, label: '备注', minWidth: '120px', prop: 'remark' },
  { id: 10, label: '操作', minWidth: state.isMobile ? '120px' : '120px', prop: 'operation', fixed: state.isMobile ? null : 'right' }
];

let userInfo = local.get('userInfo') || {};
if (userInfo?.user?.role_key == 'admin' || userInfo?.user?.role_key == 'snow') {
  // columns.push({ id: 10, label: '操作', minWidth: state.isMobile ? '120px' : '120px', prop: 'operation', fixed: state.isMobile ? null : 'right' });
}

const editRef = ref(null);
// 编辑
const handleEdit = row => {
  editRef.value.init('edit', row, state.timerList);
};

// 新增
const handleAdd = () => {
  editRef.value.init('add', false, state.timerList);
};

// 删除
const handleDel = row => {
  ElMessageBox.confirm('此操作将永久删除该记录, 是否确认删除该记录吗？', '提示', { type: 'warning' }).then(() => {
    delFavors(row.favors_id).then(res => {
      if (res.code == 200) {
        ElMessage.success('删除成功');
        getListFn();
      } else {
        alert(res.msg);
      }
    });
  });
};

// 设置类名
const tableRowClassName = ({ row }) => {
  if (row.favors_backMoney) return 'back-money';
  else return '';
};

// 获取来往时间点下拉框
const getDictFn = () => {
  getDict({ dictType: 'favors_time' }).then(res => {
    state.timerList = res.data;
    state.timerList.forEach((item, index) => {
      state.timerObj[item.value] = item.label;
    });
  });
};
getDictFn();

// 获取列表
const getListFn = () => {
  state.loading = true;
  let params = {
    dictType: state.form.dictType,
    name: state.form.name,
    page: state.page.page,
    size: state.page.size
  };
  getFavorsList(params)
    .then(res => {
      moment.suppressDeprecationWarnings = true;
      state.tableSource = res.data;
      state.tableSource.forEach(item => {
        item.createTime = item.create_time && moment(item.create_time).format('YYYY-MM-DD HH:mm:ss');
        item.updateTime = item.update_time && moment(item.update_time).format('YYYY-MM-DD HH:mm:ss');
      });
      state.page.total = res.total;
      state.loading = false;
    })
    .catch(() => {
      state.loading = false;
    });
};
getListFn();

const handleSizeChange = size => {
  state.page.page = 1;
  state.page.size = size;
  getListFn();
};

const handleCurrentChange = page => {
  state.page.page = page;
  getListFn();
};

// 查询
const handleSelect = () => {
  state.page.page = 1;
  getListFn();
};

const handleReset = () => {
  state.form.name = '';
  state.form.dictType = '2';
  getListFn();
};

//   导出
const handleExport = () => {
  state.exportLoading = true;
  let params = {
    dictType: state.form.dictType,
    name: state.form.name
  };
  exportFavors(params)
    .then(res => {
      const link = document.createElement('a');
      const blob = new Blob([res], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
      link.style.display = 'none';
      link.href = URL.createObjectURL(blob);
      link.download = '人情来往_' + moment().format('YYYYMMDDHHmmss') + '.xlsx';
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
    .table-content-container {
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
