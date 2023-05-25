<template>
  <div class="my-course-management">
    <v-container class="custom-container">
      <h2>나의 수강 관리 페이지</h2>
      <schedule-view />
      <v-container style="margin: 20px">
        <h3>수강중인 강의 목록</h3>
        <table>
          <thead>
            <tr>
              <th>강의명</th>
              <th>강사명</th>
              <th>강의 장소</th>
              <th>수강취소</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="reservation in reservations" :key="reservation.id">
              <td style="text-align: center">{{ reservation.lecture_name }}</td>
              <td style="text-align: center">{{ reservation.teacher_name }}</td>
              <td style="text-align: center">
                {{ reservation.lecture_place }}
              </td>
              <td style="text-align: center">
                <v-btn
                  color="error"
                  @click="
                    showConfirmationDialog(
                      reservation.reservation_index,
                      reservation.lecture_index
                    )
                  "
                  small
                >
                  취소
                </v-btn>
              </td>
            </tr>
          </tbody>
        </table>
      </v-container>
    </v-container>

    <v-dialog v-model="confirmationDialog" max-width="400px">
      <v-card>
        <v-card-title
          class="headline"
          style="background-color: #f44336; color: white"
          >알림</v-card-title
        >
        <v-card-text>강의를 취소하시겠습니까?</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="error" text @click="cancelReservation">확인</v-btn>
          <v-btn text @click="closeConfirmationDialog">취소</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from "axios";
import ScheduleView from "@/views/ScheduleView.vue";

export default {
  components: { ScheduleView },
  data() {
    return {
      reservations: [],
      confirmationDialog: false,
      selectedReservationId: null,
      lecture_index: null,
    };
  },
  created() {
    this.$checkLogin();
  },
  mounted() {
    this.fetchReservations();
  },
  methods: {
    fetchReservations() {
      const token = localStorage.getItem("access-token");
      axios
        .get("http://localhost:9999/api/reservation", {
          headers: {
            "access-token": token,
          },
        })
        .then((response) => {
          this.reservations = response.data;
          console.log(this.reservations);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    showConfirmationDialog(reservationId, lindex) {
      this.selectedReservationId = reservationId;
      this.lecture_index = lindex;
      this.confirmationDialog = true;
    },
    cancelReservation() {
      axios
        .delete("http://localhost:9999/api/reservation", {
          params: {
            reservation_index: this.selectedReservationId,
            lecture_index: this.lecture_index,
          },
        })
        .then(() => {
          alert("강의가 삭제되었습니다.");
          this.fetchReservations();
          this.closeConfirmationDialog();
          window.location.href = "http://localhost:8080/Mypage/MypageSchedule";
        })
        .catch((error) => {
          console.error(error);
        });
    },
    closeConfirmationDialog() {
      this.confirmationDialog = false;
      this.selectedReservationId = null;
    },
  },
};
</script>

<style scoped>
.custom-container {
  width: 2000px;
  height: 1000px;
}

table {
  width: 100%;
  border-collapse: collapse;
}

th,
td {
  border: 1px solid #ccc;
  padding: 8px;
  text-align: center;
}
.my-course-management {
  padding: 20px;
}
</style>
