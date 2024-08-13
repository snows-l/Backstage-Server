<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 16:51:19
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-15 15:47:22
 * @FilePath: /Website/WebsiteUI/src/viewsMobile/logs/index.vue
-->
<template>
  <div class="container-warp">
    <div class="form-warp">
      <el-form class="form" :model="state.form" ref="form" :rules="state.rules" label-width="0" :inline="true">
        <el-form-item size="">
          <el-input style="width: 180px" v-model="state.form.username" placeholder="请输入登录账号" clearable @blur="handleSelect"></el-input>
        </el-form-item>
        <el-form-item size="">
          <el-input style="width: 180px" v-model="state.form.city" placeholder="请输入登录地点" clearable @blur="handleSelect"></el-input>
        </el-form-item>
      </el-form>
    </div>
    <div class="favors-content-warp" v-loading="state.loading" :style="{ height: state.isBottomNav ? 'calc(100% - 94px)' : 'calc(100% - 114px)' }">
      <!-- table -->
      <div class="scorll-warp" v-if="state.isTable">
        <el-table class="wages-table" :data="state.tableSource" stripe style="width: 100%; height: 100%">
          <el-table-column v-for="col in columns" :prop="col.prop" :key="col.id" :label="col.label" :minWidth="col.minWidth" :width="col.width" :align="col.align || 'center'">
            <template #default="{ row, $index }">
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
          <div class="card-item" v-for="item in state.tableSource" :key="item.id" :style="{ boxShadow: state.boxShadow }">
            <div class="username row">
              <div class="label">登录账号</div>
              <div class="value">{{ item.username }}</div>
            </div>
            <div class="ip row">
              <div class="label">登录IP</div>
              <div class="value">{{ item.ip }}</div>
            </div>
            <div class="city row">
              <div class="label">登录地点</div>
              <div class="value">{{ item.city }}</div>
            </div>
            <div class="os row">
              <div class="label">操作系统</div>
              <div class="value">{{ item.os }}</div>
            </div>
            <div class="browser row">
              <div class="label">浏览器/版本号</div>
              <div class="value">{{ item.browser }}</div>
            </div>
            <div class="browser row">
              <div class="label">登录时间</div>
              <div class="value">{{ parseTime(item.create_time) || '' }}</div>
            </div>
          </div>
        </div>
        <div v-else class="content-empty">
          <empty>暂无数据</empty>
        </div>
      </div>
    </div>

    <div class="footer-pagination" :style="{ padding: state.isBottomNav ? '4px 10px' : '14px 10px', height: state.isBottomNav ? '40px' : '60px' }">
      <el-pagination
        v-model:current-page="state.page.page"
        v-model:page-size="state.page.size"
        :page-sizes="[20, 30, 50, 100]"
        layout="total,  prev, pager, next"
        :total="state.page.total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange" />
    </div>
  </div>
</template>

<script lang="ts" setup>
import { getLogsList } from '@/api/logs';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { local } from '@/utils/cache';
import { parseTime } from '@/utils/common';
import { getLightColor } from '@/utils/theme';
import { reactive, ref, watch } from 'vue';

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
    username: '',
    city: ''
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

const userInfo = local.get('USER_INFO') || {};

const sourceType = {
  0: 'primary',
  1: 'success',
  2: 'info',
  3: 'warning',
  4: 'danger'
};

const columns = [
  { id: 2, label: '登录账号', minWidth: '85px', prop: 'username' },
  { id: 3, label: '登录IP', minWidth: '85px', prop: 'ip' },
  { id: 4, label: '登录地点', minWidth: '100px', prop: 'city' },
  { id: 5, label: '操作系统', minWidth: '95px', prop: 'os' }
];

// 获取列表
const getListFn = () => {
  state.loading = true;
  let params = {
    username: state.form.username,
    city: state.form.city,
    page: state.page.page,
    size: state.page.size,
    t: new Date().getTime()
  };
  getLogsList(params)
    .then(res => {
      // res.data.forEach(item => {
      //   item.createTime = moment(item.create_time).format('YYYY-MM-DD HH:mm:ss');
      // });
      state.tableSource = res.data;
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
    border-left: 1px solid #fff;
    border-right: 1px solid #fff;
    // height: calc(100% - 94px);
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

        .row {
          padding: 8px 0;
          display: flex;
          justify-content: space-between;
          align-items: center;
          border-bottom: 1px solid #eee;
          .label {
            color: #666;
            font-size: 14px;
            font-weight: 500;
          }
          .value {
            color: #333;
            font-size: 16px;
            font-weight: 500;
          }
        }
        .row:last-child {
          border-bottom: none;
        }
      }
      .card-item:first-child {
        margin-top: 0;
      }
      .card-item:last-child {
        margin-bottom: 0px;
      }
    }
    .table-warp {
      .wages-table {
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0;
        .cell {
          padding: 10px;
          border-bottom: 1px solid #eee;
          text-align: center;
          .back-money {
            color: #61d8b0;
            font-size: 16px;
            font-weight: 600;
          }
        }
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
  height: 40px;
  border-top: 1px solid #f5f2f0;
  // padding: 4px 10px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
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
      .el-input {
        border-radius: 20px;
        .el-input__wrapper {
          border-radius: 20px;
        }
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
