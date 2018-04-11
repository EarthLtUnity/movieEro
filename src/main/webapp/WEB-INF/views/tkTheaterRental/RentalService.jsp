<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<c:set var="member" value="${sessionScope.memberID}" />
<c:set var="theaterImage" value="${requestScope.theaterImage}"></c:set>
<style>
#rentalreserve{display:none;}
.tim[disabled]{
	background: lightgray;
}
</style>

<script>
/////////////////////////정보보기///////////////////
function popupOpen(bnum){
	var popUrl = "RentalServiceView.do?bnum="+bnum;	
	var popOption = "width=700, height=500, resizable=no, scrollbars=no, status=no;"; 
	var title  = "testpop";
		window.open(popUrl,'',popOption);
		  }
		  
/////////////////////////////////결제///////////////////////		  

//////////////////////////////////////////////결제창화면에뿌려주기
function seletetime(time) {
	$("#datatime").text(time);
}
function selectpoint(point) {
$("#pointname").text(point);
}
/////////////////////////////////결제창 이미 결제된거 버튼 비활성화 
function seletedata(date) {
$("#datavalue").text(date);
  
	var tkposition = $("#rental_loaction option:selected").val();
    $.ajax({
           url : 'tpaymentselet.do',
           type : 'post',
       	   data : {theater_pay_postion : tkposition ,
        			theater_pay_date : date},
      	   success : function(list){
      		 console.log(list);
      		  var str = JSON.stringify(list);
      		  var newList = JSON.parse(str);
      		   if(newList.length != 0){
      			for(var i = 0 ; i < newList.length; i++){
      				 var time = newList[i]['theater_pay_time'];
      				 console.log(time);
            		$('.tim').each(function(index){
            			console.log(time+" = "+ $(this).val() + " : "+ index);
            			console.log(time == $(this).val());
            			if(time == $(this).val()) $(this).attr('disabled','disabled');
            		});
      			}
      		   } else {
      			 $('.tim').each(function(index){
         			$(this).removeAttr('disabled');
         		});
      		   }
      		   
        		}
    }); 
}

        	
</script>
<section class="section-content">
	<div class="section-content pvb0 bg-cover" data-bg-image="images/coming-bg.jpg">
		<div class="row"></div>
	</div>
	<div class="fullscreen-section bg-black pvb0">
		<div class="container wpc-boxoffice pv8">
			<div class="row">
				<div class="col-sm-12 col-xs-12" style= "padding-top: 150px;" >
                	<h3 class="heading text-center">영화관 대여서비스</h3>
		                <div class="ticket-carousel pvt85">
        		            <div class="swiper-container carousel-container movie-images" data-col="3" style="width: 900px;">
                		        <div class="swiper-wrapper">
                        	    <c:set var="theater" value="${requestScope.theater}"></c:set>
								<c:forEach var="theaterlist" items="${theater}">
                                	<div class="swiper-slide">
                                   	 	<div class="movie-image" data-bg-image="http://localhost:8088/adminMovieEro/resources/images/theater/${theaterlist.RENTAL_SERVICE_IMAGE}">
                                        	<div class="entry-hover">
                                            	<div class="entry-actions">
                                        	    	<form name="theaterview">
                                            			<input type="hidden" name ="test1" value="${theaterlist.RENTAL_SERVICE_NO}"/>
                                            		</form>
                                            		<input type='button' onclick='popupOpen(${theaterlist.RENTAL_SERVICE_NO})' value='정보 보기'/>
                                                	<a href="#rentalreserve" class="btn_rental order_btn">영화관예매하기</a>
                                               </div>
                                           </div>
                                       </div>
                                   </div>
                               </c:forEach>
                          	   </div>
                    			<div class="swiper-button-prev"></div>
                    			<div class="swiper-button-next"></div>
                   			</div>
                   		</div>
                </div>
            </div>
        </div>
    </div>  
  <div class="section-content service pvb0">
  </div>        
    <div class="fullscreen-section bg-black pvb0">
        <div class="container wpc-boxoffice pv8">
            <div class="row">
                <div class="swiper-pagination"></div>
            </div>
        </div>
   </div>
        <!-- 예매 영역 -->
   <div id="rentalreserve">
      <div class="container" style="background-color: #f5f5f5; padding-top: 80px;padding-right: 90px; padding-bottom: 80px;padding-left: 90px;">
		  <div style="text-align: right;"><a href="#" class="close-window" ><i class="fa fa-times"></i></a></div>
			  <div class="row order-content">
				  <div class="col-sm-8 col-xs-12 seat_content ph0">
						<h2>영화관 대여 결제 시스템</h2><br>
							<div class="entry-theater-content">
								<form class="msform" id="mrform" name="mrform" action="paymentinsert.do">
								<input type="hidden" name="userID" id="rentalid" value="${ID}"/>
								<!-- action에 컨트롤러 태워서 db에 데이터 넣기 -->
									<fieldset>
										<div class="wpc-content">
											<h3>영화관 선택:</h3><br>
												<select name="cinema_location" id="rental_loaction" onchange="selectpoint(this.value)" style="height: 40px;">
												<!-- 데이터 베이스에서 영화관 리스트만 뽑아와서 forEach로 뿌려주기 -->
												<c:forEach var="theaterlist" items="${theater}">
												<option>${theaterlist.RENTAL_SERVICE_TITLE}</option>
												</c:forEach>
												</select>
											<h3 class="mt3">날짜선택:</h3><br>
											<input type='date' onchange="seletedata(this.value)"/>
											<h3 class="mt3">시간선택:</h3><br>
												<ul class="order-date">
											<!-- 이부분에 forEach문 써서 데이터베이스에서 영화관, 영화 제목으로 영화 시간대 데이터를 뽑아와서 button태그 추가할것 -->
													<li><button type="button" style="color:black;" class="btn_time tim" name="Time" onclick="seletetime(this.value)" value="09:00~11:00">09:00~11:00</button></li>
													<li><button type="button" style="color:black;" class="btn_time tim" name="Time" onclick="seletetime(this.value)" value="11:30~13:30">11:30~13:30</button></li>
													<li><button type="button" style="color:black;" class="btn_time tim" name="Time" onclick="seletetime(this.value)" value="14:00~16:00">14:00~16:00</button></li>
												</ul>
										</div>
									</fieldset>
								<input type="hidden" name="rentalnum" id="rentalnum" value="">
								</form>
							</div>
					</div>
							<div class="col-sm-4 col-xs-12 order_sidebar ph0">
									<h2>결제정보</h2><br>
									<div class="order-details">
										<span>영화관:</span>
									<div id= "pointname"></div>
										<span>날짜:</span>
									<div id="datavalue"></div>
										<span>시간선택:</span>
									<div id="datatime"></div>
										<span>가격:</span>
									<div hidden="">${member}</div><br>
								<input type="button" name="rentalpayment" id="rentalpayment" style = "color:black" class="rentalpayment action-button" value="결제하기" />
									</div>
							</div>
			</div>
		</div>
	</div>
