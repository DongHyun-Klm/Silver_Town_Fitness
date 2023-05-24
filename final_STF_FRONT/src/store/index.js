import Vue from "vue";
import Vuex from "vuex";
// import axios from "axios";

Vue.use(Vuex);

// const REST_API = `http://localhost:9999/api`;

export default new Vuex.Store({
  state: {
    Schedules: [],
  },
  getters: {
    getSchedules(state) {
      return state.Schedules;
    },
  },
  mutations: {},
  actions: {},
});
