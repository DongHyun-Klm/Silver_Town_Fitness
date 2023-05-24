<template>
  <v-container class="container" fluid>
    <!-- 예약한 강의 목록 -->
    <v-row class="reservation-table">
      <v-col cols="12">
        <v-data-table
          :headers="tableHeaders"
          :items="lectureData"
          item-key="id"
          :search="search"
          :rows-per-page-items="[10, 20, 30]"
          :pagination.sync="pagination"
          hide-default-footer
        >
          <template v-slot:item="{ item }">
            <tr>
              <td>{{ item.exercise_index }}</td>
              <td>{{ item.teacher_index }}</td>
              <td>{{ item.lecture_month }}</td>
              <td>{{ item.lecture_time1 }}</td>
              <td>{{ item.lecture_place }}</td>
              <td>{{ item.lecture_cnt }}</td>
              <td>{{ item.lecture_max_cnt }}</td>
              <td>
                <v-btn
                  v-if="isRegistrationPossible(item)"
                  color="green"
                  small
                >
                  수강신청 가능
                </v-btn>
                <v-btn
                  v-else
                  color="red"
                  small
                >
                  수강신청 불가
                </v-btn>
              </td>
            </tr>
          </template>
        </v-data-table>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import axios from 'axios';

export default {
  props: {
    categoryIndex: {
      type: Number,
      required: true,
    },
  },
  data() {
    return {
      tableHeaders: [
        { text: "운동 종목", value: "exercise_index" },
        { text: "강사명", value: "teacher_index" },
        { text: "교육 주차", value: "lecture_month" },
        { text: "교육 일시", value: "lecture_time1" },
        { text: "교육 장소", value: "lecture_place" },
        { text: "참석 인원", value: "lecture_cnt" },
        { text: "신청 가능 인원", value: "lecture_max_cnt" },
        { text: "신청 가능 여부", value: "lecture_possible" }, // 새로운 컬럼 추가
      ],
      lectureData: [],
      search: "",
      pagination: {
        rowsPerPage: 10,
      },
    };
  },
  created() {
    this.fetchLectureData();
  },
  methods: {
    fetchLectureData() {
      const categoryIndex = this.categoryIndex;
      const apiUrl = `http://localhost:9999/api/lecture/list/${categoryIndex}`;

      axios
        .get(apiUrl)
        .then((response) => {
          this.lectureData = response.data;
        })
        .catch((error) => {
          console.error(error);
        });
    },
    isRegistrationPossible(item) {
      const ratio = item.lecture_max_cnt / item.lecture_cnt;
      console.log(ratio);
      return ratio < 1; // 1 이상인 경우 수강신청 
    },
  },
};
</script>

<style scoped>
.container {
  margin-top: 20px;
}
.reservation-table {
  margin-top: 20px;
}
</style>
