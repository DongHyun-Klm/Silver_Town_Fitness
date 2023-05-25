<template>
  <v-container class="container" fluid>
    <!-- 프로그램 분류 버튼 -->
    <v-container>
      <v-row justify="center" class="category-buttons">
        <v-col
          cols="12"
          sm="6"
          md="4"
          lg="4"
          v-for="category in categories"
          :key="category.id"
        >
          <v-btn
            outlined
            color="primary"
            class="ma-2"
            @click="selectCategory(category.id)"
            block
          >
            {{ category.name }}
          </v-btn>
        </v-col>
      </v-row>
    </v-container>

    <v-container fluid class="container-with-border" v-if="selectedCategory">
      <v-row>
        <v-col cols="12">
          <v-row class="program-details">
            <!-- 예약한 강의 목록 -->
            <v-col cols="12">
              <!-- RegisterTable 컴포넌트에 동적으로 categoryIndex를 전달 -->
              <RegisterTable
                :categoryIndex="selectedCategory.id"
                :key="selectedCategory.id"
              />
            </v-col>
          </v-row>
        </v-col>
      </v-row>
    </v-container>

    <v-container v-else>
      <v-row>
        <v-col cols="12">
          <ScheduleView />
        </v-col>
      </v-row>
    </v-container>
  </v-container>
</template>

<script>
import ScheduleView from "@/views/ScheduleView.vue";
import axios from "axios";
import RegisterTable from "@/components/Register/RegisterTable.vue";

export default {
  props: {
    categoryIndex: {
      type: Number,
      required: true,
    },
  },
  components: {
    ScheduleView,
    RegisterTable,
  },
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
      lectureData: [],
    };
  },
  created() {
    this.$checkLogin();
    this.fetchLectureData();
  },
  methods: {
    fetchLectureData() {
      if (this.selectedCategory) {
        const categoryIndex = this.selectedCategory.id;

        axios
          .get(`http://localhost:9999/api/lecture/list/${categoryIndex}`)
          .then((response) => {
            this.lectureData = response.data;
          })
          .catch((error) => {
            console.error(error);
          });
      }
    },
    selectCategory(categoryId) {
      this.selectedCategory = this.categories.find(
        (category) => category.id === categoryId
      );
      this.fetchLectureData();
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
  margin-top: 20px;
}

.container-with-border {
  margin-top: 20px;
}
</style>
