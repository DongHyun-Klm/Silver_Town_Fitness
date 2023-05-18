DROP DATABASE IF EXISTS STF;
CREATE DATABASE IF NOT EXISTS STF;
USE STF;

-- 182253
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- Exercise Table Create SQL
-- 테이블 생성 SQL - Exercise
CREATE TABLE Exercise
(
    `exercise_index`  INT              NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `exercise_intro`  VARCHAR(1000)    NOT NULL    COMMENT '종목 소개', 
    `exercise_img`    VARCHAR(1000)    NOT NULL    COMMENT '종목 영상', 
    `exercise_force`  VARCHAR(1000)    NOT NULL    COMMENT '종목 장점 소개', 
     PRIMARY KEY (exercise_index)
);

-- 테이블 Comment 설정 SQL - Exercise
ALTER TABLE Exercise COMMENT '종목 정보 테이블';


-- Teacher Table Create SQL
-- 테이블 생성 SQL - Teacher
CREATE TABLE Teacher
(
    `teacher_index`     INT              NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `teacher_name`      VARCHAR(20)      NOT NULL    COMMENT '이름', 
    `teacher_sex`       VARCHAR(2)       NOT NULL    COMMENT '성별', 
    `teacher_follower`  INT              NOT NULL    COMMENT '팔로워 수', 
    `exercise_index`    INT              NOT NULL    COMMENT '종목 인덱스', 
    `teacher_img`       VARCHAR(1000)    NOT NULL    COMMENT '강사 이미지', 
    CONSTRAINT PK_teacher PRIMARY KEY (teacher_index)
);

-- 테이블 Comment 설정 SQL - Teacher
ALTER TABLE Teacher COMMENT '강사 정보 테이블';

