<template>
  <v-card>
    <v-img :src="imageSrc" :class="{ 'zoomed': isZoomed }" @click="toggleZoom"></v-img>
    <v-card-actions>
      <v-btn @click="zoomIn">확대</v-btn>
      <v-btn @click="zoomOut">축소</v-btn>
    </v-card-actions>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      isZoomed: false,
      scale: 1
    };
  },
  computed: {
    imageSrc() {
      return this.isZoomed ? '@/assets/1684829116446_말라무트.jpg' : '@/assets/사랑방';
    }
  },
  methods: {
    toggleZoom() {
      this.isZoomed = !this.isZoomed;
    },
    zoomIn() {
      this.scale += 0.1;
    },
    zoomOut() {
      this.scale -= 0.1;
    }
  }
};
</script>

<style scoped>
.zoomed {
  transform: scale(var(--scale, 1));
}
</style>