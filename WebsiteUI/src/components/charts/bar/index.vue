<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-09-26 15:18:52
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2023-11-30 19:47:32
 * @FilePath: /CMDB/src/pages/test/components/barChart/index.vue
-->
<template>
  <div class="line-chart">
    <div :id="'barChartBox'" class="chart-box"></div>
  </div>
</template>

<script setup>
import * as echarts from 'echarts';
import { onMounted, watch } from 'vue';
const props = defineProps({
  // 已分配
  assigned: {
    type: Array,
    default: () => []
  },
  // 已使用
  used: {
    type: Array,
    default: () => []
  },
  yAxis: {
    type: Array,
    default: () => []
  }
});

var myChart = null;

const getOptions = () => {
  return {
    color: ['#5087EC', '#68BBC4', '#58A55C'],
    tooltip: {
      show: true,
      trigger: 'item',
      formatter: item => {
        return item.marker + item.name + '&nbsp;&nbsp;&nbsp;&nbsp;' + item.value + ' ms';
      }
    },
    title: {
      text: '运营商平均时延统计'
    },
    legend: {
      show: true,
      itemWidth: 28,
      itemHeight: 14,
      type: 'plain'
    },
    grid: {
      left: '6%',
      right: '6%',
      top: '20%',
      bottom: '20%'
    },
    xAxis: [
      {
        type: 'category',
        data: props.yAxis
      }
    ],
    yAxis: [
      {
        type: 'value',
        axisLabel: {
          color: '#4e5b5f',
          formatter: function (val) {
            //百分比显示
            return val + ' Gbps';
          }
        }
      }
    ],
    series: [
      // {
      //   name: '上行流量',
      //   type: 'bar',
      //   label: {
      //     show: true,
      //     position: 'outside',
      //     color: '#68BBC4'
      //   },
      //   barGap: '40%',
      //   barWidth: '24px',
      //   data: props.assigned
      // },
      {
        name: '平均时延',
        type: 'bar',
        label: {
          show: true,
          position: 'outside',
          color: '#58A55C'
        },
        barWidth: '24px',
        barGap: '40%',
        data: props.used
      }
    ]
  };
};

onMounted(() => {
  var chartDom = document.getElementById('barChartBox');
  myChart = echarts.init(chartDom);
  let options = getOptions();
  myChart.setOption(options, true);
});

watch(
  () => props.sum,
  () => {
    let options = getOptions();
    myChart.setOption(options, true);
  }
);

watch(
  () => props.assigned,
  () => {
    let options = getOptions();
    myChart.setOption(options, true);
  }
);

watch(
  () => props.used,
  () => {
    let options = getOptions();
    myChart.setOption(options, true);
  }
);
</script>

<style lang="scss" scoped>
.line-chart {
  margin: 40px 0;
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
