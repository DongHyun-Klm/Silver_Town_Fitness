<template>
  <div class="home-container">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'RegisterView',
};
</script>

<style>

.home-container {
  background-color: #eef3ed;
  padding: 20px; /* 적절한 여백 추가 */
  /* background-image: url('@/assets/barImg.jpeg'); */
  background-size: cover; /* 이미지를 화면에 꽉 차게 설정 */
  background-position: center; /* 이미지를 가운데 정렬 */
}
</style>
