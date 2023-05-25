<template>
  <v-app>
    <v-main>
      <v-container class="ps_L" >
        <h1 class="page-title">공지사항 상세 페이지</h1>
        <v-card v-if="notice">
          <v-card-title>{{ notice.notice_title }}</v-card-title>
          <v-card-text class="ps_L">
            <p><strong>작성자:</strong> {{ notice.notice_manager }}</p>
            <p><strong>등록일:</strong> {{ notice.notice_date }}</p>

          </v-card-text>
          <v-divider></v-divider>
          <v-card-text class="ps_L" >{{ notice.notice_content }}</v-card-text>
        </v-card>
        <v-progress-linear
          v-else
          color="primary"
          indeterminate
        ></v-progress-linear>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import axios from "axios";

export default {
  name: "NoticeBoard",
  data() {
    return {
      notice: null,
    };
  },
  mounted() {
    const noticeIndex = this.$route.params.notice_index;
    this.fetchNotice(noticeIndex);
  },
  methods: {
    fetchNotice(noticeIndex) {
      axios
        .get(`http://localhost:9999/api/notice/${noticeIndex}`)
        .then((response) => {
          this.notice = response.data;
          this.notice.notice_index += 1;
        })
        .catch((error) => {
          console.error("Error fetching notice:", error);
        });
    },
  },
};
</script>

<style scoped>


</style>