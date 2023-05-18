<template>
  <div>
    <h3>게시판 등록</h3>
    <fieldset>
      <legend>등록</legend>
      <label for="title">제목 : </label>
      <input type="text" id="title" v-model="title" /><br />
      <label for="writer">쓴이 : </label>
      <input type="text" id="writer" v-model="writer" /><br />
      <label for="content">내용 : </label>
      <textarea id="content" cols="30" rows="10" v-model="content"></textarea>
      <button @click="createBoard">등록</button>
    </fieldset>
  </div>
</template>

<script>
export default {
  name: 'BoardCreate',
  data() {
    return {
      title: '',
      writer: '',
      content: '',
    };
  },
  methods: {
    createBoard() {
      let board = {
        id: 0,
        title: this.title,
        writer: this.writer,
        content: this.content,
      };

      this.$store.dispatch('createBoard', board);
    },
  },
};
</script>

<style></style>
