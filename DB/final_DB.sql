DROP DATABASE IF EXISTS STF;
CREATE DATABASE STF;
USE STF;
set SQL_SAFE_UPDATES = 0;


-- 221213


-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- Exercise Table Create SQL
-- 테이블 생성 SQL - Exercise
CREATE TABLE Exercise
(
    `exercise_index`  INT              NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `exercise_name`   VARCHAR(100)     NOT NULL    COMMENT '종목 이름', 
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
    `teacher_career`    VARCHAR(1000)    NOT NULL    COMMENT '강사 커리어', 
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
    `user_sex`          VARCHAR(45)    NOT NULL    COMMENT '성별. 남성 / 여성', 
    `user_id`           VARCHAR(45)    NOT NULL    DEFAULT 'UNIQUE' COMMENT '유저 아이디', 
    `user_password`     VARCHAR(45)    NOT NULL    COMMENT '비밀번호', 
    `user_nick`         VARCHAR(45)    NOT NULL    COMMENT '닉네임', 
    `user_number`       VARCHAR(45)    NOT NULL    COMMENT '핸드폰. 010-0000-0000 / ''-''제외 11자', 
    `user_email`        VARCHAR(45)    NOT NULL    COMMENT '이메일', 
    `user_lecture_cnt`  INT            NULL        COMMENT '수강 개수', 
     PRIMARY KEY (user_index, user_id)
);

-- 테이블 Comment 설정 SQL - User
ALTER TABLE User COMMENT '회원 정보 테이블';

-- Unique Index 설정 SQL - User(user_id)
CREATE UNIQUE INDEX UQ_User_1
    ON User(user_id);


