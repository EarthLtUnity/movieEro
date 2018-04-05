DROP TABLE MEMBER;
CREATE TABLE MEMBER(
	MB_ID          VARCHAR2(30),
	MB_PASSWD      VARCHAR2(30) NOT NULL,
	MB_NAME        VARCHAR2(30) NOT NULL,
	MB_MAIL        VARCHAR2(30) NOT NULL,
	MB_MAILDOMAIN  VARCHAR2(20) NOT NULL,
	MB_PHONE       VARCHAR2(15) NOT NULL,
	PRIMARY KEY(MB_ID)
);

INSERT INTO member values('admin', 'qwe123', '김종민', 'admin', 'google.com', '01012345678');
INSERT INTO member values('kjm', '123', '김종민', 'kjm', 'google.com', '01012341234');
INSERT INTO member values('sj', '123', '서진', 'sj', 'google.com', '01012341234');
INSERT INTO member values('kst', '123', '김승태', 'kst', 'google.com', '01012341234');
INSERT INTO member values('ktk', '123', '김태규', 'ktk', 'google.com', '01012341234');
INSERT INTO member values('kjg', '123', '김재겸', 'kjg', 'google.com', '01012341234');

UPDATE member SET mb_name='관리자' WHERE mb_id='admin';

SELECT * FROM MEMBER;