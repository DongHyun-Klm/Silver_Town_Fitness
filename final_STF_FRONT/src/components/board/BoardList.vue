<template>
  <div class="container">
    <!-- 게시글 목록 -->
    <div class="table-container">
      <table class="table" style="width: 3000px;">
        <thead>
          <tr>
            <th style="width: 50%">게시글 제목</th>
            <th style="width: 20%">작성자</th>
            <th style="width: 20%">작성일</th>
            <th style="width: 10%">조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="post in paginatedPosts" :key="post.id">
            <td>{{ post.title }}</td>
            <td>{{ post.author }}</td>
            <td>{{ post.date }}</td>
            <td>{{ post.views }}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      posts: [],
      pageSize: 5, // 한 페이지에 표시되는 게시글 수
      currentPage: 1, // 현재 페이지 번호
    };
  },
  computed: {
    paginatedPosts() {
      const startIndex = (this.currentPage - 1) * this.pageSize;
      const endIndex = startIndex + this.pageSize;
      return this.posts.slice(startIndex, endIndex);
    },
    totalPages() {
      return Math.ceil(this.posts.length / this.pageSize);
    },
  },
  mounted() {
    // 데이터 로드
    this.fetchPosts();
  },
  methods: {
    fetchPosts() {
      // 여기에서 데이터베이스로부터 게시글 데이터를 가져오는 요청을 수행합니다.
      // 예시로 axios를 사용하여 GET 요청을 보내고, 응답을 받아옵니다.
      axios
        .get("/api/posts")
        .then((response) => {
          this.posts = response.data; // 응답에서 받아온 게시글 데이터를 저장합니다.
        })
        .catch((error) => {
          console.error(error);
        });
    },
    previousPage() {
      this.currentPage--;
    },
    nextPage() {
      this.currentPage++;
    },
  },
};
</script>

<style scoped>
.container {
  /* display: flex; */
  flex-direction: column;
  align-items: center;
}

.table-container {
  max-height: 400px; /* 테이블의 최대 높이 설정 */
  overflow-y: auto; /* 세로 스크롤 추가 */
  overflow-x: auto; /* 가로 스크롤 추가 */
  margin-top: 20px;
}

.table {
  width: 100%;
  max-width: 100%; /* 테이블의 최대 너비를 100%로 설정 */
  border-collapse: collapse;
}

.table th,
.table td {
  border: 1px solid #ccc;
  padding: 10px;
}

.pagination {
  margin-top: 20px;
}

.pagination button {
  margin: 0 5px;
}

.title-container {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
}

.heart-icon {
  font-size: 24px;
  color: #f44336;
  margin-right: 10px;
}

.title {
  font-size: 40px;
  font-weight: bold;
  color: #333;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
}
</style>