-- Program Table Create SQL
-- 테이블 생성 SQL - Program
CREATE TABLE Program
(
    `lecture_index`    INT            NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `lecture_name`     VARCHAR(10)    NOT NULL    COMMENT '강의명', 
    `lecture_time1`    VARCHAR(45)    NOT NULL    COMMENT '주 1차 수업', 
    `lecture_time2`    VARCHAR(45)    NOT NULL    COMMENT '주 2차 수업', 
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


-- Teacher_review Table Create SQL
-- 테이블 생성 SQL - Teacher_review
CREATE TABLE Teacher_review
(
    `review_index`    INT              NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `user_id`         VARCHAR(45)      NOT NULL    COMMENT '유저 아이디', 
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

-- Foreign Key 설정 SQL - Teacher_review(user_id) -> User(user_id)
ALTER TABLE Teacher_review
    ADD CONSTRAINT FK_Teacher_review_user_id_User_user_id FOREIGN KEY (user_id)
        REFERENCES User (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Teacher_review(user_id)
-- ALTER TABLE Teacher_review
-- DROP FOREIGN KEY FK_Teacher_review_user_id_User_user_id;


-- Board Table Create SQL
-- 테이블 생성 SQL - Board
CREATE TABLE Board
(
    `board_index`    INT              NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `user_id`        VARCHAR(45)      NOT NULL    COMMENT '유저 아이디', 
    `board_title`    VARCHAR(1000)    NOT NULL    COMMENT '제목', 
    `board_content`  VARCHAR(1000)    NOT NULL    COMMENT '글 내용', 
    `board_date`     DATE             NOT NULL    DEFAULT '1111-11-11' COMMENT '등록일', 
    `board_cnt`      INT              NOT NULL    COMMENT '조회수', 
    `board_img`      VARCHAR(1000)    NULL        COMMENT '이미지. 이미지 파일 명', 
     PRIMARY KEY (board_index)
);

-- 테이블 Comment 설정 SQL - Board
ALTER TABLE Board COMMENT '사랑방';

-- Foreign Key 설정 SQL - Board(user_id) -> User(user_id)
ALTER TABLE Board
    ADD CONSTRAINT FK_Board_user_id_User_user_id FOREIGN KEY (user_id)
        REFERENCES User (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Board(user_id)
-- ALTER TABLE Board
-- DROP FOREIGN KEY FK_Board_user_id_User_user_id;


-- Reservation Table Create SQL
-- 테이블 생성 SQL - Reservation
CREATE TABLE Reservation
(
    `reservation_index`  INT            NOT NULL    AUTO_INCREMENT COMMENT '인덱스', 
    `user_id`            VARCHAR(45)    NOT NULL    COMMENT '유저 아이디', 
    `lecture_index`      INT            NOT NULL    COMMENT '강의명 인덱스', 
     PRIMARY KEY (reservation_index)
);

-- 테이블 Comment 설정 SQL - Reservation
ALTER TABLE Reservation COMMENT '프로그램 예약 테이블';

-- Foreign Key 설정 SQL - Reservation(lecture_index) -> Program(lecture_index)
ALTER TABLE Reservation
    ADD CONSTRAINT FK_Reservation_lecture_index_Program_lecture_index FOREIGN KEY (lecture_index)
        REFERENCES Program (lecture_index) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Reservation(lecture_index)
-- ALTER TABLE Reservation
-- DROP FOREIGN KEY FK_Reservation_lecture_index_Program_lecture_index;

-- Foreign Key 설정 SQL - Reservation(user_id) -> User(user_id)
ALTER TABLE Reservation
    ADD CONSTRAINT FK_Reservation_user_id_User_user_id FOREIGN KEY (user_id)
        REFERENCES User (user_id) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- Foreign Key 삭제 SQL - Reservation(user_id)
-- ALTER TABLE Reservation
-- DROP FOREIGN KEY FK_Reservation_user_id_User_user_id;


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

-- 운동종목 테이블
DELETE FROM exercise;
INSERT INTO exercise(exercise_index, exercise_name, exercise_intro, exercise_img, exercise_force)
VALUES ( '0', '수영', '수영(水泳, Swimming)은 물에서 나아가기 위해 손발을 움직이는 행위, 또는 물에서 누가 더 빨리 나가는지를 겨루는 스포츠이다.', '수영 URL', '수영 장점: '),
 ( '0', '요가', '요가는 신비적 명상법으로서, 종파를 초월하여 실천됨. 오늘날에는 심신의 건강법으로서도 응용되고 있다.', '요가 URL', '요가 장점은~'),
  ( '0', '게이트볼', '수영은', '수영 URL', '수영 장점은~'),
   ( '0', '댄스 스포츠', '수영은', '수영 URL', '수영 장점은~'),
    ( '0', '스쿼시', '수영은', '수영 URL', '수영 장점은~');
SELECT * from exercise;

-- 강사 정보 테이블
DELETE FROM Teacher;
INSERT INTO Teacher(teacher_index, teacher_name, teacher_sex, teacher_follower, exercise_index, teacher_img, teacher_career)
VALUES ( 0, '일동현', '남',0, 1 , '일동현 이미지', 'X'),
( 0, '이동현', '여',0, 1 , '이동현 이미지', 'X'),
 ( 0, '일은성', '남',0, '2', '일은성 이미지', 'X'),
 ( 0, '이은성', '여',0, '2', '이은성 이미지', 'X'),
 ( 0, '일덕용', '남',0, '3', '일덕용 이미지', 'X'),
 ( 0, '이덕용', '여',0, '3', '이덕용 이미지', 'X'),
 ( 0, '일동익', '남',0, '4', '일동익 이미지', 'X'),
 ( 0, '이동익', '여',0, '4', '이동익 이미지', 'X'),
 ( 0, '일동교', '남',0, '5', '일동교 이미지', 'X'),
 ( 0, '이동교', '여',0, '5', '이동교 이미지', 'X');
SELECT * from Teacher;

-- 공지사항 테이블
DELETE FROM Notice;
INSERT INTO Notice(notice_index, notice_title, notice_content, notice_date, notice_cnt, notice_manager)
VALUES ( '0', '수영 프로그램 안내', '수영 프로그램 안내입니다.', NOW(), 0, '관리자'),
( '0', '4월 프로그램 안내', '4월 프로그램 안내입니다.', NOW(), 0, '관리자'),
( '0', '5월 프로그램 안내', '5월 프로그램 안내입니다.', NOW(), 0, '관리자'),
( '0', '휴관 안내', '휴관 안내입니다.', NOW(), 0, '관리자'),
( '0', '단수 안내', '단수 안내입니다.', NOW(), 0, '관리자'),
( '0', '대체 공휴일 안내', '대체 공휴일 안내입니다.', NOW(), 0, '관리자'),
( '0', '스쿼시 프로그램 안내', '스쿼시 프로그램 안내입니다.', NOW(), 0, '관리자');
SELECT * from Notice;

-- 회원 정보 테이블
DELETE FROM User;
INSERT INTO User(user_index, user_name, user_img, user_birth, user_sex, user_id, user_password, user_nick, user_number, user_email , user_lecture_cnt)
VALUES ( '0', '김재이', '재이 사진 url','19970901','남', 'jay_id', 'ssafy', '재이다', '010-1111-1111','jay@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', 'ra_id', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김소연', '소연 사진 url','19981010', '여','so_id', 'ssafy','소연이다','010-3333-3333','so@gmail.com',0 );
SELECT * from User;

-- 프로그램 정보 테이블
DELETE FROM program;
INSERT INTO program(lecture_index, lecture_name, lecture_time1, lecture_time2, lecture_month, lecture_max_cnt, lecture_cnt, lecture_place, exercise_index , teacher_index)
VALUES 
-- 수영 요가 게이트볼 댄스 스포츠 스쿼시
-- 4월
( 0, '수영1', '2023-05-22T09:00:00', '2023-05-25T09:00:00', 4, 0, 10,'수영장 1호', 1, 1),
( 0, '수영2', '2023-05-23T13:00:00','2023-05-24T13:00:00', 4, 0, 10,'수영장 2호', 1, 2),
( 0, '요가1', '2023-05-23T09:00:00','2023-05-24T09:00:00', 4, 0, 10,'요가교실 1호', 2, 3),
( 0, '요가2', '2023-05-22T15:00:00','2023-05-26T15:00:00', 4, 0, 10,'요가교실 2호', 2, 4),
( 0, '게이트볼1', '2023-05-23T17:00:00','2023-05-25T17:00:00', 4, 0, 10,'게이트볼장 1호', 3, 5),
( 0, '게이트볼2', '2023-05-22T10:00:00','2023-05-25T10:00:00', 4, 0, 10,'게이트볼장 2호', 3, 6),
( 0, '댄스1', '2023-05-23T14:00:00','2023-05-24T14:00:00', 4, 0, 10,'댄스교실 1호', 4, 7),
( 0, '댄스2', '2023-05-22T14:00:00','2023-05-25T14:00:00', 4, 0, 10,'댄스교실 2호', 4, 8),
( 0, '스쿼시1', '2023-05-22T10:00:00','2023-05-26T10:00:00', 4, 0, 10,'스쿼시장 1호', 5, 9),
( 0, '스쿼시2', '2023-05-22T17:00:00','2023-05-23T17:00:00', 4, 0, 10,'스쿼시장 2호', 5, 10),
-- 5월 시작시간 끝시간 월
( 0, '수영1', '2023-05-22T09:00:00', '2023-05-25T09:00:00', 5, 0, 10,'수영장 1호', 1, 1),
( 0, '수영2', '2023-05-23T13:00:00','2023-05-24T13:00:00', 5, 0, 10,'수영장 2호', 1, 2),
( 0, '요가1', '2023-05-23T09:00:00','2023-05-24T09:00:00', 5, 0, 10,'요가교실 1호', 2, 3),
( 0, '요가2', '2023-05-22T15:00:00','2023-05-26T15:00:00', 5, 0, 10,'요가교실 2호', 2, 4),
( 0, '게이트볼1', '2023-05-23T17:00:00','2023-05-25T17:00:00', 5, 0, 10,'게이트볼장 1호', 3, 5),
( 0, '게이트볼2', '2023-05-22T10:00:00','2023-05-25T10:00:00', 5, 0, 10,'게이트볼장 2호', 3, 6),
( 0, '댄스1', '2023-05-23T14:00:00','2023-05-24T14:00:00', 5, 0, 10,'댄스교실 1호', 4, 7),
( 0, '댄스2', '2023-05-22T14:00:00','2023-05-25T14:00:00', 5, 0, 10,'댄스교실 2호', 4, 8),
( 0, '스쿼시1', '2023-05-22T10:00:00','2023-05-26T10:00:00', 5, 0, 10,'스쿼시장 1호', 5, 9),
( 0, '스쿼시2', '2023-05-22T17:00:00','2023-05-23T17:00:00', 5, 0, 10,'스쿼시장 2호', 5, 10),
-- 6월 
( 0, '수영1', '2023-05-22T09:00:00', '2023-05-25T09:00:00', 6, 0, 10,'수영장 1호', 1, 1),
( 0, '수영2', '2023-05-23T13:00:00','2023-05-24T13:00:00', 6, 0, 10,'수영장 2호', 1, 2),
( 0, '요가1', '2023-05-23T09:00:00','2023-05-24T09:00:00', 6, 0, 10,'요가교실 1호', 2, 3),
( 0, '요가2', '2023-05-22T15:00:00','2023-05-26T15:00:00', 6, 0, 10,'요가교실 2호', 2, 4),
( 0, '게이트볼1', '2023-05-23T17:00:00','2023-05-25T17:00:00', 6, 0, 10,'게이트볼장 1호', 3, 5),
( 0, '게이트볼2', '2023-05-22T10:00:00','2023-05-25T10:00:00', 6, 0, 10,'게이트볼장 2호', 3, 6),
( 0, '댄스1', '2023-05-23T14:00:00','2023-05-24T14:00:00', 6, 0, 10,'댄스교실 1호', 4, 7),
( 0, '댄스2', '2023-05-22T14:00:00','2023-05-25T14:00:00', 6, 0, 10,'댄스교실 2호', 4, 8),
( 0, '스쿼시1', '2023-05-22T10:00:00','2023-05-26T10:00:00', 6, 0, 10,'스쿼시장 1호', 5, 9),
( 0, '스쿼시2', '2023-05-22T17:00:00','2023-05-23T17:00:00', 6, 0, 10,'스쿼시장 2호', 5, 10);

SELECT * from program; 		

SELECT * from program 
WHERE exercise_index = 1
AND month(current_date()) = lecture_month;


-- 사랑방 테이블

DELETE FROM Board;
INSERT INTO Board(board_index, user_id, board_title, board_content, board_date, board_cnt, board_img)
VALUES ( '0', "jay_id", "안녕", "내용이에요", NOW(), 0, '이미지 경로'),
( '0', "jay_id", "안녕", "내용이에요", NOW(), 0, '이미지 경로'),( '0', "jay_id", "안녕", "내용이에요", NOW(), 0, '이미지 경로'),( '0', "jay_id", "안녕", "내용이에요", NOW(), 0, '이미지 경로'),
( '0', "ra_id", "하이", "내용이다!", 20230524, 1, '이미지 경로');
SELECT * from Board;

-- 선생 리뷰 테이블 

DELETE FROM Teacher_review;
INSERT INTO Teacher_review(review_index, user_id, teacher_index, review_title, review_content, review_grade)
VALUES ( '0', "jay_id", 1, "이 선생 최고",'에요', 2);

SELECT * from Teacher_review;

-- 예약 테이블
INSERT INTO Reservation(reservation_index, user_id, lecture_index)
VALUES 
(0, 'jay_id', 1), (0, 'jay_id', 2), (0, 'jay_id', 3),
(0, 'jay_id', 11), (0, 'jay_id', 12), (0, 'jay_id', 13),
(0, 'jay_id', 21), (0, 'jay_id', 22), (0, 'jay_id', 23),
(0, 'ra_id', 14), (0, 'ra_id', 15), (0, 'ra_id', 16);

SELECT * FROM Reservation;                          

-- 이수 완료 목룍
SELECT R.*, P.lecture_name, P.lecture_place, P.lecture_time1, P.lecture_time2, T.teacher_name
FROM Reservation AS R
JOIN program AS P ON R.lecture_index = P.lecture_index
JOIN teacher AS T ON P.teacher_index = T.teacher_index
WHERE R.user_id = 'jay_id'
AND P.lecture_month = MONTH(CURRENT_DATE)-1;

-- 이수 중 목록
SELECT R.*, P.lecture_name, P.lecture_place, P.lecture_time1, P.lecture_time2, T.teacher_name
FROM Reservation AS R
JOIN program AS P ON R.lecture_index = P.lecture_index
JOIN teacher AS T ON P.teacher_index = T.teacher_index
WHERE R.user_id = 'jay_id'
AND P.lecture_month = MONTH(CURRENT_DATE);

-- 이수 예약 목록
SELECT R.*, P.lecture_name, P.lecture_place, P.lecture_time1, P.lecture_time2, T.teacher_name
FROM Reservation AS R
JOIN program AS P ON R.lecture_index = P.lecture_index
JOIN teacher AS T ON P.teacher_index = T.teacher_index
WHERE R.user_id = 'jay_id'
AND P.lecture_month = MONTH(CURRENT_DATE)+1;


