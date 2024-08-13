<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-05-31 10:03:13
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-09 09:43:25
 * @FilePath: /Website/WebsiteUI/src/components/ProjectConfigDialog/index.vue
-->
<template>
  <div class="trrigger" @click="handleConfig">
    <slot v-if="slots.default"></slot>
    <el-icon v-else @click="handleConfig"><Tools /></el-icon>
  </div>
  <el-drawer
    title="项目全局配置"
    v-model="configVisible"
    direction="rtl"
    :append-to-body="true"
    :size="isMobileFlag ? '90vw' : '40%'"
    style="max-width: 400px"
    :before-close="hanldeCloseConfigDrawer"
    :destroy-on-close="true"
    :show-close="true"
    :wrapperClosable="true">
    <el-form style="padding: 30px" :model="configForm" ref="configFormRef" :rules="rules">
      <el-form-item label="弹框布局:" prop="dialogOrDrawer">
        <el-radio-group v-model="configForm.dialogOrDrawer">
          <el-radio value="dialog">弹窗</el-radio>
          <el-radio value="drawer">抽屉</el-radio>
        </el-radio-group>
      </el-form-item>

      <el-form-item label="主题色:" prop="themeColor">
        <el-color-picker v-model="configForm.themeColor" />
      </el-form-item>
      <div class="mobile-warp">
        <div class="mobile-title">PC端</div>
        <el-form-item label="是否展示面包屑:" prop="isCrumb">
          <el-switch v-model="configForm.isCrumb"></el-switch>
        </el-form-item>

        <el-form-item label="是否展示Footer:" prop="isFooter">
          <el-switch v-model="configForm.isFooter"></el-switch>
        </el-form-item>

        <el-form-item label="是否展示头部时间:" prop="isShowLayoutTime">
          <el-switch v-model="configForm.isShowLayoutTime"></el-switch>
        </el-form-item>
      </div>

      <div class="mobile-warp">
        <div class="mobile-title">移动端</div>
        <el-form-item label="移动端布局:" prop="isTable">
          <el-radio-group v-model="configForm.isTable">
            <el-radio :value="true">表格</el-radio>
            <el-radio :value="false">卡片</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="是否在底部显示导航栏:" prop="isBottomNav">
          <el-switch v-model="configForm.isBottomNav"></el-switch>
        </el-form-item>
      </div>
    </el-form>

    <template #footer>
      <el-button type="info" @click="configVisible = false">取 消</el-button>
      <el-button type="primary" @click="handleSubmitConfig">确 认</el-button>
    </template>
  </el-drawer>
</template>

<script lang="ts" setup>
import { updateProjectConfig } from '@/api/common';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { getToken } from '@/utils/auth';
import { isMobile } from '@/utils/common';
import { handleThemeStyle } from '@/utils/theme';
import { ElMessage } from 'element-plus';
import { onBeforeUnmount, reactive, ref } from 'vue';

const slots = defineSlots();
const emits = defineEmits(['successCallback']);
/**
 * 项目配置
 *
 */
const PGC = usePGCStore();
const configVisible = ref<boolean>(false);
const configFormRef = ref<Element>();
let isMobileFlag = ref(isMobile(1000));
const configForm = reactive({
  dialogOrDrawer: '',
  themeColor: '',
  isCrumb: null,
  isFooter: null,
  isShowLayoutTime: null,
  isTable: null,
  isBottomNav: null
});

const rules = reactive({
  dialogOrDrawer: [{ required: true, message: '请选择弹框方式', trigger: 'change' }],
  themeColor: [{ required: true, message: '请选择主题颜色', trigger: 'change' }],
  isCrumb: [{ required: true, message: '请选择是否展示面包屑', trigger: 'change' }],
  isFooter: [{ required: true, message: '请选择是否展示面包屑', trigger: 'change' }],
  isShowLayoutTime: [{ required: true, message: '请选择是否展示头部时间', trigger: 'change' }],
  isTable: [{ required: true, message: '请选择移动端布局', trigger: 'change' }],
  isBottomNav: [{ required: true, message: '请选择移动端导航栏位置', trigger: 'change' }]
});

// 打开
const handleConfig = () => {
  configForm.dialogOrDrawer = PGC.dialogOrDrawer || 'dialog';
  configForm.themeColor = PGC.themeColor || '#eee';
  configForm.isCrumb = PGC.isCrumb as any;
  configForm.isFooter = PGC.isFooter as any;
  configForm.isShowLayoutTime = PGC.isShowLayoutTime as any;
  configForm.isTable = (PGC.isTable as any) || false;
  configForm.isBottomNav = (PGC.isBottomNav as any) || false;
  configVisible.value = true;
};
// 关闭
const hanldeCloseConfigDrawer = () => {
  configVisible.value = false;
};

// 提交项目配置
const handleSubmitConfig = () => {
  handleThemeStyle(configForm.themeColor);
  PGC.updateConfig(configForm);
  if (!getToken()) {
    ElMessage.success('配置成功');
  } else {
    let params = {
      appconfig: JSON.stringify(configForm)
    };
    updateProjectConfig(params)
      .then(res => {
        ElMessage.success('配置同步成功');
        emits('successCallback');
      })
      .catch(err => {
        // ElMessage.error('配置同步失败');
      });
  }
  hanldeCloseConfigDrawer();
};

const resizeCallback = () => {
  isMobileFlag.value = isMobile(1000);
};
window.addEventListener('resize', resizeCallback);

onBeforeUnmount(() => {
  window.removeEventListener('resize', resizeCallback);
});
</script>

<style lang="scss" scoped>
.el-form-item {
  display: flex;
  align-items: center;
  justify-content: space-between;
  :deep(.el-form-item__content) {
    flex: none;
  }
}
.mobile-title {
  margin: 30px 0 10px 0;
  font-size: 16px;
  font-weight: bold;
  color: #333;
}
</style>
