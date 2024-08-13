<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 16:51:19
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-16 09:44:52
 * @FilePath: /Website/WebsiteUI/src/viewsMobile/favors/index.vue
-->
<template>
  <div class="container-warp">
    <div class="form-warp">
      <el-form class="form" :model="state.form" ref="form" :rules="state.rules" label-width="0" :inline="true">
        <el-form-item size="">
          <el-input style="min-width: 140px" v-model="state.form.name" placeholder="请输入姓名" @blur="handleSelect"></el-input>
        </el-form-item>
        <el-form-item size="">
          <el-select style="min-width: 140px" v-model="state.form.dictType" placeholder="请选择来往时间点" clearable @change="handleSelect">
            <el-option v-for="item in state.timerList" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>
      </el-form>
    </div>
    <div class="favors-content-warp" v-loading="state.loading" :style="{ height: state.isBottomNav ? 'calc(100% - 94px)' : 'calc(100% - 114px)' }">
      <!-- table -->
      <div class="scorll-warp" v-if="state.isTable">
        <el-table :data="state.tableSource" :row-class-name="tableRowClassName" stripe style="width: 100%; height: 100%">
          <el-table-column v-for="col in columns" :prop="col.prop" :key="col.id" :label="col.label" :minWidth="col.minWidth" :align="col.align || 'center'">
            <template #default="{ row, $index }">
              <template v-if="col.prop == 'favors_timer'">
                <el-tag :type="timerType[row[col.prop]].type || 'info'" :effect="timerType[row[col.prop]].effect || 'light'">
                  {{ state.timerObj[row[col.prop]] }}
                </el-tag>
              </template>

              <template v-if="col.prop == 'favors_backMoney'">
                <div class="favors_backMoney-warp" style="width: 100%; height: 100%; min-height: 24px" @dblclick="handleEdit($index)">
                  <span v-if="row['isEdit']">
                    <el-input style="width: 100%" v-model="row[col.prop]" @blur="handleSubit(row, $index)" :id="'table-input_' + row.favors_id" />
                  </span>
                  <span v-else>{{ row[col.prop] }}</span>
                </div>
              </template>

              <template v-if="col.prop == 'remark'">
                <el-tooltip v-if="row[col.prop]" :content="row[col.prop]" placement="top" effect="dark">
                  <div
                    class="remark-warp"
                    style="height: 30px; line-height: 15px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical">
                    {{ row[col.prop] }}
                  </div>
                </el-tooltip>
                <span v-else>/</span>
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
          <div
            class="card-item"
            v-for="item in state.tableSource"
            :key="item.favors_id"
            :style="{ boxShadow: state.boxShadow, border: item.favors_backMoney ? '2px solid ' + state.themeColor : 'none' }">
            <div class="row-1 row">
              <div class="name">
                {{ item.favors_name }}
              </div>
              <el-tag class="timer" :type="'primary'" :effect="timerType[item.favors_timer].effect || 'light'">
                {{ state.timerObj[item.favors_timer] }}
              </el-tag>
            </div>
            <div class="row-2 row">
              <div class="money-warp">
                <label class="label">金额</label>
                <CountTo
                  class="money"
                  :style="{ color: state.themeColor }"
                  :startVal="0"
                  :endVal="item.favors_money * 1 || 0"
                  :duration="1000"
                  :prefix="''"
                  :suffix="''"
                  :decimals="2"
                  :decimal="'.'"
                  :separator="','"></CountTo>
                <label class="unit">元</label>
              </div>
              <div class="back-money">
                <label class="label">归还</label>
                <CountTo
                  v-if="!item.backMoneys.length"
                  class="money"
                  :style="{ color: state.themeColor }"
                  :startVal="0"
                  :endVal="0"
                  :duration="1500"
                  :prefix="''"
                  :suffix="''"
                  :decimals="2"
                  :decimal="'.'"
                  :separator="','"></CountTo>
                <template v-else>
                  <CountTo
                    v-for="(money, index) in item.backMoneys"
                    :key="index"
                    class="money"
                    :style="{ color: state.themeColor }"
                    style="margin-right: 20px"
                    :startVal="0"
                    :endVal="money * 1 || 0"
                    :duration="1500"
                    :prefix="''"
                    :suffix="''"
                    :decimals="0"
                    :decimal="'.'"
                    :separator="','"></CountTo>
                </template>
                <label class="unit">元</label>
              </div>
            </div>
            <div class="remark-warp row">
              <div class="remark">
                <label class="label">备注</label>
                <div class="value" style="font-size: 12px">{{ item.remark || '---' }}</div>
              </div>
              <el-button class="edit-btn" type="primary" size="small" link @click="handleEditRow(item)"><i class="iconfont icon-bianji"></i></el-button>
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
        :page-sizes="[50, 100, 200, 500]"
        layout="total,  prev, pager, next"
        :total="state.page.total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange" />
    </div>
    <EditDialog ref="editRef" @rereshCallback="getListFn" />
  </div>
</template>

