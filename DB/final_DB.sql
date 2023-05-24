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
    `user_img`          VARCHAR(1000)    NULL        COMMENT '회원 이미지. 이미지파일 명', 
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

-- 운동종목 테이블
DELETE FROM exercise;
INSERT INTO exercise(exercise_index, exercise_name, exercise_intro, exercise_img, exercise_force)
VALUES ( '0', '수영(水泳, Swimming)', '수영은 물에서 나아가기 위해 손발을 움직이는 행위, 또는 물에서 누가 더 빨리 나가는지를 겨루는 스포츠이다.', '수영.jpg', '전신 운동: 수영은 전신을 균형있게 운동시키는데 도움이 됩니다. 팔, 다리, 등, 복부 등 다양한 근육을 사용하여 강화시킬 수 있습니다.
저항과 유산소 운동: 물의 저항으로 인해 근력을 향상시키고 동시에 유산소 운동 효과를 얻을 수 있습니다. 심폐지구력과 체력을 향상시키는 데 도움이 됩니다.
관절 부상 감소: 수영은 관절에 대한 부담이 적으며 충격을 최소화하는 운동입니다. 관절 문제가 있는 사람들이 안전하게 운동할 수 있습니다.
스트레스 완화: 수영은 수련 동안 수면 상태를 유지하고 스트레스를 감소시키는 데 도움이 됩니다.'),
 ( '0', '요가 (Yoga)', '요가는 몸과 마음을 조화롭게 가꾸는 몸과 정신의 종합 운동입니다. 몸의 유연성, 균형감각, 근력, 호흡, 집중력, 스트레스 관리 등 다양한 측면에서 건강에 도움을 줍니다. 요가는 다양한 자세와 동작을 수행하여 몸의 유연성을 향상시키고 몸과 마음의 안정을 증진시키는 데 초점을 둡니다.', '요가.jpg', '유연성 개선: 요가는 근육과 인대를 스트레칭하여 유연성을 향상시킵니다. 관절의 움직임을 개선하고 몸의 자세를 조정하는 데 도움이 됩니다.
균형과 자세 개선: 요가는 몸의 균형을 개선하고 올바른 자세를 유지하는 데 도움이 됩니다. 근육의 균형을 맞추고 척추의 정렬을 향상시키는 데 도움이 됩니다.
스트레스 감소: 요가는 명상과 깊은 호흡을 통해 심신을 안정시키고 스트레스를 감소시키는 데 도움이 됩니다.
강력한 핵근육: 요가 동작은 복부와 허리 근육을 강화하는 데 도움이 됩니다. 핵근육의 강화는 척추 안정성을 향상시키고 다른 운동에서의 성능을 향상시킵니다.'),
  ( '0', '게이트볼(Gateball)', '게이트볼은 공을 목표 게이트에 가까이 넣는 것을 목표로 하는 팀 경기입니다. 공을 원하는 위치에 정확하게 차고, 상대팀의 공을 방해하고 목표 게이트에 점수를 얻는 전략적인 게임입니다. 게이트볼은 노인들을 위한 사회 활동으로도 많이 즐겨지며, 건강한 신체 활동과 사회적 상호 작용을 도모합니다.', '게이트볼.jpg', '사회적 상호작용: 게이트볼은 팀 스포츠로서 다른 사람들과 협력하고 소통하는 기회를 제공합니다. 사회적인 활동을 통해 친목을 도모할 수 있습니다.
전략적 사고: 게이트볼은 전략과 전술을 사용하는 스포츠입니다. 팀원과의 협력, 상대팀의 동작 분석 및 적절한 전략 수립을 통해 전략적인 사고력을 향상시킬 수 있습니다.
저항 운동: 게이트볼은 볼을 밀거나 던지는 동작을 포함하여 근력을 강화시킬 수 있는 저항 운동입니다. 팔, 다리, 허리 근육의 힘과 강도를 향상시킵니다.
적응력과 반사신경: 게이트볼은 공을 빠르게 인식하고 반응할 수 있는 반사 신경과 적응력을 향상시키는 데 도움이 됩니다.'),
   ( '0', '댄스 스포츠 (Dance Sports):', '댄스 스포츠는 음악과 함께 춤을 추는 스포츠입니다. 댄스 스포츠는 라틴 댄스와 볼룸 댄스로 구성되며, 커플 또는 그룹으로 참가하여 리듬과 스타일을 표현합니다. 댄스 스포츠는 몸의 유연성, 균형감각, 신체 조절, 협업 능력 등을 향상시키고, 운동량을 소모하여 체력을 향상시킵니다.','댄스 스포츠.jpg', '신체 조절 및 유연성: 댄스 스포츠는 몸의 운동 범위를 넓히고 유연성을 개발하는 데 도움이 됩니다. 자세와 균형을 개선하여 운동 성과를 향상시킵니다.
유산소 운동: 댄스는 유산소 운동으로서 심폐 기능을 향상시키고 체력을 키울 수 있습니다. 심혈관 건강을 촉진하고 지방을 태우는 데 도움이 됩니다.
스트레스 해소: 댄스는 음악과 운동의 조합으로 스트레스를 해소하는 데 효과적입니다. 음악에 맞춰 움직이며 재미와 기쁨을 느낄 수 있습니다.
자기 표현과 창의성: 댄스 스포츠는 감정과 자기 표현을 표현하는 수단이 될 수 있습니다. 창의성을 발휘하고 예술적인 요소를 표현하는 데 도움이 됩니다.'),
    ( '0', '스쿼시 (Squash)', '스쿼시는 벽과 공을 이용하여 플레이하는 실내 라켓 스포츠입니다. 스쿼시는 두 명의 선수가 좁은 코트에서 공을 서로에게 튀어오르게 하며 플레이합니다. 스쿼시는 전신 운동으로 근력, 유연성, 반사 신경 등을 향상시키며, 빠른 움직임과 전략적인 플레이가 요구됩니다. 스쿼시는 빠른 속도와 집중력을 요구하므로 신체적인 피트니스와 전략적 사고를 발전시킵니다.', '스쿼시.jpg', '유산소 및 근력 운동: 스쿼시는 고강도의 유산소 운동으로 심폐 기능을 향상시키고 체력을 키울 수 있습니다. 또한, 스쿼시는 다리, 팔, 허리 근육을 강화하는 데 도움이 됩니다.
반사 신경 및 전략적 사고: 스쿼시는 빠른 속도로 공을 받아치고 반응하는 반사 신경과 전략적인 사고력을 요구합니다. 경기 동안 상대방의 움직임을 예측하고 적절한 전략을 세울 수 있는 능력을 향상시킵니다.
연습과 경기의 유연성: 스쿼시는 실내에서 이루어지는 스포츠로, 날씨에 구애받지 않고 연습하고 경기를 즐길 수 있습니다. 다른 사람과 함께하는 경쟁적인 환경에서 기술을 개발할 수 있습니다.');
SELECT * from exercise;

-- 강사 정보 테이블
DELETE FROM Teacher;
INSERT INTO Teacher(teacher_index, teacher_name, teacher_sex, teacher_follower, exercise_index, teacher_img, teacher_career)
VALUES ( 0, '웨이브익', '남',0, 1 , '웨이브익.jpg', '수영 강사로 5년 경력이 있으며, 국가대표로 활동한 경험이 있습니다.
어린이와 청소년을 대상으로 수영 교육을 진행하며, 안전하고 재미있는 수업을 제공합니다.
다양한 수영 스타일과 테크닉에 대한 전문 지식을 가지고 있어 수영 실력 향상을 도와줍니다.'),
( 0, '해파리현', '여',0, 1 , '해파리현.jpg', '수영 강사로 3년 경력이 있으며, 수영 기초 학습에 중점을 둔 수업을 진행합니다.
참가자들의 신체 조건과 능력에 맞는 맞춤형 수영 교육을 제공하여 성장과 발전을 도모합니다.
원활한 커뮤니케이션과 긍정적인 에너지로 수강생들의 수영 열정을 고취시킵니다.'),
 ( 0, '플라잉식', '남',0, '2', '플라잉식.jpg', '10년 이상의 요가 강사 경력을 보유하고 있으며, 다양한 스튜디오와 웰니스 센터에서 수업을 진행했습니다.
몸과 마음의 균형을 중요시하며, 천천히 움직이는 플로우 요가를 주로 가르칩니다.
참석자들에게 안정감을 주는 세련된 가이드와 호흡 기법을 통해 몸의 유연성과 정신적인 평온을 촉진시킵니다.'),
 ( 0, '커브현', '여',0, '2', '커브현.jpg', '국제 요가 인증을 받은 경험 있는 요가 강사로, 많은 사람들에게 요가의 장점을 알리기 위해 노력하고 있습니다.
다양한 요가 스타일을 다루며, 레벨에 맞는 도전과 휴식을 조화롭게 구성한 수업을 제공합니다.
참가자들에게 긍정적인 에너지와 명확한 지침을 제공하여 신체 강화, 스트레스 완화 및 내면의 평화를 도와줍니다.'),
 ( 0, '스윙종', '남',0, '3', '스윙종.jpg', '게이트볼 전문 강사로 5년 이상의 경험을 갖추고 있습니다.
다양한 연령대와 수준의 학생들을 지도하며 게이트볼 기술과 전략을 전달하는 데 능숙합니다.
팀워크 강화와 경기 전략 수립에 주력하여 학생들의 게이트볼 실력 향상에 도움을 주고 있습니다.'),
 ( 0, '공중제경', '남',0, '3', '공중제경.jpg', '게이트볼 국가 대표팀에서 경험을 쌓은 전문 강사입니다.
게이트볼의 기술적인 측면 뿐만 아니라 신체 조절과 균형 감각을 발전시키는 수업을 진행합니다.
학생들의 적응력과 경기 욕구를 높이는 맞춤형 교육 방법을 사용하여 성과를 도모하고 있습니다.'),
 ( 0, '그루브교', '남',0, '4', '그루브교.jpg', '다양한 장르의 댄스를 습득하고 경험한 댄서로서 댄스 스포츠 강사로 활동하고 있습니다.
학생들의 자율성과 창의성을 존중하면서 댄스를 가르치는 데 주력합니다.
팀워크와 함께 몸과 마음의 건강을 증진시키는 댄스 스포츠의 매력을 전달하고 있습니다.'),
 ( 0, '댄싱용', '남',0, '4', '댄싱용.jpg', '댄스 스포츠 강사로 10년 이상의 경력을 가지고 있으며 국제 대회에서 입상한 경험이 있습니다.
다양한 연령과 수준의 학생들에게 다양한 댄스 스포츠 기술을 가르치는 데 노력하고 있습니다.
강사로서의 전문성과 열정을 바탕으로 학생들의 자신감 향상과 예술적인 표현력 발전에 도움을 주고 있습니다.'),
 ( 0, '요가호', '남',0, '5', '요가호.jpg', '스쿼시 강사로서 7년 이상의 경력을 갖추고 있으며 국내 스쿼시 대회에서 우수한 성적을 올렸습니다.
기본기와 전략적인 플레이 방법을 학생들에게 친절하게 전달하며 스쿼시 실력 향상에 도움을 주고 있습니다.
체력과 민첩성을 함께 향상시키는 전문적인 트레이닝을 제공하여 학생들의 스쿼시 실력 향상에 기여하고 있습니다.'),
 ( 0, '유연영', '여',0, '5', '유연영.jpg', '국제 스쿼시 대회에서 경험을 쌓은 전문 강사로서 10년 이상의 경력을 가지고 있습니다.
학생들의 기술적인 발전과 함께 심리적인 면에서도 도움을 주는 맞춤형 교육 방식을 적용합니다.
스쿼시의 규칙과 전략을 교육 과정에 효과적으로 통합하여 학생들의 성장과 성과 달성에 도움을 주고 있습니다.');
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
VALUES ( '0', '김재이', 'jay_id.jpg','19970901','남', 'jay_id', 'ssafy', '재이다', '010-1111-1111','jay@naver.com',0),
 ( '0', '김소연', 'so_id.jpg','19981010', '여','so_id', 'ssafy','소연이다','010-3333-3333','so@gmail.com',0 ),
 ( '0', '김라현',  'ra_id.jpg','19980723','여', 'ra_id', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '정동교',  'gyo_id.jpg','19980723','여', 'gyo_id', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김동익',  'ik_id.jpg','19980723','여', 'ik_id', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 
 ( '0', '김라현',  '라현 사진 url','19980723','여', '가', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
   ( '0', '김라현',  '라현 사진 url','19980723','여', '나', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
    ( '0', '김라현',  '라현 사진 url','19980723','여', '다', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '라', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '마', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '바', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '사', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '아', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '자', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '차', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '카', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '타', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '파', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0),
 ( '0', '김라현',  '라현 사진 url','19980723','여', '하', 'ssafy', '라현이다', '010-2222-2222','dong@naver.com',0);

 
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
VALUES ('0', "ic_id", "춘자씨", "안녕하세요. 저희 가족은 항상 당신을 생각하며 건강하고 행복하길 바랍니다. 최근들어 날씨가 점점 따뜻해지면서 봄의 기운을 느낄 수 있어 기분이 좋아지고 있어요. 저희 집 근처에는 예쁜 꽃들이 피어나고 나무들이 푸르게 물들고 있어서 매일 산책을 즐기고 있어요. 이번 주말에는 가족 모두 함께 소풍을 가기로 했어요. 여러분도 많이 웃고 즐거운 시간을 보내길 바라며, 항상 응원하고 있을게요!", NOW(), 0, 'love_1.jpg'),
       ('0', "ic_id", "안녕하세요", "잘 지내시나요? 얼마 전에 친구들과 함께 산에 등반을 다녀왔는데, 정말 멋진 경치를 볼 수 있었어요. 정상에서 내려다보니 세상이 정말 아름답고 작은 고민들도 사라지는 것 같았어요. 여러분도 가끔은 일상에서 벗어나서 자연과 함께하는 시간을 갖는 것을 추천해요. 그리고 저에게도 소식을 많이 알려주세요. 함께 이야기 나누는 시간이 저에게 큰 힘이 됩니다. 잘 지내고 행복한 일들 가득하시길 바라요!", NOW(), 0, 'love_2.jpeg'),
       ('0', "gyo_id", "오랜만이군요", "오늘은 어떤 일이 있었나요? 지난 주에는 친구들과 함께 여행을 다녀왔어요. 새로운 장소를 방문하고 맛있는 음식을 먹으며 정말 즐거운 시간을 보냈어요. 그리고 이번 주에는 새로운 취미를 시작했어요. 그것은 그림 그리기인데요, 처음에는 어려워서 많이 막막했지만 조금씩 발전하고 있는 것 같아 기분이 좋아지고 있어요. 여러분도 새로운 도전을 하면서 자신감을 키워보는 것은 어떨까요? 기대됩니다! 잘 지내시고 즐거운 하루 보내세요!", NOW(), 0, 'love_3.jpg'),
       ('0', "ic_id", "만나서 반가워요. 연락하고싶어요 하하", "오랜만에 뵙게 되었네요! 최근들어 시간이 참 빠르게 흘러가는 것 같아요. 그래도 우리는 여전히 변하지 않고 함께 있어서 참 행복해요. 가끔은 서로에게 전화나 문자를 보내며 소식을 주고받으면서 더욱 더 가까워질 수 있을 것 같아요. 우리 다음에 만나면 좋은 추억들을 만들어보는 건 어떨까요? 기대돼요! 사랑합니다.", NOW(), 0, 'love_4.jpg'),
       ('0', "jay_id", "안녕하세요~", "저도 오랜만에 인사드려요! 요즘은 여러 가지 일로 정신이 좀 바쁘지만 여전히 힘차게 살고 있어요. 매일 아침에는 간단한 운동을 하고 건강을 유지하려고 노력하고 있어요. 가끔은 나만의 시간을 갖고 책을 읽거나 영화를 보며 힐링하는 시간을 갖는 것도 좋아요. 여러분도 자신만의 작은 행복을 찾아보는 것은 어떨까요? 힘든 날도 있겠지만 언제나 응원하고 있을게요. 건강하고 행복한 하루 보내세요!", NOW(), 0, 'love_5.jpeg'),
       ('0', "ra_id", "안녕하십니까", "오늘은 어떤 계획이 있으신가요? 시간이 빠르게 흘러가는데, 가끔은 한가로운 시간을 갖는 것도 좋을 것 같아요. 바쁜 일상에 휩쓸리지 말고 마음을 가라앉힐 수 있는 시간을 갖는 것이 중요하다고 생각해요. 그리고 저에게도 소식을 많이 알려주세요. 함께 이야기 나누는 시간이 저에게 큰 힘이 됩니다. 행복한 일들이 가득하길 바라요!", NOW(), 0, 'love_6.jpg'),
       ('0', "jay_id", "반갑습니다", "오늘은 기분이 좋아요! 어제는 친구들과 함께 즐거운 시간을 보내고, 오늘은 좋아하는 음악을 들으며 여유롭게 보내고 있어요. 가끔은 자신에게 보상을 주는 것도 좋은 방법이라고 생각해요. 우리는 자주 힘들게 노력하는데, 그만큼 휴식과 재충전도 필요하다고 생각해요. 자신을 위한 작은 선물을 주면서 행복한 순간을 만들어보는 건 어떨까요? 기분 좋은 하루 보내세요!", NOW(), 0, 'love_7.jpg'),
       ('0', "so_id", "안녕하십니까~", "잘 지내셨나요? 저는 요즘에 일이 정말 많아서 너무 바쁘네요. 하지만 그만큼 성취감도 크고 뿌듯한 기분도 들어요. 가끔은 바쁜 일상에 지칠 때도 있겠지만, 그래도 항상 앞으로 나아가려는 의지를 가지고 힘내고 있어요. 여러분도 자신의 목표에 한 발 한 발 다가가는 모습을 지켜보는 것도 좋을 것 같아요. 응원하고 있을게요! 행운을 빕니다.", NOW(), 0, 'love_8.jpg'),
       ('0', "ra_id", "방가방가", "오늘은 무슨 일이 있었나요? 저는 최근에 새로운 취미를 찾았어요. 바로 요리인데요, 처음에는 많이 어려웠지만 조금씩 익숙해지고 있어요. 맛있는 음식을 만들어 먹으며 가족과 함께하는 시간은 참 행복한 시간이에요. 여러분도 가끔은 요리를 해보면서 자신의 솜씨를 키워보는 것은 어떨까요? 즐거운 하루 보내세요!", NOW(), 0, 'love_9.png'),
       ('0', "jay_id", "안녕하세여~", "오늘도 화이팅하세요! 삶은 어려운 일들로 가득차지만, 우리는 항상 앞으로 나아가기 위해 노력하고 있어요. 힘들어도 포기하지 않고 꾸준히 나아가는 모습이 멋있어요. 저는 여러분의 노력을 응원하고 있을게요. 오늘도 최선을 다해 화이팅하세요! 행운을 빕니다.", NOW(), 0, 'love_10.png');
SELECT * from Board;
	
-- 선생 리뷰 테이블 

DELETE FROM Teacher_review;
INSERT INTO Teacher_review(review_index, user_id, teacher_index, review_title, review_content, review_grade)
VALUES ( '0', "가", 1, "진짜 대박이야!",'대박박수 대박이야~', 3),
( '0', "나", 1, "좋은데여~",'좋아서 공중제 경!', 4),
( '0', "다", 1, "네 좋아요",'훌륭한 커뮤니케이션과 설명력을 갖춘 강사였습니다.', 1),
( '0', "라", 2, "진짜 대박이야!",'학생들의 질문에 성심껏 답변해주는 친절한 강사였습니다.', 5),
( '0', "마", 2, "좋은데여~",'수업을 흥미롭게 진행하여 학생들의 주의를 집중시키는 능력이 뛰어난 강사였습니다.!', 4),
( '0', "바", 2, "네 좋아요",'전문적인 지식과 실무 경험을 바탕으로 수업을 진행하는 전문가적인 강사였습니다.', 4),
( '0', "사", 3, "진짜 대박이야!",'대학생들의 학습 수준에 맞게 적절한 난이도로 강의를 구성한 강사였습니다', 5),
( '0', "아", 3, "좋은데여~",'다양한 예시와 실습을 통해 개념을 명확하게 이해할 수 있도록 도와주는 강사였습니다.', 3),
( '0', "자", 4, "네 좋아요",'수업의 흐름과 구성이 명확하여 학습에 도움이 되었던 강사였습니다.', 2),
( '0', "차", 2, "진짜 대박이야!",'열정적이고 동기부여를 잘 해주어 학생들의 참여도를 높인 강사였습니다.', 4),
( '0', "카", 5, "좋은데여~",'실제 업무에 활용할 수 있는 실용적인 지식을 전달해주는 실무 강사였습니다.', 1),
( '0', "타", 7, "네 좋아요",'학생들의 개인적인 성장을 도모하기 위해 노력하는 강사였습니다.', 5),
( '0', "파", 8, "진짜 대박이야!",'학습 환경을 적극적으로 조성하여 학생들의 학습 동기를 높인 강사였습니다.', 3),
( '0', "하", 9, "좋은데여~",'강의 중 예시와 실습을 통해 실제 적용 가능한 능력을 키워주는 강사였습니다.', 4);


SELECT * from Teacher_review;

-- 예약 테이블
INSERT INTO Reservation(reservation_index, user_id, lecture_index)
VALUES 
(0, 'jay_id', 1), (0, 'jay_id', 2), (0, 'jay_id', 3),
(0, 'jay_id', 11), (0, 'jay_id', 12), (0, 'jay_id', 13),
(0, 'jay_id', 21), (0, 'jay_id', 22), (0, 'jay_id', 23),
(0, 'ra_id', 14), (0, 'ra_id', 15), (0, 'ra_id', 16);

SELECT * FROM Reservation;   


