<template>
  <v-app>
    <v-sheet height="100%">
      <v-calendar
        color="primary"
        type="week"
        locale="ko-KR"
        :events="events"
        :interval-height="60"
        :interval-minutes="60"
        :interval-count="11"
        :first-interval="8"
        :last-interval="18"
      >
      </v-calendar>
    </v-sheet>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  data: () => ({
    events: [
      {
        name: "주말",
        start: new Date("2023-05-27T08:00:00"),
        end: new Date("2023-05-27T19:00:00"),
        timed: true,
        color: "#b2dfdb",
      },
      {
        name: "주말",
        start: new Date("2023-05-21T08:00:00"),
        end: new Date("2023-05-21T19:00:00"),
        timed: true,
        color: "#b2dfdb",
      },
    ],
    colors: [
      "#1abc9c", // Mint
      "#3498db", // Dodger Blue
      "#e74c3c", // Alizarin
      "#2ecc71", // Emerald
      "#9b59b6", // Amethyst
      "#f39c12", // Orange
      "#1abc9c", // Mint
      "#3498db", // Dodger Blue
      "#e74c3c", // Alizarin
      "#2ecc71", // Emerald
    ],
  }),

  methods: {
    // 스케줄 갱신
    makeScedule(Schedules) {
      const usedColors = new Set();

      // this.Schedules = response.data;
      // console.log(this.Schedules);
      Schedules.forEach((schedule) => {
        const start1 = new Date(schedule.lecture_time1);
        const end1 = new Date(start1.getTime() + 90 * 60 * 1000);

        const start2 = new Date(schedule.lecture_time2);
        const end2 = new Date(start2.getTime() + 90 * 60 * 1000);

        let color_index = Math.floor(Math.random() * this.colors.length);
        let color = this.colors[color_index];

        while (usedColors.has(color)) {
          // 이미 사용된 색상인 경우 다른 색상을 선택
          color_index = Math.floor(Math.random() * this.colors.length);
          color = this.colors[color_index];
        }
        usedColors.add(color);
        const newEvent1 = {
          name:
            schedule.lecture_name +
            " - " +
            schedule.teacher_name +
            "(" +
            schedule.lecture_place +
            ")",
          start: start1,
          end: end1,
          timed: true,
          color: this.colors[color_index],
        };

        const newEvent2 = {
          name:
            schedule.lecture_name +
            " - " +
            schedule.teacher_name +
            "(" +
            schedule.lecture_place +
            ")",
          start: start2,
          end: end2,
          timed: true,
          color: this.colors[color_index],
        };

        this.events.push(newEvent1);
        this.events.push(newEvent2);
      });
    },
  },
  created() {
    const token = localStorage.getItem("access-token");
    axios({
      headers: {
        "access-token": token,
      },
      method: "get",
      url: "http://localhost:9999/api/reservation",
    })
      .then(({ data }) => {
        this.makeScedule(data);
      })
      .catch((error) => {
        console.error(error);
      });
  },
};
</script>

<style scoped lang="scss"></style>
