import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import vuetify from "./plugins/vuetify";
import VCalendar from "v-calendar/lib/components/calendar.umd";
import DatePicker from "v-calendar/lib/components/date-picker.umd";

new Vue({
  router,
  store,
  vuetify,
  VCalendar,
  DatePicker,
  render: (h) => h(App),
}).$mount("#app");

Vue.prototype.$checkLogin = function () {
  const isLoggedIn = localStorage.getItem("access-token") !== null;
  // 로그인 상태가 아닌 경우 로그인 페이지로 리다이렉트
  if (!isLoggedIn) {
    alert("로그인이 필요한 서비스 입니다.");
    window.location.href = "http://localhost:8080/Login";
  }
};
