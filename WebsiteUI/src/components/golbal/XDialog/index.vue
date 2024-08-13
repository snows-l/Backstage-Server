<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-05-26 17:35:47
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-29 00:33:49
 * @FilePath: /Website/WebsiteUI/src/components/XDialog/index.vue
-->
<template>
  <div class="x-dialog-container-warp">
    <el-dialog
      v-if="dialogOrDrawer == 'dialog'"
      :style="{ maxWidth: maxWidth ? `${maxWidth}` : 'none', minWidth: minWidth ? `${minWidth}` : 'none' }"
      destroy-on-close
      :title="title"
      v-model="isShowDialog"
      :z-index="zIndex"
      :width="size ? size : '50%'"
      :before-close="beforeClose">
      <slot></slot>
      <template #footer>
        <slot name="footer"></slot>
      </template>
    </el-dialog>

    <el-drawer
      v-if="dialogOrDrawer == 'drawer'"
      :title="title"
      v-model="isShowDialog"
      :style="{ maxWidth: maxWidth ? `${maxWidth}` : 'none', minWidth: minWidth ? `${minWidth}` : 'none' }"
      direction="rtl"
      :z-index="zIndex"
      :size="size ? size : '30%'"
      :before-close="beforeClose"
      :destroy-on-close="true"
      :show-close="true"
      :wrapperClosable="true">
      <slot style="width: calc(100% - 40px)"></slot>
      <template #footer>
        <slot name="footer"></slot>
      </template>
    </el-drawer>
  </div>
</template>

<script lang="ts" setup>
import { usePGCStore } from '@/store/projectGloabalConfig';
import { onMounted, ref, watch } from 'vue';
interface Props {
  // 接口 ==> 是否必传以及类型
  modelValue: boolean;
  btnText?: string;
  title: string;
  beforeClose?: Function;
  beforeOpen?: Function;
  maxWidth?: string;
  minWidth?: string;
  size?: string;
  zIndex?: number;
  [propsName: string]: any;
}

const props = withDefaults(defineProps<Props>(), {
  // 设置默认值（不必传的才设置默认值）
  size: '',
  btnSize: 'small',
  maxWidth: '700px',
  minWidth: '350px'
});

onMounted(() => {});

let PGC;
const dialogOrDrawer = ref<string>();
const themeColor = ref<string>();

// 在store中获取配置
const getConfig = () => {
  PGC = usePGCStore();
  dialogOrDrawer.value = PGC.dialogOrDrawer;
  themeColor.value = PGC.themeColor;
};

const emits = defineEmits(['update:modelValue']);
const isShowDialog = ref(props.modelValue);

watch(
  () => props.modelValue,
  (n, o) => {
    getConfig();
    isShowDialog.value = n;
  },
  { immediate: true }
);

// 打开弹框
const handleShowDialog = () => {
  getConfig(); // 实时获取store中 配置 数据
  if (!!props.beforeOpen) props.beforeOpen();
  else emits('update:modelValue', true);
};

// 关闭弹框
const beforeClose = () => {
  if (!!props.beforeClose) props.beforeClose();
  else emits('update:modelValue', false);
};
</script>

<style lang="scss" scoped>
.x-dialog-container-warp {
  // width: 100%;
  // height: 100%;
  color: v-bind(themeColor);
  :deep(.el-drawer__body) {
    padding: 20px;
    overflow-x: hidden;
    overflow-y: auto;
  }
  :deep(.el-dialog__body) {
    padding: 25px 20px;
    overflow-x: hidden;
    overflow-y: auto;
  }
}
</style>
