<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-11 12:26:11
 * @FilePath: /Website/WebsiteUI/src/views/system/dict/index.vue
-->
<template>
  <div class="container-warp">
    <div class="select-warp">
      <el-form
        :model="state.form"
        ref="form"
        :rules="state.rules"
        :label-width="state.isMobile ? '0px' : '80px'"
        :inline="true"
        style="display: flex; align-items: center"
        :style="{ justifyContent: state.isMobile ? 'space-around' : 'flex-start' }">
        <el-form-item :label="state.isMobile ? '' : '字典名称:'" :style="{ width: state.isMobile ? '60%' : '' }">
          <el-input style="width: 160px" v-model="state.form.name" clearable placeholder="请输入名称/标识关键字" @blur="handleSelect"></el-input>
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
        <el-table :data="state.tableSource" stripe row-key="id" v-loading="state.tableLoading" style="width: 100%; height: 100%" :size="state.isMobile ? 'small' : 'default'">
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
                <el-button :size="state.isMobile ? 'small' : 'default'" v-if="row.pid === 0" type="primary" link @click="hanldeAdd(row)">新增</el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleEdit(row)">编辑</el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleDel(row)">删除</el-button>
              </template>
              <template v-if="col.prop == 'createTime' || col.prop == 'updateTime'">
                {{ parseTime(row[col.prop]) }}
              </template>
            </template>
          </el-table-column>

          <template #empty>
            <empty></empty>
          </template>
        </el-table>
      </div>
    </div>
    <EditDialog ref="editRef" :refreshCallBack="getDictFn" :is-mobile="state.isMobile" />
  </div>
</template>

<script lang="ts" setup>
import { deleteDict, getDict } from '@/api/system/dict';
import { local } from '@/utils/cache';
import { isMobile, parseTime } from '@/utils/common';
import { ElMessage, ElMessageBox } from 'element-plus';
import { onUnmounted, reactive, ref } from 'vue';
import EditDialog from './editDialog.vue';
let state = reactive({
  isMobile: isMobile(800),
  form: {
    name: ''
  },
  tableSource: [],
  rules: {},
  tableLoading: false
});

let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');

const columns = [
  // { id: 1, label: '字典ID', minWidth: '100px', prop: 'id', align: 'center' },
  { id: 2, label: '字典名称', minWidth: '200px', prop: 'label', align: 'left' },
  { id: 3, label: '字典value值', minWidth: '120px', prop: 'value' },
  { id: 4, label: '字典标识', minWidth: '120px', prop: 'dictType' },
  { id: 5, label: '创建时间', minWidth: '180px', prop: 'createTime' },
  { id: 6, label: '描述', minWidth: '200px', prop: 'remark' },
  { id: 7, label: '更新时间', minWidth: '180px', prop: 'updateTime' },
  { id: 8, label: '操作', minWidth: state.isMobile ? '138px' : '200px', prop: 'operation', fixed: state.isMobile ? null : 'right' }
];

// 权限控制
const userInfo = local.get('userInfo');

const getDictFn = () => {
  state.tableLoading = true;
  let parasms = {
    name: state.form.name
  };
  getDict(parasms)
    .then(res => {
      state.tableSource = res.data;
    })
    .finally(() => {
      state.tableLoading = false;
    });
};
getDictFn();

// 查询
const handleSelect = () => {
  getDictFn();
};

const handleReset = () => {
  state.form.name = '';
  getDictFn();
};

let editRef = ref(null);
const hanldeAdd = (row: { dictType: any }) => {
  (editRef.value as any).showDialog('add', row ? row : null);
};

const handleEdit = (row: any) => {
  (editRef.value as any).showDialog('edit', row);
};

const handleDel = (row: { id: number; pid: number }) => {
  let tip = '确认删除字典吗？';
  if (row.pid === 0) {
    tip = '此操作将删除该 字典 及其 所有子字典，确认删除吗？';
  }
  // TODO 删除字典
  ElMessageBox.confirm(tip, '提示').then(() => {
    deleteDict({ id: row.id })
      .then(() => {
        ElMessage.success('删除成功');
        getDictFn();
      })
      .catch(() => {});
  });
};
const resizeCallback = () => {
  state.isMobile = isMobile(800);
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
      height: calc(100% - 52px);
      overflow-y: auto;
    }
  }
}
.opertion {
  margin-bottom: 20px;
}
</style>
