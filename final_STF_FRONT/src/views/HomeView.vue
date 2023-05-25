<template>
  <div id="app" class="home-container">
    <v-container style="margin-bottom: 100px">
      <v-carousel>
        <v-carousel-item v-for="(card, index) in cards" :key="index">
          <v-container fluid class="card-container">
            <v-row justify="center">
              <v-col cols="12" md="6" lg="4">
                <v-card max-width="600px" class="custom-card" height="800px">
                  <v-img :src="card.image" alt="card image" height="150px" ></v-img>
                  <v-card-text>
                    <h5 class="card-title">{{ card.title }}</h5>
                    <p class="card-description">{{ card.description }}</p>
                  </v-card-text>
                  <v-card-text class="card-text">
                    <small class="text-muted">강사: {{ card.instructor }}</small>
                  </v-card-text>
                  <v-btn text color="primary" @click="goToDetail(index)">더보기</v-btn>
                </v-card>
              </v-col>
            </v-row>
          </v-container>
        </v-carousel-item>
      </v-carousel>

      <!--바디 -->
      <v-container fluid>
        <v-row>
          <v-col cols="6">
            <div class="container-with-icon">
              <h2 class="container-title">
                사랑방
                <router-link to="/Board" class="heart-icon">
                  <v-icon>mdi-heart</v-icon>
                </router-link>
              </h2>
            </div>
            <v-container fluid class="container-with-border">
              <v-row>
                <!-- board-list 뷰 불러오기 -->
                <board-list></board-list>
              </v-row>
            </v-container>
          </v-col>

          <v-col cols="6">
            <div class="container-with-icon">
              <h2 class="container-title">
                주간 스케줄 표
                <router-link to="/Mypage/MypageSchedule" class="right-icon">
                  <v-icon>mdi-calendar</v-icon>
                </router-link>
              </h2>
            </div>
            <v-container fluid class="container-with-border">
              <v-row>
                <v-col cols="12">
                  <schedule-view />
                </v-col>
              </v-row>
            </v-container>
          </v-col>
        </v-row>
      </v-container>
    </v-container>

    
    <!-- 푸터 -->
    <v-footer class="footer" color="success" dark>
      <v-container fluid fill-height>
        <v-row align="center" justify="center">
          <v-col cols="12" class="text-center">
            <span class="white--text"
              >&copy; 2023 김동현이은성의 피와살 페이지..</span
            >
          </v-col>
        </v-row>
      </v-container>
    </v-footer>
  </div>
</template>

<script>
import BoardList from "@/components/Board/BoardList.vue";
import ScheduleView from "@/views/ScheduleView.vue";

export default {
  components: {
    BoardList,
    ScheduleView,
  },
  data() {
    return {
      cards: [
        {
          image: require("@/assets/수영_이미지.jpg"),
          title: "수영",
          description:
            "수영은 물 속에서 몸을 움직이는 운동으로 인간이 수행하는 가장 오래된 운동 중 하나입니다. 수영은 재미있고 즐겁게 즐길 수 있는 스포츠이면서 동시에 전신 운동으로 알려져 있습니다 ",
          instructor: "웨이브익, 해파리현",
        },
        {
          image: require("@/assets/요가_이미지.jpg"),
          title: "요가",
          description:
            "요가는 신체와 마음을 조화롭게 발전시키는 종합적인 운동입니다. 노인에게 요가는 건강과 품질 좋은 노후 생활을 위한 많은 이점을 제공합니다.",
          instructor: "플라잉식, 커브현",
        },
        {
          image: require("@/assets/게이트볼_이미지.jpg"),
          title: "게이트볼",
          description:
            "게이트볼은 노인들에게 매우 적합한 운동으로 알려져 있습니다. 게이트볼은 공을 사용하는 팀 운동으로, 주로 중장년층과 노인들이 즐기는 스포츠입니다. 이 게임은 실내나 실외에서 플레이할 수 있으며, 작은 공과 목표물인 게이트를 사용합니다.",
          instructor: "스윙종, 공중제경",
        },
        {
          image: require("@/assets/댄스스포츠_이미지.jpg"),
          title: "댄스 스포츠",
          description:
            "댄스스포츠는 음악에 맞춰 몸을 움직이고 춤을 추는 활동입니다. 노인들에게 많은 장점을 제공하며, 신체적인 즐거움과 운동 효과 뿐만 아니라 사회적 상호작용과 두뇌 활동을 촉진시킵니다.",
          instructor: "그루브교, 댄싱용",
        },
        {
          image: require("@/assets/스쿼시_이미지.jpg"),
          title: "스쿼시",
          description:
            "스쿼시는 나이에 관계없이 즐길 수 있는 운동이며, 노인들에게도 많은 이점을 제공합니다. 스쿼시는 다른 운동과는 달리 부상의 위험이 적은 편이며, 관절을 부드럽게 움직일 수 있는 유연성과 근력을 향상시키는 데 도움이 됩니다.",
          instructor: "요가호, 유연영",
        },
      ],
    };
  },
  methods: {
    goToDetail(index) {
      // 상세 보기 페이지로 이동
      this.$router.push(`/Exercise/${index + 1}`);
    },
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
};
</script>

<style>
.card-container {
  display: flex;
  justify-content: center;
  max-width: 1200px;
  margin: 0 auto;
  position: relative;
}

.home-container {
  background-color: #e0f2f1; /* 푸른색 배경으로 변경 */
  padding: 20px; /* 적절한 여백 추가 */
}

.card-group {
  display: flex;
  flex-wrap: wrap;
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

.card-description {
  font-size: 14px;
  color: #000000;
}

.card-text {
  display: flex;
  align-items: flex-end;
  padding-top: 0;
  position: absolute;
  bottom: 0;
}

.text-muted {
  font-weight: bold;
  font-size: 14px;
  color: #999999;
}

.container-with-border {
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 16px;
  margin-top: 16px;
}

.container-title {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}

.heart-icon,
.right-icon {
  margin-left: 8px;
}

.footer {
  position: fixed;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #00a98f;
  color: #ffffff;
  font-weight: bold;
}

.v-application--wrap {
  min-height: 0vh !important;
  margin: 0;
}

* {
  margin: 0;
}

.container-with-border {
  border: 1px solid #ccc;
  border-radius: 4px;
  padding: 16px;
  margin-top: 16px;
}

@media (max-width: 1279px) {
  .container-with-icon {
    display: none;
  }
}
</style>
