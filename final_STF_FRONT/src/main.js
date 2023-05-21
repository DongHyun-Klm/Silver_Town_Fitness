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
