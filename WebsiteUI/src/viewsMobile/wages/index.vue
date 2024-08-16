<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 16:51:19
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-25 19:28:54
 * @FilePath: /webseteUI/WebsiteUI/src/viewsMobile/wages/index.vue
-->
<template>
  <div class="container-warp">
    <div class="form-warp">
      <el-form class="form" :model="state.form" ref="form" :rules="state.rules" label-width="0" :inline="true">
        <el-form-item size="">
          <el-date-picker
            style="width: 200px"
            v-model="state.form.date"
            type="monthrange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            @change="handleSelect" />
        </el-form-item>
        <el-form-item size="">
          <el-select style="min-width: 130px" v-model="state.form.source" placeholder="请选择来往时间点" clearable @change="handleSelect">
            <el-option v-for="item in state.companyList" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
    </div>
    <div class="favors-content-warp" v-loading="state.loading" :style="{ height: state.isBottomNav ? 'calc(100% - 94px)' : 'calc(100% - 114px)' }">
      <!-- table -->
      <div class="scorll-warp" v-if="state.isTable">
        <el-table class="wages-table" style="width: 100%; height: 100%" :data="state.tableSource" :row-class-name="tableRowClassName" stripe>
          <el-table-column v-for="col in columns" :prop="col.prop" :key="col.id" :label="col.label" :minWidth="col.minWidth" :width="col.width" :align="col.align || 'center'">
            <template #default="{ row, $index }">
              <template v-if="col.prop == 'source'">
                <el-tag :type="sourceType[row.source]">{{ getCompanyName(row.source) }}</el-tag>
              </template>
              <template v-if="col.prop == 'pic'">
                <el-image
                  style="width: 60px; height: 60px"
                  loading="eager"
                  preview-teleported
                  hide-on-click-modal
                  :src="row.picLoacl"
                  :preview-src-list="[row.picLoacl]"
                  fit="cover" />
              </template>
            </template>
          </el-table-column>

          <template #empty>
            <empty></empty>
          </template>
        </el-table>
      </div>

      <!-- card -->
      <div class="scorll-warp" v-else>
        <div class="card-warp bgc-container p10" v-if="state.tableSource.length">
          <div class="card-item" v-for="item in state.tableSource" :key="item.favors_id" :style="{ boxShadow: state.boxShadow }">
            <div class="img-warp">
              <el-image
                style="width: 80px; height: 100px"
                loading="eager"
                preview-teleported
                hide-on-click-modal
                :src="item.picLoacl"
                :preview-src-list="[item.picLoacl]"
                fit="cover" />
            </div>
            <div class="content-info">
              <div class="row wages-title">
                {{ item.title }}
              </div>
              <div class="row">
                <label class="label mr10">月份:</label>
                {{ item.date }}
              </div>
              <el-tag class="row source" :type="'primary'">
                {{ getCompanyName(item.source) }}
              </el-tag>
              <div class="row money-warp">
                <label class="label mr10">收入:</label>
                <span class="money" v-if="item.money == '******'" :style="{ color: state.themeColor }">0.00</span>
                <CountTo
                  v-else
                  class="money"
                  :style="{ color: state.themeColor }"
                  :startVal="0"
                  :endVal="item.money ? item.money * 1 : 0"
                  :duration="1000"
                  :prefix="''"
                  :suffix="''"
                  :decimals="2"
                  :decimal="'.'"
                  :separator="','"></CountTo>
                <label class="unit">元</label>
              </div>
              <div class="remark-warp row">
                <div class="remark">
                  <label class="label">备注:</label>
                  <div class="value" style="font-size: 12px">{{ item.remark || '---' }}</div>
                </div>
                <el-button class="edit-btn" type="primary" size="small" link @click="handleEdit(item)"><i class="iconfont icon-bianji"></i></el-button>
              </div>
            </div>
          </div>
        </div>
        <div v-else class="content-empty">
          <empty>暂无数据</empty>
        </div>
      </div>
    </div>

    <div class="footer-pagination" :style="{ padding: state.isBottomNav ? '4px 10px' : '14px 10px', height: state.isBottomNav ? '40px' : '60px' }">
      <div class="sum">
        <CountTo :startVal="10000" :endVal="state.sum ? state.sum * 1 : 0" :duration="1000" :prefix="''" :suffix="''" :decimals="2" :decimal="'.'" :separator="','"></CountTo>
        <span style="margin-left: 6px; font-size: 12px">元</span>
      </div>
      <el-pagination
        v-model:current-page="state.page.page"
        v-model:page-size="state.page.size"
        :page-sizes="[20, 30, 50, 100]"
        layout="total,  prev, pager, next"
        :total="state.page.total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange" />
    </div>
    <EditDialog ref="editRef" :refreshCallBack="getListFn" />
  </div>
