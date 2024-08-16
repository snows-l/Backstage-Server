<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 14:55:27
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-31 19:57:55
 * @FilePath: /webseteUI/WebsiteUI/src/views/music/index.vue
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
        <el-form-item :label="state.isMobile ? '' : '歌曲类型:'" :style="{ width: state.isMobile ? '50%' : '' }">
          <el-select v-model="state.form.type" placeholder="请选择歌曲类型" style="width: 160px" clearable @change="handleSelect">
            <el-option v-for="item in state.typeList" :key="item.value" :label="item.label" :value="item.value"></el-option>
          </el-select>
        </el-form-item>

        <el-form-item :label="state.isMobile ? '' : '歌名:'" :style="{ width: state.isMobile ? '46%' : '' }">
          <el-input v-model="state.form.title" placeholder="请输入歌名" style="width: 160px" clearable @change="handleSelect"></el-input>
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
                <el-button
                  :size="state.isMobile ? 'small' : 'default'"
                  type="primary"
                  :disabled="state.downLoading"
                  v-loading="state.downLoading"
                  link
                  @click="handleDownload(row)">
                  下载
                </el-button>
              </template>
              <template v-if="col.prop == 'title'">
                <div class="music-title-warp" @click="handlePlay(row)" :style="{ cursor: 'pointer', color: getLightColor(themeColor, 0.5) }">
                  <span>{{ row[col.prop] }}</span>
                  <i style="font-size: 20px; margin-left: 10px" class="iconfont icon-bofang"></i>
                  <span style="margin-left: 10px; font-size: 12px" v-if="row.isCurrentMusic">☑️</span>
                  <img
                    v-if="row.isCurrentMusic && state.isMusicPlaying"
                    style="width: 40px; height: 40px; margin-left: 10px; border-radius: 50%"
                    :src="playingGif"
                    alt=""
                    sizes=""
                    srcset="" />
                </div>
              </template>
              <template v-if="col.prop == 'type'">
                <el-tag :type="tagType[row.type]">{{ state.typeList.find(item => item.value == row.type).label }}</el-tag>
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
              <template v-if="col.prop == 'coverLocal'">
                <div class="cover" style="position: relative; display: flex; align-items: center; justify-content: center">
                  <el-image
                    :class="{ 'is-playing': row.isCurrentMusic && state.isMusicPlaying }"
                    style="width: 60px; height: 60px; border-radius: 50%"
                    loading="eager"
                    preview-teleported
                    hide-on-click-modal
                    :src="row.coverLocal || defaultCover"
                    :preview-src-list="[row.coverLocal || defaultCover]"
                    fit="cover" />
                  <!-- <div style="transform: scale(0.5)" class="playing-animation">
                    <PlayingAnimation v-show="row.isCurrentMusic && state.isMusicPlaying" style="height: 60px" />
                  </div> -->
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
    <EditDialog ref="editRef" :refreshCallBack="refreshCallBack" :is-mobile="state.isMobile" />
  </div>
</template>

<script lang="ts" setup>
import { delMusic, getMusicList } from '@/api/musics';
import { getDict } from '@/api/system/dict';
import defaultCover from '@/assets/images/default_cover.png';
import playingGif from '@/assets/images/playing1.gif';
import $bus from '@/bus';
// import PlayingAnimation from '@/components/golbal/musicPlayer/playingAnimation.vue';
import { useAppStore } from '@/store/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { isMobile } from '@/utils/common';
import { getLightColor } from '@/utils/theme';
import { ElMessage, ElMessageBox } from 'element-plus';
import moment from 'moment';
import { onBeforeUnmount, reactive, ref, watch } from 'vue';
import EditDialog from './editDialog.vue';

const appStore = useAppStore();
const pgc = usePGCStore();
const themeColor = ref(pgc.themeColor);

