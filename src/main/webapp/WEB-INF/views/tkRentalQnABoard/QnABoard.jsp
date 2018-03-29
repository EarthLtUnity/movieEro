<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<c:set var="listCount" value="${requestScope.listCount}" />
<c:set var="listReplyCount" value="${requestScope.listReplyCount}" />
<c:set var="currentPage" value="${requestScope.currentPage}" />
<c:set var="startPage" value="${requestScope.startPage}" />
<c:set var="endPage" value="${requestScope.endPage}" />
<c:set var="maxPage" value="${requestScope.maxPage}" />
<c:set var="list" value="${requestScope.list}" />
<c:set var="member" value="${sessionScope.member}" />


<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />



<section class="section-content">

	<div class="section-content pvb0 bg-cover"
		data-bg-image="images/coming-bg.jpg">
		<div class="row"></div>

	</div>

	<div class="fullscreen-section bg-black pvb0">
		<div class="container wpc-boxoffice pv8">
			<div class="row">
				<div class="col-sm-12 col-xs-12">
					<h3>문의 게시판</h3>
					<div >
					<ol>
					<li>강남지점 강남지점 강남지점 강남지점 강남지점</li></ol>
					</div>
					<ul class="wpc-box-list">
						<c:forEach var="b" items="${list}">
							<li class="wpc-box-item">
								<ol>
									<li class="bx-item-t">
									<img src="images/boxoffice/thumb-1.jpg" alt="지점?"></li>
									<li class="bx-item-c">${b.RENTAL_BOARD_NO}</li>
									<li class="bx-item-title">
											<c:if test=	"${!empty member}">
											<c:url var="bdetail" value="RentalBoardDetail.do">
											<c:param name="bnum" value="${b.RENTAL_BOARD_NO}"/>
											<c:param name="page" value="${currentPage}"/>
											</c:url>
											<a href="${bdetail}">${b.RENTAL_BOARD_TITLE}</a>
											</c:if><c:if test="${empty member}">
											${b.RENTAL_BOARD_TITLE}
											</c:if>
									</li>
									<c:if test="${b.RENTAL_REPLY>0}">
									<li class="bx-item-d">답변:${b.RENTAL_REPLY}</li>
									</c:if>
									<c:if test="${b.RENTAL_REPLY eq 0}">
									<li class="bx-item-d">답변대기중</li>
									</c:if>
									<li class="bx-item-m">${b.RENTAL_BOARD_DATE }</li>
								</ol>
							</li>
						</c:forEach>
</ul>
<ul>
<li style = "text-align: center">
	<c:if test="${currentPage <= 1}">
		[이전]&nbsp;
	</c:if><c:if test="${currentPage > 1}">
	<c:url var="blistST" value="/RentalBoardList.do">
		<c:param name="page" value="${currentPage-1}"/>
	</c:url>
		<a href="${blistST}">[이전]</a> &nbsp;
	</c:if>
	<!-- 페이지 숫자 보여주기 -->
	<c:forEach var="p" begin="${startPage}" end="${endPage}">
	<c:if test="${p eq currentPage}">
	<font color="red" size="4"><b>[${p}]</b></font>
	</c:if><c:if test="${p ne currentPage}">
	<c:url var="blistchk" value="/RentalBoardList.do">
		<c:param name="page" value="${p}"/>
	</c:url>
		<a href="${blistchk}">${p}</a>
	</c:if>
	</c:forEach>
	<c:if test="${currentPage >= maxPage}">
	[다음]
	</c:if><c:if test="${currentPage < maxPage}">
	<c:url var="blistEND" value="/blist.do">
		<c:param name="page" value="${currentPage+1}"/>
	</c:url>
		<a href="${blistEND}">[다음]</a>
	</c:if>
</li>
</ul>
<div>
   <c:url var="inserview" value="RentalBoardInsertView.do">
         </c:url>
					<a href="${inserview}"><button>글쓰기</button></a>
				</div>

</div>
</div>
			</div>
		</div>



	<div class="fullscreen-section">
		<!-- 뭐 넣을까?? -->
	</div>
	<script type="text/javascript" src="js/google-maps.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
</section>

<jsp:include page="../inc/footer.jsp" flush="false" />
    <script type="text/javascript" src="js/RentalBoard.js"></script>