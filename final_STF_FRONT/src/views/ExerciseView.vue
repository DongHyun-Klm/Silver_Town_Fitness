<template>
  <div>
    <router-view />

    <ExerciseMain :exercise_index="exerciseId"></ExerciseMain>
    <ExerciseMainSub :exercise_index="exerciseId"></ExerciseMainSub>
    <ExerciseMainFooter :exercise_index="exerciseId"></ExerciseMainFooter>
    
  </div>
</template>

<script>
import ExerciseMain from "@/components/Exercise/ExerciseMain.vue";
import ExerciseMainSub from "@/components/Exercise/ExerciseMain_sub.vue";
import ExerciseMainFooter from "@/components/Exercise/ExerciseMainFooter.vue";

export default {
  components: {
    ExerciseMain,
    ExerciseMainSub,
    ExerciseMainFooter,
  },
  data() {
    return {
      exerciseId: null,
    };
  },
  created() {
    this.exerciseId = this.$route.params.exercise_index;
  },
  
  name: "ExerciseView",
};
</script>

<style></style>