</section>
<script>
	$('.btn_rental').click(function() {
	$('#rentalreserve').show();		
	});


	$(document).ready(function(){
 	function theaterRental() {
		 var seatNum = 0;
		$('.seatCharts-seat').click(function(){
			if($(this).hasClass('selected')){
				seatNum =$(this).attr("id");
				$('#seatNum').val(seatNum);
			}
		})			
	} 
	 theaterRental();
	
	 
	 $(".btn_time").on('click',function(){
		return false;
	}); 
	 
	 
	/* $(".next").click(function(event){
	}); */

	 var IMP = window.IMP; 
	 IMP.init("imp64071802");
	 $(".rentalpayment").on('click',function(){
		 alert("결제시스템");
		 alert($('#pointname').val());
		 IMP.request_pay({
			    pg : 'inicis',
			    pay_method : 'card',
			    merchant_uid : 'sdf',
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
			    		url: "paymentinsert.do", // 가맹점 서버
			            method: "post",
			            /* headers: { "Content-Type": "application/json" }, */
			            data: {
			            	theater_pay_postion : $('#pointname').val(),
			            	theater_pay_date : $('#datavalue').val(),
			            	theater_pay_time : $('#datatime').val(),
			            	theater_pay_price : $('.seatNum').val(),
			            	mb_id : $(member).val(),
			            	theater_pay_case: "true" 
			            },
			            success : function(result){
			            	location.href="myrentalinfo.do";//반환값 지정해서 페이지 리로딩
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
	
<jsp:include page="../inc/footer.jsp" flush="false" />
