<template>
  <v-app>
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="4">
            <div class="avatar">
              <v-img class="avatar-image" :src="img"></v-img>
              <input type="file" @change="handleImageChange" />
            </div>
              <br>
              <h2>새로운 이미지를 원한다면 사진을 누르세요!</h2>
          </v-col>

          <v-col cols="8">
            <v-card>
              <v-card-title>
                <h2>개인 정보 수정</h2>
              </v-card-title>
              <v-card-text>
                <v-container>
                  <v-row>
                    <v-col cols="12">
                      <h3>아이디</h3>
                      <v-text-field v-model="id"></v-text-field>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>닉네임</h3>
                      <v-text-field v-model="nick"></v-text-field>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>이름</h3>
                      <v-text-field v-model="name"></v-text-field>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>생일</h3>
                      <v-text-field v-model="birth"></v-text-field>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>성별</h3>
                      <v-select
                        v-model="sex"
                        :items="['남성', '여성']"
                      ></v-select>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>이메일</h3>
                      <v-text-field v-model="email"></v-text-field>
                    </v-col>
                  </v-row>

                  <v-row>
                    <v-col cols="12">
                      <h3>휴대전화 번호</h3>
                      <v-text-field v-model="number"></v-text-field>
                    </v-col>
                  </v-row>

                  <!-- 추가적인 개인정보 항목들을 원하는 만큼 추가 -->
                </v-container>
              </v-card-text>
              <v-card-actions>
                <v-btn color="primary">저장</v-btn>
                <v-btn color="error" @click="cancel">취소</v-btn>
              </v-card-actions>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  name: "MyPageEdit",
  data() {
    return {
      id: "",
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
          this.id = response.data.id;
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
    cancel() {
      // 마이페이지로 돌아가기
      this.$router.push("/Mypage");
    },
     handleImageChange(event) {
      const file = event.target.files[0];
      if (file) {
        // 선택된 파일을 업로드하거나 처리하는 작업을 수행합니다.
        // 실제 업로드 및 처리 방법은 사용하는 백엔드에 따라 다를 수 있습니다.
        // 아래는 예시 코드로, FormData를 사용하여 이미지 파일을 업로드하는 방법을 보여줍니다.
        const formData = new FormData();
        formData.append("image", file);

        axios
          .post("/api/upload-image", formData) // 실제 엔드포인트를 사용해야 합니다.
          .then((response) => {
            this.img = response.data.imageUrl; // 업로드한 이미지의 URL을 받아와서 이미지를 업데이트합니다.
          })
          .catch((error) => {
            console.error("Error uploading image:", error);
          });
      }
    },
  
  },
};
</script>

<style scoped>
#app {
  padding: 0px;
}

.avatar {
  width: 260px;
  height: 260px;
  border-radius: 50%;
  overflow: hidden;
}

.avatar-image {
  width: 100%;
  height: 100%;
}

.avatar input[type="file"] {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  opacity: 0;
  cursor: pointer;
}


</style>
