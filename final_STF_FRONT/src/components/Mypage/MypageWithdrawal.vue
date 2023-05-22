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
  methods: {
    confirmDelete() {
      // 회원 탈퇴 로직을 처리하는 메소드입니다.
      // 실제로 사용할 데이터베이스 백엔드와의 통신 방법에 따라 구현해야 합니다.
      // 아래는 예시 코드로, axios 라이브러리를 사용하여 DELETE 요청을 보냅니다.
      axios
        .delete("/api/user") // 실제 엔드포인트를 사용해야 합니다.
        .then(() => {
          // 탈퇴 성공 시, 필요한 처리를 수행합니다.
          // 예를 들어, 로그아웃 처리나 홈페이지로 리다이렉트 등을 할 수 있습니다.
          // 이 예시에서는 홈페이지로 리다이렉트하는 것으로 가정합니다.
          this.$router.push("/");
        })
        .catch((error) => {
          console.error("Error withdrawing user:", error);
          // 탈퇴 실패 시, 에러 처리를 수행합니다.
          // 예를 들어, 에러 메시지를 사용자에게 표시하거나 다른 작업을 수행할 수 있습니다.
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
