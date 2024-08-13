<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-09-26 15:18:52
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2023-11-30 19:36:31
 * @FilePath: /CMDB/src/pages/test/components/pieChart/index.vue
-->
<template>
  <div class="charts-container">
    <div :id="'chartsBox' + code" class="chart-box"></div>
  </div>
</template>

<script setup>
import * as echarts from 'echarts';
import { onMounted, watch } from 'vue';
const props = defineProps({
  code: {
    type: String,
    require: true
  },
  // 已分配
  assigned: {
    type: Number,
    require: true
  },
  // 已分配
  undistributed: {
    type: Number,
    require: true
  }
});

var myChart = null;

const getOptions = () => {
  return {
    color: ['#5087EC', '#68BBC4', '#2D6CFF', '#1486FD', '#99B6F7', '#DFB4FF'],
    tooltip: {
      trigger: 'item',
      axisPointer: {
        type: 'shadow'
      },
      formatter: params => {
        return params.marker + params.name + '&nbsp;&nbsp;&nbsp;&nbsp;' + params.percent + '%';
      }
    },

    legend: {
      top: '15%'
    },
    title: {
      text: '异常协议统计'
    },
    series: [
      {
        type: 'pie',
        radius: ['0%', '70%'],
        avoidLabelOverlap: false,
        top: '20%',
        itemStyle: {
          borderRadius: 5,
          borderColor: '#fff',
          borderWidth: 0
        },

        label: {
          show: false,
          position: 'center'
        },
        emphasis: {
          label: {
            show: true,
            fontSize: 16,
            fontWeight: 'bold'
          }
        },
        labelLine: {
          show: false
        },
        data: [
          { value: 38, name: 'Unknown' },
          { value: 27.9, name: 'UDP垃圾包' },
          { value: 34.1, name: '其它' }
        ]
      }
    ]
  };
};

onMounted(() => {
  var chartDom = document.getElementById('chartsBox' + props.code);
  myChart = echarts.init(chartDom);
  let options = getOptions();
  myChart.setOption(options, true);
});

watch(
  () => props.assigned,
  () => {
    let options = getOptions();
    myChart.setOption(options);
  },
  { deep: true }
);
</script>

<style lang="scss" scoped>
.charts-container {
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
  }
}
</style>
