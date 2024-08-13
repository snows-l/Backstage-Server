<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-09-26 15:18:52
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2023-11-30 19:35:46
 * @FilePath: /CMDB/src/pages/test/components/lineCharts/index.vue
-->
<template>
  <div class="line-chart">
    <div :id="'lineChartbox' + code" class="chart-box"></div>
  </div>
</template>

<script setup>
import * as echarts from 'echarts';
import { onMounted, onUnmounted, watch } from 'vue';
const props = defineProps({
  code: {
    type: String,
    default: new Date().getTime()
  },
  name: {
    type: String,
    default: 'cpu使用率'
  },
  color: {
    type: String,
    default: '#4095E5'
  },
  yAxis: {
    type: Array,
    default: () => []
  },
  xAxis: {
    type: Array,
    default: () => []
  }
});

var myChart = null;
const getOptions = () => {
  return {
    grid: {
      left: '6%',
      right: '6%',
      top: '20%',
      bottom: '16%'
    },
    tooltip: {
      trigger: 'item',
      formatter: params => {
        return params.marker + params.name + ': ' + params.value + '%';
      }
    },
    legend: {
      type: 'plain',
      show: true
    },
    title: {
      text: '流量大小趋势'
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: props.xAxis
    },
    yAxis: {
      type: 'value',
      axisLabel: {
        color: '#4e5b5f',
        formatter: function (val) {
          //百分比显示
          return val + ' GB';
        }
      }
    },
    series: [
      {
        name: props.name ? props.name : '',
        data: props.yAxis,
        type: 'line',
        lineStyle: {
          color: props.color
        },
        itemStyle: {
          // 设置线条上点的颜色（和图例的颜色）
          color: props.color
        },
        smooth: true
      }
    ]
  };
};

onMounted(() => {
  var chartDom = document.getElementById('lineChartbox' + props.code);
  myChart = echarts.init(chartDom);
  let options = getOptions();
  myChart.setOption(options);

  window.addEventListener('resize', resetViewCharts);
});
onUnmounted(() => {
  window.removeEventListener('resize', resetViewCharts);
});

const resetViewCharts = () => {
  myChart.resize();
};

watch(
  () => props.yAxis,
  () => {
    let options = getOptions();
    myChart.setOption(options);
  },
  { deep: true }
);
</script>

<style lang="scss" scoped>
.line-chart {
  width: 100%;
  height: 400px;
  background-color: #fff;
  border-radius: 0.1875rem;
  .label {
    margin-bottom: 1rem;
    font-size: 1.125rem;
  }
  .chart-box {
    width: 100%;
    height: 100%;
    min-height: 6.25rem;
  }
}
</style>
