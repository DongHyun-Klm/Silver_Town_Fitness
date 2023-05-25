<template>
  <v-container class="container" fluid>
    <v-row justify="center">
      <v-col cols="12" sm="8" md="6">
        <h1 class="title">사랑방 수정 페이지</h1>
        <v-form @submit.prevent="submitForm">
          <v-text-field
            v-model="form.board_title"
            label="게시글 제목"
            required
            :placeholder="form.board_title"
          ></v-text-field>
          <v-text-field
            v-model="form.user_id"
            label="작성자"
            required
            disabled
            :value="form.user_id"
          ></v-text-field>
          <v-textarea
            v-model="form.board_content"
            label="내용"
            required
            :placeholder="form.board_content"
          ></v-textarea>
          <v-btn type="submit" class="form-button" color="primary"
            >수정 완료</v-btn
          >
        </v-form>
        <v-dialog v-model="dialog" max-width="400px">
          <v-card>
            <v-card-title
              class="headline"
              style="background-color: #2196f3; color: white"
              >알림</v-card-title
            >
            <v-card-text>게시글이 수정되었습니다.</v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" text @click="closeDialog">확인</v-btn>
            </v-card-actions>
          </v-card>
        </v-dialog>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  created() {
    this.$checkLogin();
  },
  data() {
    return {
      form: {
        board_title: "",
        user_id: "",
        board_content: "",
      },
      dialog: false,
    };
  },
  mounted() {
    this.fetchPost(); // 수정할 게시글 데이터를 가져오는 메서드 호출
  },
  methods: {
    fetchPost() {
      const postId = this.$route.params.board_index; // 수정할 게시글의 ID를 라우트 매개변수에서 가져옴
      axios
        .get(`http://localhost:9999/api/board/${postId}`)
        .then((response) => {
          this.form = response.data; // 서버에서 받아온 데이터를 폼에 할당
        })
        .catch((error) => {
          console.error("Error fetching post:", error);
        });
    },
    submitForm() {
      // const postId = this.$route.params.board_index; // 수정할 게시글의 ID를 라우트 매개변수에서 가져옴
      axios
        .put(`http://localhost:9999/api/board`, this.form)
        .then(() => {
          this.dialog = true; // 다이얼로그 열기

          // 추가적인 작업 수행
        })
        .catch((error) => {
          console.error(error);
        });
    },
    closeDialog() {
      this.dialog = false; // 다이얼로그 닫기

      this.$router.go(-1); // 이전 페이지로 이동
    },
  },
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
