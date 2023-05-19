DROP DATABASE IF EXISTS STF;
CREATE DATABASE STF;
USE STF;

-- 191010
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- Exercise Table Create SQL
-- 테이블 생성 SQL - Exercise

CREATE TABLE Exercise
(
    `exercise_index`  INT              NOT NULL    COMMENT '인덱스', 
    `exercise_name`   VARCHAR(100)     NOT NULL    COMMENT '종목 이름', 
    `exercise_intro`  VARCHAR(1000)    NOT NULL    COMMENT '종목 소개', 
    `exercise_img`    VARCHAR(1000)    NOT NULL    COMMENT '종목 영상', 
    `exercise_force`  VARCHAR(1000)    NOT NULL    COMMENT '종목 장점 소개', 
     PRIMARY KEY (exercise_index)
);


        
-- 운동 정보 테이블
DELETE FROM exercise;
INSERT INTO exercise(exercise_index, exercise_name, exercise_intro, exercise_img, exercise_force)
VALUES ( '1', '수영', '수영(水泳, Swimming)은 물에서 나아가기 위해 손발을 움직이는 행위, 또는 물에서 누가 더 빨리 나가는지를 겨루는 스포츠이다.', '수영 URL', '수영 장점: '),
 ( '2', '요가', '요가는 신비적 명상법으로서, 종파를 초월하여 실천됨. 오늘날에는 심신의 건강법으로서도 응용되고 있다.', '요가 URL', '요가 장점은~'),
  ( '3', '게이트볼', '게이트볼(gateball)은 T자 모양의 막대기로 공을 쳐서 경기장 안의 게이트(문) 3군데를 통과시킨 다음 골폴에 맞히는 구기이다.', '게이트볼 URL', '게이트볼 장점은~'),
   ( '4', '댄스 스포츠', '댄스스포츠(Dancesport)는 친목과 사교, 공연을 위한 볼룸 댄스가 아닌, 스포츠로서 경기를 하기 위한 볼룸 댄스이다. ', '댄스스포츠 URL', '댄스스포츠 장점은~'),
    ( '5', '스쿼시', '스쿼시(squash)는 두 명(단식) 또는 네 명(복식)의 선수가 사방이 벽으로 이루어진 코트에서 작고 속이 빈 고무공으로 경기를 하는 라켓 스포츠이다.', '스쿼시 URL', '스쿼시 장점은~');
SELECT * from exercise;




-- 테이블 Comment 설정 SQL - Exercise
ALTER TABLE Exercise COMMENT '종목 정보 테이블';


-- Teacher Table Create SQL
-- 테이블 생성 SQL - Teacher
CREATE TABLE Teacher
(
    `teacher_index`     INT              NOT NULL    COMMENT '인덱스', 
    `teacher_name`      VARCHAR(20)      NOT NULL    COMMENT '이름', 
    `teacher_sex`       VARCHAR(2)       NOT NULL    COMMENT '성별', 
    `teacher_follower`  INT              NOT NULL    COMMENT '팔로워 수', 
    `exercise_index`    INT              NOT NULL    COMMENT '종목 인덱스', 
    `teacher_img`       VARCHAR(1000)    NOT NULL    COMMENT '강사 이미지', 
    CONSTRAINT PK_teacher PRIMARY KEY (teacher_index)
);

-- 강사 정보 테이블
DELETE FROM Teacher;
INSERT INTO Teacher(teacher_index, teacher_name, teacher_sex, teacher_follower, exercise_index, teacher_img)
VALUES ( 1, '일동현', '남',0, 1 , '일동현 이미지'),
 ( 2, '이동현', '여',0, 1 , '이동현 이미지'),
 ( 3, '일은성', '남',0, '2', '일은성 이미지'),
 ( 4, '이은성', '여',0, '2', '이은성 이미지'),
 ( 5, '일덕용', '남',0, '3', '일덕용 이미지'),
 ( 6, '이덕용', '여',0, '3', '이덕용 이미지'),
 ( 7, '일동익', '남',0, '4', '일동익 이미지'),
 ( 8, '이동익', '여',0, '4', '이동익 이미지'),
 ( 9, '일동교', '남',0, '5', '일동교 이미지'),
 ( 10, '이동교', '여',0, '5', '이동교 이미지');
