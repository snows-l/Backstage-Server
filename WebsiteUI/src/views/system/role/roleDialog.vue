<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-05-30 14:44:32
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-21 08:12:05
 * @FilePath: /webseteUI/WebsiteUI/src/views/system/role/roleDialog.vue
-->
<template>
  <div class="dict-dialog-container-warp">
    <el-dialog :title="state.title" v-model="open" width="60%" :before-close="handleClose">
      <el-tree
        ref="treeRef"
        :data="state.treeData"
        node-key="menu_id"
        :props="state.treeProps"
        empty-text=""
        :show-checkbox="true"
        :check-on-click-node="true"
        :highlight-current="true"
        :default-checked-keys="state.defaultCheckedKeys"
        :default-expanded-keys="state.defaultExpandedKeys">
        <template #default="{ node, data }">
          <i class="iconfont" :class="data.icon" style="margin: 5px 10px 5px 0px"></i>
          <span>{{ data.menu_name }}</span>
        </template>
      </el-tree>

      <template #footer>
        <span>
          <el-button @click="handleClose">取消</el-button>
          <el-button type="primary" @click="handleSubmit">确认</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script lang="ts" setup>
import { getMenuList } from '@/api/system/menu';
import { editAuth } from '@/api/system/role';
import { tranListToTree } from '@/utils/common';
import { ElMessage } from 'element-plus';
import { reactive, ref } from 'vue';

const emits = defineEmits(['refresh']);

const treeRef = ref(null);
let open = ref(false);
const state = reactive({
  title: '权限管理',
  treeProps: {
    label: 'menu_name',
    children: 'children'
  },
  defaultExpandedKeys: [1, 2],
  defaultCheckedKeys: [],
  treeData: [],
  currentRole: {}
});

// 关闭弹窗
const handleClose = () => {
  treeRef.value.setCheckedKeys([]);
  open.value = false;
};

// 提交
const handleSubmit = () => {
  const params = {
    role_id: state.currentRole.role_id,
    menu_ids: treeRef.value.getCheckedKeys().join(',') || ''
  };
  editAuth(params).then(res => {
    if (res.code === 200) {
      ElMessage.success('权限修改成功');
      handleClose();
      emits('refresh');
    }
  });
};

// 打开弹窗
const init = row => {
  state.currentRole = row;
  getMenuList().then(res => {
    const menuTree = res.data.filter(item => item.menu_id != 2);
    state.treeData = tranListToTree(menuTree, 'menu_id', 'parent_id', 'children');
  });
  // 设置默认选中
  state.defaultCheckedKeys = row.menu_ids ? row.menu_ids.split(',') : [];
  open.value = true;
};

defineExpose({
  open,
  init
});
</script>

<style lang="scss" scoped>
.dict-dialog-container-warp {
  .el-form {
    padding: 20px;
  }
  .el-form-item {
    width: 100%;
  }
}

.el-tree-node {
  margin: 5px 0;
}
</style>
