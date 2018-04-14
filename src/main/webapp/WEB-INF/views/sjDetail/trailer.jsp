<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<link rel="stylesheet" type="text/css" href="css/Seo-Jin.css">
<link/>
<section class="sub_content seojin-background">
	<div class="container seojin">
		<div class="col-sm-12">
			<div class="tab_menu">
		    	<ul class="cf">
		    		<li><a id="toSummary" href="reSummary.do">영화 개요</a></li>
		    		<li class="on"><a id="toTrailer" href="trailer.do">트레일러</a></li>
		    		<li><a id="toReview" href="review.do">영화 리뷰</a></li>
		    	</ul>
			</div>
			<div class="movie__media">
			<h2 class="page-heading">photos</h2>
			<c:set var="stillcutList" value="${requestScope.movieStillcut}"/>
			<form id="toOtherCtrl">
				<input type="hidden" name="MVInfoSeq" value="${stillcutList[0].MV_INFO_SEQ}"/>
			</form>
				<div class="swiper-container detailBorder">
					<div class="img_trailer_container">
					<c:forEach var="img" items="${stillcutList}">
						<div class="img_trailer"> 
                        	<a href="${img.MV_STILLCUT}" class="movie__media-item">
                            	<img style="width: 185px; height: 105.594px" src="${img.MV_STILLCUT}">
                        	</a>
                    	</div>
					</c:forEach>
					</div>
				</div>
			<h2 class="page-heading">videos</h2>
			<c:set var="trailerList" value="${requestScope.movieTrailer}"/>
				<div class="swiper-container detailBorder trailerDiv">
					<div class="img_trailer_container">
					<c:forEach var="tlr" items="${trailerList}">
						<div class="img_trailer media-video trailerPlayer">
                        	<a href="${tlr.MV_TRAILER}" class="movie__media-item">
                            	<img style="width: 185px; height: 105.594px" src="${stillcutList[0].MV_STILLCUT}">
                        	</a>
                        	<input id="videoVal" type="hidden" value="${tlr.MV_TRAILER}">
                        	<input class="detailDesc" type="text" disabled value="${tlr.MV_DESC}">
                    	</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<%-- <div id="dim">
	<div class="loadTrailers">
		<video autoplay="autoplay" controls="controls" src="${trailerList[0].MV_TRAILER}"></video>
	</div>
</div> --%>
<!-- 혼자만 사용할 Javascript 라이브러리 파일 위치(이 밑에 추가) -->
<script>
$(document).ready(function(){
	$(".trailerPlayer").on('click', function(){
		var selectedVideo = $(this).children().find('#videoVal').val();
		console.log(selectedVideo);
	});
})
</script>
<!-- <script type="text/javascript" src="js/파일명.js"></script> -->
<jsp:include page="../inc/footer.jsp" flush="false" />