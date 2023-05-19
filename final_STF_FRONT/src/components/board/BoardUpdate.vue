<template>
  <div>
    <h2>게시글 수정</h2>
    <fieldset>
      <legend>수정</legend>
      <label for="title">제목 : </label>
      <input type="text" id="title" v-model="board.title" /><br />
      <label for="writer">쓴이 : </label>
      <input type="text" id="writer" readonly v-model="board.writer" /><br />
      <label for="content">내용 : </label>
      <textarea
        id="content"
        cols="30"
        rows="10"
        v-model="board.content"
      ></textarea>
      <button @click="updateBoard">수정</button>
    </fieldset>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  name: 'BoardUpdate',
  computed: {
    ...mapState(['board']),
  },
  methods: {
    updateBoard() {
      let updateBoard = {
        id: this.board.id,
        title: this.board.title,
        content: this.board.content,
      };
      this.$store.dispatch('updateBoard', updateBoard);
    },
  },
};
</script>

<style></style>
