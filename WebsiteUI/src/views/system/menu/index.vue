<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-04-25 09:29:06
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-21 08:09:58
 * @FilePath: /webseteUI/WebsiteUI/src/views/system/menu/index.vue
-->
<template>
  <div class="menu-container">
    <div class="select-warp">
      <el-form
        :model="queryParams"
        ref="queryRef"
        :label-width="state.isMobile ? '0px' : '80px'"
        :inline="true"
        style="display: flex; align-items: center"
        :style="{ justifyContent: state.isMobile ? 'space-around' : 'flex-start' }">
        <el-form-item :label="state.isMobile ? '' : '菜单名称:'" :style="{ width: state.isMobile ? '46%' : '' }">
          <el-input v-model="queryParams.menu_name" placeholder="请输入菜单名称" clearable style="width: 160px" @blur="handleQuery" @keyup.enter="handleQuery" />
        </el-form-item>
        <el-form-item :label="state.isMobile ? '' : '状态:'" :style="{ width: state.isMobile ? '50%' : '' }">
          <el-select v-model="queryParams.status" placeholder="菜单状态" clearable style="width: 160px" @change="handleQuery">
            <el-option v-for="dict in statusList" :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
        <el-form-item v-if="!state.isMobile">
          <el-button type="primary" icon="Search" @click="handleQuery">搜索</el-button>
          <el-button icon="Refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="table-warp">
      <el-row :gutter="10" class="mb8" style="margin-bottom: 10px">
        <el-col :span="1.5">
          <el-button type="info" plain icon="Sort" @click="toggleExpandAll">展开/折叠</el-button>
        </el-col>
        <el-col :span="1.5">
          <el-button type="primary" plain icon="Plus" @click="handleAdd">新增</el-button>
        </el-col>
      </el-row>

      <div class="table-content-container">
        <el-table
          stripe
          style="width: 100%; height: 100%"
          v-if="state.refreshTable"
          v-loading="loading"
          :data="menuList"
          row-key="menu_id"
          :default-expand-all="state.isExpandAll"
          :tree-props="{ children: 'children', hasChildren: 'hasChildren' }"
          :size="state.isMobile ? 'small' : 'default'">
          <el-table-column prop="menu_name" label="菜单名称" :show-overflow-tooltip="true" width="160"></el-table-column>
          <el-table-column prop="icon" label="图标" align="center" width="100">
            <template #default="scope">
              <i class="iconfont" :class="scope.row.icon" style="font-size: 20px"></i>
            </template>
          </el-table-column>
          <el-table-column prop="menu_sort" label="排序" width="60" align="center"></el-table-column>
          <el-table-column prop="component" label="组件路径" :show-overflow-tooltip="true"></el-table-column>
          <el-table-column prop="status" label="状态" width="80">
            <template #default="scope">
              <el-tag :type="scope.row.status == 1 ? 'success' : 'warning'">{{ state.statusList.find(item => item.value == scope.row.status).label }}</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="status" label="是否隐藏" width="80">
            <template #default="scope">
              <el-tag :type="scope.row.visible == '1' ? 'success' : 'warning'">{{ state.hiddenList.find(item => item.value == scope.row.status).label }}</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="menu_type" label="菜单类型" align="center" width="100">
            <template #default="scope">
              <!-- <span>{{ state.menuTypeList.find(item => item.value == scope.row.menu_type).label }}</span> -->
              <el-tag effect="plain" :type="scope.row.menu_type == 'M' ? 'primary' : scope.row.menu_type == 'C' ? 'success' : 'info'">
                {{ state.menuTypeList.find(item => item.value == scope.row.menu_type).label }}
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column label="创建时间" align="center" width="160" prop="create_time">
            <template #default="scope">
              <span>{{ parseTime(scope.row.create_time) }}</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center" width="210" class-name="small-padding fixed-width">
            <template #default="scope">
              <el-button :size="state.isMobile ? 'small' : 'default'" v-if="scope.row.parent_id != 0" link type="primary" icon="Edit" @click="handleUpdate(scope.row)">
                修改
              </el-button>
              <el-button :size="state.isMobile ? 'small' : 'default'" link type="primary" icon="Plus" @click="handleAdd(scope.row)">新增</el-button>
              <el-button :size="state.isMobile ? 'small' : 'default'" v-if="scope.row.parent_id != 0" link type="primary" icon="Delete" @click="handleDelete(scope.row)">
                删除
              </el-button>
            </template>
          </el-table-column>

          <template #empty>
            <empty></empty>
          </template>
        </el-table>
      </div>
    </div>

    <!-- 添加或修改菜单对话框 -->
    <div class="dialog-warp">
      <XDialog :title="title" v-model="open" :size="state.isMobile ? '90vw' : '40vw'" :before-close="cancel">
        <el-form ref="menuRef" :model="form" :rules="rules" label-width="100px">
          <el-row>
            <el-col :span="20">
              <el-form-item label="上级菜单">
                <el-tree-select
                  clearable
                  v-model="form.parent_id"
                  :data="menuOptions"
                  :props="{ value: 'menu_id', label: 'menu_name', children: 'children' }"
                  value-key="menu_id"
                  placeholder="选择上级菜单"
                  check-strictly />
              </el-form-item>
            </el-col>
            <el-col :span="16">
              <el-form-item label="菜单类型" prop="menu_type">
                <el-radio-group v-model="form.menu_type" clearable>
                  <el-radio value="M">目录</el-radio>
                  <el-radio value="C">菜单</el-radio>
                  <el-radio value="F">按钮</el-radio>
                </el-radio-group>
              </el-form-item>
            </el-col>
            <el-col :span="20" v-if="form.menu_type != 'F'">
              <el-form-item label="菜单图标" prop="icon">
                <el-popover placement="bottom-start" :width="540" trigger="click">
                  <template #reference>
                    <el-input clearable v-model="form.icon" placeholder="点击选择图标" @blur="showSelectIcon" readonly>
                      <template #prefix>
                        <i v-if="form.icon" class="iconfont" :class="form.icon" style="font-size: 20px"></i>
                        <el-icon v-else style="height: 32px; width: 16px"><search /></el-icon>
                      </template>
                    </el-input>
                  </template>
                  <icon-select ref="iconSelectRef" @selected="selected" :active-icon="form.icon" />
                </el-popover>
              </el-form-item>
            </el-col>
            <el-col :span="16">
              <el-form-item label="菜单名称" prop="menu_name">
                <el-input clearable v-model="form.menu_name" placeholder="请输入菜单名称" />
              </el-form-item>
            </el-col>
            <el-col :span="16">
              <el-form-item label="显示排序" prop="menu_sort">
                <el-input-number style="width: 100%" v-model="form.menu_sort" controls-position="right" :min="0" />
              </el-form-item>
            </el-col>

            <el-col :span="16" v-if="form.menu_type != 'F'">
              <el-form-item prop="path">
                <template #label>
                  <span>
                    <el-tooltip content="访问的路由地址，如：`user`，如外网地址需内链访问则以`http(s)://`开头" placement="top">
                      <el-icon><question-filled /></el-icon>
                    </el-tooltip>
                    路由地址
                  </span>
                </template>
                <el-input v-model="form.path" clearable placeholder="请输入路由地址" />
              </el-form-item>
            </el-col>
            <el-col :span="16" v-if="form.menu_type != 'F'">
              <el-form-item prop="component">
                <template #label>
                  <span>
                    <el-tooltip content="访问的组件路径，如：`system/user/index`，默认在`views`目录下" placement="top">
                      <el-icon><question-filled /></el-icon>
                    </el-tooltip>
                    组件路径
                  </span>
                </template>
                <el-input v-model="form.component" placeholder="请输入组件路径" />
              </el-form-item>
            </el-col>

            <el-col :span="16" v-if="form.menu_type == 'C'">
              <el-form-item>
                <el-input v-model="form.query" clearable placeholder="请输入路由参数" maxlength="255" />
                <template #label>
                  <span>
                    <el-tooltip content='访问路由的默认传递参数，如：`{"id": 1, "name": "ry"}`' placement="top">
                      <el-icon><question-filled /></el-icon>
                    </el-tooltip>
                    路由参数
                  </span>
                </template>
              </el-form-item>
            </el-col>

            <el-col :span="16" v-if="form.menu_type != 'F'">
              <el-form-item>
                <template #label>
                  <span>
                    <el-tooltip content="选择隐藏则路由将不会出现在侧边栏，但仍然可以访问" placement="top">
                      <el-icon><question-filled /></el-icon>
                    </el-tooltip>
                    显示状态
                  </span>
                </template>
                <el-radio-group v-model="form.visible">
                  <el-radio v-for="dict in hiddenList" :key="dict.value" :value="dict.value">{{ dict.label }}</el-radio>
                </el-radio-group>
              </el-form-item>
            </el-col>
            <el-col :span="16">
              <el-form-item>
                <template #label>
                  <span>
                    <el-tooltip content="选择停用则路由将不会出现在侧边栏，也不能被访问" placement="top">
                      <el-icon><question-filled /></el-icon>
                    </el-tooltip>
                    菜单状态
                  </span>
                </template>
                <el-radio-group v-model="form.status">
                  <el-radio v-for="dict in statusList" :key="dict.value" :value="dict.value">{{ dict.label }}</el-radio>
                </el-radio-group>
              </el-form-item>
            </el-col>
          </el-row>
        </el-form>
        <template #footer>
          <div class="dialog-footer">
            <el-button @click="cancel">取 消</el-button>
            <el-button type="primary" @click="submitForm">确 定</el-button>
          </div>
        </template>
      </XDialog>
    </div>
  </div>
