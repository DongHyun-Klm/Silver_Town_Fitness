<template>
  <div class="container">
    <!-- 타이틀 -->
    <div class="title-container">
      <v-icon
        class="heart-icon"
        size="40"
        v-animation="{
          name: 'heart-animation',
          duration: '2s',
          iteration: 'infinite',
          timingFunction: 'linear',
        }"
        >mdi-heart</v-icon
      >
      <h1 class="title">사랑방</h1>
      <v-icon
        class="heart-icon"
        size="40"
        v-animation="{
          name: 'heart-animation',
          duration: '2s',
          iteration: 'infinite',
          timingFunction: 'linear',
        }"
        >mdi-heart</v-icon
      >
    </div>
    <!-- 이미지 -->
    <div class="banner">
      <img src="@/assets/사랑방.jpg" alt="사랑방 이미지" class="banner-image" />
    </div>

    <!-- 게시글 목록 -->
    <div class="table-container">
      <table class="table">
        <BoardList></BoardList>
      </table>
    </div>

    <!-- 글 등록 버튼 -->
    <v-btn class="register-button" color="primary" @click="goToCreatePage">
      글 등록하기
    </v-btn>
  </div>
</template>

<script>
import axios from "axios";
import BoardList from "@/components/Board/BoardList.vue";

export default {
  components: {
    BoardList,
  },
  mounted() {
    // 데이터 로드
    this.fetchPosts();
  },
  methods: {
    fetchPosts() {
      // 여기에서 데이터베이스로부터 게시글 데이터를 가져오는 요청을 수행합니다.
      // 예시로 axios를 사용하여 GET 요청을 보내고, 응답을 받아옵니다.
      axios
        .get("/api/posts")
        .then((response) => {
          this.posts = response.data; // 응답에서 받아온 게시글 데이터를 저장합니다.
        })
        .catch((error) => {
          console.error(error);
        });
    },
    goToCreatePage() {
      // 글 등록 페이지로 이동하는 메서드입니다.
      // 적절한 경로로 변경해야 합니다.
      this.$router.push("/Board/BoardCreate");
    },
  },
};
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.title-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
}

.heart-icon {
  color: #f00707;
  margin: 0 10px;
}

.title {
  font-size: 40px;
  font-weight: bold;
  color: #333;
  text-shadow: 2px 2px 4px rgba(246, 9, 9, 0.3);
}

.banner {
  width: 100%;
  text-align: center;
  padding: 20px;
}

.banner-image {
  width: 100%;
  max-height: 500px;
  object-fit: cover;
}

.table-container {
  width: 100%;
  max-width: 100%;
  margin-top: 20px;
}

.table-card {
  padding: 20px;
}

.register-button {
  position: fixed;
  bottom: 20px;
  right: 20px;
  z-index: 100;
}

@keyframes heart-animation {
  0% {
    transform: scale(1) rotate(0deg);
  }
  50% {
    transform: scale(1.2) rotate(180deg);
  }
  100% {
    transform: scale(1) rotate(360deg);
  }
}

.heart-icon.v-animation {
  animation: heart-animation 2s linear infinite;
}
</style>