</template>

<script lang="ts" setup>
import { getDict } from '@/api/system/dict';
import { getWagesList } from '@/api/wages';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { local } from '@/utils/cache';
import { getLightColor } from '@/utils/theme';
import EditDialog from '@/views/wages/editDialog.vue';
import moment from 'moment';
import { reactive, ref, watch } from 'vue';

const editRef = ref<any>();
const pgc = usePGCStore();
const themeColor = ref(pgc.themeColor);

let state = reactive({
  isTable: pgc.isTable,
  themeColor: pgc.themeColor,
  isBottomNav: pgc.isBottomNav,
  boxShadow: '2px 1px 1px' + getLightColor(pgc.themeColor, 0.6),
  bgColor: getLightColor(pgc.themeColor, 0.4),
  loading: false,
  sum: 0,
  form: {
    date: [],
    sDate: '',
    eDate: '',
    source: null
  },
  tableSource: [],
  rules: {},
  page: {
    page: 1,
    size: 30,
    total: 0
  },
  timerObj: {}
});

const userInfo = local.get('userInfo') || {};

const sourceType = {
  0: 'primary',
  1: 'success',
  2: 'info',
  3: 'warning',
  4: 'danger'
};

const columns = [
  { id: 2, label: '收入月份', minWidth: '85px', prop: 'date' },
  { id: 3, label: '收入金额', minWidth: '85px', prop: 'money' },
  { id: 4, label: '工资截图', minWidth: '100px', prop: 'pic' },
  { id: 5, label: '就职于', minWidth: '95px', prop: 'source' }
];

