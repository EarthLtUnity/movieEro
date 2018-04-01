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
<c:set var="member" value="${sessionScope.member}"/>


<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />



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
							<a href="with_blist.do" class="btn">리스트새로고침</a>
							<h3></h3>
							<ul class="wpc-box-list">
								<c:forEach var="boardOne" items="${list}">
									<li class="wpc-box-item">
										<ol class="cf" id="">
											<li class="bx-item-c">${boardOne.WHID_BOARD_NO}</li>
											<li class="bx-item-title kst_target"><a href="#target"
												class="hello">${boardOne.WHID_BOARD_TITLE}</a>
												<div>
													<span>${boardOne.WHID_BOARD_NOW_ID}</span>
												</div></li>
											<li class="bx-item-d"><a href="#" class="join">join</a></li>
											<li class="bx-item-m">${boardOne.WHID_BOARD_DATE}</li>
											<!-- 등록일 -->
											<li class="bx-item-m">${boardOne.WHID_BOARD_NOW_NO}/${boardOne.WHID_BOARD_APPLY_NO}</li>
											<!-- 인원수 -->
										</ol>
										<div class="steve_panel">
											<p>${boardOne.WHID_BOARD_CONTENT}</p>
										</div>
									</li>
								</c:forEach>








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
						<a href="with_binsertForm.do" class="btn apply">글쓰기</a>
					</div>
				</div>
			</div>
		</section>

	</div>
</section>
<script src="js/Seung-tae.js"></script>
<jsp:include page="../inc/footer.jsp" flush="false" />