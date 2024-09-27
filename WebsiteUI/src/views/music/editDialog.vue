<template>
  <div class="dict-dialog-container-warp">
    <XDialog :title="state.title" v-model="open" :before-close="handleClose" :size="isMobile ? '90vw' : '40vw'" :style="{ width: isMobile ? '90vw' : '50vw' }">
      <el-form :model="state.itemRecord" ref="formRef" :rules="rules" label-width="120px" :inline="true">
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="歌名：" prop="title" style="width: 100%">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.title" placeholder="请输入歌名"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="歌曲类型：" prop="type" style="width: 100%">
              <el-select v-model="state.itemRecord.type" placeholder="请选择歌曲类型" style="width: 80%" clearable>
                <el-option v-for="item in state.typeList" :key="item.value" :label="item.label" :value="item.value"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="歌手：" prop="artist" style="width: 100%">
              <el-input style="width: 80%" clearable v-model="state.itemRecord.artist" placeholder="请输入歌手"></el-input>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="封面：" prop="coverLocal" style="width: 100%">
              <el-upload class="avatar-uploader" :show-file-list="false" :before-upload="beforeUpload" :http-request="handleUpload" :on-remove="handleRemove">
                <img :src="state.itemRecord.coverLocal || defaultCover" class="avatar" />
              </el-upload>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col>
            <el-form-item label="歌曲：" prop="musicList" style="width: 100%">
              <el-upload
                v-model:file-list="state.itemRecord.musicList"
                class="pm3-uploader"
                accept=".mp3"
                :before-upload="beforeUploadMp3"
                :http-request="handleUploadMp3"
                :on-remove="handleRemoveMp3">
                <el-button type="primary">上传</el-button>
                <template #tip>
                  <div class="el-upload__tip">只能上传.mp3格式的文件.</div>
                </template>
              </el-upload>
            </el-form-item>
          </el-col>
        </el-row>

        <el-row :gutter="20">
          <el-col>
            <el-form-item label="备注：" prop="remark" style="width: 100%">
              <el-input type="textarea" :rows="4" clearable style="width: 80%" placeholder="请输入备注" v-model="state.itemRecord.remark"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>

      <template #footer>
        <span>
          <el-button @click="handleClose">取消</el-button>
          <el-button type="primary" @click="handleSubmit">确认</el-button>
        </span>
      </template>
    </XDialog>
  </div>
</template>

<script lang="ts" setup>
import { uploadFile } from '@/api/common';
import { addMusic, editMusic } from '@/api/musics';
import defaultCover from '@/assets/images/default_cover.png';
import { ElMessage, ElMessageBox } from 'element-plus';
import moment from 'moment';
import { reactive, ref } from 'vue';

const props = defineProps({
  isMobile: {
    type: Boolean,
    default: false
  },

  refreshCallBack: Function
});

let formRef = ref(null);
let open = ref(false);
const state = reactive({
  title: '新增',
  type: 'add',
  typeList: [],
  itemRecord: {
    title: '',
    cover: '',
    artist: '',
    src: '',
    coverLocal: '',
    musicList: [],
    remark: ''
  }
});

const rules = {
  title: [{ required: true, message: '请输入收标题', trigger: 'blur' }],
  type: [{ required: true, message: '请选择歌曲类型', trigger: 'change' }],
  musicList: [{ required: true, message: '请上传歌曲', trigger: 'change' }]
};

const handleUpload = (file: any) => {
  let name = file.file.name && file.file.name.split('.')[0];
  uploadFile(file.file, '/imgs/musics', name).then(res => {
    state.itemRecord.coverLocal =
      import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + res.data.path : import.meta.env.VITE_PROD_BASE_SERVER + res.data.path;
    state.itemRecord.cover = res.data.path;
  });
};

const handleRemove = () => {
  state.itemRecord.coverLocal = '';
  state.itemRecord.cover = '';
};