<script lang="ts" setup>
import { editFavors, getFavorsList } from '@/api/favors';
import { getDict } from '@/api/system/dict';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { local } from '@/utils/cache';
import { getLightColor } from '@/utils/theme';
import EditDialog from '@/views/favors/editDialog.vue';
import { ElMessage, ElMessageBox } from 'element-plus';
import { nextTick, reactive, ref, watch } from 'vue';

const pgc = usePGCStore();
const editRef = ref(null);

let state = reactive({
  isTable: pgc.isTable,
  themeColor: pgc.themeColor,
  isBottomNav: pgc.isBottomNav,
  boxShadow: '2px 1px 1px' + getLightColor(pgc.themeColor, 0.6),
  loading: false,
  form: {
    name: '',
    dictType: '2'
  },
  tableSource: [],
  rules: {},
  timerList: [],
  page: {
    page: 1,
    size: 200,
    total: 0
  },
  timerObj: {}
});

const timerType = {
  1: { type: 'primary', effect: 'light' },
  2: { type: 'warning', effect: 'light' },
  3: { type: 'warning', effect: 'light' },
  4: { type: 'info', effect: 'light' }
};

const columns = [
  { id: 1, label: '姓名', minWidth: '80px', prop: 'favors_name', align: 'center' },
  { id: 1, label: '金额', minWidth: '65px', prop: 'favors_money', align: 'center' },
  { id: 1, label: '回礼', minWidth: '65px', prop: 'favors_backMoney', align: 'center' },
  { id: 2, label: '时间点', minWidth: '70px', prop: 'favors_timer' }
];

let userInfo = local.get('userInfo') || {};

// 设置类名
const tableRowClassName = ({ row, rowIndex }) => {
  if (row.favors_backMoney) return 'back-money';
  else return '';
};

// 获取来往时间点下拉框
const getDictFn = () => {
  getDict({ dictType: 'favors_time' }).then(res => {
    state.timerList = res.data;
    state.timerList.forEach(item => {
      state.timerObj[item.value] = item.label;
    });
    // if (userInfo?.user?.role_key === 'snow') {
    //   state.timerList.forEach((item, index) => {
    //     item.label = '时间节点' + (index + 1);
    //     (state as any).timerObj[(item as any).value] = (item as any).label;
    //   });
    // }
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
    size: state.page.size,
    t: new Date().getTime()
  };
  getFavorsList(params)
    .then(res => {
      state.tableSource = res.data;
      state.tableSource.forEach(item => {
        item.backMoneys = item.favors_backMoney ? item.favors_backMoney.split('、') : [];
      });
      // state.tableSource = [];
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

const handleEditRow = row => {
  (editRef.value as any).init('edit', row, state.timerList);
};

// 编辑回礼金额
const handleEdit = i => {
  state.tableSource.forEach(item => {
    item.isEdit = false;
  });
  state.tableSource[i].isEdit = true;
  if (!state.tableSource[i].favors_backMoney) state.tableSource[i].favors_backMoney = '';
  nextTick(() => {
    document.getElementById('table-input_' + state.tableSource[i].favors_id).focus();
  });
};

let isQueruy = false;
const handleSubit = (row, i) => {
  isQueruy = true;
  ElMessageBox.confirm('确认修改吗？', '提示')
    .then(() => {
      state.loading = true;
      state.tableSource[i].isEdit = false;
      editFavors({
        favors_id: row.favors_id,
        favors_backMoney: row.favors_backMoney
      })
        .then(() => {
          state.loading = false;
          ElMessage.success('修改成功');
          getListFn();
        })
        .catch(() => {
          state.loading = false;
          ElMessage.error('修改失败');
        });
    })
    .catch(() => {
      state.tableSource[i].isEdit = false;
      getListFn();
    });
};

watch(
  () => pgc.isTable,
  n => {
    state.isTable = n;
  }
);

watch(
  () => pgc.themeColor,
  n => {
    state.themeColor = n;
    state.boxShadow = '2px 1px 1px' + getLightColor(n, 0.6);
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
  // padding: 0 10px;
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
        .timer {
          position: absolute;
          top: 0px;
          right: 0;
          padding: 4px 16px;
          border-top-right-radius: 8px;
          border-bottom-left-radius: 16px;
          border-top-left-radius: 0;
          border-bottom-right-radius: 0;
          font-size: 12px;
        }
        .row {
          display: flex;
          justify-content: space-between;
          margin: 10px 0;
          .label {
            margin-right: 10px;
            font-size: 14px;
          }
          .unit {
            margin-left: 5px;
            font-size: 12px;
          }
        }
        .row-1 {
          font-size: 16px;
          font-weight: 600;
        }
        .remark-warp {
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
        .row-2 {
          justify-content: flex-start;
          .money-warp {
            margin-right: 30px;
          }
          .money {
            font-size: 22px;
            font-family: DSDIGI;
          }
        }
        .edit-warp {
          display: flex;
          justify-content: flex-end;
          align-items: center;
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
  justify-content: flex-end;
  background-color: var(--contentBgc);
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
.cell {
  width: 100%;
  min-width: 100px;
  height: 100%;
  min-height: 24px;
}
</style>
