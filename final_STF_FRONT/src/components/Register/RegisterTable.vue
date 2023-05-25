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
              <td>{{ formatExercise(item.exercise_index) }}</td>
              <td>{{ formatTeacher(item.teacher_index) }}</td>
              <td>{{ item.lecture_name }}</td>
              <td>{{ item.lecture_time1 }}</td>
              <td>{{ item.lecture_place }}</td>
              <td>{{ item.lecture_cnt }}</td>
              <td>{{ item.lecture_max_cnt }}</td>
              <td>
                <v-btn v-if="isRegistered(item)" color="primary" small disabled>
                  신청한 강의
                </v-btn>
                <v-btn
                  v-else-if="isRegistrationPossible(item)"
                  color="green"
                  small
                  @click="registerLecture(item.lecture_index)"
                >
                  수강신청 가능
                </v-btn>
                <v-chip v-else color="red" small disabled>신청인원 마감</v-chip>
              </td>
            </tr>
          </template>
        </v-data-table>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import http from "@/util/http-common";
import axios from "axios";

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
        {
          text: "운동 종목",
          value: "exercise_index",
        },
        { text: "강사명", value: "teacher_index" },
        { text: "강의 이름", value: "lecture_month" },
        { text: "교육 일시", value: "lecture_time1" },
        { text: "교육 장소", value: "lecture_place" },
        { text: "참석 인원", value: "lecture_cnt" },
        { text: "신청 가능 인원", value: "lecture_max_cnt" },
        { text: "신청 가능 여부", value: "lecture_possible" }, // 새로운 컬럼 추가
      ],
      lectureData: [],
      userLectureData: [],
      search: "",
      pagination: {
        rowsPerPage: 10,
      },
    };
  },
  created() {
    this.fetchLectureData();
    this.getUserLectureData();
  },
  methods: {
    formatExercise(value) {
      switch (value) {
        case 1:
          return "수영";
        case 2:
          return "요가";
        case 3:
          return "게이트볼";
        case 4:
          return "댄스 스포츠";
        case 5:
          return "스쿼시";
        default:
          return "";
      }
    },
    formatTeacher(value) {
      switch (value) {
        case 1:
          return "웨이브익";
        case 2:
          return "해파리현";
        case 3:
          return "플라잉식";
        case 4:
          return "커브현";
        case 5:
          return "스윙종";
        case 6:
          return "공중제경";
        case 7:
          return "그루브교";
        case 8:
          return "댄싱용";
        case 9:
          return "요가호";
        case 10:
          return "유연영";
        default:
          return "";
      }
    },
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
    getUserLectureData() {
      const token = localStorage.getItem("access-token");
      axios
        .get("http://localhost:9999/api/reservation", {
          headers: { "access-token": token },
        })
        .then(({ data }) => {
          this.userLectureData = data;
        });
    },
    registerLecture(index) {
      const token = localStorage.getItem("access-token");

      const headers = {
        "access-token": token,
      };

      http
        .post(`/reservation/${index}`, null, { headers })
        .then(() => {
          alert("등록완료");
          window.location.href = "http://localhost:8080/Register";
        })
        .catch((error) => {
          console.error(error);
        });
    },

    isRegistrationPossible(item) {
      const ratio = item.lecture_cnt / item.lecture_max_cnt;
      return ratio < 1; // 1 이상인 경우 수강신청
    },
    isRegistered(item) {
      return this.userLectureData.some(
        (lecture) => lecture.lecture_index === item.lecture_index
      );
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
