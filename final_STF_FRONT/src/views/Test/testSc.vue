<template>
  <v-app>
    <v-main>
      <h2>테스트 페이지</h2>
      <v-btn @click="addEvent">새 이벤트 추가</v-btn>
      <v-row class="fill-height">
        <v-col>
          <v-sheet height="1000">
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
export default {
  data: () => ({
    events: [],
    colors: [],
    names: [],
  }),
  methods: {
    addEvent() {
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
};
</script>

<style scoped lang="scss"></style>
