<template>
  <v-card class="review-list" outlined>
    <v-card-title class="review-list-title">리뷰 목록</v-card-title>
    <v-card-text>
      <v-row>
        <v-col cols="6">
          <v-data-table
            :headers="headers"
            :items="reviews.filter((review) => review.teacher_index === this.exercise_index*2-1)"
            :dense="true"
            :footer-props="{
              showFirstLastPage: true,
              itemsPerPageOptions: [5, 10, 15],
            }"
          >
            <template v-slot:items="props">
              <tr v-for="item in props.items" :key="item.review_id">
                <td>{{ item.review_title }}</td>
                <td>{{ item.review_content }}</td>
                <td>
                  <v-icon
                    v-for="n in item.review_grade"
                    :key="n"
                    class="mdi"
                    color="yellow"
                  >
                    mdi-star-outline
                  </v-icon>
                </td>
              </tr>
            </template>
          </v-data-table>
        </v-col>
        <v-col cols="6">
          <v-data-table
            :headers="headers"
            :items="reviews.filter((review) => review.teacher_index === this.exercise_index*2)"
            :dense="true"
            :footer-props="{
              showFirstLastPage: true,
              itemsPerPageOptions: [5, 10, 15],
            }"
          >
            <template v-slot:items="props">
              <tr v-for="item in props.items" :key="item.review_id">
                <td>{{ item.review_title }}</td>
                <td>{{ item.review_content }}</td>
                <td>
                  <v-icon
                    v-for="n in item.review_grade"
                    :key="n"
                    class="mdi"
                    color="yellow"
                  >
                    mdi-star-outline
                  </v-icon>
                </td>
              </tr>
            </template>
          </v-data-table>
        </v-col>
      </v-row>
    </v-card-text>
  </v-card>
</template>

<script>
import axios from "axios";

export default {
  props: {
    exercise_index: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      reviews: [],
      headers: [
        { text: "리뷰 제목", value: "review_title" },
        { text: "리뷰 내용", value: "review_content" },
        { text: "평점", value: "review_grade" },
      ],
    };
  },
  created() {
    this.fetchReviews();
  },
  methods: {
    fetchReviews() {
      const exercise_index = this.exercise_index;
      axios
        .get(`http://localhost:9999/api/review/${exercise_index}`)
        .then((response) => {
          this.reviews = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
};
</script>

<style scoped>
.review-list {
  margin-top: 20px;
  border-radius: 5px;
}

.review-list-title {
  font-size: 24px;
  font-weight: bold;
  padding: 16px;
}
</style>