const beforeUpload = (file: any) => {
  if (file.type !== 'image/jpeg' && file.type !== 'image/png' && file.type !== 'image/jpg') {
    ElMessage.error('请上传jpeg, jpg, png格式的图片!');
    return false;
  } else if (file.size / 1024 / 1024 > 10) {
    ElMessage.error('附件不能大于10M!');
    return false;
  }
  return true;
};

const beforeUploadMp3 = (file: any) => {
  // 后缀
  let suffix = file.name && file.name.split('.')[1];
  if (suffix !== 'mp3') {
    ElMessage.error('请上传.mp3格式的音频文件!');
    return false;
  }
  return true;
};

const handleUploadMp3 = (file: any) => {
  let name = file.file.name && file.file.name.split('.')[0];
  uploadFile(file.file, '/mp3', name).then(res => {
    state.itemRecord.musicList = [{ ...file.file, name: file.file.name, url: res.data.path }];
    state.itemRecord.src = res.data.path;
  });
};

const handleRemoveMp3 = () => {
  state.itemRecord.musicList = [];
  state.itemRecord.src = '';
};

// 关闭弹窗
const handleClose = () => {
  state.itemRecord = {
    title: '',
    cover: '',
    artist: '',
    src: '',
    coverLocal: '',
    musicList: [],
    remark: ''
  };
  open.value = false;
};

// 新增
const add = () => {
  addMusic({ ...state.itemRecord, date: moment(state.itemRecord.date).format('YYYY-MM') }).then(() => {
    ElMessage.success('新增成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 修改
const edit = () => {
  editMusic({ ...state.itemRecord, date: moment(state.itemRecord.date).format('YYYY-MM') }).then(() => {
    ElMessage.success('修改成功');
    handleClose();
    props.refreshCallBack && props.refreshCallBack();
  });
};

// 提交
const handleSubmit = () => {
  let tipText = state.type === 'add' ? '确认新增嘛？' : '确认修改嘛？';
  (formRef.value as any).validate((valid: any) => {
    if (valid) {
      ElMessageBox.confirm(tipText, '提示').then(() => {
        state.type === 'add' ? add() : edit();
      });
    }
  });
};

// 打开弹窗
const showDialog = (type: string, row, typeList) => {
  state.title = type == 'add' ? '新增音乐' : '修改音乐';
  state.type = type;
  state.typeList = typeList;

  if (type == 'add') {
    if (row) {
      state.itemRecord = {
        title: '',
        artist: '',
        musicList: [],
        cover: '',
        coverLocal: '',
        remark: ''
      };
    }
  } else {
    state.itemRecord = Object.assign({}, row);
    let suffix = state.itemRecord.src && state.itemRecord.src.split('.')[1];
    if (state.itemRecord.coverLocal) {
      state.itemRecord.coverLocal =
        import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + state.itemRecord.cover : import.meta.env.VITE_PROD_BASE_SERVER + state.itemRecord.cover;
    }
    state.itemRecord.musicList = [
      {
        name: row.title + '.' + suffix,
        url: row.src
      }
    ];
    import.meta.env.VITE_CURRENT_ENV == 'dev' ? import.meta.env.VITE_DEV_BASE_SERVER + state.itemRecord.cover : import.meta.env.VITE_PROD_BASE_SERVER + state.itemRecord.cover;
  }
  open.value = true;
};

defineExpose({
  open,
  showDialog
});
</script>

<style lang="scss" scoped>
.avatar-uploader .avatar {
  width: 178px;
  height: 178px;
  display: block;
}
</style>

<style>
.avatar-uploader .el-upload {
  border: 1px dashed var(--el-border-color);
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  transition: var(--el-transition-duration-fast);
}

.avatar-uploader .el-upload:hover {
  border-color: var(--el-color-primary);
}

.el-icon.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 178px;
  height: 178px;
  text-align: center;
}
</style>