</template>

<script setup name="Menu">
import { addMenu, deleteMenu, getMenuList, updateMenu } from '@/api/system/menu';
import { isMobile, parseTime, tranListToTree } from '@/utils/common';
import { ElMessage, ElMessageBox } from 'element-plus';
import { nextTick, onUnmounted, reactive, ref, toRefs } from 'vue';

let menuRef = ref(null);
const iconSelectRef = ref(null);

const state = reactive({
  isMobile: isMobile(1000),
  queryParams: {
    menu_name: '',
    status: ''
  },
  menuList: [],
  statusList: [
    { label: '启用', value: 1 },
    { label: '禁用', value: 0 }
  ],
  hiddenList: [
    { label: '显示', value: 1 },
    { label: '隐藏', value: 0 }
  ],
  menuTypeList: [
    { label: '目录', value: 'M' },
    { label: '菜单', value: 'C' },
    { label: '按钮', value: 'F' }
  ],
  loading: false,
  isExpandAll: true,
  refreshTable: true,
  title: '新增菜单',
  open: false,
  form: {
    menu_id: '',
    parent_id: '',
    menu_type: 'M',
    menu_name: '',
    icon: '',
    menu_sort: 0,
    path: '',
    component: '',
    query: '',
    visible: 1,
    status: 1,
    create_time: '',
    update_time: ''
  },
  rules: {
    menu_name: [{ required: true, message: '请输入菜单名称', trigger: 'blur' }],
    menu_type: [{ required: true, message: '请选择菜单类型', trigger: 'change' }],
    menu_sort: [{ required: true, message: '请输入显示排序', trigger: 'blur' }],
    path: [{ required: true, message: '请输入路由地址', trigger: 'blur' }],
    component: [{ required: true, message: '请输入组件路径', trigger: 'blur' }],
    perms: [{ required: true, message: '请输入权限标识', trigger: 'blur' }],
    query: [{ required: true, message: '请输入路由参数', trigger: 'blur' }],
    visible: [{ required: true, message: '请选择显示状态', trigger: 'change' }],
    status: [{ required: true, message: '请选择菜单状态', trigger: 'change' }]
  },

  menuOptions: []
});
let tableHeight = ref(state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)');
const { queryParams, menuList, loading, isExpandAll, statusList, title, open, form, rules, hiddenList, menuOptions } = toRefs(state);

