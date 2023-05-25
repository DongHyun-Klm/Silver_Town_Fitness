<template>
  <div class="login-page ">
    <v-container >
    <router-view />
    <div class="login-content login-content-signin " v-show="!showSignIn">
      <div>
        <h2>로그인</h2>
        <form class="wrapper-box " @submit.prevent="login">
          <input
            type="id"
            v-model="id_login"
            class="form-control form-control-id"
            placeholder="아이디를 입력하세요."
            required
          />
          <input
            type="password"
            v-model="password_login"
            class="form-control form-control-password"
            placeholder="비밀번호를 입력하세요"
            required
          />
          <!-- <a class="outer-link pull-left" href="#/forgot">Forgot Password</a> -->
          <button type="submit" class="btn">로그인</button>
        </form>
      </div>
    </div>

    <div class="login-content login-content-signup" v-show="showSignIn">
      <div>
        <h2>회원가입</h2>
        <form
          class="wrapper-box"
          @submit.prevent="register"
          enctype="multipart/form-data"
        >
          <input
            type="text"
            v-model="name"
            name="name"
            class="form-control form-control-name"
            placeholder="이름 입력"
            required
          />
          <input
            type="id"
            v-model="id"
            name="id"
            class="form-control form-control-id"
            placeholder="아이디 입력(영어 5글자이상)"
            required
            @input="dupliChk"
          />
          <div v-if="showIdStatus">
            <div v-if="!isIdValid">사용 불가능한 아이디입니다.</div>
            <div v-else>사용 가능한 아이디입니다.</div>
          </div>
          <input
            type="password"
            v-model="password"
            name="password"
            class="form-control form-control-password"
            placeholder="비밀번호 입력"
            required
          />
          <input
            type="text"
            v-model="nick"
            name="nick"
            class="form-control form-control-nick"
            placeholder="별명 입력"
            required
          />
          <input
            type="number"
            v-model="number"
            name="number"
            class="form-control form-control-number"
            placeholder="휴대전화 번호 입력"
            required
          />
          <input
            type="number"
            v-model="birth"
            name="birth"
            class="form-control form-control-birth"
            placeholder="생년월일(ex:970830) 입력"
            required
          />
          <input
            type="text"
            v-model="sex"
            name="sex"
            class="form-control form-control-sex"
            placeholder="성별 입력(남성/여성)"
            required
          />
          <input
            type="email"
            v-model="email"
            name="email"
            class="form-control form-control-email"
            placeholder="이메일 입력"
            required
          />
          <!-- handleImageUpload 메소드는 파일을 선택한 후 실행되는 함수 -->
          <input
            type="file"
            id="fileInput"
            name="fileInput"
            accept="image/*"
            @change="handleImageUpload"
            class="form-control form-control-image"
            style="display: none"
          />
          <div class="mg-1">
            <v-btn color="primary" dark class="btn">
              <label for="fileInput" class="custom-file-upload">
                사진 넣기
              </label>
            </v-btn>
          </div>
          <div v-if="showUploadSuccess">사진이 업로드되었습니다!</div>
          <div class="mg-1">
            <v-btn
              :color="!isIdValid ? 'grey darken-2' : 'primary'"
              dark
              class="btn"
              :disabled="!isIdValid"
              @click="register"
            >
              <template>회원가입</template>
            </v-btn>
          </div>
        </form>
      </div>
    </div>

    <div class="login-switcher">
      <div class="login-switcher-signin" v-show="showSignIn">
        <h3>회원이신가요~?</h3>
        <button @click="showSignIn = false" class="custom-btn">로그인</button>
      </div>
      <div class="login-switcher-signup" v-show="!showSignIn">
        <h3>.. 아직 가입하지 않으셨나요~?</h3>
        <button @click="showSignIn = true" class="custom-btn">회원가입</button>
      </div>


    </div> 
    </v-container>
  </div>
</template>

