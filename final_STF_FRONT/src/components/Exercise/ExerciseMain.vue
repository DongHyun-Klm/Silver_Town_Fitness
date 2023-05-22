<template>
  <v-container class="container" fluid>
    <!-- 첫 번째 행 -->
    <v-row class="row">
      <!-- 1열 - 운동 사진 -->
      <v-col cols="6">
        <v-img
          src="@/assets/요가_이미지2.jpg"
          alt="운동 사진"
          class="exercise-image"
        ></v-img>
      </v-col>

      <!-- 2열 - 운동 소개 테이블 -->
      <v-col cols="6">
        <v-card class="exercise-card" outlined>
          <v-card-title class="exercise-card-title">운동 소개</v-card-title>
          <v-card-text>
            <table class="exercise-table">
              <tr>
                <th>강좌소개</th>
                <td>운동 강좌 소개 내용</td>
              </tr>
              <tr>
                <th>장점</th>
                <td>운동의 장점 내용</td>
              </tr>
              <tr>
                <th>특징</th>
                <td>운동의 특징 내용</td>
              </tr>
            </table>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>

    <!-- 두 번째 행 -->
    <v-row class="row">
      <!-- 1열 - 강사 소개 컨테이너 -->
      <v-col cols="6">
        <v-card class="trainer-card" outlined>
          <v-card-title class="trainer-card-title">강사 소개</v-card-title>
          <v-card-text>
            <h2 class="trainer-name">강사 이름</h2>
            <p class="trainer-description">강사 소개 내용</p>
          </v-card-text>
        </v-card>
      </v-col>

      <!-- 2열 - 강사 소개 컨테이너 -->
      <v-col cols="6">
        <v-card class="trainer-card" outlined>
          <v-card-title class="trainer-card-title">강사 소개</v-card-title>
          <v-card-text>
            <h2 class="trainer-name">강사 이름</h2>
            <p class="trainer-description">강사 소개 내용</p>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

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

.trainer-card {
  height: 100%;
  border-radius: 5px;
}

.trainer-card-title {
  font-size: 24px;
  font-weight: bold;
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
