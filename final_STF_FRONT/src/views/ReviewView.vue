<template>
  <div>
    <h2></h2>
    <ReviewMain :teacher_index="t_index" />
  </div>
</template>

<script>  
import ReviewMain from "../components/Review/ReviewMain.vue";
export default {
  name: 'ReviewView',
  data(){
    return{
      t_index: "",
    }
  },
  created(){
    this.t_index =  this.$route.params.teacher_index;
  },
  components:{
    ReviewMain
  }
};
</script>

<style></style>