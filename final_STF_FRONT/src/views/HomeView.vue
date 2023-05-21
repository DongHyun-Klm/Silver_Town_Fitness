<template>
   <header>
    <nav class="header-nav">
      <div>
      </div>

      <div>
        <!-- IF 로그인 상태 / 아닌 상태 -->
        <router-link to="/">수강 신청</router-link> |
        <router-link to="/">마이페이지</router-link> |
        <router-link to="/">공지사항</router-link>
      </div>
    </nav>

    <img src="@/assets/ssafy_logo.png" />
    <h2>게시판 환영!</h2>
   </header>
</template>

<script>
export default {
  name: "HomeView",
  data() {
    return {
      file: "",
    };
  },
  methods: {
    fileChange: function (e) {
      console.log(e.target.files); //files는 배열로 들어온다.
      this.file = e.target.files[0];
    },
  },
};
</script>

<style >

.header-nav {
  display: flex;
  justify-content: space-between;
}

</style>