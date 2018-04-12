drop table theater_pay;

create table theater_pay(
theater_pay_postion varchar2(300),
theater_pay_date varchar2(100),
theater_pay_time varchar2(100),
theater_pay_price number,
mb_id references MEMBER(MB_ID),
theater_pay_case varchar2(50),
theater_pay_number number,
primary key(theater_pay_number)
);

drop SEQUENCE rental_payment_sq;
CREATE SEQUENCE rental_payment_sq
START WITH 1 
INCREMENT BY 1 
MAXVALUE 100000
MINVALUE 0;