import router from '@/router';
import { useAppStore } from '@/store/common';
import { getToken } from '@/utils/auth';
import { session } from '@/utils/cache';
import { blobValidate, tansParams } from '@/utils/common';
import errorCode from '@/utils/errorCode';
import axios from 'axios';
import { ElLoading, ElMessage, ElMessageBox, ElNotification } from 'element-plus';
import { saveAs } from 'file-saver';
// 创建取消令牌
const CancelToken = axios.CancelToken;
let cancel;

let downloadLoadingInstance;
// 是否显示重新登录
export let isRelogin = { show: false };
axios.defaults.headers['Content-Type'] = 'application/json;charset=utf-8';
let isDev = import.meta.env.MODE === 'development';

// 创建axios实例
const service = axios.create({
  // axios中请求配置有baseURL选项，表示请求URL公共部分
  baseURL: isDev ? import.meta.env.VITE_DEV_BASE_URL : import.meta.env.VITE_PROP_BASE_URL,
  // 超时
  timeout: 100000
});

// request拦截器
service.interceptors.request.use(
  config => {
    config.cancelToken = new CancelToken(c => {
      cancel = c;
    });

    const userInfo = JSON.parse(localStorage.getItem('__LOCAL__USER_INFO')) || {};
    // 无权限访问的接口
    let noAuthPath = ['add', 'edit', 'delete', 'del', '/favors/export', '/wages/export'];
    const authPath = ['/sys/musics/add', '/sys/musics/edit'];
    if (userInfo?.user?.role_key == 'snow' && noAuthPath.some(item => config.url.includes(item)) && !authPath.some(item => config.url.includes(item))) {
      // 取消请求
      if (cancel) {
        cancel();
        cancel = null;
      }
      return Promise.reject({ message: '您是访客角色，没有权限进行此操作！' });
    }

    // 是否需要设置 token
    const isToken = (config.headers || {}).isToken === false;
    // 是否需要防止数据重复提交
    const isRepeatSubmit = (config.headers || {}).repeatSubmit === false;
    if (getToken() && !isToken) {
      config.headers['Authorization'] = 'Bearer ' + getToken(); // 让每个请求携带自定义token 请根据实际情况自行修改
    }
    // get请求映射params参数
    if (config.method === 'get' && config.params) {
      let url = config.url + '?' + tansParams(config.params);
      url = url.slice(0, -1);
      config.params = {};
      config.url = url;
    }
    if (!isRepeatSubmit && (config.method === 'post' || config.method === 'put')) {
      const requestObj = {
        url: config.url,
        data: typeof config.data === 'object' ? JSON.stringify(config.data) : config.data,
        time: new Date().getTime()
      };
      const sessionObj = session.get('QUERY_PARAMS');
      if (sessionObj === undefined || sessionObj === null || sessionObj === '') {
        session.set('QUERY_PARAMS', requestObj);
      } else {
        const s_url = sessionObj.url; // 请求地址
        const s_data = sessionObj.data; // 请求数据
        const s_time = sessionObj.time; // 请求时间
        const interval = 1000 * 2; // 间隔时间(ms)，小于此时间视为重复提交
        // 判断是否是重复提交
        if (s_data === requestObj.data && requestObj.time - s_time < interval && s_url === requestObj.url) {
          const message = '数据正在处理，请勿重复提交';
          console.warn(`[${s_url}]: ` + message);
          return Promise.reject(new Error(message));
        } else {
          // 不是重复提交，更新缓存
          session.set('QUERY_PARAMS', requestObj);
        }
      }
    }
    return config;
  },
  error => {
    console.log(error);
    Promise.reject(error);
  }
);

// 响应拦截器
service.interceptors.response.use(
  res => {
    // 未设置状态码则默认成功状态
    const code = res.data.code || 200;
    // 获取错误信息
    const msg = errorCode[code] || res.data.msg || errorCode['default'];
    // 二进制数据则直接返回
    if (res.request.responseType === 'blob' || res.request.responseType === 'arraybuffer') {
      return res.data;
    }
    if (code == 401) {
      if (!isRelogin.show) {
        isRelogin.show = true;
        ElMessageBox.confirm('登录状态已过期，您可以继续留在该页面，或者重新登录', '系统提示', {
          confirmButtonText: '重新登录',
          cancelButtonText: '取消',
          type: 'warning'
        })
          .then(() => {
            isRelogin.show = false;
            // 退出登陆
            const store = useAppStore();
            store.Logout().then(res => {
              router.push({
                path: '/login',
                query: {
                  redirect: router.currentRoute.value.path
                }
              });
              ElMessage.success('退出登录成功！');
            });
          })
          .catch(() => {
            isRelogin.show = false;
          });
      }
      return Promise.reject('无效的会话，或者会话已过期，请重新登录。');
    } else if (code === 500) {
      ElMessage({ message: res.data.message || msg, type: 'error' });
      return Promise.reject(new Error(msg));
    } else if (code === 601) {
      ElMessage({ message: msg, type: 'warning' });
      return Promise.reject('error');
    } else if (code !== 200) {
      ElNotification.error({ title: msg });
      return Promise.reject('error');
    } else {
      return res.data;
    }
  },
  error => {
    console.log('error - ' + error);
    let { message } = error;
    if (message == 'Network Error') {
      message = '后端接口连接异常';
    } else if (message.includes('timeout')) {
      message = '系统接口请求超时';
    } else if (message.includes('Request failed with status code')) {
      message = '系统接口' + message.substr(message.length - 3) + '异常';
    }
    ElMessage({ message: message, type: 'error', duration: 5 * 1000 });
    return Promise.reject(error);
  }
);

// 通用下载方法
export function download(url, params, filename, config) {
  downloadLoadingInstance = ElLoading.service({
    text: '正在下载数据，请稍候',
    spinner: 'el-icon-loading',
    background: 'rgba(0, 0, 0, 0.7)'
  });
  return service
    .post(url, params, {
      transformRequest: [
        params => {
          return tansParams(params);
        }
      ],
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      responseType: 'blob',
      ...config
    })
    .then(async data => {
      const isBlob = blobValidate(data);
      if (isBlob) {
        const blob = new Blob([data]);
        saveAs(blob, filename);
      } else {
        const resText = await data.text();
        const rspObj = JSON.parse(resText);
        const errMsg = errorCode[rspObj.code] || rspObj.msg || errorCode['default'];
        ElMessage.error(errMsg);
      }
      downloadLoadingInstance.close();
    })
    .catch(r => {
      console.error(r);
      ElMessage.error('下载文件出现错误，请联系管理员！');
      downloadLoadingInstance.close();
    });
}

export default service;
