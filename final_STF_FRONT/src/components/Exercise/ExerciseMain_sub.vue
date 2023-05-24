<template>
  <v-container class="container" fluid>
    <!-- 강사 소개 -->
    <v-card class="trainer-card" outlined>
      <v-card-title class="trainer-card-title">강사 소개</v-card-title>
      <v-card-text>
        <v-row>
          <v-col cols="6">
            <v-card class="trainer-info" outlined>
              <v-avatar size="150" class="trainer-image" style="padding: 100px">
                <img :src="getImagePath(img1)" alt="강사 이미지" />
              </v-avatar>
              <h2 class="trainer-name">{{ teachers[0].teacher_name }}</h2>
              <p class="trainer-description">
                {{ teachers[0].teacher_career }}
              </p>
              <v-btn @click="goToReviewPage(teachers[0].teacher_index)">
                강사 리뷰 작성하기
              </v-btn>
            </v-card>
          </v-col>
          <v-col cols="6">
            <v-card class="trainer-info" outlined>
              <v-avatar size="150" class="trainer-image" style="padding: 100px">
                <img :src="getImagePath(img2)" alt="강사 이미지" />
              </v-avatar>
              <h2 class="trainer-name">{{ teachers[1].teacher_name }}</h2>
              <p class="trainer-description">
                {{ teachers[1].teacher_career }}
              </p>
              <v-btn @click="goToReviewPage(teachers[1].teacher_index)">
                강사 리뷰 작성하기
              </v-btn>
            </v-card>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
import axios from "axios";

export default {
  props: {
    exercise_index: {
      required: true,
    },
  },
  data() {
    return {
      img1: "",
      img2: "",
      teachers: [],
    };
  },
  created() {
    this.fetchExerciseDetails();
  },
  methods: {
    fetchExerciseDetails() {
      const exercise_index = this.exercise_index;
      axios
        .get(`http://localhost:9999/api/instructor/${exercise_index}`)
        .then((response) => {
          this.teachers = response.data;
          this.img1 = this.teachers[0].teacher_img;
          this.img2 = this.teachers[1].teacher_img;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    goToReviewPage(teacher_index) {
      this.$router.push({
        name: "Review",
        params: { teacher_index },
      });
    },
    getImagePath(image) {
      return require(`@/assets/${image}`);
    },
  },
};
</script>

<style scoped>
.container {
  padding: 20px;
}

.trainer-card {
  border-radius: 5px;
}

.trainer-card-title {
  font-size: 24px;
  font-weight: bold;
  padding: 16px;
}

.trainer-info {
  margin-bottom: 20px;
  padding: 16px;
  text-align: center;
}

.trainer-image img {
  border-radius: 50%;
  width: 150px;
  height: 150px;
  object-fit: cover;
}

.trainer-name {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 10px;
}

.trainer-description {
  margin: 0;
}
</style>
