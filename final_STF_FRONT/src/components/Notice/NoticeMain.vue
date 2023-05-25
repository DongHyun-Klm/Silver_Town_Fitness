<template>
  <v-app>
    <v-main>
      <v-container>
        <h1 class="page-title">STF 공지사항</h1>

        <!-- 검색 기능 -->
        <v-row align="end" justify="end">
          <!-- 대분류 선택 -->
          <v-col cols="12" sm="4" md="3">
            <v-select
              v-model="searchCategory"
              :items="searchCategories"
              label="대분류"
              outlined
              dense
            ></v-select>
          </v-col>
          <!-- 검색어 입력 -->
          <v-col cols="12" sm="6" md="5">
            <v-text-field
              v-model="searchKeyword"
              label="검색어"
              outlined
              dense
              clearable
            ></v-text-field>
          </v-col>
          <!-- 검색 버튼 -->
          <v-col cols="12" sm="2" md="1">
            <v-btn icon @click="search">
              <v-icon>mdi-magnify</v-icon>
            </v-btn>
          </v-col>
        </v-row>

        <!-- 공지사항 목록 -->
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
                <td>{{ limitText(item.notice_title, 20) }}</td>
                <td>{{ limitText(item.notice_content, 50) }}</td>
                <td>{{ item.notice_date }}</td>
                <td>{{ item.notice_manager }}</td>
                <td>
                  <v-icon small @click="goToNoticeDetail(item)">
                    mdi-magnify
                  </v-icon>
                </td>
              </tr>
            </template>
          </v-data-table>
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
    limitText(text, maxLength) {
      if (text.length <= maxLength) {
        return text;
      } else {
        return text.slice(0, maxLength) + "...";
      }
    },
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
    // "자세히" 버튼 클릭 시 상세 뷰 페이지로 이동
    goToNoticeDetail(notice) {
      this.$router.push({
        name: "NoticeBoard",
        params: { notice_index: notice.notice_index },
      });
    },
  },
};
</script>
