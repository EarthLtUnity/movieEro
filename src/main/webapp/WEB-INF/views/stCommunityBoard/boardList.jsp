<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-x.y.z.js"></script>

<c:set var="listCount" value="${requestScope.listCount}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="startPage" value="${requestScope.startPage}"/>
<c:set var="endPage" value="${requestScope.endPage}"/>
<c:set var="maxPage" value="${requestScope.maxPage}"/>
<c:set var="list" value="${requestScope.list}"/>
<c:set var="listsub" value="${requestScope.listsub}"/>
<c:set var="memberId" value="${sessionScope.memberID}"/>


<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<script>
$(document).ready(function(){

	//결제는 맨위에 설정
	 var IMP = window.IMP; 
	 IMP.init("imp68666223");
	
		//유효성
		$(".kst_join").on('click', function() {
			
			// 현재 로그인 ID
			var userId = '${memberId}';
			// 해당 게시판 참여 중인 ID
			var memberList = $(this).parent().parent().find('#mList').text();
			// 해당 게시판 모집인원(boardmain.WITH_BOARD_APPLY_NO) - 현재 참여중인 인원(boardsub.WITH_BOARD_NOW_NO)
			var mCount = $(this).parent().parent().find('.applyCount').val();
			var bno = $(this).parent().parent().find('.bno').val();
			
			// 1. 로그인 
			if(userId == "" || userId == null){
				alert('Sorry, Login Please ~');
				
			// 2. 해당 게시판에 쳠여 이력 	
			} else if(memberList.indexOf(userId) >= 0){
				alert("이미 가입한 회원입니다.");
				
			// 3. 모집인원이 다 찼는지 	
			} else if(mCount == 0){
				alert("이미 만석입니다.<br>다음 기회를 이용해 주세요."); 
				
			// 4. 로그인 ok, 게시판 참여한적 없고, 모집인원이 아직 남았다면 진행	
			} else{
				// 3. 모두 정상이라면 가입이 가능해야 한다.
					$.ajax({
			    		url: "withReserve.do", // 가맹점 서버
			            method: "GET",
			            data: {
			            	WITH_BOARD_NO : bno,
			            	WITH_BOARD_NOW_ID : memberList+", "+userId
			            },
			            success : function(result){
			            	var msg = '결제가 완료되었습니다.';
			    			alert(msg);
			            	location.href="withBoardList.do";//반환값 지정해서 페이지 리로딩
			            }
			    	});
					
				//결제창
				 /* IMP.request_pay({
					    pg : 'inicis',
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : $('#CINEMA_MOVIE').val(),
					    amount : 1000,
					    buyer_email : 'worua99@nate.com',
					    buyer_name : $('#MB_ID').val(),
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
					            	MB_ID : $('#MB_ID').val(),
					            	CINEMA_NAME : $('#CINEMA_NAME').val(),
					            	CINEMA_MOVIE : $('#CINEMA_MOVIE').val(),
					            	CINEMA_MOVIE_SEAT : $('#CINEMA_MOVIE_SEAT').val(),
					            	CINEMA_MOVIE_TIME : $('#CINEMA_MOVIE_TIME').val(),
					            	CINEMA_SECTION : "임시 상영관"
					            },
					            success : function(result){
					            	var msg = '결제가 완료되었습니다.';
							        msg += '아이디 : ' + $('#MB_ID').val();
							        msg += '영화관 : ' + $('#CINEMA_NAME').val();
							        msg += '영화제목 : ' + $('#CINEMA_MOVIE').val();
							        msg += '좌석 : ' + $('#CINEMA_MOVIE_SEAT').val();
							        msg += '시간 : ' + $('#CINEMA_MOVIE_TIME').val();
		
					    			alert(msg);
					            	location.href="";//반환값 지정해서 페이지 리로딩
					            }
					    	});
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
		
					        alert(msg);
					    }
				});*/
			} 
		});
		
		
		// 쿠폰 보여주는 modal창
	 	var modal = document.getElementById('myModal');
	 
		$(document).on('click','.getCoupon',function(){
			var coupon = $(this).parent().parent().find('.kstBoardCoupon').val();
			$(modal).find('.modal-body-coupon').html(coupon);
			 modal.style.display = "block"; 
		})
	 	$(document).on('click','.modal',function(){
	 		modal.style.display = "none";
		})
		/* $(document).on('click','.close',function(){
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}) */
		
		
		
		
	});
	
	
	