<script>
import http from "@/util/http-common";
export default {
  name: "LoginView",
  data() {
    return {
      showSignIn: false,
      id_login: "",
      password_login: "",
      id: "",
      password: "",
      name: "",
      nick: "",
      number: "",
      birth: "",
      sex: "",
      email: "",
      image: null,
      showUploadSuccess: false,
      isIdValid: false,
    };
  },
  methods: {
    login() {
      // 로그인 로직
      http
        .post("/user/login", {
          user_id: this.id_login,
          user_password: this.password_login,
        })
        .then(({ data }) => {
          console.log(data);
          localStorage.setItem("access-token", data.access_token);
          localStorage.setItem("id", this.id_login);
          const msg = data.message;
          alert(msg);
          window.location.href = "http://localhost:8080/";
        })
        .catch((error) => {
          const msg = error.response.data.message;
          alert(msg);
          window.location.href = "http://localhost:8080/Login";
        });
    },
    register() {
      // Create a FormData object
      this.showUploadSuccess = false;
      const formData = new FormData();
      formData.append("user_id", this.id);
      formData.append("user_password", this.password);
      formData.append("user_name", this.name);
      formData.append("user_nick", this.nick);
      formData.append("user_number", this.number);
      formData.append("user_birth", this.birth);
      formData.append("user_sex", this.sex);
      formData.append("user_email", this.email);
      formData.append("profileImage", this.image);

      http
        .post("/user/signup", formData, {
          headers: { "Content-Type": "multipart/form-data" },
        })
        .then(() => {
          alert("회원가입 성공!");
          this.$router.push("/");
        })
        .catch(() => {
          alert("잘못된 입력입니다.");
          window.location.href = "http://localhost:8080/Login";
        });
    },
    handleImageUpload(event) {
      const file = event.target.files[0];
      this.image = file;
      this.showUploadSuccess = true;
    },
    // 아이디 유효성검사
    dupliChk() {
      this.showIdStatus = true; // 아이디 상태 표시 영역을 보이도록 설정

      const regex = /^[A-Za-z0-9]+$/;
      const isValidId = regex.test(this.id) && this.id.length >= 5;

      if (isValidId) {
        // 중복 체크 요청
        http.post("/user/signup/chk", { user_id: this.id }).then(({ data }) => {
          this.isIdValid = !data;
        });
      } else {
        this.isIdValid = false;
      }
    },
  },
};
</script>

<style scoped>
.login-page {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  background: #fff;
}

.login-content {
  width: 420px;
  padding: 40px;
  height: 500px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1;
  position: absolute;
  background: #fff;
  box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
  border-top: 5px solid #7ac142;
  float: left;
  transition: all 0.2s ease-out;
  transition-delay: 0.2s;
}

.login-content-signin.ng-hide:not(.ng-hide-animate) {
  transition-delay: 0s;
  display: block !important;
  opacity: 0;
  z-index: -1;
  transform: translate(-45%, -50%);
}

.login-content-signup.ng-hide:not(.ng-hide-animate) {
  transition-delay: 0s;
  display: block !important;
  opacity: 0;
  z-index: -1;
  transform: translate(-55%, -50%);
}

h2 {
  text-align: left;
  color: #7ac142;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin: 0;
  font-size: 18px;
  font-weight: bold;
}

form.wrapper-box {
  margin-top: 40px;
}
form.wrapper-box input.form-control {
  margin-bottom: 2px;
}

input {
  margin-top: 10px;
  border: none;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 0;
  padding-left: 0;
  box-shadow: none;
  transition: all 0.1s ease-out;
}

input:valid {
  border-bottom: 1px solid #7ac142;
}

input:focus:invalid {
  border-bottom: 1px solid #ef6161;
}

::-webkit-input-placeholder {
  color: rgba(0, 0, 0, 0.5);
}

:-moz-placeholder {
  color: rgba(0, 0, 0, 0.5);
}

::-moz-placeholder {
  color: rgba(0, 0, 0, 0.5);
}

:-ms-input-placeholder {
  color: rgba(0, 0, 0, 0.5);
}

button {
  display: inline-block;
  margin-top: 50px;
  border: 2px solid #7ac142;
  background: #7ac142;
  border-radius: 25px;
  padding: 3px 12px 5px 12px;
  color: #fff;
  font-size: 14px;
  font-weight: bold;
  letter-spacing: 0px;
  transition: all 0.1s ease-out;
}

button:hover {
  color: #7ac142;
  background: #fff;
  border: 2px solid #7ac142;
}

button:active {
  box-shadow: none;
}

.outer-link {
  display: inline-block;
  margin-top: 50px;
  padding: 5px 0;
  display: block;
  color: rgba(0, 0, 0, 0.4);
  transition: all 0.1s ease-out;
}

.outer-link:hover {
  transition: all 0s ease-out;
  color: rgba(0, 0, 0, 0.8);
  text-decoration: none;
}

.login-content-signin > div,
.login-content-signup > div {
  width: 360px;

  overflow: hidden;
  top: 50%;
  position: relative;
  transform: translateY(-50%);
}

.login-content-signin {
  margin-left: -130px;
}

.login-content-signup {
  margin-left: 130px;
}

.login-switcher {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  width: 800px;
  height: 400px;
  box-shadow: 0 0px 20px rgba(0, 0, 0, 0.03);
}

.login-switcher > div {
  width: 40%;
  margin-top: 125px;
}

.login-switcher-signin {
  float: left;
}

.login-switcher-signup {
  float: right;
}

h3 {
  color: rgba(0, 0, 0, 0.6);
  font-size: 18px;
  margin: 0;
}

.custom-btn {
  display: inline-block;
  margin-top: 10px;
  padding: 5px 20px;
  display: block;
  color: #fff;
  background: #7ac142;
  border: none;
  border-radius: 25px;
  font-size: 14px;
  font-weight: bold;
  letter-spacing: 0px;
  transition: all 0.1s ease-out;
}

