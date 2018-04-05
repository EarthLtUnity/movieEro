<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ID" value="${sessionScope.memberID}"/>

<div id="order">
	<div class="container">
		<div class="row order-content">
			<div class="col-sm-8 col-xs-12 seat_content ph0">
				<h2>order a ticket</h2>
				<div class="entry-order-content">
					<form class="msform" id="msform" name="msform" action="reserve.do">
					<input type="hidden" name="userID" id="userID" value="${ID}"/>
						<!-- action에 컨트롤러 태워서 db에 데이터 넣기 -->
						<!-- fieldsets -->
						<fieldset>
							<div class="wpc-content">
								<h3>location</h3>
								<select name="cinema_location" id="cinema_location">
									<!-- 데이터 베이스에서 영화관 리스트만 뽑아와서 forEach로 뿌려주기 -->
									<option>cgv 강남</option>
									<option>megabox 강남</option>
									<option>lotte cinema 신사역</option>
									<option>cgv 수원역</option>
								</select>
								<h3 class="mt3">Movie</h3>
								<select name="kindOfMovie" id="kindOfMovie">
									<!-- 영화관 정보에 따라서 데이터베이스에서 영화목록만 받아와서 forEach로 뿌려주기 -->
									<option>Dead pool</option>
									<option>THE BATTLE OF ALGIERS (DI ALGERI)</option>
									<option>LORD OF THE RINGS: THE RETURN OF THE KINGS</option>
									<option>어벤져스</option>
								</select>
								<h3 class="mt3">Date</h3>
								<input type='date' class="datetime" />
								<h3 class="mt3">TIME</h3>
								<ul class="order-date">
								<!-- 이부분에 forEach문 써서 데이터베이스에서 영화관, 영화 제목으로 영화 시간대 데이터를 뽑아와서 button태그 추가할것 -->
									<li><button type="button" class="btn_time" name="Time" value="t1">
											11:50
										</button></li>
									<li><button type="button" class="btn_time" name="Time" value="t2">
											13:40
										</button></li>
									<li><button type="button" class="btn_time" name="Time" value="t3">
											16:35
										</button></li>
								</ul>
							</div>
							<input type="button" name="next" class="next action-button" value="Next" />
						</fieldset>
						<fieldset class="seat-content">
							<div class="wpc-content">
								<h3 class="seat_title">SCREEN</h3>
								<div id="seat-map"></div>
								<div id="legend"></div>
							</div>
							<input type="button" name="previous" class="action-button previous" value="Previous" />
							<input type="button" name="payment" id="payment" class="payment action-button" value="payment" />
						</fieldset>

						<input type="hidden" name="seatNum" id="seatNum" value="4_9">
					</form>
				</div>
			</div>
			<div class="col-sm-4 col-xs-12 order_sidebar ph0">
				<h2>Your Information</h2>
				<div class="order-details">
					<span> Location:</span>
					<p id="locationp">Tenguu Cinema Tysons corner</p>
					<span>Time:</span>
					<p>2016.3.8 18:30</p>
					<span>Seat: </span>
					<ul id="selected-seats"></ul>
					<div>
						Tickets: <span id="counter">0</span>
					</div>
					<div>
						Total: <b><span id="total">0</span></b> 
					</div>
					<a href="#" class="close-window"><i class="fa fa-times"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>




<script>

	$(document).ready(function(){

		
		function aaa() {
			var seatNum = 0;
			$('.seatCharts-seat').click(function(){
				if($(this).hasClass('selected')){
					seatNum =$(this).attr("id");
					$('#seatNum').val(seatNum);
				}
			})			
			
		}
		aaa();
		
		
		$(".btn_time").on('click',function(){
			return false;
		});
		
		/* $(".next").click(function(event){
			
			
			
		});
		 */
		 var IMP = window.IMP; 
		 IMP.init("imp68666223");
		 $(".payment").on('click',function(){
			 alert($('#userID').val());
			 IMP.request_pay({
				    pg : 'inicis',
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '주문명:결제테스트',
				    amount : 1000,
				    buyer_email : 'worua99@nate.com',
				    buyer_name : '김재겸',
				    buyer_tel : '010-2030-1266',
				    buyer_addr : '서울특별시 강남구 삼성동',
				    buyer_postcode : '123-456'
				}, function(rsp) {
				    if ( rsp.success ) {
				    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
				    	jQuery.ajax({
				    		url: "reserve.do", // 가맹점 서버
				            method: "GET",
				            headers: { "Content-Type": "application/json" },
				            data: {
				            	userID : $('.userID').val(),
				            	cinema_location : $('.ciname_lication').val(),
				            	kindOfMovie : $('.kindOfMovie').val(),
				            	seatNum : $('.seatNum').val(),
				            	Time : $('#Time').val()
				            },
				            success : function(result){
				            	location.href="";//반환값 지정해서 페이지 리로딩
				            }
				    	}).done(function(data) {
				    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
				    		if ( everythings_fine ) {
				    			var msg = '결제가 완료되었습니다.';
						        msg += '아이디 : ' + $('.userID').val();
						        msg += '영화관 : ' + $('.ciname_lication').val();
						        msg += '영화제목 : ' + $('.kindOfMovie').val();
						        msg += '좌석 : ' + $('.seatNum').val();

				    			alert(msg);
				    			
				       
				        	} else {
				    			//[3] 아직 제대로 결제가 되지 않았습니다.
				    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
				    		}
				    	});
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;

				        alert(msg);
				    }
				});
		 });
		 
			    		
		location.href="#";
	});
</script>