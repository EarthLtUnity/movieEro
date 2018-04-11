<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="myrentallist" value="${requestScope.myrentallist}"></c:set>
<c:set var="theater" value="${requestScope.theater}"></c:set>
<section class="sub_content mypage_wrap">
	<div class="container">
		<div class="row">               
			<h1 class="sub_tit">영화관대여내역</h1>
			<div class="sub_page mypage_grid">
				<div class="lft_mypage_box col-md-3 col-sm-5 col-xs-12">
					<jsp:include page="../inc/mypage_menu.jsp" flush="false" />
				</div>
				<div class="rgh_mypage_box col-md-9 col-sm-7 col-xs-12">
					<ul>
						<li class="cf li_mypage_list">
						<c:forEach var="myllist" items="${myrentallist}">
							<c:forEach var="tImage" items="${theater}">
							<c:if test="${tImage.RENTAL_SERVICE_POSITION eq theater_pay_postion}"></c:if>
							<div class="lft_img_sec"><img src="http://localhost:8088/adminMovieEro/resources/images/theater/${tImage.RENTAL_SERVICE_IMAGE}" alt="" /></div>
							</c:forEach>
							<div class="mdl_txt_sec">
								<a href="#">
									<ul>
										<li>
										<strong class="mypage_movie_tit">theater_pay_postion</strong>
										</li>
										<li class="mypage_movie_date">${myllist.theater_pay_date}</li>
										<li class="mypage_movie_date">${myllist.theater_pay_time}</li>
										<li class="mypage_movie_price">${myllist.theater_pay_price}</li>
									</ul>
								</a>
							</div>
								<c:if test="${myllist.tImagetheater_pay_case eq true}">
								<div class="rgh_btn_sec"><button class="btn_reserve_cl c_orange">예매취소</button></div>
								</c:if>
								<c:if test="${myllist.tImagetheater_pay_case eq false}">
								<div class="rgh_btn_sec"><button class="btn_reserve_cl c_orange">예매취소신청중</button></div>
								</c:if>
							</c:forEach>
						</li>			
					</ul>
				</div>
			</div>
		</div>	
	</div> 
</section>

<jsp:include page="../inc/footer.jsp" flush="false" />