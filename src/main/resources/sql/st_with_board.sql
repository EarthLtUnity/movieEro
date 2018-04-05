drop sequence ST_WITH_BOARD_SEQ;

create sequence ST_WITH_BOARD_SEQ
start with 1
increment by 1
maxvalue 9999


drop table ST_WITH_BOARD;
delete ST_WITH_BOARD;

create table ST_WITH_BOARD (	
	WHID_BOARD_NO NUMBER, /* 게시글번호 */
	WHID_BOARD_WRITER VARCHAR2(30 BYTE) NOT NULL ENABLE, /* 작성자 */
	WHID_BOARD_TITLE VARCHAR2(50 BYTE) NOT NULL ENABLE, /* 제목 */
	WHID_BOARD_CONTENT VARCHAR2(2000 BYTE) NOT NULL ENABLE, /* 내용 */
	WHID_BOARD_NOW_ID VARCHAR2(400 BYTE) NOT NULL ENABLE, /* 현재 참여자ID */
	WHID_BOARD_NOW_NO NUMBER, /* 현재참여인원 */
	WHID_BOARD_APPLY_NO NUMBER, /* 모집인원 */
	WHID_BOARD_READCOUNT NUMBER, /* 게시글조회수 */
	WHID_BOARD_DATE DATE DEFAULT sysdate, /* 날시날짜 */
	primary key (WHID_BOARD_NO));
	 
/*초기 값 넣기 10개 */
INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL, 
'admin', 
'강남 7시 신과함께 보실분', 
'강남역 /CGV /4명/ 신과함께/ 강남역앞4번출구/ 10:00까지',
'admin',
1 ,4 ,1 , sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'steve',
'목동 7시 다함께차차차 보실분',
'목동역 /메가박스 /3명 /신과함께 /목동역앞4번출구 /11:00까지',
'steve,babo',
2, 3, 1, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'love',
'이수 4시 어벤져스',
'이수역 /메가박스 /4명 /어벤져스 /이수역앞4번출구 /21:00까지',
'love,momo',
2, 4, 10, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'gogo',
'삼성 1시 바람과 함께 사라지다 / 4명',
'삼성역 /CGV /4명 /바람과 함께 사라지다 /삼성역 앞1번출구 /22:00까지',
'gogo,momo,test,yoo',
4, 4, 10, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'gogo',
'삼성 1시 바람과 함께 사라지다 / 4명',
'삼성역 /CGV /4명 /바람과 함께 사라지다 /삼성역 앞1번출구 /22:00까지',
'gogo,momo,test,yoo',
4, 4, 10, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL, 
'admin', 
'강남 7시 신과함께 보실분', 
'강남역 /CGV /4명/ 신과함께/ 강남역앞4번출구/ 10:00까지',
'admin',
1 ,4 ,1 , sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'steve',
'목동 7시 다함께차차차 보실분',
'목동역 /메가박스 /3명 /신과함께 /목동역앞4번출구 /11:00까지',
'steve,babo',
2, 3, 1, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'love',
'이수 4시 어벤져스',
'이수역 /메가박스 /4명 /어벤져스 /이수역앞4번출구 /21:00까지',
'love,momo',
2, 4, 10, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'gogo',
'삼성 1시 바람과 함께 사라지다 / 4명',
'삼성역 /CGV /4명 /바람과 함께 사라지다 /삼성역 앞1번출구 /22:00까지',
'gogo,momo,test,yoo',
4, 4, 10, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'gogo',
'삼성 1시 바람과 함께 사라지다 / 4명',
'삼성역 /CGV /4명 /바람과 함께 사라지다 /삼성역 앞1번출구 /22:00까지',
'gogo,momo,test,yoo',
4, 4, 10, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL, 
'admin', 
'강남 7시 신과함께 보실분', 
'강남역 /CGV /4명/ 신과함께/ 강남역앞4번출구/ 10:00까지',
'admin',
1 ,4 ,1 , sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'steve',
'목동 7시 다함께차차차 보실분',
'목동역 /메가박스 /3명 /신과함께 /목동역앞4번출구 /11:00까지',
'steve,babo',
2, 3, 1, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'love',
'이수 4시 어벤져스',
'이수역 /메가박스 /4명 /어벤져스 /이수역앞4번출구 /21:00까지',
'love,momo',
2, 4, 10, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'gogo',
'삼성 1시 바람과 함께 사라지다 / 4명',
'삼성역 /CGV /4명 /바람과 함께 사라지다 /삼성역 앞1번출구 /22:00까지',
'gogo,momo,test,yoo',
4, 4, 10, sysdate);

INSERT INTO ST_WITH_BOARD values (ST_WITH_BOARD_SEQ.NEXTVAL,
'gogo',
'삼성 1시 바람과 함께 사라지다 / 4명',
'삼성역 /CGV /4명 /바람과 함께 사라지다 /삼성역 앞1번출구 /22:00까지',
'gogo,momo,test,yoo',
4, 4, 10, sysdate);