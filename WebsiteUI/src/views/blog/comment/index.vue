<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-29 16:04:50
 * @FilePath: /backstage/WebsiteUI/src/views/blog/comment/index.vue
-->
<template>
  <div class="musics-container-warp">
    <div class="select-warp">
      <el-form
        :model="state.form"
        ref="form"
        :rules="state.rules"
        :label-width="state.isMobile ? '0px' : '90px'"
        :inline="true"
        style="display: flex; align-items: center"
        :style="{ justifyContent: state.isMobile ? 'space-around' : 'flex-start' }">
        <el-form-item :label="state.isMobile ? '' : '发布时间:'" :style="{ width: state.isMobile ? '50%' : '' }">
          <el-date-picker
            v-model="state.form.date"
            type="daterange"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            style="width: 200px"
            clearable
            @change="handleSelect" />
        </el-form-item>

        <el-form-item :label="state.isMobile ? '' : '内容:'" :style="{ width: state.isMobile ? '46%' : '' }">
          <el-input v-model="state.form.title" placeholder="请输入内容" style="width: 160px" clearable @change="handleSelect"></el-input>
        </el-form-item>

        <el-form-item style="margin-left: 10px" v-if="!state.isMobile">
          <el-button @click="handleReset">重置</el-button>
          <el-button type="primary" @click="handleSelect">查询</el-button>
        </el-form-item>
      </el-form>
    </div>
    <div class="table-warp">
      <div class="content-top-warp">
        <div class="opertion"></div>
      </div>
      <div class="table-content-container">
        <el-table
          stripe
          :data="state.tableSource"
          row-key="id"
          :default-expand-all="state.isExpandAll"
          :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
          v-loading="state.tableLoading"
          style="width: 100%; height: 100%"
          :size="state.isMobile ? 'small' : ''">
          <el-table-column
            v-for="col in columns"
            :prop="col.prop"
            :key="col.id"
            :label="col.label"
            :minWidth="col.minWidth || null"
            :width="col.width || null"
            :align="col.align || 'center'"
            :fixed="col.fixed || null"
            :row-class-name="tableRowClassName">
            <template #default="{ row }">
              <template v-if="col.prop == 'operation'">
                <el-button :disabled="row.children && row.children.length > 0" :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleDel(row)">
                  删除
                </el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleView(row)">详情</el-button>
              </template>
              <template v-if="col.prop == 'comment' || col.prop == 'websiteUrl'">
                <el-tooltip style="display: inline-block" v-if="row[col.prop]" :content="row[col.prop]" placement="top" effect="dark">
                  <div
                    class="remark-warp"
                    @click="handleView(row)"
                    style="height: 30px; line-height: 15px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical">
                    {{ row[col.prop] }}
                  </div>
                </el-tooltip>
                <span v-else></span>
              </template>

              <template v-else-if="col.prop == 'avatarUrl'">
                <Img :src="row[col.prop] || getQQAvatar(row.qq)" style="width: 40px; height: 40px; border-radius: 50%"></Img>
              </template>

              <template v-else-if="col.prop == 'isPrivacy' || col.prop == 'isEmailFeekback'">
                <el-tag type="success" v-if="row[col.prop] === 1">是</el-tag>
                <el-tag type="danger" v-else>否</el-tag>
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
  </div>
</template>

<script lang="ts" setup>
import { delMsgBoard, getMsgBoardList } from '@/api/msgBoard';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { getQQAvatar, isMobile, tranListToTree } from '@/utils/common';
import { ElMessage, ElMessageBox } from 'element-plus';
import moment from 'moment';
import { onBeforeUnmount, reactive, ref, watch } from 'vue';

const appStore = useAppStore();
const editDialogRef = ref<any>();
const pgc = usePGCStore();
const themeColor = ref(pgc.themeColor);

let state = reactive({
  open: false,
  exportLoading: false,
  downLoading: false,
  isMobile: isMobile(1000),
  form: {
    title: '',
    date: [],
    startTime: null,
    endTime: null
  },
  typeList: [],
  isExpandAll: false,
  page: {
    page: 1,
    size: 20,
    total: 0
  },
  tableSource: [],
  rules: {},
  tableLoading: false,
  currentPlayingMusicId: appStore.currentPlayingMusicId,
  isMusicPlaying: appStore.isMusicPlaying
});

