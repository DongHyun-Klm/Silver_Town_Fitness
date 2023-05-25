<template>
  <v-container class="container">
    <v-card>
      <v-card-title class="board-title">{{ post.board_title }}</v-card-title>
      <v-card-subtitle>작성자: {{ post.user_id }}</v-card-subtitle>
      <v-card-subtitle>작성일: {{ post.board_date }}</v-card-subtitle>
      <v-card-subtitle>조회수: {{ post.board_cnt }}</v-card-subtitle>
      <v-card-text>
        <div v-html="post.board_content"></div>
      </v-card-text>
      <v-card-actions>
        <v-btn v-if="AccessUpdate" color="primary" @click="editPost"
          >수정하기</v-btn
        >
        <v-btn color="error" @click="showConfirmationDialog">삭제하기</v-btn>
        <v-btn color="success" @click="backPost">뒤로가기</v-btn>
      </v-card-actions>
    </v-card>

    <v-dialog v-model="confirmationDialog" max-width="400px">
      <v-card>
        <v-card-title
          class="headline"
          style="background-color: #f44336; color: white"
        >
          알림
        </v-card-title>
        <v-card-text>글을 삭제하시겠습니까?</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="error" text @click="deletePost">확인</v-btn>
          <v-btn text @click="closeConfirmationDialog">취소</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      post: null,
      AccessUpdate: false,
      confirmationDialog: false,
    };
  },
  mounted() {
    this.fetchPost();
  },
  watch: {
    post(newValue) {
      const user_id = localStorage.getItem("id");
      this.AccessUpdate = user_id === newValue.user_id;
    },
  },

  methods: {
    fetchPost() {
      const postId = this.$route.params.board_index;
      axios
        .get(`http://localhost:9999/api/board/${postId}`)
        .then((response) => {
          this.post = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    editPost() {
      this.$router.push({
        name: "BoardUpdate",
        params: {
          board_index: this.$route.params.board_index,
        },
      });
    },
    backPost() {
      this.$router.go(-1);
    },
    deletePost() {
      const postId = this.$route.params.board_index;
      axios
        .delete(`http://localhost:9999/api/board/${postId}`, {
          headers: { "access-token": localStorage.getItem("access-token") },
        })
        .then(() => {
          // alert("삭제되었습니다.");
          this.$router.push("/Board");
        })
        .catch(() => {
          alert("본인 글만 삭제할 수 있습니다.");
          this.$router.go(0);
        });
      this.confirmationDialog = false;
    },
    showConfirmationDialog() {
      this.confirmationDialog = true;
    },
    closeConfirmationDialog() {
      this.confirmationDialog = false;
    },
  },
};
</script>

<style scoped>
.container {
  padding: 20px;
}

.board-title {
  font-size: 24px;
  margin-bottom: 10px;
}

.v-card-subtitle {
  margin-bottom: 5px;
}

.v-card-text {
  margin-top: 20px;
}

.v-card-actions {
  margin-top: 20px;
}
</style>
