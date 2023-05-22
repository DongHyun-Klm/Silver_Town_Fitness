<template>
  <v-app>
    <v-main>
      <h2>테스트 페이지</h2>
      <v-btn @click="addEvent">새 이벤트 추가</v-btn>
      <v-row class="fill-height">
        <v-col>
          <v-sheet height="1000" width="1500">
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
        </v-col>
      </v-row>
    </v-main>
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
        color: "#000000",
      },
      {
        name: "주말",
        start: new Date("2023-05-21T08:00:00"),
        end: new Date("2023-05-21T19:00:00"),
        timed: true,
        color: "#000000",
      },
    ],
    colors: ["#00c0a0", "#ff9900", "#e91e63", "#3f51b5", "#4caf50"],
    Schedules: [],
  }),
  methods: {
    addEvent() {
      console.log(this.Schedules);
      const newEvent = {
        name: "수영 강습1",
        start: new Date("2023-05-22T10:00:00"), // 시작 시간 설정
        end: new Date("2023-05-22T11:30:00"), // 종료 시간 설정
        timed: true, // 시간 지정 여부 설정
        color: "#00c0a0", // 이벤트 색상 설정
      };
      this.events.push(newEvent);
    },
  },
  created() {
    axios({
      headers: {
        "access-token":
          // 토큰 1
          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImpheV9pZCIsImFnZSI6IjI1Iiwi64u07JWE67O07J6QIjoi7ZWc6riA64-E6rCA64qlPyIsInVzZXJfbmFtZSI6ImRvbmdoeXVuIn0.1jp8iMua6E1EvyUEKeZmc9p7V-Aq6PKZ6vg4Wc5GgYE",
          // 토큰 2
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InJhX2lkIiwiYWdlIjoiMjUiLCLri7TslYTrs7TsnpAiOiLtlZzquIDrj4TqsIDriqU_IiwidXNlcl9uYW1lIjoiZG9uZ2h5dW4ifQ.NtCnbyxayVDbbp1g7h0AGS36uLG81CsaQ_V8VCqlgTY",
      },
      method: "get",
      url: "http://localhost:9999/api/reservation",
    }).then((response) => {
      this.Schedules = response.data;
      this.Schedules.forEach((schedule) => {
        console.log(schedule.teacher_name);
        const start1 = new Date(schedule.lecture_time1);
        const end1 = new Date(start1.getTime() + 90 * 60 * 1000);

        const start2 = new Date(schedule.lecture_time2);
        const end2 = new Date(start2.getTime() + 90 * 60 * 1000);

        const newEvent1 = {
          name: schedule.lecture_name + " - " + schedule.teacher_name,
          start: start1,
          end: end1,
          timed: true,
          color: this.colors[Math.floor(Math.random() * this.colors.length)],
        };

        const newEvent2 = {
          name: schedule.lecture_name + " - " + schedule.teacher_name,
          start: start2,
          end: end2,
          timed: true,
          color: this.colors[Math.floor(Math.random() * this.colors.length)],
        };

        this.events.push(newEvent1);
        this.events.push(newEvent2);
      });
    });
  },
};
</script>

<style scoped lang="scss"></style>
