<template>
  <div class="container">
    <h1>사랑방 상세 페이지</h1>
    <div>
      <h2>{{ post.title }}</h2>
      <p>작성자: {{ post.author }}</p>
      <p>작성일: {{ post.date }}</p>
      <p>조회수: {{ post.views }}</p>
      <div v-html="post.content"></div>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      post: null
    };
  },
  mounted() {
    // 데이터 로드
    this.fetchPost();
  },
  methods: {
    fetchPost() {
      const postId = this.$route.params.id; // 게시글의 식별자를 경로 매개변수에서 가져옵니다.
      // 여기에서 데이터베이스로부터 특정 게시글 데이터를 가져오는 요청을 수행합니다.
      // 예시로 axios를 사용하여 GET 요청을 보내고, 응답을 받아옵니다.
      axios
        .get(`/api/posts/${postId}`)
        .then((response) => {
          this.post = response.data; // 응답에서 받아온 게시글 데이터를 저장합니다.
        })
        .catch((error) => {
          console.error(error);
        });
    }
  }
};
</script>

<style scoped>
.container {
  background-color: rgba(255, 255, 255, 0.7);
  padding: 20px;
  border-radius: 5px;
}

.container h1 {
  margin-bottom: 20px;
}

.container h2 {
  margin-bottom: 10px;
}

.container p {
  margin-bottom: 5px;
}
</style>