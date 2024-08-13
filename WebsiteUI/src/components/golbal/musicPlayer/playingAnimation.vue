<!--
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-07-22 20:53:39
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-07-22 21:33:15
 * @FilePath: /webseteUI/WebsiteUI/src/components/golbal/musicPlayer/playingAnimation.vue
-->
<template>
  <div class="loader">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
  </div>
</template>

<script lang="ts" setup></script>

<style lang="scss" scoped>
.loader {
  height: 100%;
  max-height: 90px;
  width: 100%;
  display: flex;
  transform: rotate(180deg);
}

.loader span {
  width: 5px;
  margin: 0 2px;
  border-radius: 4px;
  animation: loading 2s infinite;
}

@keyframes loading {
  0%,
  100% {
    height: 10px;
    background: #ffd166;
  }

  25% {
    height: 90px;
    background: #06d6a0;
  }

  50% {
    height: 40px;
    background: #118ab2;
  }

  75% {
    height: 90px;
    background: #ef476f;
  }
}
.loader span:nth-child(6) {
  animation-delay: 0.1s;
}
.loader span:nth-child(2) {
  animation-delay: 0.2s;
}
.loader span:nth-child(12) {
  animation-delay: 0.3s;
}
.loader span:nth-child(13) {
  animation-delay: 0.4s;
}
.loader span:nth-child(5) {
  animation-delay: 0.5s;
}
.loader span:nth-child(1) {
  animation-delay: 0.6s;
}
.loader span:nth-child(3) {
  animation-delay: 0.7s;
}
.loader span:nth-child(15) {
  animation-delay: 0.8s;
}
.loader span:nth-child(7) {
  animation-delay: 0.9s;
}
.loader span:nth-child(10) {
  animation-delay: 1s;
}
.loader span:nth-child(9) {
  animation-delay: 1.1s;
}
.loader span:nth-child(5) {
  animation-delay: 1.2s;
}
.loader span:nth-child(13) {
  animation-delay: 1.3s;
}
.loader span:nth-child(4) {
  animation-delay: 1.4s;
}
.loader span:nth-child(15) {
  animation-delay: 1.5s;
}
</style>
