DROP TABLE NOTICE_BOARD;
DROP SEQUENCE NOTICE_BOARD_SEQ;

CREATE TABLE NOTICE_BOARD
   (	MB_ID VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	NOTICE_BOARD_TITLE VARCHAR2(200 BYTE), 
	NOTICE_BOARD_CONTENT VARCHAR2(500 BYTE), 
	NOTICE_BOARD_DATE DATE, 
	NOTICE_BOARD_NOTICE_BOARD_ORIGINFILENAME VARCHAR2(200 BYTE), 
	NOTICE_BOARD_READCNT NUMBER, 
	NOTICE_BOARD_NO NUMBER, 
	NOTICE_BOARD_RENAMEFILENAME VARCHAR2(200 BYTE),
	 CONSTRAINT NOTICE_BOARD_FK1 FOREIGN KEY (MB_ID)
	  REFERENCES MEMBER (MB_ID) ENABLE
   )
   
   CREATE SEQUENCE  NOTICE_BOARD_SEQ  
   MINVALUE 1 
   MAXVALUE 99999999999 
   INCREMENT BY 1 
   START WITH 21 
   CACHE 20 NOORDER  
   NOCYCLE ;
   
   insert into NOTICE_BOARD VALUES('worua99','공지사항!! 무비에로 페이지 오픈','무비에로 페이지가 오픈하였습니다.',sysdate,
   									null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('worua99','공지사항!! 새로운 영화 등록','새로운 영화등록 했어요',sysdate,
   									null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('worua99','세번째 게시 공지사항','세번째 게시 공지사항 본문',sysdate,
   									null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('worua99','네번잰데 공지사항이...','네번째 공지사항 가져가세요',sysdate,
   									null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('worua99','베고파요','무비에로 페이지가 오픈하였습니다.',sysdate,
   									null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('worua99','화이팅 합시다!!','무비에로 페이지가 오픈하였습니다.',sysdate,
   									null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);
   insert into NOTICE_BOARD VALUES('worua99','긴급공지!! 무비에로사이트 서비스 종료','무비에로 사이트의 서비스가 종료되었습니다.',sysdate,
   									null,0,NOTICE_BOARD_SEQ.NEXTVAL,null);