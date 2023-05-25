<template>
  <v-app>
    <v-navigation-drawer v-model="drawer" app class="sidebar">
      <v-list dense>
        <v-list-item>
          <v-list-item-avatar>
            <v-img :src="getImagePath(img)"></v-img>
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

    <v-app-bar app class="bar" dark height="80" >
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

      <div v-if="hasAccessToken">{{ name }}님 환영합니다</div>
      <v-btn text to="/Mypage/MypageSchedule">내 일정 관리</v-btn>
      <v-btn v-if="!hasAccessToken" text to="/Login">로그인</v-btn>
      <v-btn v-else text @click="logout" to="/">로그아웃</v-btn>
    
    </v-app-bar>

    <v-main> </v-main>
  </v-app>
</template>

<script>
import axios from "axios";
export default {
  name: "MyPage",
  data() {
    return {
      drawer: false,
      img: "ssafy.png",
      temp: "",
      name: "",
      email: "로그인 해주세요",
      hasAccessToken: false,
      menuItems: [
        { title: "메인페이지", icon: "mdi-home", route: "/" },
        { title: "마이페이지", icon: "mdi-account", route: "/Mypage" },
        { title: "수강신청", icon: "mdi-calendar-check", route: "/Register" },
        { title: "공지사항", icon: "mdi-bell", route: "/Notice" },
        // {
        //   title: "내 일정관리",
        //   icon: "mdi-calendar-week",
        //   route: "/Mypage/MypageSchedule",
        // },
        { title: "사랑방", icon: "mdi-heart", route: "/Board/" },
      ],
    };
  },
  methods: {
    navigateToHome() {
      this.$router.push("/");
    },
    getImagePath(image) {
      return require(`@/assets/upload/${image}`);
    },
    logout() {
      localStorage.removeItem("access-token");
      localStorage.removeItem("id");
      this.hasAccessToken = false;
      alert("로그아웃 되었습니다!");
      window.location.href = "http://localhost:8080/";
    },
    fetchUserData() {
      axios
        .get("http://localhost:9999/api/user/mypage", {
          headers: { "access-token": localStorage.getItem("access-token") },
        })
        .then(({ data }) => {
          this.img = data.user_img;
          this.name = data.user_name;
          this.email = data.user_email;
        });
    },
  },
  mounted() {
    const AccessToken = localStorage.getItem("access-token");
    this.hasAccessToken = AccessToken !== null;
  },
  watch: {
    hasAccessToken(newValue) {
      if (newValue) {
        this.fetchUserData();
      } else {
        this.img = "ssafy.png";
        this.name = "";
        this.email = "";
      }
    },
  },
};
</script>

<style scoped>

.bar {
  color: black; /* 글자 색상을 검은색으로 설정 */
  font-weight: bold; /* 글자를 굵게 설정 */
}
.bar .v-btn {
  color: black; /* 글자 색상을 검은색으로 설정 */
  font-weight: bold; /* 글자를 굵게 설정 */
}

.sidebar {
  background-image: url('@/assets/barImg.jpeg');
  background-size: cover;
  background-repeat: no-repeat;
  background-color: rgba(81, 50, 50, 0.5); /* 배경 색상 및 투명도 조절 */
  border-left: 2px solid #fff; /* 사이드바 오른쪽 테두리 스타일 설정 */
  border-radius: 0 8px 8px 0; /* 사이드바 오른쪽 꼭지점을 둥글게 설정 */
}

.bar {
  background-image: url('@/assets/barImg.jpeg');
  background-size: cover;
  background-repeat: no-repeat;
  background-color: rgba(81, 50, 50, 0.5); /* 배경 색상 및 투명도 조절 */
  border-bottom: 2px solid #fff;
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
