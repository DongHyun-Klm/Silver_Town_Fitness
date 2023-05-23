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
    <br />
    <!-- 글 등록 버튼 -->
    <div class="register-container">
      <v-btn class="register-button" color="primary" @click="goToCreatePage">
        글 등록하기
      </v-btn>
    </div>
    <!-- 게시글 목록 -->
    <div class="table-container">
      <table class="table">
        <BoardList></BoardList>
      </table>
    </div>
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

.register-button {
  display: flex;
  justify-content: flex-end;
  margin-top: 10px;
}
.register-container {
  display: flex;
  justify-content: flex-end;
  margin-top: 10px;
}

.container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.table-container {
  margin-top: 20px;
}

.table {
  width: 100%;
  max-width: 100%;
  border-collapse: collapse;
  table-layout: fixed; /* 추가: 테이블의 너비를 고정으로 설정 */
}

.table th,
.table td {
  border: 1px solid #ccc;
  padding: 10px;
  white-space: nowrap; /* 추가: 텍스트 줄바꿈 방지 */
  overflow: hidden; /* 추가: 내용이 너무 길어도 숨기고 나머지는 보이지 않도록 설정 */
  text-overflow: ellipsis; /* 추가: 내용이 너무 길어지면 말줄임표(...) 표시 */
}

.title-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
}

.heart-icon {
  font-size: 24px;
  color: #f44336;
  margin-right: 10px;
}

.title {
  font-size: 40px;
  font-weight: bold;
  color: #333;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}

</style>
