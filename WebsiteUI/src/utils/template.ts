/*
 * @Description: ------------ fileDescription -----------
 * @Author: snows_l snows_l@163.com
 * @Date: 2023-05-31 13:46:05
 * @LastEditors: snows_l snows_l@163.com
 * @LastEditTime: 2023-06-01 09:42:27
 * @FilePath: /my-vue3-vite-app/src/utils/template.ts
 */
import beautify from 'js-beautify';
/**
 * @description: 生成vue文件的 template 模版
 * @param1 { string } str
 * @return { string } 生成之后的 template 模板
 */
function generateVueTemplate(str: string): string {
  return `<template><div class="warp">${str}</div></template>`;
}

/**
 * @description: 生成vue文件的 script 模版
 * @param1 { string } str
 * @param2 { string } lang 是否 ts
 * @param3 { boolean } isSetup 是否将 setup 写入script 标签中
 * @param4 { boolean } isBeautify 是否美化代码
 * @param5 { object } options 美化的配置
 * @return { string } 生成之后的 script 模板
 */
function generateVueScript(str: string, lang?: string, isSetup?: boolean, isBeautify?: boolean, options?: { [propsName: string]: any }): string {
  if (!options) {
    options = {
      indent_size: 2, //缩进两个空格
      space_in_empty_paren: false
    };
  }
  console.log('--------  beautify --------', beautify);
  console.log('--------  beautify.html --------', beautify.html);
  if (isBeautify) return beautify.html(`<script lang="${lang ? lang : 'javascript'}" ${isSetup ? 'setup' : ''}>${str}</script>`, options);
  else return `<script lang="${lang ? lang : 'javascript'}" ${isSetup ? 'setup' : ''}>${str}</script>`;
}

/**
 * @description: 生成vue文件的 style 模版
 * @param1 { string } str
 * @param2 { string } lang
 * @param3 { boolean } isScoped 是否将 scoped 植入style标签中
 * @return { string } 生成之后的 style 模板
 */
function generateVueStyle(str: string, lang?: string, isScoped?: boolean): string {
  return `<style lang="${lang ? lang : 'css'}" ${isScoped ? 'scoped' : ''}>${str}</style>`;
}

/**
 * @description: 代码美化
 * @param1 { string } str
 * @param2 { object } options
 * @return { string } 美化之后的 code
 */
function beautifyJs(str: string, options: { [propsName: string]: any }): string {
  return beautify.html(str, options);
}

/**
 * @description: 生成vue文件
 * @param1 { string } tempStr
 * @param2 { string } scriptStr
 * @param3 { string } styleStr
 * @return { string } 生成之后的 vue 文件
 */
function generateVue(tempStr: string, scriptStr: string, styleStr: string): string {
  return tempStr + '\r\n\r\n' + scriptStr + '\r\n\r\n' + styleStr;
}

/**
 * @description: 导出 vue 文件
 * @param1 {string} str
 */
function downloadVueTemp(str: string) {
  const blob = new Blob([str], { type: 'text/plain' });
  const dom = document.createElement('a');
  dom.download = 'demo.vue';
  dom.href = URL.createObjectURL(blob);
  dom.id = 'upload-file-dom';
  dom.style.display = 'none';
  document.body.appendChild(dom);
  // 触发点击事件
  dom.click();
  // 释放资源
  URL.revokeObjectURL(dom.href);
  document.getElementById('upload-file-dom')?.remove();
}

export { generateVueTemplate, generateVueScript, generateVueStyle, beautifyJs, generateVue, downloadVueTemp };
export default generateVue;
