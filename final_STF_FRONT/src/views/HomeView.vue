<template>
  <div id="app">
    <v-app-bar color="primary" dark>
      <v-spacer></v-spacer>
      <v-btn text to="/Register">수강신청</v-btn>
      <v-btn text to="/Mypage">마이페이지</v-btn>
      <v-btn text to="/Notice">공지사항</v-btn>
      //
      <v-btn text to="/Mypage/MypageSchedule">내 일정관리</v-btn>
      <!-- 로그아웃은 따로 처리할 예정 -->
      <v-btn text to="/">로그아웃</v-btn>
      <v-btn text to="/Login/">로그인</v-btn>
      <v-btn text to="/Login/LoginJoin">회원가입</v-btn>
    </v-app-bar>

    <!-- 카드 -->
    <div class="card-container">
      <v-container class="card-group" fluid>
        <v-row>
          <v-col
            :cols="getCardColumns"
            v-for="(item, index) in cards"
            :key="index"
          >
            <v-card max-width="300px" class="custom-card" height="500px">
              <v-img :src="item.image" alt="card image" height="150px"></v-img>
              <v-card-text>
                <h5 class="card-title">{{ item.title }}</h5>
                <p class="card-description">{{ item.description }}</p>
              </v-card-text>
              <v-card-footer class="card-footer">
                <small class="text-muted">강사: {{ item.instructor }}</small>
              </v-card-footer>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </div>

    <!-- -->
    <v-container fluid>
      <v-row>
        <v-col cols="6">
          좌측 컨테이너 제목
          <v-container fluid class="container-with-border">
            <v-row>
              <v-col cols="12"> 좌측 컨테이너 내용 </v-col>
            </v-row>
          </v-container>
        </v-col>
        <v-col cols="6">
          우측 컨테이너 제목
          <v-container fluid class="container-with-border">
            <v-row>
              <v-col cols="12"> 우측 컨테이너 내용 </v-col>
            </v-row>
          </v-container>
        </v-col>
      </v-row>
    </v-container>

    <!-- 푸터 -->
    <v-footer class="footer" color="success" dark>
      <v-container fluid fill-height>
        <v-row align="center" justify="center">
          <v-col cols="12" class="text-center">
            <span class="white--text"
              >&copy; 2023 Your Company. All rights reserved.</span
            >
          </v-col>
        </v-row>
      </v-container>
    </v-footer>
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
          description:
            "게이트볼은 노인들에게 매우 적합한 운동으로 알려져 있습니다. 게이트볼은 공을 사용하는 팀 운동으로, 주로 중장년층과 노인들이 즐기는 스포츠입니다. 이 게임은 실내나 실외에서 플레이할 수 있으며, 작은 공과 목표물인 게이트를 사용합니다.",
          instructor: "일은성, 이은성",
        },
        {
          image: require("@/assets/댄스스포츠_이미지.jpg"),
          title: "댄스 스포츠",
          description:
            "댄스스포츠는 음악에 맞춰 몸을 움직이고 춤을 추는 활동입니다. 노인들에게 많은 장점을 제공하며, 신체적인 즐거움과 운동 효과 뿐만 아니라 사회적 상호작용과 두뇌 활동을 촉진시킵니다.",
          instructor: "일동현, 이동현",
        },
        {
          image: require("@/assets/수영_이미지.jpg"),
          title: "수영",
          description:
            "수영은 물 속에서 몸을 움직이는 운동으로 인간이 수행하는 가장 오래된 운동 중 하나입니다. 수영은 재미있고 즐겁게 즐길 수 있는 스포츠이면서 동시에 전신 운동으로 알려져 있습니다 ",
          instructor: "일규호, 이규호",
        },
        {
          image: require("@/assets/스쿼시_이미지.jpg"),
          title: "스쿼시",
          description:
            "스쿼시는 나이에 관계없이 즐길 수 있는 운동이며, 노인들에게도 많은 이점을 제공합니다. 스쿼시는 다른 운동과는 달리 부상의 위험이 적은 편이며, 관절을 부드럽게 움직일 수 있는 유연성과 근력을 향상시키는 데 도움이 됩니다.",
          instructor: "일ㅇㅇ, 이ㅇㅇ",
        },
        {
          image: require("@/assets/요가_이미지.jpg"),
          title: "요가",
          description:
            "요가는 신체와 마음을 조화롭게 발전시키는 종합적인 운동입니다. 노인에게 요가는 건강과 품질 좋은 노후 생활을 위한 많은 이점을 제공합니다.",
          instructor: "일ㅇㅇ, 이ㅇㅇ",
        },
      ],
    };
  },
  computed: {
    getCardColumns() {
      const viewportWidth = window.innerWidth;
      if (viewportWidth >= 1280) {
        return "2";
      } else if (viewportWidth >= 960) {
        return "3";
      } else {
        return "12";
      }
    },
  },
  methods: {},
};
</script>

<style>
.card-container {
  display: flex;
  justify-content: center;
  max-width: 1200px;
  margin: 0 auto;
  position: relative; /* 추가: 상대 위치 설정 */
}

#app {
  margin-top: 56px;
}
.card-group {
  display: flex;
  flex-wrap: wrap;
}
.card {
  margin: 10px;
  width: 300px;
}

.card-image {
  position: relative;
  height: 200px;
}

.card-image img {
  object-fit: cover;
  height: 100%;
  width: 100%;
}

.container-with-border {
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 16px;
  margin-top: 16px;
}

.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 60px; /* 원하는 높이 값으로 설정 */
  display: flex;
}

.card-footer {
  display: flex;
  align-items: flex-end;
  padding-top: 0;
  position: absolute; /* 추가: 절대 위치 설정 */
  bottom: 0; /* 추가: 바닥에 정렬 */
}

.custom-card {
  font-family: "Arial", sans-serif;
  background-color: #f0f0f0;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  transition: box-shadow 0.3s ease-in-out;
}

.custom-card:hover {
  box-shadow: 0 4px 8px rgba(240, 4, 4, 0.2);
}

.card-title {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 8px;
  color: #0307f9;
}

.text-muted {
  font-weight: bold;
  font-size: 14px;
}

.card-description {
  font-size: 14px;
  color: #000000;
}

.text-muted {
  color: #999999;
}
</style>