-- Foreign Key 설정 SQL - Teacher(exercise_index) -> Exercise(exercise_index)
ALTER TABLE Teacher
    ADD CONSTRAINT FK_Teacher_exercise_index_Exercise_exercise_index FOREIGN KEY (exercise_index)
        REFERENCES Exercise (exercise_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Teacher(exercise_index)
-- ALTER TABLE Teacher
-- DROP FOREIGN KEY FK_Teacher_exercise_index_Exercise_exercise_index;


-- User Table Create SQL
-- 테이블 생성 SQL - User
CREATE TABLE User
(
    `user_index`        INT            NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `user_name`         VARCHAR(20)    NOT NULL    COMMENT '이름', 
    `user_img`          VARCHAR(45)    NULL        COMMENT '회원 이미지. 이미지파일 명', 
    `user_birth`        DATE           NOT NULL    COMMENT '생년월일. YYYYMMDD, 8자', 
    `user_sex`          VARCHAR(2)     NOT NULL    COMMENT '성별. 남 / 여', 
    `user_id`           VARCHAR(45)    NOT NULL    COMMENT '아이디', 
    `user_password`     VARCHAR(45)    NOT NULL    COMMENT '비밀번호', 
    `user_nick`         VARCHAR(45)    NOT NULL    COMMENT '닉네임', 
    `user_number`       VARCHAR(45)    NOT NULL    COMMENT '핸드폰. 010-0000-0000 / ''-''제외 11자', 
    `user_email`        VARCHAR(45)    NOT NULL    COMMENT '이메일', 
    `user_lecture_cnt`  INT            NULL        COMMENT '수강 개수', 
     PRIMARY KEY (user_index)
);

-- 테이블 Comment 설정 SQL - User
ALTER TABLE User COMMENT '회원 정보 테이블';


-- Program Table Create SQL
-- 테이블 생성 SQL - Program
CREATE TABLE Program
(
    `lecture_index`    INT            NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `lecture_name`     VARCHAR(10)    NOT NULL    COMMENT '강의명', 
    `lecture_start`    VARCHAR(45)    NOT NULL    COMMENT '시작시간', 
    `lecture_end`      VARCHAR(45)    NOT NULL    COMMENT '끝 시간', 
    `lecture_event_1`  VARCHAR(45)    NOT NULL    COMMENT '주 1차 강의', 
    `lecture_event_2`  VARCHAR(45)    NOT NULL    COMMENT '주 2차 강의', 
    `lecture_month`    INT            NOT NULL    COMMENT '프로그램 월 차수', 
    `lecture_max_cnt`  INT            NOT NULL    COMMENT '수강 최대 인원', 
    `lecture_cnt`      INT            NOT NULL    COMMENT '수강 인원', 
    `lecture_place`    VARCHAR(45)    NOT NULL    COMMENT '강의장 위치', 
    `exercise_index`   INT            NOT NULL    COMMENT '종목 인덱스', 
    `teacher_index`    INT            NOT NULL    COMMENT '강사 인덱스', 
     PRIMARY KEY (lecture_index)
);

-- 테이블 Comment 설정 SQL - Program
ALTER TABLE Program COMMENT '프로그램 테이블';

-- Foreign Key 설정 SQL - Program(exercise_index) -> Exercise(exercise_index)
ALTER TABLE Program
    ADD CONSTRAINT FK_Program_exercise_index_Exercise_exercise_index FOREIGN KEY (exercise_index)
        REFERENCES Exercise (exercise_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Program(exercise_index)
-- ALTER TABLE Program
-- DROP FOREIGN KEY FK_Program_exercise_index_Exercise_exercise_index;

-- Foreign Key 설정 SQL - Program(teacher_index) -> Teacher(teacher_index)
ALTER TABLE Program
    ADD CONSTRAINT FK_Program_teacher_index_Teacher_teacher_index FOREIGN KEY (teacher_index)
        REFERENCES Teacher (teacher_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Program(teacher_index)
-- ALTER TABLE Program
-- DROP FOREIGN KEY FK_Program_teacher_index_Teacher_teacher_index;


-- Notice Table Create SQL
-- 테이블 생성 SQL - Notice
CREATE TABLE Notice
(
    `notice_index`    INT              NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `notice_title`    VARCHAR(1000)    NOT NULL    COMMENT '제목', 
    `notice_content`  VARCHAR(1000)    NOT NULL    COMMENT '공지 내용', 
    `notice_date`     DATE             NOT NULL    COMMENT '등록일', 
    `notice_cnt`      INT              NOT NULL    COMMENT '조회수', 
    `notice_manager`  VARCHAR(10)      NOT NULL    COMMENT '작성자', 
     PRIMARY KEY (notice_index)
);

-- 테이블 Comment 설정 SQL - Notice
ALTER TABLE Notice COMMENT '공지사항';


-- Reservation Table Create SQL
-- 테이블 생성 SQL - Reservation
CREATE TABLE Reservation
(
    `reservation_index`  INT    NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `user_index`         INT    NOT NULL    COMMENT '유저 인덱스', 
    `lecture_index`      INT    NOT NULL    COMMENT '강의명 인덱스', 
     PRIMARY KEY (reservation_index)
);

-- 테이블 Comment 설정 SQL - Reservation
ALTER TABLE Reservation COMMENT '프로그램 예약 테이블';

-- Foreign Key 설정 SQL - Reservation(user_index) -> User(user_index)
ALTER TABLE Reservation
    ADD CONSTRAINT FK_Reservation_user_index_User_user_index FOREIGN KEY (user_index)
        REFERENCES User (user_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Reservation(user_index)
-- ALTER TABLE Reservation
-- DROP FOREIGN KEY FK_Reservation_user_index_User_user_index;

-- Foreign Key 설정 SQL - Reservation(lecture_index) -> Program(lecture_index)
ALTER TABLE Reservation
    ADD CONSTRAINT FK_Reservation_lecture_index_Program_lecture_index FOREIGN KEY (lecture_index)
        REFERENCES Program (lecture_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Reservation(lecture_index)
-- ALTER TABLE Reservation
-- DROP FOREIGN KEY FK_Reservation_lecture_index_Program_lecture_index;


-- Teacher_career Table Create SQL
-- 테이블 생성 SQL - Teacher_career
CREATE TABLE Teacher_career
(
    `teacher_table_index`  INT             NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `teacher_index`        INT             NOT NULL    COMMENT '강사 인덱스', 
    `teacher_career`       VARCHAR(100)    NOT NULL    COMMENT '강사 경력', 
     PRIMARY KEY (teacher_table_index)
);

-- 테이블 Comment 설정 SQL - Teacher_career
ALTER TABLE Teacher_career COMMENT '강사 경력 테이블';

-- Foreign Key 설정 SQL - Teacher_career(teacher_index) -> Teacher(teacher_index)
ALTER TABLE Teacher_career
    ADD CONSTRAINT FK_Teacher_career_teacher_index_Teacher_teacher_index FOREIGN KEY (teacher_index)
        REFERENCES Teacher (teacher_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Teacher_career(teacher_index)
-- ALTER TABLE Teacher_career
-- DROP FOREIGN KEY FK_Teacher_career_teacher_index_Teacher_teacher_index;


-- Board Table Create SQL
-- 테이블 생성 SQL - Board
CREATE TABLE Board
(
    `board_index`    INT              NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `user_index`     INT              NOT NULL    COMMENT '유저 인덱스', 
    `board_title`    VARCHAR(1000)    NOT NULL    COMMENT '제목', 
    `board_content`  VARCHAR(1000)    NOT NULL    COMMENT '글 내용', 
    `board_date`     DATE             NOT NULL    COMMENT '등록일', 
    `board_cnt`      INT              NOT NULL    COMMENT '조회수', 
    `board_img`      VARCHAR(1000)    NULL        COMMENT '이미지. 이미지 파일 명', 
     PRIMARY KEY (board_index)
);

-- 테이블 Comment 설정 SQL - Board
ALTER TABLE Board COMMENT '사랑방';

-- Foreign Key 설정 SQL - Board(user_index) -> Teacher(teacher_index)
ALTER TABLE Board
    ADD CONSTRAINT FK_Board_user_index_Teacher_teacher_index FOREIGN KEY (user_index)
        REFERENCES Teacher (teacher_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Board(user_index)
-- ALTER TABLE Board
-- DROP FOREIGN KEY FK_Board_user_index_Teacher_teacher_index;


-- Teacher_review Table Create SQL
-- 테이블 생성 SQL - Teacher_review
CREATE TABLE Teacher_review
(
    `review_index`    INT              NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `user_index`      INT              NOT NULL    COMMENT '작성자 인덱스', 
    `teacher_index`   INT              NOT NULL    COMMENT '강사 인덱스', 
    `review_title`    VARCHAR(100)     NOT NULL    COMMENT '리뷰 제목', 
    `review_content`  VARCHAR(1000)    NOT NULL    COMMENT '리뷰 내용', 
    `review_grade`    DOUBLE           NOT NULL    COMMENT '별점', 
     PRIMARY KEY (review_index)
);

-- 테이블 Comment 설정 SQL - Teacher_review
ALTER TABLE Teacher_review COMMENT '강사 리뷰 테이블';

-- Foreign Key 설정 SQL - Teacher_review(teacher_index) -> Teacher(teacher_index)
ALTER TABLE Teacher_review
    ADD CONSTRAINT FK_Teacher_review_teacher_index_Teacher_teacher_index FOREIGN KEY (teacher_index)
        REFERENCES Teacher (teacher_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Teacher_review(teacher_index)
-- ALTER TABLE Teacher_review
-- DROP FOREIGN KEY FK_Teacher_review_teacher_index_Teacher_teacher_index;

-- Foreign Key 설정 SQL - Teacher_review(user_index) -> User(user_index)
ALTER TABLE Teacher_review
    ADD CONSTRAINT FK_Teacher_review_user_index_User_user_index FOREIGN KEY (user_index)
        REFERENCES User (user_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Teacher_review(user_index)
-- ALTER TABLE Teacher_review
-- DROP FOREIGN KEY FK_Teacher_review_user_index_User_user_index;


