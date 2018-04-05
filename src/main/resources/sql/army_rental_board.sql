create table rental_movie_board(
rental_board_title VARCHAR2(60),
rental_board_date date,
rental_board_content varchar2(500),
rental_board_no number PRIMARY KEY,
rental_board_point varchar2(30),
MB_ID VARCHAR2(30) CONSTRAINT rental_board_writer references MEMBER(MB_ID)
)


create table rental_movie_board_reply(
RENTAL_BOARD_REPLY_CONTENT VARCHAR2(60),
RENTAL_BOARD_REPLY_NO NUMBER PRIMARY KEY,
RENTAL_BOARD_RE_NO NUMBER CONSTRAINT RENTAL_BOARD_REPLY_RNO references rental_movie_board(rental_board_no) on delete cascade,
MB_ID VARCHAR2(30) CONSTRAINT RENTAL_BOARD_REPLY_WRITER references MEMBER(MB_ID),
RENTAL_BOARD_REPLY_DATE DATE
)


CREATE SEQUENCE rental_movie_replyboard_sq
START WITH 0 
INCREMENT BY 1 
MAXVALUE 100000
MINVALUE 0;

CREATE SEQUENCE rental_movie_board_sq
START WITH 0 
INCREMENT BY 1 
MAXVALUE 100000
MINVALUE 0;