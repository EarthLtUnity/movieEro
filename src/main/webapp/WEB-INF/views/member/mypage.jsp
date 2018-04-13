<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="pmVO" value="${requestScope.list}"/>
<c:set var="pmVOAt" value="${requestScope.listAt}"/>

<section class="sub_content mypage_wrap">
	<div class="container">
		<div class="row">               
			<h1 class="sub_tit">영화결제내역</h1>
			<div class="sub_page mypage_grid">
				<div class="lft_mypage_box col-md-3 col-sm-5 col-xs-12">
					<jsp:include page="../inc/mypage_menu.jsp" flush="false" />
				</div>
				<div class="rgh_mypage_box col-md-9 col-sm-7 col-xs-12">
				<%-- private String CINEMA_NAME;
	private String CINEMA_SECTION;
	private String CINEMA_MOVIE;
	private String CINEMA_MOVIE_TIME;
	private String CINEMA_MOVIE_SEAT;
	private String MB_ID;
	private String CINEMA_RESERVE_NO; --%>
					<ul>
					<c:forEach var="pm" items="${pmVOAt}">
						<li class="cf li_mypage_list">
							<div class="lft_img_sec"><img src="images/poster/mypage_thor.jpg" alt="" /></div>
							<div class="mdl_txt_sec">
								<a href="#">
									<ul>
										<li>
											<strong class="mypage_movie_tit">${pm.CINEMA_MOVIE}</strong>
										</li>
										<li class="mypage_movie_date">영화관 : ${pm.CINEMA_NAME}</li>
										<li class="mypage_movie_date">상영 시간 : ${pm.CINEMA_MOVIE_TIME}</li>
										<li class="mypage_movie_price">예약 좌석 :
										<c:forEach var="seat" items="${pmVO}">
											<c:if test="${seat.CINEMA_MOVIE eq pm.CINEMA_MOVIE }">
												<c:if test="${seat.CINEMA_MOVIE_TIME eq pm.CINEMA_MOVIE_TIME}">
													 ${seat.CINEMA_MOVIE_SEAT} , 
												</c:if>
											</c:if>
										</c:forEach>
										</li>
									</ul>
								</a>
							</div>
						</li>			
					</c:forEach>
					</ul>
				</div>
			</div>
		</div>	
	</div> 
</section>

<jsp:include page="../inc/footer.jsp" flush="false" />