const tagType = {
  1: 'primary',
  2: 'success',
  3: 'info',
  4: 'warning',
  5: 'danger'
};
let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');

const columns = [
  { id: 1, label: 'qq', width: '200px', prop: 'qq', align: 'left' },
  { id: 1, label: '内容', width: '200px', prop: 'comment', align: 'center' },
  { id: 0, label: '文章id', width: '60px', prop: 'articleId', align: 'center' },
  { id: 2, label: '昵称', minWidth: '120px', prop: 'nickName' },
  { id: 5, label: '头像', width: '60px', prop: 'avatarUrl' },
  { id: 5, label: '邮箱', minWidth: '120px', prop: 'email' },
  { id: 5, label: 'IP', minWidth: '120px', prop: 'ip' },
  { id: 5, label: '城市', minWidth: '120px', prop: 'city' },
  { id: 5, label: '网址', minWidth: '120px', prop: 'websiteUrl' },
  { id: 5, label: '是否私密评论', minWidth: '120px', prop: 'isPrivacy' },
  { id: 5, label: '是否邮件通知', minWidth: '120px', prop: 'isEmailFeekback' },
  { id: 5, label: '浏览器', minWidth: '120px', prop: 'browser' },
  { id: 5, label: '操作系统', minWidth: '120px', prop: 'os' },
  { id: 6, label: '更新日期', minWidth: '120px', prop: 'time' },
  { id: 7, label: '操作', minWidth: state.isMobile ? '150px' : '150px', prop: 'operation', fixed: state.isMobile ? null : 'right' }
];

// 设置类名
const tableRowClassName = ({ row, rowIndex }) => {
  if (row.isCurrentMusic) return 'playing-row';
  else return '';
};

// 获取列表
const getMsgBoardListFn = () => {
  state.tableLoading = true;
  let parasms = {
    text: state.form.title,
    page: state.page.page,
    size: state.page.size,
    type: 1,
    startTime: state.form.date && state.form.date[0] ? moment(state.form.date[0]).format('YYYY-MM-DD HH:mm:ss') : null,
    endTime: state.form.date && state.form.date[1] ? moment(state.form.date[1]).format('YYYY-MM-DD HH:mm:ss') : null
  };
  getMsgBoardList(parasms)
    .then((res: any) => {
      state.tableSource = tranListToTree(res.data, 'id', 'pId', 'children');
      state.page.total = res.total || 0;
    })
    .finally(() => {
      state.tableLoading = false;
    });
};
getMsgBoardListFn();

// 查询
const handleSelect = () => {
  state.page.page = 1;
  getMsgBoardListFn();
};

// 重置
const handleReset = () => {
  state.page.page = 1;
  state.form.title = null;
  state.form.date = [];
  state.form.startTime = null;
  state.form.endTime = null;
  state.form.includeFile = false;
  getMsgBoardListFn();
};

// 改变分页
const handleSizeChange = (size: number) => {
  state.page.page = 1;
  state.page.size = size;
  getMsgBoardListFn();
};

// 改变当前页
const handleCurrentChange = (page: number) => {
  state.page.page = page;
  getMsgBoardListFn();
};

// 删除
const handleDel = (row: { id: number }) => {
  ElMessageBox.confirm('确认删除该记录？', '提示').then(() => {
    delMsgBoard(row.id)
      .then(() => {
        ElMessage.success('删除成功');
        getMsgBoardListFn();
      })
      .catch(() => {});
  });
};

const handleView = row => {
  const url = import.meta.env.VITE_BLOG_URL + '/article/detail?id=' + row.articleId;
  window.open(url, '_blank');
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
.musics-container-warp {
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
      height: calc(100% - 68px);
      overflow-y: auto;
    }
    .music-title-warp {
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .music-title-warp:hover {
      color: v-bind(themeColor) !important;
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
:deep(.musics-date-picker) {
  color: red;
}

.is-playing {
  animation: spin 2s linear infinite;
  .img {
    border-width: 4px !important;
    border-color: v-bind(themeColor) !important;
  }
}

.playing-animation {
  position: absolute;
  top: 10px;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}
.remark-warp {
  color: v-bind(themeColor);
  cursor: pointer;
}
</style>
