<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-02 16:05:38
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-05 10:14:02
 * @FilePath: /Website/WebsiteUI/src/views/baseView/home/components/LineChart.vue
-->
<template>
  <div class="line-chart-warp">
    <div id="line" class="line-chart"></div>
  </div>
</template>

<script lang="ts" setup>
import * as echarts from 'echarts';
import { onMounted, watch } from 'vue';
const props = defineProps({
  color: {
    type: Array,
    default: () => ['#5470C6']
  },
  // 总量
  xAxis: {
    type: Array,
    default: () => []
  },
  series: {
    type: Array,
    default: () => []
  }
});

let myChart: echarts.ECharts | null = null;

const getOptions = () => {
  return {
    color: props.color,
    tooltip: {
      show: true,
      trigger: 'axis',
      formatter: (params: any) => {
        return params[0].name + '<br/>' + params[0].marker + ' 收入：' + params[0].value + ' 元';
      }
    },
    legend: {
      show: true,
      data: ['收入'],
      left: 10
    },
    grid: {
      left: '16%',
      right: '4%',
      top: '18%',
      bottom: '18%'
    },
    xAxis: {
      type: 'category',
      data: props.xAxis,
      axisLabel: {
        show: true, // 显示标签
        position: 'bottom', // 标签位置
        verticalAlign: 'middle', // 垂直对齐方式
        align: 'center', // 水平对齐方式
        margin: 30, // 标签与轴线之间的距离
        distance: 20,
        rotate: 70
      }
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        name: '收入',
        data: props.series,
        type: 'bar',
        barWidth: '15',
        smooth: true,
        label: {
          show: true, // 显示标签
          position: 'insideTop', // 标签位置
          // verticalAlign: 'middle', // 垂直对齐方式
          align: 'center', // 水平对齐方式
          distance: -30, // 标签与轴线的距离
          rotate: 70,
          formatter: '{c} 元' // {c} 表示数据值
        }
      }
    ]
  };
};

const renderChart = () => {
  let options = getOptions();
  myChart && myChart.setOption(options, true);
};

const resize = () => {
  myChart && myChart.resize();
};

onMounted(() => {
  const chartDom = document.getElementById('line');
  myChart = echarts.init(chartDom);
  renderChart();
});

watch(
  () => props.xAxis,
  () => {
    renderChart();
  }
);
watch(
  () => props.series,
  () => {
    renderChart();
  }
);
watch(
  () => props.color,
  () => {
    renderChart();
  }
);

defineExpose({
  resize
});
</script>

<style lang="scss" scoped>
.line-chart-warp {
  width: 100%;
  height: 100%;
  .line-chart {
    width: 100%;
    height: 100%;
    min-height: 300px;
  }
}
</style>
