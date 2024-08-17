/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2024-08-17 16:48:18
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2024-08-17 16:51:53
 * @FilePath: /webseteUI/WebsiteUI/src/utils/with-editor-api.js
 */
// 全屏功能的事件处理函数
const toggleFullScreen = () => {
  const isFullScreen = document.fullscreenElement !== null;
  const editorContainer = document.getElementById('editor-container-warp');

  if (isFullScreen) {
    // 退出全屏
    if (document.exitFullscreen) {
      document.exitFullscreen();
    }
  } else {
    // 进入全屏
    if (editorContainer.requestFullscreen) {
      editorContainer.requestFullscreen();
    }
  }
};

// 重写编辑器 API
function withEditorApi(editor) {
  const { fullScreen, unFullScreen } = editor; // 获取当前 editor API
  const newEditor = editor;

  // 重写点击全屏操作
  newEditor.fullScreen = () => {
    toggleFullScreen();
    // ... 一些自己的业务
    // 这里是执行编辑器自带的全屏API方法
    // fullScreen();
  };
  // 重写点击退出全屏
  newEditor.unFullScreen = () => {
    toggleFullScreen();
    // 这里是执行编辑器自带的退出全屏API方法
    // unFullScreen();
  };

  // 返回 newEditor ，重要！
  return newEditor;
}

export default withEditorApi;
