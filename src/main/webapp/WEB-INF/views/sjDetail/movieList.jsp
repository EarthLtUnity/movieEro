<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<link rel="stylesheet" type="text/css" href="css/Seo-Jin.css">
<section class="sub_content seojin-background">
	<form id="movie_list">
		<div class="container seojin">
			<div class="col-sm-12">
				<h2 class="page-heading">cinemas</h2>
				<div class="tags-area tags-area--thin">
					<div class="tags tags--unmarked tags--aside">
	                	<span class="tags__label">Sorted by:</span>
						<ul>
	                   		<li class="item-wrap"><a href="movieList.do" id="allBtn" class="tags__item item-active">all</a></li>
	                      	<li class="item-wrap"><a href="movieRating.do" id="topRatingBtn" class="tags__item">평점순</a></li>
	                      	<li class="item-wrap"><a href="movieRecnt.do" id="recentlyBtn" class="tags__item">최신순</a></li>
						</ul>
					</div>
	 			</div>
				<div class="cinema-wrap">
	            	<div class="row">
	            	<c:set var="movies" value="${requestScope.movieList}"/>
	            	<c:forEach var="forMovie" items="${movies}">
	                	<div class="col-xs-6 col-sm-3 custom listPost cinema-item">
	                    	<div class="cinema">
	                        	<a class="cinema__images" href="summary.do?MVInfoSeq=${forMovie.MV_INFO_SEQ}">
	                            	<img src="${forMovie.MV_IMAGE}">
	                            	<span class="cinema-rating">${forMovie.MV_USER_RATING}</span>
	                        	</a>
	                           	<a href="single-cinema.html" class="cinema-title">${forMovie.MV_TITLE}</a>
	                           <input type="hidden" name="MVInfoSeq" value="${forMovie.MV_INFO_SEQ}"/>
	                    	</div>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</form>
</section>
<script>

</script>
<!-- 혼자만 사용할 Javascript 라이브러리 파일 위치(이 밑에 추가) -->
<!-- <script type="text/javascript" src="js/파일명.js"></script> -->
<jsp:include page="../inc/footer.jsp" flush="false" />