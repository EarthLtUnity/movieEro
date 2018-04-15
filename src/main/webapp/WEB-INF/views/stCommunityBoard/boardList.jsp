<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:set var="listCount" value="${requestScope.listCount}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="startPage" value="${requestScope.startPage}"/>
<c:set var="endPage" value="${requestScope.endPage}"/>
<c:set var="maxPage" value="${requestScope.maxPage}"/>
<c:set var="list" value="${requestScope.list}"/>
<c:set var="listsub" value="${requestScope.listsub}"/>
<%-- <c:set var="writerNo" value="${requestScope.writerNo}"/> --%>

<c:set var="memberId" value="${sessionScope.memberID}"/>



<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-x.y.z.js"></script>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<script>
$(document).ready(function(){
	
	setTimeout(function() {
		 modal.style.display = "block"; 
	}, 1000);
	
	
	
	

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
			
			
			// 2-1. 해당 계시판에 참여했는지 조사하기
			// 먼저 가져온 값들을 하나씩 분리하여 배열을 생성
			var memberListToArray = memberList.split(', ');
			// 만약 일치한다면 이 값을 true로 변경하여 중복이 있다고 판단.
			var dupChk = false;
			
			// 값들을 하나 하나 현재 아이디와 비교
			for(var i in memberListToArray){
				// 만약 중복이 존재한다면 dupChk 를 true로 바꾸어 줍
				//여기 있었군요!! ㅇㅋ 알겠습니다^^ 
				if(userId == memberListToArray[i]) dupChk = true;
			}
			
			// 1. 로그인 
			if(userId == "" || userId == null){
				alert('\n Sorry, Login Please ~');
				
			// 2. 해당 게시판에 쳠여 이력 	
			} else if(dupChk){ // 중복이 존재한다면 true일 테니 여기서 조건이 확인 
				alert("\n 이미 가입한 회원입니다.");
				
			// 3. 모집인원이 다 찼는지 	
			} else if(mCount == 0){
				alert("\n 이미 만석입니다. \n다음 기회를 이용해 주세요."); 
				
			// 4. 로그인 ok, 게시판 참여한적 없고, 모집인원이 아직 남았다면 진행	
			} else{
				// 3. 모두 정상이라면 가입이 가능해야 한다.
				//결제창
				
					$.ajax({
					    		url: "withReserve.do", // 가맹점 서버
					            method: "GET",
					            data: {
					            	WITH_BOARD_NO : bno,
					            	WITH_BOARD_NOW_ID : memberList+", "+userId
					            },
					            success : function(result){
					            	var msg = '\n 결제가 완료되었습니다.';
					    			alert(msg);
					    			alert('\n 쿠폰은 참여한 게시글에서 즉시 확인 가능합니다');
					            	location.href="withBoardList.do";//반환값 지정해서 페이지 리로딩
					            }
					    	});
				
				 /*  IMP.request_pay({
					    pg : 'inicis',
					    pay_method : 'card',
					    merchant_uid : 'merchant_' + new Date().getTime(),
					    name : '아무거나',
					    amount : 1000,
					    buyer_email : 'worua99@nate.com',
					    buyer_name : '${memberId}',
					    buyer_tel : '010-2030-1266',
					    buyer_addr : '서울특별시 강남구 삼성동',
					    buyer_postcode : '123-456'
					}, function(rsp) {
					    if ( rsp.success ) {
					    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
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
					    } else {
					        var msg = '결제에 실패하였습니다.';
					        msg += '에러내용 : ' + rsp.error_msg;
		
					        alert(msg);
					    }
				}); */
			} /* else ENd */
		}); /* click function ENd */
		
		
		// 쿠폰 보여주는 modal창
	 	var modal = document.getElementById('myModal');
	 	// 쿠폰 버튼 눌렀을 때
		$(document).on('click','.getCoupon',function(){
			//쿠폰번호 찾아서 저장
			var coupon = $(this).parent().parent().find('.kstBoardCoupon').val();
			//modal창에 쿠폰 번호 저장한 값 붙이기
			$(modal).find('.modal-body-couponTitle').html("즐거운 관람 되세요");
			$(modal).find('.modal-body-couponNo').html(coupon);
			$(modal).find('.modal-body-couponMessage').html("쿠폰 사용은 발급일로 부터 1주일 이내 유효합니다");
			$(modal).find('.modal-body-writerPhoneNo').html("게시자(모임주최자)의 연락처는 버튼을 통해 확인 하시기 바랍니다")
			//modal창 열기
			 modal.style.display = "block"; 
		})
		
		// 폰 번호 버튼 눌렀을 때 
		$(document).on('click','.getPhoneNo',function(){
			
			var applyingId = $(this).parent().parent().parent().find('#mList').text();
			/* var writer = applyingId.split(', ',1);
			console.log("확인 : " + writer); */
			
			// 먼저 현재 버튼의 정보를 가져옵니다.
			var getPhoneBtn = $(this);
			
			$.ajax({
	    		url: "writerPhoneNumber.do", // 가맹점 서버
	            method: "GET",
	            data: {
	            	WITH_BOARD_WRITER : applyingId
	            },
	            success : function(result){
	            	// TEST 한번 해주세요
	    			//alert("예약 정보 및 동석을 위하여,\n다음 번호로 연락 주세요.\ntel : "+result);
	            	//setTimeout(function(){
	            	// 요즘엔 함수형 인터페이스라고 해서
	            	// 저 function조차도 축약합니다.
	            	// 이클립스는 오류라고 하네요 ;;;
	            	
	            	//처음엔 값을 전화번호로 변경하고
	            	$(getPhoneBtn).text(result);
	            	
	            	// 5초 뒤에 원래 이름으로 변경해봅시다.
	            	 setTimeout(function(){
	            		 $(getPhoneBtn).text('PHONE.NO');  
					}, 5000);
	            }
	    	});
			

		})
		
		
		
		// Dynamic 버튼에 모두 적용
	 	$(document).on('click','.modal',function(){
	 		modal.style.display = "none";
		})
		
		
		//게시글 만들기 전에 alert창 
		$('.new').on('click',function(){
			var userId = '${memberId}';
			
			if(userId == "" || userId == null){
				alert('\n Sorry, Login Please ~');
				return location.href="withBoardList.do";
			}else{
			alert('\n 영화 예매 목적 외 내용이나, 광고성 글, 도배 게시글은 \n 관리자에 의해 임의로 삭제 될 수 있으니 참고 바랍니다');
				
			}
		})
		
		
		
		
	});
	
