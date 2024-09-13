<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-13 17:21:54
 * @FilePath: /backstage/WebsiteUI/src/views/blog/article/list/index.vue
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
        <el-form-item :label="state.isMobile ? '' : '文章类型:'" :style="{ width: state.isMobile ? '50%' : '' }">
          <el-select v-model="state.form.type" placeholder="请选择文章类型" style="width: 160px" clearable @change="handleSelect">
            <el-option v-for="item in state.typeList" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item :label="state.isMobile ? '' : '标题:'" :style="{ width: state.isMobile ? '46%' : '' }">
          <el-input v-model="state.form.title" placeholder="请输入标题" style="width: 160px" clearable @change="handleSelect"></el-input>
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
            :fixed="col.fixed || null"
            :row-class-name="tableRowClassName">
            <template #default="{ row }">
              <template v-if="col.prop == 'operation'">
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleEdit(row)">编辑</el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleDel(row)">删除</el-button>
                <el-button :size="state.isMobile ? 'small' : 'default'" type="primary" link @click="handleView(row)">详情</el-button>
              </template>
              <template v-if="col.prop == 'type'">
                <el-tag :type="tagType[row.type]">{{ state.typeList.find(item => item.value == row.type).label }}</el-tag>
              </template>

              <template v-if="col.prop == 'label'">
                <el-tag style="margin-right: 5px" type="infm" v-for="item in row.labels" :key="item">{{ item }}</el-tag>
              </template>
              <template v-if="col.prop == 'game'">
                <el-tag :type="row.game == 1 ? 'success' : 'danger'">
                  {{ row.game == 1 ? '是' : '否' }}
                </el-tag>
              </template>
              <template v-if="col.prop == 'subTitle' || col.prop == 'title'">
                <el-tooltip v-if="row[col.prop]" :content="row[col.prop]" placement="top" effect="dark">
                  <div
                    v-if="col.prop == 'title'"
                    @click="handleView(row)"
                    class="remark-warp"
                    style="height: 30px; line-height: 15px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical">
                    {{ row[col.prop] }}
                  </div>
                  <div
                    v-else
                    style="height: 30px; line-height: 15px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical">
                    {{ row[col.prop] }}
                  </div>
                </el-tooltip>
                <span v-else></span>
              </template>
              <template v-if="col.prop == 'coverLocal'">
                <div class="cover" style="position: relative; display: flex; align-items: center; justify-content: center">
                  <Img style="width: 90px; height: 65px" preview-teleported hide-on-click-modal :src="row.coverLocal || defaultCover" fit="cover" />
                </div>
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
import { delArticle, getArticleList } from '@/api/article';
import { getDict } from '@/api/system/dict';
import defaultCover from '@/assets/images/default_cover.png';
import router from '@/router';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { isMobile } from '@/utils/common';
import { ElMessage, ElMessageBox } from 'element-plus';
import moment from 'moment';
import { onBeforeUnmount, reactive, ref, watch } from 'vue';

const appStore = useAppStore();
const pgc = usePGCStore();
const themeColor = ref(pgc.themeColor);

interface rowType {
  id: number;
  title: string;
  cover: string;
  coverLocal: string;
  subTitle: string;
  type: number;
  createTime: string;
  updateTime: string;
  label: string;
  isCurrentMusic: boolean;
  labels: string[];
}

let state = reactive({
  open: false,
  exportLoading: false,
  downLoading: false,
  isMobile: isMobile(1000),
  form: {
    title: '',
    type: ''
  },
  typeList: [],
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
  { id: 1, label: '标题', width: '180px', prop: 'title', align: 'center' },
  { id: 2, label: '封面', minWidth: '100px', prop: 'coverLocal' },
  { id: 3, label: '描述', minWidth: '100px', prop: 'subTitle' },
  { id: 4, label: '文章类型', minWidth: '120px', prop: 'type' },
  { id: 9, label: '是否是小游戏', minWidth: '100px', prop: 'game' },
  { id: 8, label: '文章标签', minWidth: '200px', prop: 'label' },
  { id: 5, label: '创建日期', minWidth: '120px', prop: 'createTime' },
  { id: 6, label: '更新日期', minWidth: '120px', prop: 'updateTime' },
  { id: 7, label: '操作', minWidth: state.isMobile ? '195px' : '195px', prop: 'operation', fixed: state.isMobile ? null : 'right' }
];

// 获取歌曲类型列表
getDict({ dictType: 'article_type' }).then(res => {
  state.typeList = res.data;
});

// 设置类名
const tableRowClassName = ({ row, rowIndex }) => {
  if (row.isCurrentMusic) return 'playing-row';
  else return '';
};

// 获取列表
const getArticleListFn = () => {
  state.tableLoading = true;
  let parasms = {
    title: state.form.title,
    type: state.form.type,
    page: state.page.page,
    size: state.page.size
  };
  getArticleList(parasms)
    .then((res: any) => {
      res.data.forEach((item: rowType) => {
        item.createTime = item.createTime && moment(item.createTime).format('YYYY-MM-DD HH:mm:ss');
        item.isCurrentMusic = false;
        item.updateTime = item.updateTime && moment(item.updateTime).format('YYYY-MM-DD HH:mm:ss');
        if (item.cover) {
          item.coverLocal = import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + item.cover : import.meta.env.VITE_PROD_BASE_SERVER + item.cover;
        }
        item.subTitle = item.subTitle.replace(/&#39;/g, "'");
        item.labels = item.labels ? item.labels.split(',') : [];
      });
      state.tableSource = res.data;
      state.page.total = res.total || 0;
    })
    .finally(() => {
      state.tableLoading = false;
    });
};
getArticleListFn();

// 查询
const handleSelect = () => {
  state.page.page = 1;
  getArticleListFn();
};

// 重置
const handleReset = () => {
  state.page.page = 1;
  state.form.title = null;
  state.form.type = null;
  state.form.includeFile = false;
  getArticleListFn();
};

// 改变分页
const handleSizeChange = (size: number) => {
  state.page.page = 1;
  state.page.size = size;
  getArticleListFn();
};

// 改变当前页
const handleCurrentChange = (page: number) => {
  state.page.page = page;
  getArticleListFn();
};

// 新增
const hanldeAdd = () => {
  router.push('/blog/article/write');
};

// 编辑
const handleEdit = (row: any) => {
  router.push({ path: '/blog/article/write', query: { id: row.id } });
};

// 删除
const handleDel = (row: { id: number }) => {
  ElMessageBox.confirm('确认删除该记录？', '提示').then(() => {
    delArticle(row.id)
      .then(() => {
        ElMessage.success('删除成功');
        getArticleListFn();
      })
      .catch(() => {});
  });
};

// 查看
const handleView = row => {
  window.open('http://124.223.41.220/article/detail?id=' + row.id, '_blank');
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
      height: calc(100% - 100px);
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
