<template>
  <v-container class="container" fluid>
    <!-- 강사 소개 -->
    <v-card class="trainer-card" outlined>
      <v-card-title class="trainer-card-title">강사 소개</v-card-title>
      <v-card-text>
        <v-row>
          <v-col cols="6" v-for="teacher in teachers" :key="teacher.teacher_index">
            <v-card class="trainer-info" outlined>
              <h2 class="trainer-name">{{ teacher.teacher_name }}</h2>
              <p class="trainer-description">{{ teacher.teacher_career }}</p>
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