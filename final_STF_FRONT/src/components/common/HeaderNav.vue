<template>
  <header>
    <nav>
      <router-link to="/">Home</router-link> |
      <router-link :to="{ name: 'boardCreate' }">게시글 등록</router-link> |
      <router-link :to="{ name: 'boardList' }">게시글 목록</router-link>
    </nav>
  </header>
</template>

<script>
export default {};
</script>

<style>
nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