.custom-btn:hover {
  transition: all 0s ease-out;
  color: #7ac142;
  background: #fff;
}
</style>

<style scoped>
.login-page {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  background: #fff;
}

.login-content {
  width: 420px;
  padding: 40px;
  height: 800px;
  top: 80%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 1;
  position: absolute;
  background: #fff;
  box-shadow: 0 0px 70px rgba(0, 0, 0, 0.1);
  border-top: 5px solid #7ac142;
  float: left;
  transition: all 0.2s ease-out;
  transition-delay: 0.2s;
}

.login-content-signin.ng-hide:not(.ng-hide-animate) {
  transition-delay: 0s;
  display: block !important;
  opacity: 0;
  z-index: -1;
  transform: translate(-45%, -50%);
}

.login-content-signup.ng-hide:not(.ng-hide-animate) {
  transition-delay: 0s;
  display: block !important;
  opacity: 0;
  z-index: -1;
  transform: translate(-55%, -50%);
}

h2 {
  text-align: left;
  color: #7ac142;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin: 0;
  font-size: 18px;
  font-weight: bold;
}

form.wrapper-box {
  margin-top: 20px;
}
form.wrapper-box input.form-control {
  margin-bottom: 2px;
  width: 500px;
}

input {
  margin-top: 20px;
  border: none;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 0;
  padding-left: 0;
  box-shadow: none;
  transition: all 0.1s ease-out;
}

input:valid {
  border-bottom: 1px solid #7ac142;
}

input:focus:invalid {
  border-bottom: 1px solid #ef6161;
}

::-webkit-input-placeholder {
  color: rgba(0, 0, 0, 0.5);
}

:-moz-placeholder {
  color: rgba(0, 0, 0, 0.5);
}

::-moz-placeholder {
  color: rgba(0, 0, 0, 0.5);
}

:-ms-input-placeholder {
  color: rgba(0, 0, 0, 0.5);
}

button {
  display: inline-block;
  margin-top: 50px;
  border: 2px solid #7ac142;
  background: #7ac142;
  border-radius: 25px;
  padding: 3px 12px 5px 12px;
  color: #fff;
  font-size: 14px;
  font-weight: bold;
  letter-spacing: 0px;
  transition: all 0.1s ease-out;
}

button:hover {
  color: #7ac142;
  background: #fff;
  border: 2px solid #7ac142;
}

button:active {
  box-shadow: none;
}

.outer-link {
  display: inline-block;
  margin-top: 50px;
  padding: 5px 0;
  display: block;
  color: rgba(0, 0, 0, 0.4);
  transition: all 0.1s ease-out;
}

.outer-link:hover {
  transition: all 0s ease-out;
  color: rgba(0, 0, 0, 0.8);
  text-decoration: none;
}

.login-content-signin > div,
.login-content-signup > div {
  overflow: hidden;
  top: 50%;
  position: relative;
  transform: translateY(-50%);
}

.login-content-signin {
  margin-left: -130px;
}

.login-content-signup {
  margin-left: 130px;
}

.login-switcher {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
  width: 660px;
  height: 400px;
  box-shadow: 0 0px 20px rgba(0, 0, 0, 0.03);
}

.login-switcher > div {
  width: 40%;
  margin-top: 125px;
}

.login-switcher-signin {
  float: left;
}

.login-switcher-signup {
  float: right;
}

h3 {
  color: rgba(0, 0, 0, 0.6);
  font-size: 18px;
  margin: 0;
}

.custom-btn {
  display: inline-block;
  margin-top: 10px;
  padding: 5px 20px;
  display: block;
  color: #fff;
  background: #7ac142;
  border: none;
  border-radius: 25px;
  font-size: 14px;
  font-weight: bold;
  letter-spacing: 0px;
  transition: all 0.1s ease-out;
}

.custom-btn:hover {
  transition: all 0s ease-out;
  color: #7ac142;
  background: #fff;
}

.btn {
  /* 버튼 스타일을 일치시키는 CSS 속성 설정 */
  /* 예시로 일부 스타일을 추가했습니다. 필요에 따라 수정하십시오. */
  display: inline-block;
  padding: 10px 20px;
  font-size: 16px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.mg-1 {
  margin-bottom: 0.5px; /* 원하는 간격으로 수정하세요 */
  margin-top: 0.5px; /* 원하는 간격으로 수정하세요 */
}

.login-page {
  position: relative;
  width: 100%;
  height: 500px;
  top: 0;
  left: 0;
  background: #fff;
 
}

.login-content[data-v-0a49c508] {
  height: 700px;
}

.background{
 background-image: url('@/assets/background-image.jpg');
}

.ps_S {
  font-size: small;
}
.ps_M {
  font-size: medium;
}
.ps_L {
  font-size: large;
}
.ps_XL {
  font-size: x-large;
}
.ps_XXL {
  font-size: xx-large;
}
</style>
