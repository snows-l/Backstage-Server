<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-11 12:32:51
 * @FilePath: /Website/WebsiteUI/src/views/system/user/index.vue
-->
<template>
  <div class="container-warp">
    <div class="select-warp">
      <el-form
        :model="state.form"
        ref="form"
        :rules="state.rules"
        :label-width="state.isMobile ? '0px' : '60px'"
        :inline="true"
        style="display: flex; align-items: center"
        :style="{ justifyContent: state.isMobile ? 'space-around' : 'flex-start' }">
        <el-form-item :label="state.isMobile ? '' : '用户名:'" :style="{ width: state.isMobile ? '50%' : '' }">
          <el-input style="width: 160px" v-model="state.form.name" clearable placeholder="请输入用户名" @blur="handleSelect"></el-input>
        </el-form-item>
        <el-form-item :label="state.isMobile ? '' : '角色:'" :style="{ width: state.isMobile ? '46%' : '' }">
          <el-select style="width: 160px" v-model="state.form.role" clearable placeholder="请选择角色" @change="handleSelect">
            <el-option v-for="item in state.roleList" :key="item.role_id" :label="item.role_name" :value="item.role_id"></el-option>
          </el-select>
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
        <el-table :data="state.tableSource" stripe row-key="id" v-loading="state.tableLoading" style="height: 100%; width: 100%" :size="state.isMobile ? 'small' : 'default'">
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
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleEdit(row)">编辑</el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleDel(row)">删除</el-button>
              </template>
              <template v-if="col.prop == 'role'">
                <span>{{ getRoleName(row.role) }}</span>
              </template>
              <template v-if="col.prop == 'sex'">
                <span>{{ getSexName(row.sex) || '未知' }}</span>
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
          :page-sizes="[20, 50, 100, 200]"
          :layout="state.isMobile ? 'total, prev, pager, next' : 'total, sizes, prev, pager, next, jumper'"
          :total="state.page.total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange" />
      </div>
    </div>
    <EditDialog ref="editRef" :refreshCallBack="getUserListFn" :is-mobile="state.isMobile" />
  </div>
</template>

<script lang="ts" setup>
import { getDict } from '@/api/system/dict';
import { getRoleList } from '@/api/system/role';
import { delUser, getUser } from '@/api/system/user';
import { local } from '@/utils/cache';
import { isMobile, parseTime } from '@/utils/common';
import { ElMessage, ElMessageBox } from 'element-plus';
import { onBeforeUnmount, reactive, ref } from 'vue';
import EditDialog from './editDialog.vue';

let state = reactive({
  isMobile: isMobile(1000),
  form: {
    name: '',
    role: null
  },
  page: {
    page: 1,
    size: 20,
    total: 0
  },
  tableSource: [],
  roleList: [],
  sexList: [],
  rules: {},
  tableLoading: false
});

let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');

// 用户角色列表
getRoleList().then(res => {
  state.roleList = res.data;
});
// 获取性别
getDict({ dictType: 'user_sex' }).then(res => {
  state.sexList = res.data;
});

const columns = [
  { id: 2, label: '用户名ID', minWidth: '120px', prop: 'user_id', align: 'center' },
  { id: 3, label: '用户名', minWidth: '120px', prop: 'user_name' },
  { id: 3, label: '昵称', minWidth: '120px', prop: 'nick_name' },
  { id: 3, label: '角色', minWidth: '120px', prop: 'role' },
  { id: 4, label: '手机号码', minWidth: '120px', prop: 'phonenumber' },
  { id: 6, label: '性别', minWidth: '200px', prop: 'sex' },
  { id: 6, label: '邮箱', minWidth: '200px', prop: 'email' },
  { id: 5, label: '创建时间', minWidth: '180px', prop: 'create_time' },
  { id: 7, label: '更新时间', minWidth: '180px', prop: 'update_time' },
  { id: 8, label: '操作', minWidth: state.isMobile ? '140px' : '140px', prop: 'operation', fixed: state.isMobile ? null : 'right' }
];

// 权限控制
const userInfo = local.get('userInfo') || {};

const getUserListFn = () => {
  state.tableLoading = true;
  let parasms = {
    name: state.form.name,
    role: state.form.role,
    page: state.page.page,
    size: state.page.size
  };
  getUser(parasms)
    .then(res => {
      state.tableSource = res.data;
      state.page.total = res.total;
    })
    .finally(() => {
      state.tableLoading = false;
    });
};
getUserListFn();

// 查询
const handleSelect = () => {
  getUserListFn();
};

// 重置
const handleReset = () => {
  state.form.name = '';
  state.form.role = null;
  getUserListFn();
};

// 改变分页
const handleSizeChange = (size: number) => {
  state.page.page = 1;
  state.page.size = size;
  getUserListFn();
};

// 改变当前页
const handleCurrentChange = (page: number) => {
  state.page.page = page;
  getUserListFn();
};

let editRef = ref(null);
const hanldeAdd = (row: { dictType: any }) => {
  (editRef.value as any).showDialog('add', row ? row : null, state.roleList, state.sexList);
};

const handleEdit = (row: any) => {
  (editRef.value as any).showDialog('edit', row, state.roleList, state.sexList);
};

// 获取角色名称
const getRoleName = (roleId: number) => {
  let roleName = '';
  state.roleList.forEach(item => {
    if (item.role_id === roleId) {
      roleName = item.role_name;
    }
  });
  return roleName;
};

// 获取性别名称
const getSexName = (sexValue: number) => {
  let sexName = '';
  state.sexList.forEach(item => {
    if (item.value == sexValue) {
      sexName = item.label;
    }
  });
  return sexName;
};

const handleDel = (row: { id: number }) => {
  ElMessageBox.confirm('确认删除该用户？', '提示').then(() => {
    delUser(row.user_id)
      .then(() => {
        ElMessage.success('删除成功');
        getUserListFn();
      })
      .catch(() => {});
  });
};

const resizeCallback = () => {
  state.isMobile = isMobile(1000);
  tableHeight.value = state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)';
};
window.addEventListener('resize', resizeCallback);

onBeforeUnmount(() => {
  window.removeEventListener('resize', resizeCallback);
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
