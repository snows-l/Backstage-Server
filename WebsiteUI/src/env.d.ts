/*
 * @Description: ------ 文件描述 ------
 * @Creater: snows_l snows_l@163.com
 * @Date: 2023-01-05 09:47:52
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-09-08 15:24:21
 * @FilePath: /webseteUI/WebsiteUI/src/env.d.ts
 */

declare module '*.vue' {
  import { DefineComponent } from 'vue';
  // eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/ban-types
  const component: DefineComponent<{}, {}, any>;
  export default component;
}

// 环境变量 TypeScript的智能提示
interface ImportMetaEnv {
  VITE_PROD_BASE_SERVER: string;
  VITE_DEV_BASE_SERVER: string;
  VITE_CURRENT_ENV: string;
  VITE_APP_TITLE: string;
  VITE_APP_PORT: string;
  VITE_APP_BASE_API: string;
}

interface ImportMeta {
  readonly env: ImportMetaEnv;
}
