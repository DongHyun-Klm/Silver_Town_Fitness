<template>
  <v-app-bar app color="success" dark>
    <v-app-bar-nav-icon @click="navigateToHome">
      <img src="@/assets/STF_Logo.png" alt="Home" class="home-icon" />
    </v-app-bar-nav-icon>

    <v-spacer></v-spacer> 

    <v-btn text to="/Mypage/MypageSchedule">내 일정 관리</v-btn>
    <v-btn text to="/">로그아웃</v-btn>
    <!-- 로그아웃 후 홈으로 -->
  </v-app-bar>
</template>

<script>
export default {
  name: "HeaderNav",
  methods: {
    navigateToHome() {
      this.$router.push('/');
    },
  },
};
</script>

<style>
.home-icon {
  width: 100px; /* 원하는 너비로 설정 */
  height: auto; /* 높이는 자동으로 조정됨 */
  margin-left: 70px; /* 왼쪽 간격 설정 */
}
</style>
