<template>
  <v-container class="container" fluid>
    <!-- 첫 번째 행 -->
    <v-row class="row">
      <!-- 1열 - 운동 사진xxxxx문제문제-->
    <!-- <v-col cols="6">
        <v-img
          :src="require(exerciseDetails.exercise_img)"
          :alt="exerciseDetails.exercise_name"
          class="exercise-image"
        ></v-img>
      </v-col> -->

      <!-- 2열 - 운동 소개 컨테이너 -->
      <v-col cols="6">
        <v-card class="exercise-card" outlined>
          <v-card-text>
            <!-- 운동 소개 테이블 -->
            <v-row>
              <v-col cols="12">
                <strong>운동 이름:</strong> {{ exerciseDetails.exercise_name }}
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12">
                <strong>운동 소개:</strong> {{ exerciseDetails.exercise_intro }}
              </v-col>
            </v-row>
            <v-row>
              <v-col cols="12">
                <strong>운동 장점:</strong> {{ exerciseDetails.exercise_force }}
              </v-col>
            </v-row>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
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
      exerciseDetails: {},
    };
  },
  created() {
    this.fetchExerciseDetails();
  },
  methods: {
    fetchExerciseDetails() {
      const exercise_index = this.exercise_index;
      axios
        .get(`http://localhost:9999/api/lecture/${exercise_index}`)
        .then((response) => {
          this.exerciseDetails = response.data;
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
  padding: 20px;
}

.row {
  margin-bottom: 20px;
}

.exercise-image {
  width: 100%;
  max-height: 600px;
  object-fit: cover;
}

.exercise-card {
  height: 100%;
  border-radius: 5px;
}

.exercise-card-title {
  font-size: 24px;
  font-weight: bold;
}

.exercise-table {
  width: 100%;
  border-collapse: collapse;
}

.exercise-table th,
.exercise-table td {
  border: 1px solid #ccc;
  padding: 10px;
}
</style>