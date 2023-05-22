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
        <!-- 한 줄 작성 컨테이너와 입력 버튼 -->
        <v-row justify="center">
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
          <v-col cols="12" sm="2">
            <v-btn
              @click="submitReview"
              color="primary"
              class="form-button"
              :disabled="!review"
            >
              입력
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
  data() {
    return {
      rating: 0,
      review: "",
    };
  },
  methods: {
    submitReview() {
      const data = {
        rating: this.rating,
        review: this.review,
      };
      axios
        .post("/api/reviews", data)
        .then((response) => {
          console.log(response.data); // 응답 데이터 확인
          console.log("리뷰가 작성되었습니다.");
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
  background-color: rgba(255, 255, 255, 0.7);
  padding: 20px;
  border-radius: 5px;
}

.title {
  margin-bottom: 20px;
  text-align: center;
}

.form-button {
  margin-top: 10px;
  width: 100%;
}
</style>