let state = reactive({
  open: false,
  exportLoading: false,
  downLoading: false,
  isMobile: isMobile(1000),
  form: {
    title: '',
    type: '',
    includeFile: false
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
  { id: 0, label: 'ID', width: '60px', prop: 'id', align: 'center' },
  { id: 1, label: '歌名', width: '180px', prop: 'title', align: 'center' },
  { id: 4, label: '封面', minWidth: '100px', prop: 'coverLocal' },
  { id: 2, label: '歌手', minWidth: '100px', prop: 'artist' },
  { id: 2, label: '歌曲类型', minWidth: '120px', prop: 'type' },
  { id: 2, label: '上传人', minWidth: '100px', prop: 'cretor' },
  { id: 5, label: '歌曲地址', minWidth: '200px', prop: 'src' },
  { id: 6, label: '创建日期', minWidth: '120px', prop: 'create_time' },
  { id: 6, label: '更新日期', minWidth: '120px', prop: 'update_time' },
  { id: 7, label: '备注', minWidth: '120px', prop: 'remark' },
  { id: 8, label: '操作', minWidth: state.isMobile ? '150px' : '150px', prop: 'operation', fixed: state.isMobile ? null : 'right' }
];

// 获取歌曲类型列表
getDict({ dictType: 'music_type' }).then(res => {
  state.typeList = res.data;
});

// 设置类名
const tableRowClassName = ({ row, rowIndex }) => {
  if (row.isCurrentMusic) return 'playing-row';
  else return '';
};

// 获取列表
const getMusicListFn = () => {
  state.tableLoading = true;
  let parasms = {
    title: state.form.title,
    type: state.form.type,
    page: state.page.page,
    size: state.page.size
  };
  getMusicList(parasms)
    .then((res: any) => {
      res.data.forEach((item: { create_time: Date | string }) => {
        item.create_time = item.create_time && moment(item.create_time).format('YYYY-MM-DD HH:mm:ss');
        item.isCurrentMusic = false;
        item.updat_time = item.updat_time && moment(item.updat_time).format('YYYY-MM-DD HH:mm:ss');
        if (item.cover) {
          item.coverLocal = import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + item.cover : import.meta.env.VITE_PROD_BASE_SERVER + item.cover;
        }
      });
      state.tableSource = res.data;
      if (state.currentPlayingMusicId) {
        state.tableSource.forEach(item => {
          if (item.id === state.currentPlayingMusicId) {
            item.isCurrentMusic = true;
          }
        });
      }
      state.page.total = res.total || 0;
    })
    .finally(() => {
      state.tableLoading = false;
    });
};
getMusicListFn();

// 查询
const handleSelect = () => {
  state.page.page = 1;
  getMusicListFn();
};

// 重置
const handleReset = () => {
  state.page.page = 1;
  state.form.title = null;
  state.form.type = null;
  state.form.includeFile = false;
  getMusicListFn();
};

// 改变分页
const handleSizeChange = (size: number) => {
  state.page.page = 1;
  state.page.size = size;
  getMusicListFn();
};

// 改变当前页
const handleCurrentChange = (page: number) => {
  state.page.page = page;
  getMusicListFn();
};

let editRef = ref(null);
const hanldeAdd = (row: { dictType: any }) => {
  (editRef.value as any).showDialog('add', row ? row : null, state.typeList);
};

const handleEdit = (row: any) => {
  (editRef.value as any).showDialog('edit', row, state.typeList);
};

const handleDel = (row: { id: number }) => {
  ElMessageBox.confirm('确认删除该记录？', '提示').then(() => {
    delMusic(row.id)
      .then(() => {
        ElMessage.success('删除成功');
        getMusicListFn();
        $bus.emit('refreshMusicList');
      })
      .catch(() => {});
  });
};

// 下载
const handleDownload = ({ src, title }) => {
  state.downLoading = true;
  let url = import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + src : import.meta.env.VITE_PROD_BASE_SERVER + src;
  const x = new XMLHttpRequest();
  x.open('GET', url, true);
  x.responseType = 'blob';
  x.onload = function () {
    const url = window.URL.createObjectURL(x.response);
    const elink = document.createElement('a');
    elink.href = url;
    elink.target = '_self'; // 当前也 target打开新页面
    elink.setAttribute('download', title + '.mp3');
    elink.style.display = 'none';
    document.body.appendChild(elink);
    elink.click();
    document.body.removeChild(elink);
    state.downLoading = false;
  };
  x.send();
};

// 刷新回调
const refreshCallBack = () => {
  getMusicListFn();
  $bus.emit('refreshMusicList');
};

// 播放音乐
const handlePlay = row => {
  $bus.emit('playMusic', { id: row.id, type: state.form.type });
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

watch(
  () => appStore.isMusicPlaying,
  n => {
    state.isMusicPlaying = n;
  },
  { immediate: true }
);

watch(
  () => appStore.currentPlayingMusicId,
  id => {
    state.currentPlayingMusicId = id;
    state.tableSource.forEach(item => {
      if (item.id === id) {
        item.isCurrentMusic = true;
      } else {
        item.isCurrentMusic = false;
      }
    });
  },
  { immediate: true }
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
</style>
