import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    Schedules: [],
  },
  getters: {
    Schedules(state) {
      return state.Schedules;
    },
  },
  mutations: {
    setSchedules(state, payload) {
      state.Schedules = payload;
    },
  },
  actions: {
    getSchedules(context, token) {
      axios({
        headers: {
          "access-token": token,
        },
        method: "get",
        url: "http://localhost:9999/api/reservation",
      })
        .then(({ data }) => {
          context.commit("setSchedules", data);
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
});
