<template>
  <div>
    <h3>게시글 목록</h3>
    <hr />
    <div>
      <table>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>쓰니</th>
          <th>조회수</th>
          <th>등록일</th>
        </tr>
        <tr v-for="board in boards" :key="board.id">
          <td>{{ board.id }}</td>
          <td>
            <router-link :to="`/board/${board.id}`">{{
              board.title
            }}</router-link>
          </td>
          <td>{{ board.writer }}</td>
          <td>{{ board.viewCnt }}</td>
          <td>{{ board.regDate }}</td>
        </tr>
      </table>
    </div>
    <div>
      <select v-model="mode">
        <option value="1">제목</option>
        <option value="2">내용</option>
        <option value="3">제목+내용</option>
      </select>
      <input type="text" v-model="keyword" />
      <button @click="search">검색</button>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  name: 'BoardList',
  data() {
    return {
      mode: 1,
      keyword: '',
    };
  },
  computed: {
    ...mapState(['boards']),
  },
  created() {
    this.$store.dispatch('getBoards');
  },
  methods: {
    search() {
      const payload = {
        mode: this.mode,
        keyword: this.keyword,
      };
      this.$store.dispatch('getBoards', payload);
    },
  },
};
</script>

<style></style>
