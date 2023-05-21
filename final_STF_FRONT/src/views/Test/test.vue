<template>
  <v-app>
    <v-main>
      <h2>테스트 페이지</h2>
      <v-calendar locale="ko-KR" />
      <v-date-picker
        locale="ko-KR"
        v-model="selectedDate"
        range
        color="blue"
        dark
      />
      <button @click="clk">버튼</button>
    </v-main>
  </v-app>
</template>

<script>
export default {
  name: "BoardMain",
  components: {},
  data() {
    return {
      selectedDate: null,
    };
  },
  methods: {
    clk() {
      console.log(this.selectedDate);
    },
  },
};
</script>

<style></style>
