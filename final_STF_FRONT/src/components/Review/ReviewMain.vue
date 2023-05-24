<template>
  <v-container class="container" fluid>
    <v-row justify="center">
      <v-col cols="12" sm="8" md="6">
        <!-- 별점 버튼 -->
        <v-row justify="center">
          <v-rating
            v-model="rating"
            background-color="#f0f0f0"
            color="yellow darken-3"
            dense
            size="200px"
          ></v-rating>
        </v-row>

        <h1 class="title">강사님에 대한 한 줄 리뷰 작성하기</h1>

        <!-- 리뷰 제목 -->
        <v-row justify="center">
          <v-col cols="12" sm="10">
            <v-text-field
              v-model="reviewTitle"
              label="리뷰 제목"
              outlined
              dense
            ></v-text-field>
          </v-col>
        </v-row>

        <!-- 리뷰 작성 -->
        <v-row justify="center" class="review-row">
          <v-col cols="12" sm="10">
            <v-textarea
              v-model="review"
              label="리뷰 작성"
              rows="4"
              auto-grow
              outlined
              dense
            ></v-textarea>
          </v-col>
        </v-row>

        <!-- 보내기 버튼 -->
        <v-row justify="center">
          <v-col cols="12" sm="10">
            <v-btn
              @click="submitReview"
              color="primary"
              class="form-button"
              :disabled="!review"
            >
              리뷰 보내기~
            </v-btn>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  props: {
    teacher_index: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      review_grade: 0,
      reviewTitle: "",
      review: "",
    };
  },
  methods: {
    submitReview() {
      // 리뷰 데이터 구성
      const reviewData = {
        teacher_index: this.teacher_index, // 강사 인덱스
        review_grade: this.review_grade, // 별표의 개수
        review_title: this.reviewTitle, // 리뷰 제목
        review_content: this.review, // 리뷰 작성
      };
      console.log(reviewData);
      const token = localStorage.getItem("access-token");
        // Spring 백엔드로 데이터 전송
        axios
          .post(
            `http://localhost:9999/api/review`,
            reviewData,
            {
              headers: {
                "access-token": token,
              },
            }
          )
          .then((response) => {
            console.log(response); // 응답 데이터 확인
            alert("리뷰가 작성되었습니다.");
            this.$router.go(-1)
            // 추가적인 작업 수행
          })
          .catch((error) => {
            console.error(error);
          });
    },
  },
};
</script>

<style scoped>
.container {
  margin-top: 100px;
  background-color: rgba(255, 255, 255, 0.7);
  padding: 20px;
  border-radius: 5px;
}

.title {
  margin-bottom: 20px;
  text-align: center;
}

.form-button {
  margin-top: 20px;
  width: 100%;
}

.review-row {
  margin-top: 20px;
}
</style>