const showSelectIcon = () => {
  iconSelectRef.value.reset();
};

const selected = icon => {
  form.value.icon = icon;
  iconSelectRef.value.reset();
};

// 关闭弹窗
const cancel = () => {
  state.open = false;
  state.form.menu_id = '';
  state.form.parent_id = '';
  state.form.menu_type = 'M';
  state.form.menu_name = '';
  state.form.icon = '';
  state.form.menu_sort = 0;
  state.form.path = '';
  state.form.component = '';
  state.form.perms = '';
  state.form.query = '';
  state.form.visible = 1;
  state.form.status = 1;
  state.form.create_time = '';
  state.form.update_time = '';
};

const queryRef = ref(null);

const handleQuery = () => {
  loading.value = true;
  getMenuList(queryParams.value)
    .then(res => {
      const menu = res.data.filter(item => item.menu_id != 2);
      menuList.value = tranListToTree(menu, 'menu_id', 'parent_id', 'children');
    })
    .finally(() => {
      loading.value = false;
    });
};

const resetQuery = () => {
  queryParams.value = {
    menu_name: '',
    status: ''
  };
  handleQuery();
};

// 新增
const handleAdd = row => {
  state.title = '新增菜单';
  menuOptions.value = menuList.value;
  form.value.parent_id = (row && row.menu_id) || 1;
  state.open = true;
};

