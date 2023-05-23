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
        <v-btn v-if="AccessUpdate" color="primary" @click="editPost">수정하기</v-btn>
        <v-btn color="error" @click="deletePost">삭제하기</v-btn>
      </v-card-actions>
    </v-card>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      post: null,
      AccessUpdate: false,
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
    deletePost() {
      const postId = this.$route.params.board_index;
      axios({
        // 임시 헤더(j)
        headers: {
          "access-token":
            //라현
            // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6InJhX2lkIiwiYWdlIjoiMjUiLCLri7TslYTrs7TsnpAiOiLtlZzquIDrj4TqsIDriqU_IiwidXNlcl9uYW1lIjoiZG9uZ2h5dW4ifQ.NtCnbyxayVDbbp1g7h0AGS36uLG81CsaQ_V8VCqlgTY",
            //재이
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImpheV9pZCIsImFnZSI6IjI1Iiwi64u07JWE67O07J6QIjoi7ZWc6riA64-E6rCA64qlPyIsInVzZXJfbmFtZSI6ImRvbmdoeXVuIn0.1jp8iMua6E1EvyUEKeZmc9p7V-Aq6PKZ6vg4Wc5GgYE",
        },
        method: "delete",
        url: `http://localhost:9999/api/board/${postId}`,
      })
        .then((response) => {
          this.$router.push("/");
          console.log(response.data);
        })
        .catch(() => {
          alert("본인 글만 삭제할 수 있습니다. 사랑방 페이지로 돌아갑니다~");
          this.$router.push("/Board");
        });
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
