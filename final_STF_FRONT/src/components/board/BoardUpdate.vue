<template>
  <v-container class="container" fluid>
    <v-row justify="center">
      <v-col cols="12" sm="8" md="6">
        <h1 class="title">사랑방 수정 페이지</h1>
        <v-form @submit.prevent="submitForm">
          <v-text-field
            v-model="form.title"
            label="게시글 제목"
            required
          ></v-text-field>
          <v-text-field
            v-model="form.author"
            label="작성자"
            required
          ></v-text-field>
          <v-textarea
            v-model="form.content"
            label="내용"
            required
          ></v-textarea>
          <v-btn type="submit" class="form-button" color="primary">수정 완료</v-btn>
        </v-form>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      form: {
        title: "",
        author: "",
        content: ""
      }
    };
  },
  mounted() {
    this.fetchPost(); // 수정할 게시글 데이터를 가져오는 메서드 호출
  },
  methods: {
    fetchPost() {
      const postId = this.$route.params.id; // 수정할 게시글의 ID를 라우트 매개변수에서 가져옴
      axios
        .get(`/api/posts/${postId}`)
        .then((response) => {
          this.form = response.data; // 서버에서 받아온 데이터를 폼에 할당
        })
        .catch((error) => {
          console.error("Error fetching post:", error);
        });
    },
    submitForm() {
      const postId = this.$route.params.id; // 수정할 게시글의 ID를 라우트 매개변수에서 가져옴
      axios
        .put(`/api/posts/${postId}`, this.form)
        .then((response) => {
          console.log(response.data); // 응답 데이터 확인
          console.log("게시글이 수정되었습니다.");
          // 추가적인 작업 수행
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

.title {
  margin-bottom: 20px;
  text-align: center;
}

.form-button {
  margin-top: 20px;
}

.form-button:hover {
  background-color: #555;
}
</style>