// 修改
const handleUpdate = row => {
  state.title = '修改菜单';
  menuOptions.value = menuList.value;
  form.value = {
    menu_id: row.menu_id,
    parent_id: row.parent_id,
    menu_type: row.menu_type,
    menu_name: row.menu_name,
    icon: row.icon,
    menu_sort: row.menu_sort,
    path: row.path,
    component: row.component,
    perms: row.perms,
    query: row.query,
    visible: row.visible * 1,
    status: row.status * 1,
    create_time: row.create_time,
    update_time: row.update_time
  };
  open.value = true;
};

// 删除
const handleDelete = row => {
  ElMessageBox.confirm('确认删除该菜单？', '提示')
    .then(() => {
      deleteMenu(row.menu_id).then(res => {
        if (res.code === 200) {
          ElMessage.success('删除成功');
          handleQuery();
        }
      });
    })
    .catch(() => {
      ElMessage.info('已取消删除');
    });
};

// 展开收起
const toggleExpandAll = () => {
  state.isExpandAll = !state.isExpandAll;
  state.refreshTable = false;
  nextTick(() => {
    state.refreshTable = true;
  });
};

// 提交表单
const submitForm = () => {
  menuRef.value.validate(valid => {
    if (valid) {
      state.loading = true;
      if (state.title === '新增菜单') {
        addMenu(form.value).then(res => {
          if (res.code === 200) {
            cancel();
            handleQuery();
          }
        });
      } else {
        updateMenu(form.value).then(res => {
          if (res.code === 200) {
            cancel();
            handleQuery();
          }
        });
      }
    }
  });
};
handleQuery();

const resizeCallback = () => {
  state.isMobile = isMobile(1000);
  tableHeight.value = state.isMobile ? 'calc(100% - 82px)' : 'calc(100% - 82px)';
};
window.addEventListener('resize', resizeCallback);

onUnmounted(() => {
  window.removeEventListener('resize', resizeCallback);
});
</script>

<style lang="scss">
.menu-container {
  width: 100%;
  height: 100%;
  background-color: var(--containerBgc);
  .select-warp {
    padding: 10px 10px;
    background-color: var(--contentBgc);
    .el-form-item {
      margin: 10px 0;
      margin-right: 20px;
    }
  }
  .table-warp {
    height: v-bind(tableHeight);
    margin-top: 10px;
    padding: 20px 20px;
    background-color: var(--contentBgc);
    overflow: hidden;
    .table-content-container {
      height: calc(100% - 52px);
      overflow-y: auto;
    }
  }
}
</style>