</script>

<section class="sub_common_sec block_board">
	<div class="bl_brd_wrap Seungtae_BoardList">
		<br><br><br><br><br>
		<h1 id="news02">With Me </h1>
		<br>
		<section class="section-content ">
			<!-- BoardList 투명 창  -->
			<div class="fullscreen-section bg_pale pvb0">
			<div class="container wpc-boxoffice pv8">
					<div class="row">
					
					<!-- 검색창 -->
						<form class="example" action="withSearch.do" method="get" style="margin: auto; max-width: 300px">
							<input type="text" placeholder="Search.." name="WITH_BOARD_SEARCH_WORD">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
						
						
						<div class="col-sm-7 col-xs-12">
							<a href="withBoardList.do" class="btn">List_Reflesh</a>
							<br><br>
							<ul class="wpc-box-list">
								<c:forEach var="boardmain" items="${list}"> <!-- boardList for문 -->
									<c:forEach var="boardsub" items="${listsub}"> <!-- boardListsub for문 -->
									<c:if test="${boardmain.WITH_BOARD_NO == boardsub.WITH_BOARD_NO}">   <!-- 메인게시글 번호와 서브게시글 번호 비교-->
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
														<a href="#" class="kst_join">Join</a>
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
											<div class="steve_panel">  <!-- 게시글 내용 범위 -->
												<p class="kstBoardContent">${boardmain.WITH_BOARD_CONTENT}</p>    <!-- 게시글 내용 -->
												<div class="myCoupon">
												
													<!-- 로그인 접속 유효성 -->
													<c:if test="${memberId ne null}">
													<!-- 모집인원이 다 찼을 경우 모달 창 띄우는 버튼 활성화 -->
													<c:if test="${boardmain.WITH_BOARD_APPLY_NO - boardsub.WITH_BOARD_NOW_NO eq 0}">
													<!-- 현재 참여 중인 ID에 내가 있다면 coupon 버튼 보기 -->
													<c:if test="${fn:contains(boardsub.WITH_BOARD_NOW_ID, memberId)}">
															<button id="getCoupon" class="getCoupon">Coupon</button>
															<button id="getPhoneNo" class="getPhoneNo">Writer's Phone.No</button>
															</c:if>
													</c:if>
													
													<input type="hidden" class="kstBoardCoupon" value="${boardmain.WITH_BOARD_COUPON}">
													</c:if>
												</div>
											</div>  <!-- 게시글 내용 범위끝 -->
										</li>
										</c:if>  <!-- boardmain.WITH_BOARD_NO == boardsub.WITH_BOARD_NO 비교문-->
									</c:forEach> <!-- boardList for문 end -->
								</c:forEach> <!-- boardListsub for문 end -->
								</ul>




								

								<!-- 쿠폰 Modal창 -->
								<div id="myModal" class="modal">
									<!-- Modal content -->
									<div class="modal-content">
										<div class="modal-header">
											<span class="close">&times;</span>
											<h2 align="center" class="modal-body-couponTitle">Welcome to MovieEro</h2>
										</div>
										<div class="modal-body">
											<p class="modal-body-couponNo">3명이상 영화보고 할인 받자</p>
											<p class="modal-body-couponMessage"></p>
											<p class="modal-body-writerPhoneNo">모이기만 하면 쿠폰이 자동지급</p>
										</div>
									</div>
								</div>



								
						</div>
						<!-- row -->
					</div>
					<br> <br> <br>


					<!-- 페이지 처리 -->
					<div class="page" align="center">
						<td colspan="6">
							<c:if test="${currentPage <= 1}">
								[이전] &nbsp;
							</c:if>
							<c:if test="${currentPage > 1}">
								<c:url var="blistst" value="/withBoardList.do">
									<c:param name="page" value="${currentPage-1}"/>
								</c:url>
								<a href="${blistst}">[이전]</a> &nbsp;
							</c:if>
	
	
					<!-- 페이지 숫자 보여주기 -->
					<c:forEach var="p" begin="${startPage}" end="${endPage}">
						<c:if test="${p eq currentPage}">
							<font color="red" size="4"><b>[${p}]</b></font>
						</c:if>
						<c:if test="${p ne currentPage}">
							<c:url var="blistchk" value="/withBoardList.do">
								<c:param name="page" value="${p}"/>
							</c:url>
						<a href="${blistchk}">${p}</a>
						</c:if>
					</c:forEach>
	
					<c:if test="${currentPage >= maxPage}">
						[다음]
					</c:if>
					<c:if test="${currentPage < maxPage}">
						<c:url var="blistEND" value="/withBoardList.do">
							<c:param name="page" value="${currentPage+1}"/>
						</c:url>
					<a href="${blistEND}">[다음]</a>
					</c:if>
					</td>
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