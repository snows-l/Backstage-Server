<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-02 16:06:02
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-03 15:37:29
 * @FilePath: /Website/WebsiteUI/src/views/baseView/home/components/BarChart.vue
-->
<template>
  <div class="bar-chart-warp">
    <div id="favors" class="bar-chart"></div>
  </div>
</template>

<script lang="ts" setup>
import * as echarts from 'echarts';
import { onMounted, watch } from 'vue';
const props = defineProps({
  title: {
    type: String,
    default: ''
  },
  color: {
    type: Array,
    default: () => ['#5470C6', '#4DABCE']
  },
  xAxis: {
    type: Array,
    default: () => []
  },
  seriesM: {
    type: Array,
    default: () => []
  },
  seriesB: {
    type: Array,
    default: () => []
  }
});

let myChart: echarts.ECharts | null = null;

const getOptions = () => {
  return {
    color: props.color,
    tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'shadow'
      },
      formatter: (params: any) => {
        return params[0].name + '<br/>' + params[0].marker + ' 人情：' + params[0].value + ' 元' + '<br/>' + params[1].marker + ' 已还：' + params[1].value + ' 元';
      }
    },
    legend: {
      show: true,
      data: ['人情', '已还'],
      type: 'plain',
      left: 10
    },
    grid: {
      left: '16%',
      right: '4%',
      top: '18%',
      bottom: '16%'
    },
    xAxis: {
      type: 'category',
      data: props.xAxis,
      axisLine: {
        show: false
      },
      axisLabel: {
        show: true, // 显示标签
        position: 'bottom', // 标签位置
        verticalAlign: 'middle', // 垂直对齐方式
        align: 'center', // 水平对齐方式
        margin: 25, // 标签与轴线之间的距离
        distance: 30,
        rotate: 70
      }
    },
    yAxis: {
      type: 'value'
    },
    series: [
      {
        name: '人情',
        data: props.seriesM,
        type: 'line',
        smooth: true,
        label: {
          show: true, // 显示标签
          position: 'top', // 标签位置
          verticalAlign: 'middle', // 垂直对齐方式
          distance: 26, // 标签与轴线的距离
          align: 'center', // 水平对齐方式
          formatter: '{c} 元', // {c} 表示数据值
          rotate: 70,
          color: props.color[0] // 标签颜色
        }
      },
      {
        name: '已还',
        data: props.seriesB,
        type: 'line',
        smooth: true,
        label: {
          show: true, // 显示标签
          position: 'top', // 标签位置
          verticalAlign: 'middle', // 垂直对齐方式
          align: 'center', // 水平对齐方式
          distance: 15, // 标签与轴线的距离
          rotate: 70,
          formatter: '{c} 元', // {c} 表示数据值
          color: props.color[1] // 标签颜色,
        }
      }
    ]
  };
};

const renderChart = () => {
  let options = getOptions();
  myChart.setOption(options, true);
};

const resize = () => {
  myChart.resize();
};

onMounted(() => {
  const chartDom = document.getElementById('favors');
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
  () => props.seriesM,
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
.bar-chart-warp {
  width: 100%;
  height: 100%;
  .bar-chart {
    width: 100%;
    height: 100%;
    min-height: 300px;
  }
}
</style>
