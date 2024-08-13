/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-11-16 11:37:49
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2023-11-16 11:52:52
 * @FilePath: /vue3+vite+pinia_classicsCase/src/utils/bigScreenAdapterHook.js
 */
import { onMounted, onUnmounted } from 'vue';
let drawTiming = null;
export const useBigScreenAdapter = () => {
  const scale = {
    width: '1',
    height: '1'
  };

  // 定时器

  // * 设计稿尺寸（px）
  const baseWidth = 1920;
  const baseHeight = 1080;

  // * 需保持的比例（默认1.77778）
  const baseProportion = parseFloat((baseWidth / baseHeight).toFixed(5));

  const calcRate = () => {
    const style = {
      width: '1920px',
      height: '1080px',
      position: 'absolute',
      top: '50%',
      left: '50%',
      transformOrigin: 'left top'
    };
    const bigScreenContainer = document.getElementById('bigScreenContainer');
    if (!bigScreenContainer) return;

    // 设置必要样式(上下左右居中)
    bigScreenContainer.style.width = style.width;
    bigScreenContainer.style.height = style.height;
    bigScreenContainer.style.position = style.position;
    bigScreenContainer.style.top = style.top;
    bigScreenContainer.style.left = style.left;
    bigScreenContainer.style.transformOrigin = style.transformOrigin;

    // 当前宽高比
    const currentRate = parseFloat((window.innerWidth / window.innerHeight).toFixed(5));
    if (bigScreenContainer) {
      if (currentRate > baseProportion) {
        // 表示更宽
        scale.width = ((window.innerHeight * baseProportion) / baseWidth).toFixed(5);
        scale.height = (window.innerHeight / baseHeight).toFixed(5);
        bigScreenContainer.style.transform = `scale(${scale.width}, ${scale.height}) translate(-50%, -50%)`;
      } else {
        // 表示更高
        scale.height = (window.innerWidth / baseProportion / baseHeight).toFixed(5);
        scale.width = (window.innerWidth / baseWidth).toFixed(5);
        bigScreenContainer.style.transform = `scale(${scale.width}, ${scale.height}) translate(-50%, -50%)`;
      }
    }
  };
  const resize = () => {
    clearTimeout(drawTiming);
    drawTiming = setTimeout(() => {
      calcRate();
    }, 200);
  };

  onMounted(() => {
    calcRate();
    window.addEventListener('resize', resize);
  });

  onUnmounted(() => {
    window.removeEventListener('resize', resize);
  });

  return scale;
};
