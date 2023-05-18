<template>
  <div>
    <h3>게시글 상세보기</h3>
    <div>{{ board.title }}</div>
    <div>{{ board.viewCnt }}</div>
    <div>{{ board.writer }}</div>
    <div>{{ board.regDate }}</div>
    <div>{{ board.content }}</div>

    <button @click="moveUpdate">수정</button>
    <button @click="deleteBoard">삭제</button>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  name: 'BoardDetail',
  computed: {
    ...mapState(['board']),
  },
  created() {
    const pathName = new URL(document.location).pathname.split('/');
    const id = pathName[pathName.length - 1];
    this.$store.dispatch('getBoard', id);
  },
  methods: {
    moveUpdate() {
      this.$router.push({ name: 'boardUpdate' });
    },
    deleteBoard() {
      this.$store.dispatch('deleteBoard', this.board.id);
    },
  },
};
</script>

<style></style>
