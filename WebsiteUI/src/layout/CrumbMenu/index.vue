<!--
 * @Description: ------------ 面包屑 -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-12-04 11:00:39
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-15 16:14:20
 * @FilePath: /Website/WebsiteUI/src/layout/CrumbMenu/index.vue
-->
<template>
  <div class="crumb-warp">
    <el-breadcrumb :separator-icon="ArrowRight">
      <el-breadcrumb-item v-for="item in list" :key="item.path" :to="{ path: item.path }">{{ item.title }}</el-breadcrumb-item>
    </el-breadcrumb>
  </div>
</template>

<script lang="ts" setup>
import { ArrowRight } from '@element-plus/icons-vue';
import { ref, watch } from 'vue';
import { useRoute } from 'vue-router';
const route = useRoute();

// 面包屑列表
const list = ref([
  {
    title: '首页',
    path: '/'
  }
]);

//监听路由变化
watch(
  route,
  to => {
    //每次切换路由时，清空以前的列表，只保留首页
    list.value = [
      {
        title: '首页',
        path: '/'
      }
    ];

    // if (to.fullPath === '/index') return;

    //只有一级菜单，则只添加一次
    if (to.matched[0].children.length === 1) {
      list.value.push({
        title: to.meta.title as string,
        path: to.fullPath
      });
      return;
    } else {
      //有二级菜单
      to.matched.forEach(item => {
        // view 是内容的容器，不用展示
        if (item.path != '')
          list.value.push({
            title: item.meta.title as string,
            path: item.path
          });
      });
    }
  },
  {
    immediate: true
  }
);
</script>

<style lang="scss" scoped>
.crumb-warp {
  width: 100%;
  height: 100%;
  padding: 5px 10px;
  background-color: #fff;
  display: flex;
  align-items: center;
  overflow-x: auto;
  .el-breadcrumb {
    // width: 100%;
    // height: 100%;
  }
}
</style>
