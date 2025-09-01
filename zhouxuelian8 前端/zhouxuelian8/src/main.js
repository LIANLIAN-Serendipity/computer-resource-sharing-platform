// main.js
import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import axios from "axios";
//import SvgIcon from 'vue-svgicon'; // 确保这是正确的导入路径

Vue.use(ElementUI);
Vue.config.productionTip = false;
Vue.prototype.$axios = axios;
//Vue.component('svg-icon', SvgIcon); // 全局注册 SvgIcon 组件

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