// 设置类名
const tableRowClassName = ({ row, rowIndex }) => {
  if (row.favors_backMoney) return 'back-money';
  else return '';
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

// 获取就职企业下拉框
const getDictFn = () => {
  getDict({ dictType: 'wages_source' }).then(res => {
    state.companyList = res.data;
    if (userInfo?.user?.role_key === 'snow') {
      // state.companyList.forEach((item, index) => {
      //   item.label = '企业' + (index + 1);
      // });
    }
  });
};
getDictFn();

const handleEdit = (row: any) => {
  (editRef.value as any).showDialog('edit', row, state.companyList);
};

// 获取列表
const getListFn = () => {
  state.loading = true;
  let params = {
    source: state.form.source,
    sDate: state.form.date && state.form.date.length ? moment(state.form.date[0]).format('YYYY-MM') : '',
    eDate: state.form.date && state.form.date.length ? moment(state.form.date[1]).format('YYYY-MM') : '',
    page: state.page.page,
    size: state.page.size,
    t: new Date().getTime()
  };
  getWagesList(params)
    .then(res => {
      res.data.forEach((item: { create_time: Date | string }) => {
        item.date = item.date && moment(item.date).format('YYYY-MM');
        item.picLoacl = import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + item.pic : import.meta.env.VITE_PROD_BASE_SERVER + item.pic;
      });
      state.tableSource = res.data;
      state.page.total = res.total;
      state.sum = res.sum && res.sum.toFixed(2);
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

watch(
  () => pgc.themeColor,
  () => {
    themeColor.value = pgc.themeColor;
    state.themeColor = n;
    state.boxShadow = '2px 1px 1px' + getLightColor(n, 0.6);
    state.bgColor = getLightColor(n, 0.4);
  }
);

watch(
  () => pgc.isTable,
  n => {
    state.isTable = n;
  }
);

watch(
  () => pgc.isBottomNav,
  n => {
    state.isBottomNav = n;
  }
);
</script>

<style lang="scss" scoped>
.container-warp {
  height: 100%;
  background-color: var(--contentBgc);
  .form-warp {
    padding: 10px;
    background-color: var(--contentBgc);
    height: 54px;
    border-bottom: 1px solid #eee;
  }
  .favors-content-warp {
    // height: calc(100% - 94px);
    border-left: 1px solid #fff;
    border-right: 1px solid #fff;
    .scorll-warp {
      width: 100%;
      height: 100%;
      overflow-y: auto;
      position: relative;
    }
    .card-warp {
      .card-item {
        background-color: var(--contentBgc);
        margin: 10px 0;
        border-radius: 8px;
        padding: 10px 20px;
        position: relative;
        display: flex;
        align-items: center;
        .img-warp {
          margin-right: 20px;
          width: 80px;
        }
        .content-info {
          width: calc(100% - 100px);
          .row {
            margin: 10px 0;
          }
          .wages-title {
            font-weight: 600;
          }
          .source {
            position: absolute;
            top: -10px;
            right: 0;
            padding: 4px 16px;
            border-top-right-radius: 8px;
            border-bottom-left-radius: 16px;
            border-top-left-radius: 0;
            border-bottom-right-radius: 0;
            font-size: 12px;
          }
          .label {
            font-size: 14px;
            margin-right: 10px;
            color: #999;
          }
          .unit {
            margin-left: 5px;
            font-size: 12px;
          }
          .remark-warp {
            width: 100%;
            display: flex;
            justify-content: space-between;
            .remark {
              display: flex;
              justify-content: flex-start;
              align-items: center;
              width: calc(100% - 22px);
              .label {
                width: 32px;
              }
              .value {
                white-space: nowrap; /* 防止文本换行 */
                overflow: hidden; /* 隐藏溢出的内容 */
                text-overflow: ellipsis; /* 使用省略号表示文本溢出 */
                width: calc(100% - 52px);
              }
            }
            .edit-btn {
              width: 22px;
            }
          }
          .money {
            font-size: 22px;
            font-family: DSDIGI;
          }
        }
      }
      .card-item:first-child {
        margin-top: 0;
      }
      .card-item:last-child {
        margin-bottom: 0px;
      }
    }
  }
  .content-empty {
    width: 100%;
    height: 100%;
    padding: 10px;
    background-color: var(--containerBgc);
    .bgc-content {
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
}

.footer-pagination {
  // height: 40px;
  // padding: 4px 10px;
  border-top: 1px solid #f5f2f0;
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: var(--contentBgc);
  .sum {
    color: v-bind(themeColor);
    font-size: 24px;
    font-weight: 600;
    font-family: DSDIGI;
  }
}
</style>

<style lang="scss">
.form {
  display: flex;
  justify-content: space-around;
  .el-form-item {
    border-radius: 20px;
    margin: 0;
    .el-form-item__content {
      border-radius: 20px;
      .el-select {
        border-radius: 20px;
        .el-select__wrapper {
          border-radius: 20px;
        }
      }
      .el-date-editor {
        border-radius: 20px;
      }
    }
  }
}
.el-table .back-money {
  --el-table-tr-bg-color: #61d8b0ae !important;
}
.favors-content-warp {
  .el-table__header-wrapper {
    position: fixed;
    top: 94px;
    z-index: 100;
  }
  .el-table__body-wrapper {
    margin-top: 56px;
  }
}
.wages-table {
  .cell {
    padding-left: 6px;
    padding-right: 6px;
  }
}
</style>
