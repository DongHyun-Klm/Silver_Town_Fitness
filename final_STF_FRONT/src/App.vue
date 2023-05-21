<template>
  <v-app id="app">
    <header-nav></header-nav>
    <router-view />
  </v-app>
</template>

<script>
import HeaderNav from "@/components/common/HeaderNav.vue";

export default {
  components: {
    HeaderNav,
  },

  name: "App",

  data: () => ({
    //
  }),
};
</script>

<style></style>
