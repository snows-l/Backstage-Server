/*
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2022-12-30 10:30:44
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-06-18 10:39:51
 * @FilePath: /Website/WebsiteUI/vite.config.js
 */
import vue from '@vitejs/plugin-vue';
import path from 'path';
import { defineConfig, loadEnv } from 'vite';
// https://vitejs.dev/config/

const port = 30002;
export default defineConfig(({ mode, command }) => {
  console.log('command', command);
  console.log('当前环境的环境', mode); // 当前开发环境 development | production
  // 获取当前环境的环境变量的所有配置（.env.xxxx）
  const config = loadEnv(mode, process.cwd());
  console.log('当前开发环境变量', config); // 当前环境的环境变量的所有配置

  return {
    // publicPath: '/',
    plugins: [
      vue()
      // visualizer({
      //   open: true, //注意这里要设置为true，否则无效
      //   gzipSize: true,
      //   brotliSize: true
      // })
    ],
    build: {
      rollupOptions: { optimizeDeps: { include: '*' }, input: '/index.html' }
    },
    resolve: {
      alias: {
        '@': path.resolve(__dirname, './src')
      }
    },
    server: {
      host: '0.0.0.0',
      port,
      open: true,
      historyApiFallback: true, // 解决本地页面刷新 Cannot GET的问题
      proxy: {
        [config.VITE_DEV_BASE_URL]: {
          target: config.VITE_DEV_BASE_SERVER,
          changeOrigin: true,
          rewrite: path => path.replace(/^\/api/, '')
        }
      }
    }
  };
});
