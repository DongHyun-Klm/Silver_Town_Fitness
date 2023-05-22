<template>
  <v-app>
    <v-main>
      <v-container>
        <h1 class="page-title">STF 공지사항</h1>

        <v-row align="end" justify="end">
          <v-col cols="12" sm="4" md="3">
            <v-select
              v-model="searchCategory"
              :items="searchCategories"
              label="대분류"
              outlined
              dense
            ></v-select>
          </v-col>
          <v-col cols="12" sm="6" md="5">
            <v-text-field
              v-model="searchKeyword"
              label="검색어"
              outlined
              dense
              clearable
            ></v-text-field>
          </v-col>
          <v-col cols="12" sm="2" md="1">
            <v-btn icon @click="search">
              <v-icon>mdi-magnify</v-icon>
            </v-btn>
          </v-col>
        </v-row>

        <template v-if="notices.length > 0 || filteredNotices.length > 0">
          <v-data-table
            :headers="headers"
            :items="paginatedNotices"
            :rows-per-page-items="[4, 8, 12]"
            hide-default-footer
            class="notice-table"
          >
            <template v-slot:item="{ item, index }">
              <td>{{ index + 1 }}</td>
              <td>{{ item.title }}</td>
              <td>{{ item.date }}</td>
              <td>{{ item.author }}</td>
              <td>{{ item.views }}</td>
              <td>
                <v-btn text color="primary">자세히 보기</v-btn>
              </td>
            </template>
          </v-data-table>

          <v-pagination
            v-model="currentPage"
            :length="totalPages"
            @input="handlePageChange"
            class="pagination"
          ></v-pagination>
        </template>

        <template v-if="notices.length === 0 && filteredNotices.length === 0">
          <v-card class="notice-card">
            <v-card-text class="no-notice-text">검색 결과가 없습니다.</v-card-text>
          </v-card>
        </template>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  name: "NoticePage",
  data() {
    return {
      notices: [],
      searchCategory: "제목",
      searchKeyword: "",
      searchCategories: ["제목", "내용", "작성자"],
      currentPage: 1,
      pageSize: 4,
      filteredNotices: [],
      headers: [
        { text: "번호", value: "index" },
        { text: "제목", value: "title" },
        { text: "날짜", value: "date" },
        { text: "작성자", value: "author" },
        { text: "조회수", value: "views" },
        { text: "자세히 보기", value: "actions" },
      ],
    };
  },
  mounted() {
    this.fetchNotices();
  },
  methods: {
    fetchNotices() {
      axios
        .get("/api/notices")
        .then((response) => {
          this.notices = response.data;
          this.filteredNotices = this.notices;
        })
        .catch((error) => {
          console.error("Error fetching notices:", error);
        });
    },
    search() {
      if (this.searchKeyword) {
        const keyword = this.searchKeyword.toLowerCase();
        this.filteredNotices = this.notices.filter((notice) => {
          if (this.searchCategory === "제목") {
            return notice.title.toLowerCase().includes(keyword);
          } else if (this.searchCategory === "내용") {
            return notice.content.toLowerCase().includes(keyword);
          } else if (this.searchCategory === "작성자") {
            return notice.author.toLowerCase().includes(keyword);
          }
          return false;
        });
      } else {
        this.filteredNotices = this.notices;
      }
      this.currentPage = 1;
    },
    handlePageChange(page) {
      this.currentPage = page;
    },
  },
  computed: {
    paginatedNotices() {
      const startIndex = (this.currentPage - 1) * this.pageSize;
      const endIndex = startIndex + this.pageSize;
      return this.filteredNotices.map((notice, index) => ({
        ...notice,
        index: startIndex + index + 1,
        actions: <v-btn text color="primary">자세히 보기</v-btn>,
      })).slice(startIndex, endIndex);
    },
    totalPages() {
      return Math.ceil(this.filteredNotices.length / this.pageSize);
    },
  },
};
</script>

<style scoped>
.page-title {
  font-size: 30px;
  font-weight: bold;
  color: #333;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
  background-color: #f0f0f0;
  padding: 10px;
  border-radius: 4px;
  text-align: center;
}

.notice-table {
  margin-top: 20px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.pagination {
  margin-top: 20px;
  justify-content: center;
}

.no-notice-text {
  text-align: center;
  font-size: 18px;
  color: #999;
  margin-top: 20px;
}

.search-category-col {
  text-align: right;
}

.search-button-col {
  text-align: left;
}

.search-button {
  margin-left: 8px;
  margin-top: -4px;
  width: 36px;
  height: 36px;
}
</style>
