<template>
  <header>
    <nav class="header-nav">
      <div >
        <img class="text-center" src="@/assets/ssafy_logo.png" />
      </div>
      <div>
        <!-- IF 로그인 상태 / 아닌 상태 -->
        <router-link to="/movie/create">수강 신청</router-link> |
        <router-link to="/movie">마이페이지</router-link> | 
        <router-link to="/movie">마이페이지</router-link>
      </div>

    </nav>
  </header>
</template>

<script>
export default {
  name: "HeaderNav",
};
</script>

<style>
header {
  height: 70px;
  background-color: black;
  line-height: 70px;
  padding: 0px 30px;
}

header a {
  text-decoration: none;
  color: white;
}

.header-nav {
  display: flex;
  justify-content: space-between;
}

.logo {
  display: inline-block;
  font-size: 5rem;
  font-weight: bold;
  color: white;
}
</style>
