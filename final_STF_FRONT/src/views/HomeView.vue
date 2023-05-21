<template>
  <div id="app">
    <router-view />
    <v-app>
      <v-app-bar app color="primary" dark>
        <v-toolbar-title>
          <v-img src="@/assets/STF_Logo.png" alt="Logo" max-height="40"></v-img>
        </v-toolbar-title>
        <v-spacer></v-spacer>
        <v-btn text to="/Register">수강신청</v-btn>
        <v-btn text to="/Mypage">마이페이지</v-btn>
        <v-btn text to="/Notice">공지사항</v-btn>
      </v-app-bar>

      <!-- 카드  -->
      <v-container class="card-group" fluid>
        <v-row>
          <v-col
            cols="12"
            sm="6"
            md="4"
            v-for="(item, index) in cards"
            :key="index"
          >
            <v-card>
              <v-img :src="item.image" alt="card image"></v-img>
              <v-card-text>
                <h5>{{ item.title }}</h5>
                <p>{{ item.description }}</p>
              </v-card-text>
              <v-card-actions>
                <v-btn text>더 알아보기</v-btn>
              </v-card-actions>
              <v-card-footer>
                <small class="text-muted">강사: {{ item.instructor }}</small>
              </v-card-footer>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-app>
  </div>
</template>

<script>
export default {
  data() {
    return {
      cards: [
        {
          image: require("@/assets/게이트볼_이미지.jpg"),
          title: "게이트볼",
          description: "게이트볼이란 ~",
          instructor: "일은성, 이은성",
        },
        {
          image: require("@/assets/댄스스포츠_이미지.jpg"),
          title: "댄스 스포츠",
          description: "댄스 스포츠는 ~",
          instructor: "일동현, 이동현",
        },
        {
          image: require("@/assets/수영_이미지.jpg"),
          title: "수영",
          description: "수영은 ~",
          instructor: "일규호, 이규호",
        },
        {
          image: require("@/assets/스쿼시_이미지.jpg"),
          title: "스쿼시",
          description: "스쿼시는 ~",
          instructor: "일ㅇㅇ, 이ㅇㅇ",
        },
        {
          image: require("@/assets/요가_이미지.jpg"),
          title: "요가",
          description: "요가는 ~",
          instructor: "일ㅇㅇ, 이ㅇㅇ",
        },
      ],
    };
  },
};
</script>

<style>
#app {
  margin-top: 56px;
}
.card-group {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}
.card {
  margin: 10px;
  width: 300px;
}
</style>
