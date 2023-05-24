<template>
  <div>
    <h2>마이페이지 스케줄 페이지</h2>
    <test-sc />
  </div>
</template>

<script>
import testSc from "@/views/Test/testSc.vue";
export default {
  created() {
    this.$checkLogin();
  },
  components: { testSc },
  name: "MypageSchedule",
};
</script>

<style></style>
