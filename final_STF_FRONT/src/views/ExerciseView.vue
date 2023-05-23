<template>
  <div>
    <router-view />

    <ExerciseMain :exercise_index="exerciseId"></ExerciseMain>
    <ExerciseMainSub :exercise_index="exerciseId"></ExerciseMainSub>
  </div>
</template>

<script>
import ExerciseMain from "@/components/Exercise/ExerciseMain.vue";
import ExerciseMainSub from "@/components/Exercise/ExerciseMain_sub.vue";

export default {
  components: {
    ExerciseMain,
    ExerciseMainSub,
  },
  data() {
    return {
      exerciseId: null,
    };
  },
  created() {
    this.exerciseId = this.$route.params.exercise_index;
  },
  methods: {
    chk() {
    },
  },
  name: "ExerciseView",
};
</script>

<style></style>
