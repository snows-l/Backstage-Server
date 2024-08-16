<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-11 12:19:32
 * @FilePath: /Website/WebsiteUI/src/views/wages/index.vue
-->
<template>
  <div class="wages-container-warp">
    <div class="select-warp">
      <el-form
        :model="state.form"
        ref="form"
        :rules="state.rules"
        :label-width="state.isMobile ? '0px' : '60px'"
        :inline="true"
        style="display: flex; align-items: center"
        :style="{ justifyContent: state.isMobile ? 'space-around' : 'flex-start' }">
        <el-form-item :label="state.isMobile ? '' : '就职于:'" :style="{ width: state.isMobile ? '46%' : '' }">
          <el-select v-model="state.form.company" placeholder="请选择就职于" style="width: 160px" clearable @change="handleSelect">
            <el-option v-for="item in state.companyList" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item :label="state.isMobile ? '' : '日期:'" :style="{ width: state.isMobile ? '50%' : '' }">
          <el-date-picker
            popper-class="wages-date-picker"
            v-model="state.form.date"
            type="monthrange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @change="handleSelect" />
        </el-form-item>
        <el-form-item style="margin-left: 10px" v-if="!state.isMobile">
          <el-button @click="handleReset">重置</el-button>
          <el-button type="primary" @click="handleSelect">查询</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-warp">
      <div class="content-top-warp">
        <div class="opertion">
          <el-button type="primary" @click="hanldeAdd(false)">新 增</el-button>
          <el-button type="primary" @click="hanldeExport" v-loading="state.exportLoading">导 出</el-button>
        </div>
        <div class="sum">
          <!-- <span class="label">合计收入</span> -->
          <span class="value">
            <CountTo
              :startVal="10000"
              :endVal="state.sumMoney ? state.sumMoney * 1 : 0"
              :duration="1000"
              :prefix="''"
              :suffix="''"
              :decimals="2"
              :decimal="'.'"
              :separator="','"></CountTo>
            <span style="margin-left: 6px; font-size: 12px">元</span>
          </span>
        </div>
      </div>
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
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleEdit(row)">编辑</el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleDel(row)">删除</el-button>
              </template>
              <template v-if="col.prop == 'source'">
                <el-tag :type="state.tagType[row.source]">{{ getCompanyName(row.source) }}</el-tag>
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
              <template v-if="col.prop == 'pic'">
                <el-image
                  style="width: 80px; height: 80px"
                  loading="eager"
                  preview-teleported
                  hide-on-click-modal
                  :src="row.picLocal"
                  :preview-src-list="[row.picLocal]"
                  fit="cover" />
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
    <EditDialog ref="editRef" :refreshCallBack="getWagesListFn" :is-mobile="state.isMobile" />
    <XDialog draggable title="导出提示" v-model="state.open" :size="state.isMobile ? '90vw' : '40%'" :before-close="handleClose">
      <div class="export-warp" style="padding: 0 20px 20px 20px">
        <div class="label" style="color: #f14c4c; margin-bottom: 20px">导出收入明细中是否包含 附件？</div>
        <el-radio-group v-model="state.form.includeFile">
          <el-radio :value="true">是</el-radio>
          <el-radio :value="false">否</el-radio>
        </el-radio-group>
      </div>
      <template #footer>
        <span>
          <el-button @click="handleClose">取消</el-button>
          <el-button type="primary" @click="handleConmitExport">确认</el-button>
        </span>
      </template>
    </XDialog>
  </div>
</template>

<script lang="ts" setup>
import { getDict } from '@/api/system/dict';
import { delWages, exportWages, getWagesList } from '@/api/wages';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { local } from '@/utils/cache';
import { isMobile } from '@/utils/common';
import { ElMessage, ElMessageBox, ElNotification } from 'element-plus';
import moment from 'moment';
import { onBeforeUnmount, reactive, ref, watch } from 'vue';
import EditDialog from './editDialog.vue';

const pgc = usePGCStore();
const themeColor = pgc.themeColor;

let state = reactive({
  open: false,
  exportLoading: false,
  isMobile: isMobile(1000),
  form: {
    date: [],
    sDate: '',
    eDate: '',
    company: null,
    includeFile: false
  },
  page: {
    page: 1,
    size: 20,
    total: 0
  },
  tableSource: [],
  companyList: [],
  rules: {},
  tableLoading: false,
  tagType: {
    0: 'primary',
    1: 'success',
    2: 'info',
    3: 'warning',
    4: 'danger'
  },
  sumMoney: 0
});
let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');

const userInfo = local.get('userInfo') || {};
// 获取就职企业
getDict({ dictType: 'wages_source' }).then(res => {
  state.companyList = res.data;
  // if (userInfo?.user?.role_key === 'snow') {
  //   state.companyList.forEach((item, index) => {
  //     item.label = '企业' + (index + 1);
  //   });
  // }
});

const columns = [
  { id: 0, label: 'ID', width: '60px', prop: 'id', align: 'center' },
  { id: 1, label: '标题', width: '160px', prop: 'title', align: 'center' },
  { id: 2, label: '收入月份', minWidth: '120px', prop: 'date' },
  { id: 3, label: '收入金额(元)', minWidth: '120px', prop: 'money' },
  { id: 4, label: '工资截图', minWidth: '120px', prop: 'pic' },
  { id: 5, label: '就职于', minWidth: '120px', prop: 'source' },
  { id: 6, label: '创建日期', minWidth: '120px', prop: 'create_time' },
  { id: 7, label: '备注', minWidth: '120px', prop: 'remark' },
  { id: 8, label: '操作', minWidth: state.isMobile ? '120px' : '120px', prop: 'operation', fixed: state.isMobile ? null : 'right' }
];

