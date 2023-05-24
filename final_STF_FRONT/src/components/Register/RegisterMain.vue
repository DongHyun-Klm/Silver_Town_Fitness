<template>
  <v-container class="container" fluid>
    <!-- 프로그램 분류 버튼 -->
    <v-row justify="center" class="category-buttons">
      <v-btn
        v-for="category in categories"
        :key="category.id"
        outlined
        color="primary"
        @click="selectCategory(category.id)"
      >
        {{ category.name }}
      </v-btn>
    </v-row>

    <!-- 선택한 프로그램 내용 -->
    <v-row v-if="selectedCategory" class="program-details">
      <!-- 강사 정보 -->
      <v-row justify="center">
        <v-col cols="6" v-for="teacher in selectedCategory.teachers" :key="teacher.id">
          <v-card class="teacher-card" outlined>
            <v-card-text>
              <h2 class="teacher-name">{{ teacher.name }}</h2>
              <p class="teacher-description">{{ teacher.career }}</p>
              <v-btn @click="goToReviewPage(teacher.id)">강사 리뷰 작성하기</v-btn>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>

      <!-- 예약한 강의 목록 -->
      <v-row class="reservation-table">
        <v-col cols="12">
          <v-data-table
            :headers="tableHeaders"
            :items="reservedLessons"
            item-key="id"
            :search="search"
            :rows-per-page-items="[10, 20, 30]"
            :pagination.sync="pagination"
            hide-default-footer
          >
            <template v-slot:body="{ items }">
              <tbody>
                <tr v-for="item in items" :key="item.id">
                  <td>{{ item.exercise }}</td>
                  <td>{{ item.teacher }}</td>
                  <td>{{ item.week }}</td>
                  <td>{{ item.date }}</td>
                  <td>
                    <v-btn color="primary" @click="cancelReservation(item.id)">취소하기</v-btn>
                  </td>
                  <td>{{ item.remainingCapacity }}</td>
                </tr>
              </tbody>
            </template>
          </v-data-table>
        </v-col>
      </v-row>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      categories: [
        { id: 1, name: "수영", teachers: [] },
        { id: 2, name: "요가", teachers: [] },
        { id: 3, name: "게이트볼", teachers: [] },
        { id: 4, name: "댄스 스포츠", teachers: [] },
        { id: 5, name: "스쿼시", teachers: [] },
      ],
      selectedCategory: null,
      tableHeaders: [
        { text: "운동 종목", value: "exercise" },
        { text: "강사명", value: "teacher" },
        { text: "교육 주차", value: "week" },
        { text: "교육 일시", value: "date" },
        { text: "신청하기", value: "action" },
        { text: "수강 신청 잔여 인원", value: "remainingCapacity" },
      ],
      reservedLessons: [
        { id: 1, exercise: "수영", teacher: "김강사", week: 1, date: "2023-06-01", remainingCapacity: 5 },
        { id: 2, exercise: "요가", teacher: "이강사", week: 1, date: "2023-06-02", remainingCapacity: 10 },
      ],
      search: "",
      pagination: {
        rowsPerPage: 10,
      },
    };
  },
  methods: {
    selectCategory(categoryId) {
      this.selectedCategory = this.categories.find((category) => category.id === categoryId);
    },
    goToReviewPage(teacherId) {
      console.log(teacherId)
      // Redirect to the review page for the selected teacher
    },
    cancelReservation(reservationId) {
      console.log(reservationId)
      
      // Cancel the reservation for the selected lesson
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

.category-buttons {
  margin-bottom: 20px;
}

.program-details {
  margin-bottom: 20px;
}

.teacher-card {
  margin-bottom: 20px;
}

.teacher-name {
  margin-bottom: 10px;
}

.teacher-description {
  margin-bottom: 10px;
}

.reservation-table {
  margin-top: 20px;
}
</style>
