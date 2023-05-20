<template>

  <div class="home">
    <img src="@/assets/ssafy_logo.png" />
    <h2>게시판 환영!</h2>
  </div>


     
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
