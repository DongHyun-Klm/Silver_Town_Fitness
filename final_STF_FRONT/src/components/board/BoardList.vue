<template>
  <div class="container">
    <!-- 게시글 목록 -->
    <div class="table-container">
      <table class="table">
        <thead>
          <tr>
            <th style="width: 50%">게시글 제목</th>
            <th style="width: 20%">작성자</th>
            <th style="width: 20%">작성일</th>
            <th style="width: 10%">조회수</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="post in displayedPosts" :key="post.board_index">
            <td>
              <router-link :to="'/Board/BoardDetail/' + post.board_index">
                <v-btn text color="primary">{{ post.board_title }}</v-btn>
              </router-link>
            </td>
            <td>{{ post.user_id }}</td>
            <td>{{ post.board_date }}</td>
            <td>{{ post.board_cnt }}</td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- 페이지네이션 -->
    <div class="pagination">
      <v-btn v-for="pageNumber in totalPages" :key="pageNumber" @click="changePage(pageNumber)">
        {{ pageNumber }}
      </v-btn>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "BoardList",
  data() {
    return {
      posts: [],
      currentPage: 1,
      postsPerPage: 11
    };
  },
  computed: {
    totalPages() {
      return Math.ceil(this.posts.length / this.postsPerPage);
    },
    displayedPosts() {
      const startIndex = (this.currentPage - 1) * this.postsPerPage;
      const endIndex = startIndex + this.postsPerPage;
      return this.posts.slice(startIndex, endIndex);
    }
  },
  mounted() {
    // 데이터 로드
    this.fetchPosts();
  },
  methods: {
    fetchPosts() {
      axios
        .get("http://localhost:9999/api/board")
        .then((response) => {
          this.posts = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    changePage(pageNumber) {
      this.currentPage = pageNumber;
    }
  }
};
</script>

<style scoped>
.container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.table-container {
  margin-top: 20px;
}

.table {
  width: 100%;
  max-width: 100%;
  border-collapse: collapse;
  table-layout: fixed; /* 추가: 테이블의 너비를 고정으로 설정 */
}

.table th,
.table td {
  border: 1px solid #ccc;
  padding: 10px;
  white-space: nowrap; /* 추가: 텍스트 줄바꿈 방지 */
  overflow: hidden; /* 추가: 내용이 너무 길어도 숨기고 나머지는 보이지 않도록 설정 */
  text-overflow: ellipsis; /* 추가: 내용이 너무 길어지면 말줄임표(...) 표시 */
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

@media (max-width: 600px) {
  .table {
    width: auto;
  }
}
.pagination {
  display: flex;
  justify-content: center;
  margin-top: 10px;
}

.pagination v-btn {
  margin: 0 5px;
}
</style>
