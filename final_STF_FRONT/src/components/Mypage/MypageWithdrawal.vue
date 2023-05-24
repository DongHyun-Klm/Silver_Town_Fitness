<template>
  <v-app>
    <v-main>
      <v-container>
        <v-card>
          <v-card-title>
            <h2>회원 탈퇴</h2>
          </v-card-title>
          <v-card-text>
            <p>정말로 회원 탈퇴하시겠습니까?</p>
            <p>회원 탈퇴 시 모든 데이터가 삭제되며, 되돌릴 수 없습니다.</p>
          </v-card-text>
          <v-card-actions>
            <v-btn color="error" @click="confirmDelete">탈퇴하기</v-btn>
            <v-btn @click="cancel">취소</v-btn>
          </v-card-actions>
        </v-card>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  name: "WithdrawalPage",
  created() {
    this.$checkLogin();
  },
  methods: {
    confirmDelete() {
      axios
        .delete("http://localhost:9999/api/user", {
          headers: { "access-token": localStorage.getItem("access-token") },
        })
        .then(() => {
          alert("그동안 이용해주셔서 감사합니다");
          this.$router.push("/");
        })
        .catch((error) => {
          console.error("Error withdrawing user:", error);
        });
    },
    cancel() {
      // 마이페이지로 돌아가기
      this.$router.push("/Mypage");
    },
  },
};
</script>

<style scoped>
/* 스타일 */
</style>
