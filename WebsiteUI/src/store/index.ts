/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-03-26 09:31:07
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-04-19 09:44:08
 * @FilePath: /Website/WebsiteUI/src/store/index.ts
 */
import { createPinia } from 'pinia';
// 持久化
import piniaPersist from 'pinia-plugin-persist';
const store = createPinia();
store.use(piniaPersist);
export default store;
