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
    :items="filteredNotices"
    hide-default-footer
    class="notice-table"
  >
    <template v-slot:item="{ item, index }">
      <tr>
        <td>{{ index + 1 }}</td>
        <td>
          <v-btn text color="primary">{{ item.notice_title }}</v-btn>
        </td>
        <td>{{ item.notice_content }}</td>
        <td>{{ item.notice_date }}</td>
        <td>{{ item.notice_manager }}</td>
        <td>{{ item.notice_cnt }}</td>
      </tr>
    </template>
  </v-data-table>
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
      filteredNotices: [],
      headers: [
        { text: "번호", value: "index" },
        { text: "제목", value: "notice_title" },
        { text: "내용", value: "notice_content" },
        { text: "등록일", value: "notice_date" },
        { text: "작성자", value: "notice_manager" },
        { text: "조회수", value: "notice_cnt" },
      ],
    };
  },
  mounted() {
    this.fetchNotices();
  },
  methods: {
    fetchNotices() {
      axios
        .get("http://localhost:9999/api/notice")
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
            return notice.notice_title.toLowerCase().includes(keyword);
          } else if (this.searchCategory === "내용") {
            return notice.notice_content.toLowerCase().includes(keyword);
          } else if (this.searchCategory === "작성자") {
            return notice.notice_manager.toLowerCase().includes(keyword);
          }
          return false;
        });
      } else {
        this.filteredNotices = this.notices;
      }
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
