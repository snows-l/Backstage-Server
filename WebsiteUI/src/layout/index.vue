<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-11-16 11:16:48
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-05 15:51:24
 * @FilePath: /Website/WebsiteUI/src/layout/index.vue
-->
<template>
  <div class="layout-container">
    <!-- header -->
    <HeaderView />
    <div class="layout-slider-content">
      <!-- 侧边栏 菜单 -->
      <SliderMenu class="layout-slider"></SliderMenu>

      <!-- main -->
      <div class="layout-content">
        <!-- 面包屑 -->
        <div v-if="isCrumb" class="crumb-warp">
          <CrumbMenu></CrumbMenu>
        </div>

        <!-- 内容 -->
        <div class="content-out-warp">
          <div class="content-warp-padding">
            <div class="content-container-warp">
              <router-view></router-view>
            </div>
          </div>
        </div>

        <!-- footer -->
        <div v-if="isFooter" class="footer-warp">
          <CustomFooter></CustomFooter>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import CrumbMenu from '@/layout/CrumbMenu/index.vue';
import CustomFooter from '@/layout/CustomFooter/index.vue';
import SliderMenu from '@/layout/SliderMenu/index.vue';
import { usePGCStore } from '@/store/projectGloabalConfig';
import { Ref, ref, watch } from 'vue';
import HeaderView from './Header/index.vue';
const PGC = usePGCStore();

const isCrumb: Ref<boolean> = ref(PGC.isCrumb as any);
const isFooter: Ref<boolean> = ref(PGC.isFooter as any);

let sliderWidth = ref(PGC.isCollapse ? '64px' : '200px');

// 面包屑的高度
const crumbHeight: Ref<string> = ref(isCrumb.value ? '40px' : '0');
// footer的高度
const footerHeight: Ref<string> = ref(isFooter.value ? '40px' : '0');
// 面包屑、footer的高度之和
const notContentHeight: Ref<string> = ref(parseInt(crumbHeight.value) + parseInt(footerHeight.value) + 'px');

watch(
  () => PGC.isCrumb,
  n => {
    isCrumb.value = PGC.isCrumb as any;
    if (n) {
      crumbHeight.value = '40px';
    } else {
      crumbHeight.value = '0';
    }
    notContentHeight.value = parseInt(crumbHeight.value) + parseInt(footerHeight.value) + 'px';
  }
);
watch(
  () => PGC.isFooter,
  n => {
    isFooter.value = PGC.isFooter as any;

    if (n) {
      footerHeight.value = '40px';
    } else {
      footerHeight.value = '0';
    }
    notContentHeight.value = parseInt(crumbHeight.value) + parseInt(footerHeight.value) + 'px';
  }
);
watch(
  () => PGC.isCollapse,
  n => {
    if (n) {
      sliderWidth.value = '64px';
    } else {
      sliderWidth.value = '200px';
    }
  }
);
</script>

<style lang="scss" scoped>
.layout-container {
  width: 100%;
  height: 100%;
  background-color: #f5f2f0;
  overflow: hidden;

  .layout-slider-content {
    height: calc(100% - 62px);
    width: 100%;
    display: flex;
    margin-top: 2px;
    .layout-slider {
      width: v-bind(sliderWidth);
      height: 100%;
      background-color: #fff;
      overflow-x: hidden;
      overflow-y: auto;
      transition: width 0.5s ease-in-out;
    }
    .layout-content {
      flex: 1;
      height: 100%;
      overflow: hidden auto;
      border-left: 1px solid #ccc;
      .crumb-warp {
        height: v-bind(crumbHeight);
        border-bottom: 1px solid #ccc;
      }
      .footer-warp {
        height: v-bind(footerHeight);
      }
      .content-out-warp {
        width: 100%;
        height: calc(100% - (v-bind(notContentHeight)));
        padding: 10px 10px;
        background-color: var(--containerBgc);
        .content-warp-padding {
          width: 100%;
          height: 100%;
          background-color: var(--contentBgc);
          overflow: hidden;
          .content-container-warp {
            width: 100%;
            height: 100%;
            background-color: var(--contentBgc);
            overflow-y: auto;
          }
        }
      }
    }
  }
}
</style>
