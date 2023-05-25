<template>
  <v-container>
  <div>
    <h2>마이페이지 스케줄 페이지</h2>
    <schedule-view />
  </div>
  </v-container>

</template>

<script>
import ScheduleView from "@/views/ScheduleView.vue";
export default {
  created() {
    this.$checkLogin();
  },
  components: { ScheduleView },
  name: "MypageSchedule",
};
</script>

<style></style>