SELECT * from Teacher;



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
    `user_id`           VARCHAR(45)    NOT NULL    DEFAULT 'UNIQUE' COMMENT '아이디', 
    `user_password`     VARCHAR(45)    NOT NULL    COMMENT '비밀번호', 
    `user_nick`         VARCHAR(45)    NOT NULL    COMMENT '닉네임', 
    `user_number`       VARCHAR(45)    NOT NULL    COMMENT '핸드폰. 010-0000-0000 / ''-''제외 11자', 
    `user_email`        VARCHAR(45)    NOT NULL    COMMENT '이메일', 
    `user_lecture_cnt`  INT            NULL        COMMENT '수강 개수', 
     PRIMARY KEY (user_index)
  --   CONSTRAINT uc_user_id UNIQUE (user_id)
);
-- Unique Index 설정 SQL - User(user_id)
CREATE UNIQUE INDEX UQ_User_1
    ON User(user_id);

-- 테이블 Comment 설정 SQL - User
ALTER TABLE User COMMENT '회원 정보 테이블';

-- 회원 정보 테이블
DELETE FROM User;
INSERT INTO User(user_index, user_name, user_img, user_birth, user_sex, user_id, user_password, user_nick, user_number, user_email , user_lecture_cnt)
VALUES ( '0', '김재이', '재이 사진 url','19970901','남', 'jay_id', 'ssafy', '재이다', '010-1111-1111','jay@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', 'ra_id', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김소연', '소연 사진 url','19981010', '여','so_id', 'ssafy','소연이다','010-3333-3333','so@gmail.com',0 );
SELECT * from User;

-- Program Table Create SQL
-- 테이블 생성 SQL - Program
CREATE TABLE Program
(
    `lecture_index`    INT            NOT NULL    COMMENT '인덱스', 
    `lecture_name`     VARCHAR(10)    NOT NULL    COMMENT '강의명', 
    `lecture_start`    VARCHAR(45)    NOT NULL    COMMENT '시작시간', 
    `lecture_end`      VARCHAR(45)    NOT NULL    COMMENT '끝 시간', 
    `lecture_event_1`  VARCHAR(45)    NOT NULL    COMMENT '1차 요일 ', 
    `lecture_event_2`  VARCHAR(45)    NOT NULL    COMMENT '2차 요일', 
    `lecture_month`    INT            NOT NULL    COMMENT '프로그램 월 차수', 
    `lecture_max_cnt`  INT            NOT NULL    COMMENT '수강 최대 인원', 
    `lecture_cnt`      INT            NOT NULL    COMMENT '수강 인원', 
    `lecture_place`    VARCHAR(45)    NOT NULL    COMMENT '강의장 위치', 
    `exercise_index`   INT            NOT NULL    COMMENT '종목 인덱스', 
    `teacher_index`    INT            NOT NULL    COMMENT '강사 인덱스', 
     PRIMARY KEY (lecture_index)
);

select * from program;
SELECT * from program 
		WHERE exercise_index =  1;
        
DELETE FROM program;
INSERT INTO program(lecture_index, lecture_name, lecture_start, lecture_end, lecture_event_1, lecture_event_2, lecture_month, lecture_max_cnt, lecture_cnt, lecture_place, exercise_index , teacher_index)
VALUES 
-- 수영 요가 게이트볼 댄스 스포츠 스쿼시
-- 5월
( 1, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'수영장 1호', 1, 1),
( 2, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'수영장 2호', 1, 2),
( 3, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'요가교실 1호', 2, 3),
( 4, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'요가교실 2호', 1, 4),
( 5, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'게이트볼장 1호', 1, 5),
( 6, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'게이트볼장 2호', 1, 6),
( 7, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'댄스교실 1호', 1, 7),
( 8, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'댄스교실 2호', 1, 8),
( 8, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'스쿼시장 1호', 1, 9),
( 10, '수영1', '오후 3시','오후 5시','화', '목', 5, 20, 15,'스쿼시장 2호', 1, 10),
-- 6월 
( 11, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 12, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 13, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 14, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 15, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 16, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 17, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 18, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 19, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
( 20, '수영1', '오후 3시','오후 5시','화', '목', 6, 20, 15,'수영장 1호', 1, 1),
-- 7월
( 21, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 22, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 23, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 24, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 25, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 26, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 27, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 28, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 29, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1),
( 30, '수영1', '오후 3시','오후 5시','화', '목', 7, 20, 15,'수영장 1호', 1, 1);

SELECT * from program; 
		
       SELECT * from program 
		WHERE exercise_index = 1
		AND month(current_date()) = lecture_month;

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


