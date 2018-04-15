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
		  '목동 CGV / 그날바다 / 12:00 '  , 
		  ' 오늘 같이 외로운날 가까운 사람들끼리 
			영화도 보고 끝나고 같이 저녁도 먹으면서 즐겁게 대화 나눠요~
			' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);

INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'heize',
		  '영등포 메가박스 / 곤지암 / 19:00 '  ,
		  ' 비도 오고 그래서 
			네 생각이 났어
			생각이 나서 그래서 
			그랬던거지
			별 의미 없지
			그러니까 영화나 보자 ' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);

INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'god',
		  '충무로 롯데시네마 / 머니백 / 19:00 '  , 
		  ' 어려서 부터 우리 
            집은 가난했었고 
            남들 다하는 외식 
            몇 번 한 적이 없었고
            일터에 나가신 
            어머니 집에 없으면
		영화나 보자!
            ' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'mamamoo',
		  '광명 CGV / 덕구 / 20:00 '  , 
		 ' 점점 분위기에 취하고
            눈빛은 서로를 비추고
            흐르는 침묵도 끈적해
            터질 것만 같은 우리 사이
		영화나 보자 !' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);          

INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'exid',
		  '여의도 메가박스 / 캡틴아메리카 / 10:00 '  , 
		 ' 위 아래 위 위 아래 위 아래 위 위 아래
            위 아래 위 위 아래
		영화나 보자!' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);  
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'hot',
		  '강변 CGV / 행복 / 02:00 '  , 
		  ' 약속된 시간이 왔어요 그대 앞에 있어요 
            두려움에 울고 있지만 눈물을 닦아 주었어요
		그래서 영화나 보죠~' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE); 
          
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'buzz',
		  '이태원 무비창고 / 남자를 몰라 / 15:10 '  , 
		  ' 미안합니다 고작 나란 사람이 당신을 미친 듯 사랑합니다
			그래서 영화나 봅시다~ ' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE); 
          
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'beast',
		  '수원 CGV / 비가 오는 날엔 / 22:00 '  , 
		  ' 비가 오는 날에 나를 찾아와 밤을 새워 괴롭히다 영화나 보자고 하겠지' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'rain',
		  '한남 CGV / 태양을 피하는 방법 / 11:00 '  , 
		  ' 울고 있는 나의 모습 바보 같은 나의 모습 
            환하게 비추는 태양이 싫어 태양이 싫어 그러니까 영화나 보자' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          
INSERT INTO ST_WITH_BOARD VALUES 
		(ST_WITH_BOARD_SEQ.NEXTVAL, 'psy',
		  '당산 메가박스 / 강남스타일 / 14:00 '  , 
		  ' 낮에는 따사로운 인간적인 여자 
            커피 한잔의 여유를 아는 품격 있는 여자 
            밤이 오면 심장이 뜨거워지는 여자 
            그런 반전 있는 여자
		나랑 영화나 보자  ' ,
		  TO_CHAR(SYSDATE,'RR-MM-DD')||'-'|| 3 ||'-'||
		  LTRIM(TO_CHAR(ROUND(DBMS_RANDOM.VALUE(0, 999)),'000')),
		  3, 1, SYSDATE);
          

INSERT INTO member values('heize', '123', '헤이즈', 'HEIZE', 'google.com', '01075645678');
INSERT INTO member values('god', '123', '쥐오디', 'GOD', 'google.com', '01011541344');
INSERT INTO member values('mamamoo', '123', '마마무', 'MAMAMOO', 'google.com', '01099872347');
INSERT INTO member values('exid', '123', '이엑스아이디', 'EXID', 'google.com', '01051456300');
INSERT INTO member values('hot', '123', '에쵸티', 'HOT', 'google.com', '01099664448');
INSERT INTO member values('buzz', '123', '버즈', 'BUZZ', 'google.com', '01022478965');
INSERT INTO member values('beast', '123', '비스트', 'BEAST', 'google.com', '01033478854');
INSERT INTO member values('rain', '123', '비', 'RAIN', 'google.com', '01095422245');
INSERT INTO member values('psy', '123', '싸이', 'PSY', 'google.com', '010153554464');
          
          
commit;