// 权限控制

if (userInfo?.user?.role_key === 'admin' || userInfo?.user?.role_key === 'snow') {
  // columns.push({ id: 8, label: '操作', minWidth: state.isMobile ? '120px' : '120px', prop: 'operation', fixed: state.isMobile ? null : 'right' });
}

const getWagesListFn = () => {
  state.tableLoading = true;
  let parasms = {
    sDate: state.form.date && state.form.date.length ? moment(state.form.date[0]).format('YYYY-MM') : '',
    eDate: state.form.date && state.form.date.length ? moment(state.form.date[1]).format('YYYY-MM') : '',
    source: state.form.company,
    page: state.page.page,
    size: state.page.size
  };
  getWagesList(parasms)
    .then((res: any) => {
      res.data.forEach((item: { create_time: Date | string }) => {
        item.create_time = item.create_time && moment(item.create_time).format('YYYY-MM-DD HH:mm:ss');
        item.date = item.date && moment(item.date).format('YYYY-MM');
        item.picLocal = import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + item.pic : import.meta.env.VITE_PROD_BASE_SERVER + item.pic;
      });
      state.tableSource = res.data;
      state.page.total = res.total || 0;
      state.sumMoney = (res.sum && res.sum.toFixed(2)) || 0;
    })
    .finally(() => {
      state.tableLoading = false;
    });
};
getWagesListFn();

// 查询
const handleSelect = () => {
  state.page.page = 1;
  getWagesListFn();
};

// 重置
const handleReset = () => {
  state.page.page = 1;
  state.form.date = [];
  state.form.sDate = '';
  state.form.eDate = '';
  state.form.company = null;
  state.form.includeFile = false;
  getWagesListFn();
};

// 改变分页
const handleSizeChange = (size: number) => {
  state.page.page = 1;
  state.page.size = size;
  getWagesListFn();
};

// 改变当前页
const handleCurrentChange = (page: number) => {
  state.page.page = page;
  getWagesListFn();
};

let editRef = ref(null);
const hanldeAdd = (row: { dictType: any }) => {
  (editRef.value as any).showDialog('add', row ? row : null, state.companyList);
};

const handleEdit = (row: any) => {
  (editRef.value as any).showDialog('edit', row, state.companyList);
};

// 获取来源企业名称
const getCompanyName = (sourceVal: number | string) => {
  let sourceName = '';
  state.companyList.forEach(item => {
    if (item.value === sourceVal) {
      sourceName = item.label;
    }
  });
  return sourceName;
};

const handleDel = (row: { id: number }) => {
  ElMessageBox.confirm('确认删除该记录？', '提示').then(() => {
    delWages(row.id)
      .then(() => {
        ElMessage.success('删除成功');
        getWagesListFn();
      })
      .catch(() => {});
  });
};

const exportFn = () => {
  state.exportLoading = true;
  let params = {
    sDate: state.form.date && state.form.date.length ? moment(state.form.date[0]).format('YYYY-MM') : '',
    eDate: state.form.date && state.form.date.length ? moment(state.form.date[1]).format('YYYY-MM') : '',
    source: state.form.company,
    includePic: state.form.includeFile
  };
  exportWages(params)
    .then(res => {
      const link = document.createElement('a');
      const blob = new Blob([res], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
      link.style.display = 'none';
      link.href = URL.createObjectURL(blob);
      link.download = '工资明细_' + '.xlsx';
      document.body.appendChild(link);
      link.click();
      document.body.removeChild(link);
      ElMessage.success('导出成功！');
    })
    .finally(() => {
      state.exportLoading = false;
    });
};
// 导出

const hanldeExport = () => {
  state.open = true;
};

const handleConmitExport = () => {
  exportFn();
  if (state.form.includeFile) {
    ElNotification({
      title: '附件导出提示',
      message: '因包含附件，导出附件需要一定时间，请耐心等待。',
      type: 'info'
    });
  }
  handleClose();
};
const handleClose = () => {
  state.open = false;
};

const resizeCallback = () => {
  state.isMobile = isMobile(1000);
  tableHeight.value = state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)';
};
window.addEventListener('resize', resizeCallback);

onBeforeUnmount(() => {
  window.removeEventListener('resize', resizeCallback);
});

watch(
  () => pgc.themeColor,
  () => {
    themeColor.value = pgc.themeColor;
  }
);
</script>

<style lang="scss" scoped>
.wages-container-warp {
  width: 100%;
  height: 100%;
  background-color: var(--containerBgc);
  overflow: hidden;
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
      height: calc(100% - 100px);
      overflow-y: auto;
    }

    .content-top-warp {
      margin: 0 0 15px 0;
      display: flex;
      justify-content: space-between;
      align-items: center;
      .sum {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        font-size: 16px;
        font-weight: 600;
        .label {
          margin: 5px;
        }
        .value {
          font-size: 24px;
          font-family: DSDIGI;
          color: v-bind(themeColor);
        }
      }
    }
  }
}
.footer-pagination {
  border-top: 1px solid #ccc;
  padding: 20px 20px 0 20px;
  display: flex;
  justify-content: flex-end;
}
:deep(.wages-date-picker) {
  color: red;
}
</style>
