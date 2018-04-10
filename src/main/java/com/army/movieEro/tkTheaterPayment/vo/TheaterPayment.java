package com.army.movieEro.tkTheaterPayment.vo;

public class TheaterPayment {
		String	theater_pay_postion ; //지역
		String	theater_pay_date ; //날짜
		String	theater_pay_time ; //시간
		int	theater_pay_price ; //가격
		String	mb_id ; //결제자
		String theater_pay_case; //결제여부
		
		public String getTheater_pay_case() {
			return theater_pay_case;
		}
		public void setTheater_pay_case(String theater_pay_case) {
			this.theater_pay_case = theater_pay_case;
		}
		public String getTheater_pay_postion() {
			return theater_pay_postion;
		}
		public void setTheater_pay_postion(String theater_pay_postion) {
			this.theater_pay_postion = theater_pay_postion;
		}
		public String getTheater_pay_date() {
			return theater_pay_date;
		}
		public void setTheater_pay_date(String theater_pay_date) {
			this.theater_pay_date = theater_pay_date;
		}
		public String getTheater_pay_time() {
			return theater_pay_time;
		}
		public void setTheater_pay_time(String theater_pay_time) {
			this.theater_pay_time = theater_pay_time;
		}
		public int getTheater_pay_price() {
			return theater_pay_price;
		}
		public void setTheater_pay_price(int theater_pay_price) {
			this.theater_pay_price = theater_pay_price;
		}
		public String getMb_id() {
			return mb_id;
		}
		public void setMb_id(String mb_id) {
			this.mb_id = mb_id;
		}
		
}
