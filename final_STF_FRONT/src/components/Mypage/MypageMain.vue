<template>
  <v-app>
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="4">
            <div class="avatar">
              <v-img class="avatar-image" :src="getImagePath(img)"></v-img>
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
                </v-container>
              </v-card-text>
            </v-card>
          </v-col>
        </v-row>

        <v-row>
          <v-col cols="12" class="button-container">
            <div class="button-wrapper">
              <router-link
                to="/Mypage/MypageUpdate"
                tag="v-btn"
                :class="['custom-button', 'primary-button']"
                >수정하기</router-link
              >
              <router-link
                to="/Mypage/MypageWithdrawal"
                tag="v-btn"
                :class="['custom-button', 'error-button']"
                >탈퇴하기</router-link
              >
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
      img: "",
      id: "",
      nick: "",
      name: "",
      birth: "",
      sex: "",
      email: "",
      number: "",
    };
  },
  created() {
    this.$checkLogin();
  },
  mounted() {
    this.fetchData(); // 컴포넌트가 마운트되면 데이터를 불러오는 메소드 호출
  },
  methods: {
    fetchData() {
      axios
        .get("http://localhost:9999/api/user/mypage", {
          headers: { "access-token": localStorage.getItem("access-token") },
        })
        .then((response) => {
          this.id = response.data.user_id;
          this.nick = response.data.user_nick;
          this.name = response.data.user_name;
          this.birth = response.data.user_birth;
          this.sex = response.data.user_sex;
          this.email = response.data.user_email;
          this.number = response.data.user_number;
          this.img = response.data.user_img;
        })
        .catch((error) => {
          console.error("Error fetching personal info:", error);
        });
    },
    getImagePath(image) {
      return require(`@/assets/upload/${image}`);
    },
  },
};
</script>

<style scoped>
#app {
  padding: 0px;
}

h2,
h3,
p {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.avatar {
  width: 350px;
  height: 350px;
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
  background-color: #1976d2;
  color: white;
}

.error-button {
  background-color: #f44336;
  color: white;
}
</style>
