drop table rental_movie_board_reply;
drop table rental_movie_board;
drop SEQUENCE rental_movie_replyboard_sq;
drop SEQUENCE rental_movie_board_sq;

create table rental_movie_board(
rental_board_title VARCHAR2(500),
rental_board_date date,
rental_board_content varchar2(500),
rental_board_no number PRIMARY KEY,
rental_board_point varchar2(500),
MB_ID VARCHAR2(30) references MEMBER(MB_ID)
);

create table rental_movie_board_reply(
RENTAL_BOARD_REPLY_CONTENT VARCHAR2(500),
RENTAL_BOARD_REPLY_NO NUMBER PRIMARY KEY,
RENTAL_BOARD_RE_NO NUMBER CONSTRAINT RENTAL_BOARD_REPLY_RNO references rental_movie_board(rental_board_no) on delete cascade,
MB_ID VARCHAR2(30) references MEMBER(MB_ID),
RENTAL_BOARD_REPLY_DATE DATE
);

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

Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('상영관 내 다른 음식물의 반입이 되나요?',to_date('18/04/14','RR/MM/DD'),'<p>상영관 내 다른 음식물의 반입이 되나요?</p>
',20,'SJ 김포 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('예매내역을 뽑아가야하나요?',to_date('18/04/14','RR/MM/DD'),'<p>예매내역을 뽑아가야하나요?</p>
',40,'전체','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('예매 취소는 어덯게 하나요?',to_date('18/04/14','RR/MM/DD'),'<p>예매 취소는 어덯게 하나요?</p>
',41,'KTK 중랑 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('음식물 반입가능한가요?',to_date('18/04/14','RR/MM/DD'),'<p>반입해두될가요</p>
',42,'KST 목동 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('가격에 수수료가 포함인가요?',to_date('18/04/14','RR/MM/DD'),'<p>포함되나여?</p>
',43,'KJM 의왕 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('영화관 대여시 영화상영이 가능할까요?',to_date('18/04/14','RR/MM/DD'),'<p>영화상영이 가능하나요?</p>
',44,'KJK 수원 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('영화관 좌석은 몇좌석인가요?',to_date('18/04/14','RR/MM/DD'),'<p>영화관 몇좌석이에요?</p>
',45,'SJ 김포 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('영화관 빔프로젝트가 설치되어있나요?',to_date('18/04/14','RR/MM/DD'),'<p>설치되어있나요?</p>
',46,'KJK 수원 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('시간대는 정해진건가요?',to_date('18/04/14','RR/MM/DD'),'<p>다른시간대는 ㄴ못하나요</p>
',47,'KST 목동 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('영화관내에 다른장비를 설치해도되나여',to_date('18/04/14','RR/MM/DD'),'<p>마이크같은걸 가지고 와두되나여</p>
',48,'KJM 의왕 영화관','ktk');
Insert into ARMY.RENTAL_MOVIE_BOARD (RENTAL_BOARD_TITLE,RENTAL_BOARD_DATE,RENTAL_BOARD_CONTENT,RENTAL_BOARD_NO,RENTAL_BOARD_POINT,MB_ID) values ('음식물 반입은 가능한가요?',to_date('18/04/14','RR/MM/DD'),'<p>가능한가요?</p>
',49,'KTK 중랑 영화관','ktk');

Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('상영관 내 대부분의 음식물 반입은 가능합니다. 단, 강한 냄새로 인해 영화 관람 시 다른 고객님에게 방해가 되는 품목에 한해서 (예 : 족발, 순대 등) 취식 후 입장해 주실 것을 고객님께 양해(권고) 드리고 있습니다',0,20,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('비회원 예매 시 남긴 휴대폰 번호로 전송된 예매번호를 기준으로 무인발권기 및 현장 매표소에서 티켓 출력이 가능합니다.',1,40,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('마이페이지 내에서 결제취소 버튼을 클릭하시면 됩니다.',2,41,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('내용 : 상영관 내 대부분의 음식물 반입은 가능합니다. 단, 강한 냄새로 인해 영화 관람 시 다른 고객님에게 방해가 되는 품목에 한해서 (예 : 족발, 순대 등) 취식 후 입장해 주실 것을 고객님께 양해(권고) 드리고 있습니다',3,42,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('결제가격에는 예매 수수료 및 세금이 포함된 가격입니다.',4,43,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('영화관 상영시 영화 상영은 별도의 금액이 부가됩니다.',5,44,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('영화관 정보보기를 클릭시 영화관내 좌석 수 와 정보를 보실 수 있습니다.',6,45,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('영화간 내 빔 프로젝트는 설치되어있으며 사용이 가능합니다.',7,46,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('네 영화관 대여는 정해진 일정 시간대에만 대여가 가능하십니다.',8,47,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('마이크와 같은 장비를 설치 할 경우 직원분이 감독하에 사용이 가능하십니다.',9,48,'ktk',to_date('18/04/14','RR/MM/DD'));
Insert into ARMY.RENTAL_MOVIE_BOARD_REPLY (RENTAL_BOARD_REPLY_CONTENT,RENTAL_BOARD_REPLY_NO,RENTAL_BOARD_RE_NO,MB_ID,RENTAL_BOARD_REPLY_DATE) values ('내용 : 상영관 내 대부분의 음식물 반입은 가능합니다. 단, 강한 냄새로 인해 영화 관람 시 다른 고객님에게 방해가 되는 품목에 한해서 (예 : 족발, 순대 등) 취식 후 입장해 주실 것을 고객님께 양해(권고) 드리고 있습니다',10,49,'ktk',to_date('18/04/14','RR/MM/DD'));