drop talbe theater_pay;

create table theater_pay(
theater_pay_postion varchar2(300),
theater_pay_date varchar2(100),
theater_pay_time varchar2(100),
theater_pay_price number,
mb_id references MEMBER(MB_ID),
theater_pay_case varchar2(50),
primary key(theater_pay_postion ,theater_pay_date ,theater_pay_time )
);