</script>

<section class="sub_common_sec block_board">
	<div class="bl_brd_wrap Seungtae_BoardList">
		<br> <b></b>
		<h1 id="news02">With Me</h1>
		<br>
		<section class="section-content ">

			<!-- BoardList 투명 창  -->
			<div class="fullscreen-section bg_pale pvb0">
				<div class="container wpc-boxoffice pv8">
					<div class="row">

						<div class="col-sm-7 col-xs-12">
							<a href="withBoardList.do" class="btn">리스트새로고침 ${memberId}</a>
							<h3></h3>
							<ul class="wpc-box-list">
								<c:forEach var="boardmain" items="${list}"> <!-- boardList for문 -->
									<c:forEach var="boardsub" items="${listsub}"> <!-- boardListsub for문 -->
									<c:if test="${boardmain.WITH_BOARD_NO == boardsub.WITH_BOARD_NO}">
										<li class="wpc-box-item">
											<ol class="cf">
												<li class="bx-item-c">${boardmain.WITH_BOARD_NO}</li> <!-- 게시글 번호 -->
												<li class="bx-item-title kst_target">
													<a href="#target"class="hello">${boardmain.WITH_BOARD_TITLE}</a> <!-- 게시글 제목 -->
													<div>
														<span id="mList">${boardsub.WITH_BOARD_NOW_ID}</span> <!-- 현재 참여중인 ID -->
													</div>
												</li>
												<li class="bx-item-d">
													
													<!-- 모집 인원이 차지 않았을 경우 버튼 활성화 -->
													<c:if test="${boardmain.WITH_BOARD_APPLY_NO - boardsub.WITH_BOARD_NOW_NO ne 0}">
														<a href="#" class="kst_join">join</a>
													</c:if>
													<!-- 모집인원이 다 찼을 경우 버튼 비활성화 -->
													<c:if test="${boardmain.WITH_BOARD_APPLY_NO - boardsub.WITH_BOARD_NOW_NO eq 0}">
														<a class="kst_end">End</a>
													</c:if>
													
												</li>
												<li class="bx-item-m">${boardmain.WITH_BOARD_DATE}</li> <!-- 게시글 날짜 -->
												<li class="bx-item-m">${boardsub.WITH_BOARD_NOW_NO}/${boardmain.WITH_BOARD_APPLY_NO}</li>  <!-- 현재참여자수 / 모집인원 -->
												
												<input type="hidden" class="applyCount" value="${boardmain.WITH_BOARD_APPLY_NO - boardsub.WITH_BOARD_NOW_NO}">
												<input type="hidden" class="bno" value="${boardmain.WITH_BOARD_NO}">
											</ol>
											<div class="steve_panel">
												<p class="kstBoardContent">${boardmain.WITH_BOARD_CONTENT}</p>    <!-- 게시글 내용 -->
												<div class="myCoupon">
												
													<!-- 모집인원이 다 찼을 경우 모달 창 띄우는 버튼 활성화 -->
													<c:if test="${boardmain.WITH_BOARD_APPLY_NO - boardsub.WITH_BOARD_NOW_NO eq 0}">
														<button id="getCoupon" class="getCoupon">Coupon</button>
													</c:if>
													
													<input type="hidden" class="kstBoardCoupon" value="${boardmain.WITH_BOARD_COUPON}">
													
												</div>
											</div>
										</li>
										</c:if>
									</c:forEach> <!-- boardList for문 end -->
								</c:forEach> <!-- boardListsub for문 end -->




								

								<!-- The Modal -->
								<div id="myModal" class="modal">
									<!-- Modal content -->
									<div class="modal-content">
										<div class="modal-header">
											<span class="close">&times;</span>
											<h2>즐거운 관람 되세요</h2>
										</div>
										<div class="modal-body">
											<p class="modal-body-coupon">Some text in the Modal Body</p>
											<p>Some other text...</p>
										</div>
									</div>
								</div>








								<!-- 스크롤에 따라 움직이게 감쌈 -->
								<div class="floating">

									<!-- 디테일 & 광고 -->
									<div class="wpc-testimonails">
										<div class="swiper-container carousel-container">
											<div class="swiper-wrapper">
												<div class="swiper-slide">
													<div class="testimonial">
														<div class="entry-meta">
															<h4>Shela Mathews</h4>
														</div>
														<p>Enthusiastically monetize plug-and-play scenarios
															through quality manufactured products. Monotonectally
															streamline standardized portals after proactive
															innovation. Energistically promote market positioning.</p>
													</div>
												</div>
												<div class="swiper-slide">
													<div class="testimonial">
														<div class="entry-meta">
															<h4>Shela Mathews</h4>
														</div>
														<p>Enthusiastically monetize plug-and-play scenarios
															through quality manufactured products. Monotonectally
															streamline standardized portals after proactive
															innovation. Energistically promote market positioning.</p>
													</div>
												</div>
												<div class="swiper-slide">
													<div class="testimonial">
														<div class="entry-meta">
															<h4>Shela Mathews</h4>
														</div>
														<p>Enthusiastically monetize plug-and-play scenarios
															through quality manufactured products. Monotonectally
															streamline standardized portals after proactive
															innovation. Energistically promote market positioning.</p>
													</div>
												</div>
												<div class="swiper-slide">
													<div class="testimonial">
														<div class="entry-meta">
															<h4>Shela Mathews</h4>
														</div>
														<p>Enthusiastically monetize plug-and-play scenarios
															through quality manufactured products. Monotonectally
															streamline standardized portals after proactive
															innovation. Energistically promote market positioning.</p>
													</div>
												</div>
												<div class="swiper-slide">
													<div class="testimonial">
														<div class="entry-meta">
															<h4>Shela Mathews</h4>
														</div>
														<p>Enthusiastically monetize plug-and-play scenarios
															through quality manufactured products. Monotonectally
															streamline standardized portals after proactive
															innovation. Energistically promote market positioning.</p>
													</div>
												</div>
											</div>
											<div class="swiper-pagination"></div>
										</div>
									</div>
								</div>
								<!-- 스크롤 마침 -->
						</div>
						<!-- row -->
					</div>
					<br> <br> <br>


					<!-- 페이지 처리 -->
					<div class="page" align="center">
						<td colspan="6"><c:if test="${currentPage <= 1}"> « &nbsp; </c:if>
							<c:if test="${currentPage > 1}">
								<c:url var="blistst" value="/with_blist.do">
									<c:param name="page" value="${currentPage-1}" />
								</c:url>
								<a href="${blistst}"> « </a> &nbsp;
						</c:if> <!-- 페이지 숫자 보여주기 --> <c:forEach var="p" begin="${startPage}"
								end="${endPage}">
								<c:if test="${p eq currentPage}">
									<font color="red" size="4"><b>[${p}]</b></font>
								</c:if>
								<c:if test="${p ne currentPage}">
									<c:url var="blistchk" value="/with_blist.do">
										<c:param name="page" value="${p}" />
									</c:url>
									<a href="${blistchk}">${p}</a>
								</c:if>
							</c:forEach> <c:if test="${currentPage >= maxPage}">&nbsp; » </c:if> <c:if
								test="${currentPage < maxPage}">
								<c:url var="blistEND" value="/with_blist.do">
									<c:param name="page" value="${currentPage+1}" />
								</c:url>
								<a href="${blistEND}">&nbsp;»</a>
							</c:if></td>
					</div>
					<br> <br> <br>
					<div align="center">
						<input onclick="javascript:location.href='withBoardinsertForm.do';" type="button" class="new" value="NEW">
					</div>
				</div>
			</div>
		</section>

	</div>
</section>
<script src="js/Seung-tae.js"></script>
<jsp:include page="../inc/footer.jsp" flush="false" />