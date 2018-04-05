
drop SEQUENCE rental_movie_sq
CREATE SEQUENCE rental_movie_sq
START WITH 1 
INCREMENT BY 1 
MAXVALUE 100000
MINVALUE 0;

drop table rental_movie 
create table rental_movie( 
rental_service_info VARCHAR2(500), 
rental_service_position varchar2(300),
rental_service_price varchar2(300), 
rental_service_title varchar2(100), 
rental_service_no number PRIMARY KEY
) 

drop table rental_movie_image
create table rental_movie_image(
	RENTAL_SERVICE_NO number references rental_movie(rental_service_no),
	RENTAL_SERVICE_IMAGE varchar2(200),
	RENTAL_SERVICE_OIMAGE varchar2(200)
	)
	
)