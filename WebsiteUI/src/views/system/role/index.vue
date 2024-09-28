<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-28 16:23:17
 * @FilePath: /webseteUI/WebsiteUI/src/views/system/role/index.vue
-->
<template>
  <div class="container-warp">
    <div class="select-warp">
      <el-form
        :model="state.form"
        ref="form"
        :label-width="state.isMobile ? '0px' : '80px'"
        :inline="true"
        style="display: flex; align-items: center"
        :style="{ justifyContent: state.isMobile ? 'space-around' : 'flex-start' }">
        <el-form-item :label="state.isMobile ? '' : '角色名:'" :style="{ width: state.isMobile ? '46%' : '' }">
          <el-input style="width: 160px" v-model="state.form.name" clearable placeholder="请输入角色名" @blur="handleSelect"></el-input>
        </el-form-item>
        <el-form-item :label="state.isMobile ? '' : '角色key:'" :style="{ width: state.isMobile ? '50%' : '' }">
          <el-input style="width: 160px" v-model="state.form.roleKey" clearable placeholder="请输入角色key" @blur="handleSelect"></el-input>
        </el-form-item>
        <el-form-item v-if="!state.isMobile">
          <el-button @click="handleReset">重置</el-button>
          <el-button type="primary" @click="handleSelect">查询</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-warp">
      <div class="opertion"><el-button type="primary" @click="hanldeAdd(false)">新增</el-button></div>
      <div class="table-content-container">
        <el-table :data="state.tableSource" stripe row-key="id" v-loading="state.tableLoading" style="width: 100%; height: 100%" :size="state.isMobile ? 'small' : ''">
          <el-table-column
            v-for="col in columns"
            :prop="col.prop"
            :key="col.id"
            :label="col.label"
            :minWidth="col.minWidth || null"
            :width="col.width || null"
            :align="col.align || 'center'"
            :fixed="col.fixed || null">
            <template #default="{ row }">
              <template v-if="col.prop == 'operation'">
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" v-if="row.role_key != 'admin'" link @click="handleEdit(row)">编辑</el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" v-if="row.role_key != 'admin'" link @click="handleDel(row)">删除</el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" v-if="row.role_key != 'admin'" link @click="handleAuth(row)">权限</el-button>
              </template>
              <template v-if="col.prop == 'create_time' || col.prop == 'update_time'">
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
          v-model:current-page="state.page.page"
          v-model:page-size="state.page.size"
          :page-sizes="[10, 20, 50, 100]"
          :layout="state.isMobile ? 'total, prev, pager, next' : 'total, sizes, prev, pager, next, jumper'"
          :total="state.page.total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange" />
      </div>
    </div>
    <EditDialog ref="editRef" :refreshCallBack="getRoleListFn" :is-mobile="state.isMobile" />
    <RoleDialog ref="roleRef" @refresh="getRoleListFn" />
  </div>
</template>

<script lang="ts" setup>
import { delRole, getRoleList } from '@/api/system/role';
import { local } from '@/utils/cache';
import { isMobile, parseTime } from '@/utils/common';
import { ElMessage, ElMessageBox } from 'element-plus';
import { onBeforeUnmount, reactive, ref } from 'vue';
import EditDialog from './editDialog.vue';
import RoleDialog from './roleDialog.vue';

const roleRef = ref(null);
const editRef = ref(null);

let state = reactive({
  isMobile: isMobile(1000),
  form: {
    name: '',
    roleKey: ''
  },
  page: {
    page: 1,
    size: 20,
    total: 0
  },
  tableSource: [],
  rules: {},
  tableLoading: false
});
let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');

const columns = [
  { id: 3, label: '角色名', minWidth: '120px', prop: 'role_name' },
  { id: 3, label: '角色key', minWidth: '120px', prop: 'role_key' },
  { id: 5, label: '创建时间', minWidth: '180px', prop: 'create_time' },
  { id: 7, label: '更新时间', minWidth: '180px', prop: 'update_time' },
  { id: 3, label: '备注', minWidth: '120px', prop: 'remark' },
  { id: 8, label: '操作', minWidth: state.isMobile ? '150px' : '160px', prop: 'operation', fixed: state.isMobile ? null : 'right' }
];

// 权限控制
const userInfo = local.get('userInfo') || {};

const getRoleListFn = () => {
  state.tableLoading = true;
  let parasms = {
    name: state.form.name,
    roleKey: state.form.roleKey,
    page: state.page.page,
    size: state.page.size
  };
  getRoleList(parasms)
    .then(res => {
      state.tableSource = res.data;
      state.page.total = res.total;
    })
    .finally(() => {
      state.tableLoading = false;
    });
};
getRoleListFn();

// 查询
const handleSelect = () => {
  getRoleListFn();
};

// 重置
const handleReset = () => {
  state.form.name = '';
  state.form.roleKey = '';
  getRoleListFn();
};

// 改变分页
const handleSizeChange = (size: number) => {
  state.page.page = 1;
  state.page.size = size;
  getRoleListFn();
};

// 改变当前页
const handleCurrentChange = (page: number) => {
  state.page.page = page;
  getRoleListFn();
};

const hanldeAdd = (row: { dictType: any }) => {
  (editRef.value as any).init('add', row ? row : null);
};

const handleEdit = (row: any) => {
  (editRef.value as any).init('edit', row);
};

const handleDel = (row: { id: number }) => {
  ElMessageBox.confirm('确认删除该角色？', '提示').then(() => {
    delRole(row.role_id)
      .then(() => {
        ElMessage.success('删除成功');
        getRoleListFn();
      })
      .catch(() => {});
  });
};

// 权限控制
const handleAuth = row => {
  (roleRef.value as any).init(row);
};

const resizeCallback = () => {
  state.isMobile = isMobile(1000);
  tableHeight.value = state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)';
};
window.addEventListener('resize', resizeCallback, { passive: true });

onBeforeUnmount(() => {
  window.removeEventListener('resize', resizeCallback), { passive: true };
});
</script>

<style lang="scss" scoped>
.container-warp {
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
.opertion {
  margin-bottom: 20px;
}

.footer-pagination {
  border-top: 1px solid #ccc;
  padding: 20px 20px 0 20px;
  display: flex;
  justify-content: flex-end;
}
</style>
