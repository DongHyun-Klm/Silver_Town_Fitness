import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

import HomeView from "../views/HomeView.vue";
import BoardView from "../views/BoardView.vue";
import ExerciseView from "../views/ExerciseView.vue";
import LoginView from "../views/LoginView.vue";
import MypageView from "../views/MypageView.vue";
import NoticeView from "../views/NoticeView.vue";
import RegisterView from "../views/RegisterView.vue";
import ReviewView from "../views/ReviewView.vue";

// Board
import BoardMain from "../components/Board/BoardMain.vue";
import BoardCreate from "../components/Board/BoardCreate.vue";
import BoardDetail from "../components/Board/BoardDetail.vue";
import BoardUpdate from "../components/Board/BoardUpdate.vue";
// Exercise
import ExerciseMain from "../components/Exercise/ExerciseMain.vue";
// Login
import LoginMain from "../components/Login/LoginMain.vue";
// Mypage
import MypageMain from "../components/Mypage/MypageMain.vue";
import MypageSchedule from "../components/Mypage/MypageSchedule.vue";
import MypageUpdate from "../components/Mypage/MypageUpdate.vue";
import MypageWithdrawal from "../components/Mypage/MypageWithdrawal.vue";
// Notice
import NoticeMain from "../components/Notice/NoticeMain.vue";
// Register
import RegisterMain from "../components/Register/RegisterMain.vue";
// Review
import ReviewMain from "../components/Review/ReviewMain.vue";

const routes = [
  // Home
  {
    path: "/",
    name: "Home",
    component: HomeView,
  },
  // Board
  {
    path: "/Board",
    name: "Board",
    component: BoardView,
    children: [
      {
        path: "",
        name: "BoardMain",
        component: BoardMain,
      },
      {
        path: "BoardCreate",
        name: "BoardCreate",
        component: BoardCreate,
      },
      {
        // path 경로 확인할 것!
        path: ":index",
        name: "boardDetail",
        component: BoardDetail,
      },
      {
        path: "BoardUpdate",
        name: "BoardUpdate",
        component: BoardUpdate,
      },
    ],
  },
  // Exercise
  {
    path: "/Exercise",
    name: "Exercise",
    component: ExerciseView,
    children: [
      {
        path: "",
        name: "ExerciseMain",
        component: ExerciseMain,
      },
      
    ],
  },
  // Login
  {
    path: "/Login",
    name: "Login",
    component: LoginView,
    children: [
      {
        path: "",
        name: "LoginMain",
        component: LoginMain,
      },
    ],
  },
  // Mypage
  {
    path: "/Mypage",
    name: "Mypage",
    component: MypageView,
    children: [
      {
        path: "",
        name: "MypageMain",
        component: MypageMain,
      },
      {
        path: "MypageSchedule",
        name: "MypageSchedule",
        component: MypageSchedule,
      },
      {
        path: "MypageUpdate",
        name: "MypageUpdate",
        component: MypageUpdate,
      },
      {
        path: "MypageWithdrawal",
        name: "MypageWithdrawal",
        component: MypageWithdrawal,
      },
    ],
  },
  // Notice
  {
    path: "/Notice",
    name: "Notice",
    component: NoticeView,
    children: [
      {
        path: "",
        name: "NoticeMain",
        component: NoticeMain,
      },
    ],
  },
  // Register
  {
    path: "/Register",
    name: "Register",
    component: RegisterView,
    children: [
      {
        path: "",
        name: "RegisterMain",
        component: RegisterMain,
      },
    ],
  },
  // Review
  {
    path: "/Review",
    name: "Review",
    component: ReviewView,
    children: [
      {
        path: "",
        name: "ReviewMain",
        component: ReviewMain,
      },
    ],
  },
  
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
