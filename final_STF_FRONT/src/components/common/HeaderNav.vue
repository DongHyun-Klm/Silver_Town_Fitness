<template>
  <v-app>
    <v-navigation-drawer v-model="drawer" app class="sidebar">
      <v-list dense>
        <v-list-item>
          <v-list-item-avatar>
            <v-img :src="image"></v-img>
          </v-list-item-avatar>

          <v-list-item-content>
            <v-list-item-title>{{ name }}</v-list-item-title>
            <v-list-item-subtitle>{{ email }}</v-list-item-subtitle>
          </v-list-item-content>
        </v-list-item>

        <v-divider></v-divider>

        <!-- 사이드바 메뉴 아이템 -->
        <v-list-item
          v-for="(item, index) in menuItems"
          :key="index"
          :to="item.route"
          link
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>
          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app color="success" dark height="80">
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <router-link to="/">
        <v-toolbar-title>
          <v-img
            src="@/assets/STF_Logo.png"
            alt="로고"
            width="150"
            height="auto"
          ></v-img>
        </v-toolbar-title>
      </router-link>

      <v-spacer></v-spacer>

      <v-btn text to="/Mypage/MypageSchedule">내 일정 관리</v-btn>
      <v-btn v-if="!hasAccessToken" text to="/Login">로그인</v-btn>
      <v-btn v-else text @click="logout" to="/">로그아웃</v-btn>
      <!-- 로그아웃 후 홈으로 -->
    </v-app-bar>

    <v-main>
      <!-- 나머지 컨텐츠 -->
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: "MyPage",
  data() {
    return {
      drawer: false,
      image: require("@/assets/ssafy_logo.png"), // 임시
      // image: 'your img',
      name: "Your Name",
      email: "your@email",
      hasAccessToken: false,
      menuItems: [
        { title: "메인페이지", icon: "mdi-home", route: "/" },
        { title: "마이페이지", icon: "mdi-account", route: "/Mypage" },
        { title: "수강신청", icon: "mdi-calendar-check", route: "/Register" },
        { title: "공지사항", icon: "mdi-bell", route: "/Notice" },
        {
          title: "내 일정관리",
          icon: "mdi-calendar-week",
          route: "/Mypage/MypageSchedule",
        },
        { title: "사랑방", icon: "mdi-heart", route: "/Board/" },
        { title: "운동목록(temp)", icon: "mdi-home", route: "/Exercise" },
        // 추가 메뉴 아이템
      ],
    };
  },
  methods: {
    navigateToHome() {
      this.$router.push("/");
    },
    logout() {
      localStorage.removeItem("access-token");
      this.hasAccessToken = false;
      window.location.href = "http://localhost:8080/";
    },
  },
  mounted() {
    const AccessToken = localStorage.getItem("access-token");
    this.hasAccessToken = AccessToken !== null;
  },
};
</script>

<style scoped>
.sidebar {
  background-color: #f5f5f5;
}

.sidebar .v-list-item {
  padding: 10px;
}

.sidebar .v-list-item__content {
  margin-left: 10px;
}

.home-icon {
  width: 100px;
  height: auto;
  margin-left: 16px;
}
</style>
