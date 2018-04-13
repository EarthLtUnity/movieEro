--시퀀스 생성
DROP TRIGGER TRG_WITH_BOARD_SUB;
drop sequence ST_WITH_BOARD_SEQ;
drop table ST_WITH_BOARD_SUB;
drop table ST_WITH_BOARD;

create sequence ST_WITH_BOARD_SEQ
start with 1
increment by 1
maxvalue 9999;


--WITH 게시판 
create table ST_WITH_BOARD (	
	WITH_BOARD_NO NUMBER primary key, --게시글번호
	WITH_BOARD_WRITER VARCHAR2(30 BYTE) NOT NULL ENABLE, --작성자 
	WITH_BOARD_TITLE VARCHAR2(500 BYTE) NOT NULL ENABLE, --제목 
	WITH_BOARD_CONTENT VARCHAR2(4000 BYTE) NOT NULL ENABLE, -- 내용
	WITH_BOARD_COUPON VARCHAR2(100 BYTE), --쿠폰함
	WITH_BOARD_APPLY_NO NUMBER, --모집인원 
	WITH_BOARD_READCOUNT NUMBER, --게시글조회수 
	WITH_BOARD_DATE DATE DEFAULT sysdate  --날시날짜 
	);
	
--WITH_SUB 게시판
create table ST_WITH_BOARD_SUB (	
	WITH_BOARD_NO NUMBER references ST_WITH_BOARD(WITH_BOARD_NO) on delete cascade, --게시글번호 
	WITH_BOARD_NOW_ID VARCHAR2(500 BYTE) NOT NULL ENABLE, --현재 참여자ID
	WITH_BOARD_NOW_NO NUMBER, --현재참여인원
	WITH_BOARD_DATE DATE DEFAULT sysdate --날시날짜 
	); --외래키

--TRIGGER
--INSERT문 실행시 sub에 insert

CREATE OR REPLACE TRIGGER TRG_WITH_BOARD_SUB
AFTER INSERT
ON ST_WITH_BOARD
FOR EACH ROW
BEGIN
   INSERT INTO ST_WITH_BOARD_SUB
   VALUES(:NEW.WITH_BOARD_NO, :NEW.WITH_BOARD_WRITER, 1, SYSDATE);
END;
/
commit;




INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'admin',
		  '목동 CGV / 그날바다 / 12:00 '  , ' 즐거운 시간 보내요' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);

INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'heize',
		  '영등포 메가박스 / 곤지암 / 19:00 '  , ' 오늘은 오랜만에 네 생각을 하는 날이야
            일부러 난 너와 내가 담겨 있는 노랠 찾아
            오늘은 슬프거나 우울해도 괜찮은 맘이야
            어차피 이 밤이 다 지나가면은 별 수도 없이
            난 또 한 동안은 널 잊고 살테니까
            내 가슴 속에만 품고 살아갈테니까' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);

INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'god',
		  '충무로 롯데시네마 / 머니백 / 19:00 '  , ' 어려서 부터 우리 
            집은 가난했었고 
            남들 다하는 외식 
            몇 번 한 적이 없었고
            일터에 나가신 
            어머니 집에 없으면
            언제나 혼자서 
            끓여 먹었던 라면 
            그러다 라면이 
            너무 지겨워서 
            맛있는 것 좀 
            먹자고 대들었었어' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'mamamoo',
		  '광명 CGV / 덕구 / 20:00 '  , ' 점점 분위기에 취하고
            눈빛은 서로를 비추고
            흐르는 침묵도 끈적해
            터질 것만 같은 우리 사이' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);          

INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'exid',
		  '여의도 메가박스 / 캡틴아메리카 / 10:00 '  , ' 위 아래 위 위 아래 위 아래 위 위 아래
            위 아래 위 위 아래 UP~
            위 아래 위 위 아래 위 아래 위 위 아래
            위 아래 위 위 아래 DOWN~' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);  
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'hot',
		  '강변 CGV / 행복 / 02:00 '  , ' 약속된 시간이 왔어요 그대 앞에 있어요 
            두려움에 울고 있지만 눈물을 닦아 주었어요' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE); 
          
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'buzz',
		  '이태원 무비창고 / 남자를 몰라 / 15:10 '  , ' 미안합니다 고작 나란 사람이 당신을 미친 듯 사랑합니다 ' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE); 
          
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'beast',
		  '수원 CGV / 비가 오는 날엔 / 22:00 '  , ' 비가 오는 날에 나를 찾아와 밤을 새워 괴롭히다 
          비가 그쳐가면 너도 따라서 서서히 조금씩 그쳐가겠지' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'rain',
		  '한남 CGV / 태양을 피하는 방법 / 11:00 '  , ' 울고 있는 나의 모습 바보 같은 나의 모습 
            환하게 비추는 태양이 싫어 태양이 싫어 ' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'psy',
		  '당산 메가박스 / 강남스타일 / 14:00 '  , ' 낮에는 따사로운 인간적인 여자 
            커피 한잔의 여유를 아는 품격 있는 여자 
            밤이 오면 심장이 뜨거워지는 여자 
            그런 반전 있는 여자  ' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'steve',
		  '신도림CGV / 지금 만나러 갑니다 / 16:00 '  , ' 하루 종일 심심해서 이렇게 올립니다. 가볍게 영화보고 저녁도 같이 드실 분 같이 봐요~   ' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          
INSERT INTO member values('heize', '123', '헤이즈', 'HEIZE', 'google.com', '01012345678');
INSERT INTO member values('god', '123', '쥐오디', 'GOD', 'google.com', '01012341234');
INSERT INTO member values('mamamoo', '123', '마마무', 'MAMAMOO', 'google.com', '01012341234');
INSERT INTO member values('exid', '123', '이엑스아이디', 'EXID', 'google.com', '01012341234');
INSERT INTO member values('hot', '123', '에쵸티', 'HOT', 'google.com', '01012341234');
INSERT INTO member values('buzz', '123', '버즈', 'BUZZ', 'google.com', '01012341234');
INSERT INTO member values('beast', '123', '비스트', 'BEAST', 'google.com', '01012341234');
INSERT INTO member values('rain', '123', '비', 'RAIN', 'google.com', '01012341234');
INSERT INTO member values('psy', '123', '싸이', 'PSY', 'google.com', '01012341234');
          
          
commit;