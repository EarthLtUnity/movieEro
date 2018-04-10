<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="memberId" value="${sessionScope.memberID}"/>

<div class="Seungtae_insertForm">
	<section class="sub_content aa">
		<div class="container">
			<div class="row">
				<h1 class="sub_tit"></h1>
				<br> <br> <br> <br>
				<section id="kst_insertBoard">
					<div class="container footer-container">
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-6">
								<div class="widget" id="widget">
									<h5 class="widget-title"></h5>
									<form class="contact_form transparent" name="kst_insertForm" id="kst_insertForm" action="withBoardList.do" method="post">
										<div class="row">
											<div class="col-sm-4">
												<input type="text" class="inputValidation" id="WITH_BOARD_WRITER" name="WITH_BOARD_WRITER" value="${memberId}" readOnly="readonly">
											</div>
											<div id="select">
												<select name="WITH_BOARD_APPLY_NO" id="select_1" class="col-sm-3">
													<option >모집인원</option>
													<option value="3"> 3  명</option>
													<option value="4"> 4 명</option>
													<option value="5"> 5 명</option>
													<option value="6"> 6 명</option>
													<option value="7"> 7 명</option>
													<option value="8"> 8 명</option>
													<option value="9"> 9 명</option>
													<option value="10"> 10 명</option>
												</select>
											</div>
											<div class="col-sm-9">
												<input type="text" id="WITH_BOARD_TITLE" class="inputValidation"	name="WITH_BOARD_TITLE"	placeholder="TITLE ( 영화관 / 영화시간 / 영화제목  ) ">
											</div>
											<div class="col-sm-12 ">
												<textarea class="inputValidation" name="WITH_BOARD_CONTENT" id="WITH_BOARD_CONTENT" placeholder="CONTENT (자세히 작성해주세요) " style="resize: none"></textarea>
												<div class="kst_btn">
													<button type="submit" class="btn_submit">submit</button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<br> <a href="withBoardList.do" class="btn">리스트새로고침</a>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</section>
</div>

<div class="Seungtae_wrap"></div>




<!-- 스크롤에 따라 움직이게 감쌈 -->
<div class="bl_brd_wrap Seungtae_BoardList">
	<section class="section-content ">
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
								<p>Enthusiastically monetize plug-and-play scenarios through
									quality manufactured products. Monotonectally streamline
									standardized portals after proactive innovation. Energistically
									promote market positioning.</p>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="testimonial">
								<div class="entry-meta">
									<h4>Shela Mathews</h4>
								</div>
								<p>Enthusiastically monetize plug-and-play scenarios through
									quality manufactured products. Monotonectally streamline
									standardized portals after proactive innovation. Energistically
									promote market positioning.</p>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="testimonial">
								<div class="entry-meta">
									<h4>Shela Mathews</h4>
								</div>
								<p>Enthusiastically monetize plug-and-play scenarios through
									quality manufactured products. Monotonectally streamline
									standardized portals after proactive innovation. Energistically
									promote market positioning.</p>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="testimonial">
								<div class="entry-meta">
									<h4>Shela Mathews</h4>
								</div>
								<p>Enthusiastically monetize plug-and-play scenarios through
									quality manufactured products. Monotonectally streamline
									standardized portals after proactive innovation. Energistically
									promote market positioning.</p>
							</div>
						</div>
						<div class="swiper-slide">
							<div class="testimonial">
								<div class="entry-meta">
									<h4>Shela Mathews</h4>
								</div>
								<p>Enthusiastically monetize plug-and-play scenarios through
									quality manufactured products. Monotonectally streamline
									standardized portals after proactive innovation. Energistically
									promote market positioning.</p>
							</div>
						</div>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
	</section>
</div>





<script src="js/Seung-tae.js"></script>
<jsp:include page="../inc/footer.jsp" flush="false" />