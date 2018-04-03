<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />

<c:set var="listCount" value="${requestScope.listCount}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="startPage" value="${requestScope.startPage}"/>
<c:set var="endPage" value="${requestScope.endPage}"/>
<c:set var="maxPage" value="${requestScope.maxPage}"/>
<c:set var="list" value="${requestScope.list}"/>

<script>
	var page = '${currentPage}';
	page = page+2;
	<%--var list = '${list}';--%>
	function noticeInsertForm(){
		location.href = "noticeInsertForm.do"
	};
	
	$(function(){
		$('[name=showMoreNotice]').click(function(){ 
			
		    page++;
		    showThreeMore(); 
		    console.log("page == "+page);
		});
	});

	function showThreeMore(){
		$.ajax({
			url : 'noticeMore.do',
	        type : 'get',
	        data : {page:page},
	        success : function(list){
	        	console.log(list);
	        	var add1 = '';
	        	var add2 = '';
	        	var add3 = '';
	        	for(var i = 0; i<list.length; i++){
	        			console.log(list[i].mb_ID);
	        			console.log(list[i].notice_BOARD_TITLE);
	        			console.log(list[i].notice_BOARD_CONTENT);
	        		var r = list[i].rnum;
	        		console.log("test 1 : "+(r%3 == 1));
	        		console.log("test 1 : "+(r%3 == 2));
	        		console.log("test 1 : "+(r%3 == 0));
	        		 if(r%3 == 1){ 
			        	add1 += '<div class="bl_brd_box"><h2>';
			        	add1 += '<a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#ddd;">'+list[i].notice_BOARD_TITLE+'</a></h2>';
			        	add1 += '<div class="bl_brd_img"> </div>';
			        	add1 += '<p><a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#666;">'+list[i].notice_BOARD_CONTENT+'</a></p>';
			        	add1 += '<a href="noticeDetail.do?NOTICE_BOARD_NO=1" class="bl_brd_more">MORE</a>';
			        	add1 += '</div>';
			        	$(".firstLine").html($(".firstLine").html()+add1);
	        		}else if(r%3 == 2){
	        			add2 += '<div class="bl_brd_box"><h2>';
	    	        	add2 += '<a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#ddd;">'+list[i].notice_BOARD_TITLE+'</a></h2>';
	    	        	add2 += '<div class="bl_brd_img"> </div>';
	    	        	add2 += '<p><a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#666;">'+list[i].notice_BOARD_CONTENT+'</a></p>';
	    	        	add2 += '<a href="noticeDetail.do?NOTICE_BOARD_NO = ${NOTICE_BOARD_NO}" class="bl_brd_more">MORE</a>';
	    	        	add2 += '</div>';
	    	        	$(".secondLine").html($(".secondLine").html()+add2);
	        		}else{
	        			add3 += '<div class="bl_brd_box"><h2>';
	    	        	add3 += '<a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#ddd;">'+list[i].notice_BOARD_TITLE+'</a></h2>';
	    	        	add3 += '<div class="bl_brd_img"> </div>';
	    	        	add3 += '<p><a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#666;">'+list[i].notice_BOARD_CONTENT+'</a></p>';
	    	        	add3 += '<a href="noticeDetail.do?NOTICE_BOARD_NO = ${NOTICE_BOARD_NO}" class="bl_brd_more">MORE</a>';
	    	        	add3 += '</div>';
	    	        	$(".thirdLine").html($(".thirdLine").html()+add3);
	        		}
	        	}
	        }
		});

	}
</script>
<section class="block_board" id="board">
	<div class="Jaekyeom_wrap">
		<div class="bl_brd_wrap">
			<h1 id="news02">공지사항</h1>
			
			
			
			<!-- 
			글쓰기버튼 주석처리
			<input type = "button" class = "btn mls20" value = "글쓰기" onclick="noticeInsertForm();"/> 
			
			-->
			
			
			
			<ul class="cf">
				
				
						<!-- ROWNUM을 사용해서 ROWNUM이 3으로 나누어서 나머지가 1인경우 첫번째 새로줄에 추가 -->
						<li ><%-- 첫번째 새로 줄 --%>					
							<div class = "firstLine">
								<c:forEach var="bb" items="${list}">
									<c:if test="${bb.RNUM%3 == 1}">
										<div class="bl_brd_box"><h2>
					        			<a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#ddd;">${bb.NOTICE_BOARD_TITLE }</a></h2>
					        			<div class="bl_brd_img"> </div>
					        			<p><a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#666;">${bb.NOTICE_BOARD_CONTENT }</a></p>
				    	    			<a href="noticeDetail.do?NOTICE_BOARD_NO=1" class="bl_brd_more">MORE</a>
				        			</div>
									</c:if>
								</c:forEach>
							</div>
						</li>
						<%-- 첫번째 새로줄 끝 --%>
						
						
						
						<!-- ROWNUM을 사용해서 ROWNUM이 3으로 나누어서 나머지가 2인경우 두번째 새로줄에 추가 -->
						<%-- 두번째 새로줄 시작 --%>
						<li >		
							<div class = "secondLine">
								<c:forEach var="bb" items="${list}">
									<c:if test="${bb.RNUM%3 == 2}">
										<div class="bl_brd_box"><h2>
					        			<a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#ddd;">${bb.NOTICE_BOARD_TITLE }</a></h2>
					        			<div class="bl_brd_img"> </div>
					        			<p><a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#666;">${bb.NOTICE_BOARD_CONTENT }</a></p>
				    	    			<a href="noticeDetail.do?NOTICE_BOARD_NO=1" class="bl_brd_more">MORE</a>
				        			</div>
									</c:if>
								</c:forEach>
							</div>			
						</li>
						<%-- 두번째 새로줄 끝 --%>

						<!-- ROWNUM을 사용해서 ROWNUM이 3으로 나누어서 나머지가 0인경우 첫번째 새로줄에 추가 -->
						<%-- 세번째 새로줄 시작 --%>
						<li>	
							<div class = "thirdLine">
								<c:forEach var="bb" items="${list}">
									<c:if test="${bb.RNUM%3 == 0}">
										<div class="bl_brd_box"><h2>
					        			<a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#ddd;">${bb.NOTICE_BOARD_TITLE }</a></h2>
					        			<div class="bl_brd_img"> </div>
					        			<p><a href="noticeDetail.do?NOTICE_BOARD_NO=1" style="color:#666;">${bb.NOTICE_BOARD_CONTENT }</a></p>
				    	    			<a href="noticeDetail.do?NOTICE_BOARD_NO=1" class="bl_brd_more">MORE</a>
				        			</div>
									</c:if>
								</c:forEach>
							</div>					
						</li>	
						<%-- 세번째 새로줄 끝 --%>
						
				
			</ul>
			<div class="bl_brd_more">
				<button name="showMoreNotice" class="btn_brd_prev" value = "MORE">더보기</button>
			</div>

			<<!-- div class="paging_wrap">
				<div class="paging">
					<ol>
						<li><a class="active">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
					</ol>
				</div>
			</div> -->

		</div>

	</div>
</section>
<c:import url="../inc/footer.jsp" />
