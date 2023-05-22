<template>
  <v-app>
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="4">
            <div class="avatar">
              <v-img class="avatar-image" :src="img"></v-img>
            </div>
          </v-col>

          <v-col cols="8">
            <v-card>
              <v-card-title>
                <h2>개인 정보</h2>
              </v-card-title>
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12">
                      <h3>아이디</h3>
                      <p>{{ id }}</p>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>닉네임</h3>
                      <p>{{ nick }}</p>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>이름</h3>
                      <p>{{ name }}</p>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>생일</h3>
                      <p>{{ birth }}</p>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>성별</h3>
                      <p>{{ sex }}</p>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>이메일</h3>
                      <p>{{ email }}</p>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>휴대전화 번호</h3>
                      <p>{{ number }}</p>
                    </v-col>
                  </v-row>

                  <!-- 추가적인 개인정보 항목들을 원하는 만큼 추가 -->
                </v-container>
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" class="button-container">
            <div class="button-wrapper">
              <router-link to="/Mypage/MypageUpdate" tag="v-btn" :class="['custom-button', 'primary-button']">수정하기</router-link>
              <router-link to="/Mypage/MypageWithdrawal" tag="v-btn" :class="['custom-button', 'error-button']">탈퇴하기</router-link>
            </div>
          </v-col>
        </v-row>

      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  name: "MyPageMain",
  data() {
    return {
      img: require("@/assets/게이트볼_이미지.jpg"), // 임시
      // img: "",
      nick: "",
      name: "",
      birth: "",
      sex: "",
      email: "",
      number: "",
    };
  },
  mounted() {
    this.fetchData(); // 컴포넌트가 마운트되면 데이터를 불러오는 메소드 호출
  },
  methods: {
    fetchData() {
      // API 요청을 통해 개인 정보 데이터를 불러옵니다.
      // 실제로 사용할 데이터베이스 백엔드와의 통신 방법에 따라 구현해야 합니다.
      // 아래는 예시 코드로, axios 라이브러리를 사용하여 GET 요청을 보냅니다.
      axios
        .get("/api/personal-info") // 실제 엔드포인트를 사용해야 합니다.
        .then((response) => {
          this.img = response.data.img;
          this.nick = response.data.nick;
          this.name = response.data.name;
          this.birth = response.data.birth;
          this.sex = response.data.sex;
          this.email = response.data.email;
          this.number = response.data.number;
          // 추가적인 개인정보 데이터를 바인딩
        })
        .catch((error) => {
          console.error("Error fetching personal info:", error);
        });
    },
  },
};
</script>

<style scoped>
#app {
  padding: 0px;
}

.avatar {
  width: 200px;
  height: 200px;
  border-radius: 50%;
  overflow: hidden;
}

.avatar-image {
  width: 100%;
  height: 100%;
}

.button-container {
  display: flex;
  justify-content: flex-end;
}

.button-wrapper {
  display: flex;
}

.custom-button {
  margin-right: 10px;
  font-size: 16px;
  border-radius: 20px;
  padding: 10px 20px;
  text-transform: none;
}

.custom-button:hover {
  opacity: 0.8;
}

.custom-button:active {
  opacity: 0.9;
}

.primary-button {
  background-color: #1976d2; /* 원하는 primary 색상 값으로 변경하세요 */
  color: white;
}

.error-button {
  background-color: #f44336; /* 원하는 error 색상 값으로 변경하세요 */
  color: white;
}

</style>
