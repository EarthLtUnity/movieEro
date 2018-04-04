<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ID" value="${sessionScope.memberID}"/>

<div id="order">
	<div class="container">
		<div class="row order-content">
			<div class="col-sm-8 col-xs-12 seat_content ph0">
				<h2>order a ticket</h2>
				<div class="entry-order-content">
					<form id="msform" name="msform" action="">\
					<input type="hidden" name="userID" id="userID" value="${ID}"/>
						<!-- action에 컨트롤러 태워서 db에 데이터 넣기 -->
						<!-- fieldsets -->
						<fieldset>
							<div class="wpc-content">
								<h3>location</h3>
								<select name="location">
									<option>cgv 강남</option>
									<option>megabox 강남</option>
									<option>lotte cinema 신사역</option>
									<option>cgv 수원역</option>
								</select>
								<h3 class="mt3">Movie</h3>
								<select>
									<option>Dead pool</option>
									<option>THE BATTLE OF ALGIERS (DI ALGERI)</option>
									<option>LORD OF THE RINGS: THE RETURN OF THE KINGS</option>
									<option>어벤져스</option>
								</select>
								<h3 class="mt3">Date</h3>
								<input type='date' class="datetime" />
								<h3 class="mt3">TIME</h3>
								<ul class="order-date">
									<li><button name="" value="">
											<i>11:50</i>
										</button></li>
									<li><button name="" value="">
											<i>13:40</i>
										</button></li>
									<li><button name="" value="">
											<i>16:35</i>
										</button></li>
									<li><button name="" value="">
											<i>17:30</i>
										</button></li>
									<li><button name="" value="">
											<i>19:50</i>
										</button></li>
									<li><button name="" value="">
											<i>21:10</i>
										</button></li>
								</ul>
							</div>
							<input type="button" name="next" class="next action-button"
								value="Next" />
						</fieldset>
						<fieldset class="seat-content">
							<div class="wpc-content">
								<h3 class="seat_title">seat</h3>
								<div id="seat-map"></div>
								<div id="legend"></div>
							</div>
							<input type="button" name="previous"
								class="action-button previous" value="Previous" /> <input
								type="button" name="submit" class="payment action-button"
								value="Submit" />
						</fieldset>

						<input type="hidden" name="seatNum" id="seatNum" value="">
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
						Total: <b>$<span id="total">0</#iv> 
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
		
		$(".payment").click(function(event){
			
		var IMP = window.IMP;
		IMP.init('imp68666223');
		
			IMP.request_pay({
			    pg : 'html5_inicis',//필수
			    pay_method : 'card',//필수
			    merchant_uid : 'merchant_' + new Date().getTime(),//필수
			    name : '주문명:결제테스트',//필수
			    amount : 1000,//필수
			    buyer_email : 'worua99@nate.com',//필수
			    buyer_name : $('.userID').val(),//선택 id
			    buyer_tel : '010-2030-1266',//필수
			    buyer_addr : '경기도 화성시 병점동',//선택
			    buyer_postcode : '123-456'//선택
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        $("#msform").submit();
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
	
			    alert(msg);
			});
		});
		location.this;
	});
	
</script>