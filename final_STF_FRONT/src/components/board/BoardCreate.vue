<template>
  <v-container class="container" fluid>
    <v-row justify="center">
      <v-col cols="12" sm="8" md="6">
        <h1 class="title">사랑방 작성 페이지</h1>
        <v-form @submit.prevent="submitForm" enctype="multipart/form-data">
          <v-text-field
            v-model="form.board_title"
            label="게시글 제목"
            required
          ></v-text-field>
          <v-textarea
            v-model="form.board_content"
            label="내용"
            required
          ></v-textarea>

          <v-file-input
            v-model="form.user_img"
            label="이미지"
            accept="image/*"
          ></v-file-input>
          <v-btn type="submit" class="form-button" color="primary"
            >작성 완료</v-btn
          >
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
        board_title: "",
        board_content: "",
        user_img: null, // 파일 업로드를 위해 null로 초기화
      },
    };
  },
  methods: {
    submitForm() {
      const formData = new FormData(); // FormData 객체 생성
      formData.append("board_title", this.form.board_title);
      formData.append("board_content", this.form.board_content);
      formData.append("file", this.form.user_img); // 파일 업로드 추가
      const token = localStorage.getItem("access-token");
      axios
        .post(`http://localhost:9999/api/board`, formData, {
          headers: {
            "Content-type": "multipart/form-data",
            "access-token": token,
          },
        })
        .then(() => {
          alert("게시글이 작성되었습니다.");
          this.$router.push("/Board");
        })
        .catch((error) => {
          console.error(error);
        });
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
