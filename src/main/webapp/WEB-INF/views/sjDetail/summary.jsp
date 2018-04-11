<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<c:set var="summary" value="${requestScope.movieSummary}"/>
<c:set var="specific" value="${requestScope.specInfo}"/>
<section class="sub_content">
	<div class="container ">
		<div class="col-sm-12">
			<div class="tab_menu">
		    	<ul class="cf">
		    		<li class="on"><a href="summary.do">영화 개요</a></li>
		    		<li><a href="trailer.do">트레일러</a></li>
		    		<li><a href="review.do">영화 리뷰</a></li>
		    	</ul>
			</div>
			<div class="movie detailBorder">
				<div class="movie__info">
				<h2 class="page-heading">${specific.MV_TITLE}</h2>
	                <div class="col-sm-4 col-md-3 movie-mobile">
 	                    <div class="movie__images">
	                        <span class="movie__rating">${specific.MV_USER_RATING}</span>
	                        <img src="${specific.MV_IMAGE}">
	                    </div>
	                </div>
	                <div class="col-sm-8 col-md-9">	
	                    <p class="movie__time">${summary.MV_RUNTIME}</p>
	                    <p class="movie__option"><strong>Country: </strong>${summary.MV_COUNTRY}</p>
	                    <p class="movie__option"><strong>Year: </strong>${specific.MV_PUB_DATE}</p>
	                    <p class="movie__option"><strong>Genre: </strong>${summary.MV_GENRE}</p>
	                    <p class="movie__option"><strong>Release date: </strong>${summary.MV_RELEASE_DATE}</p>
	                    <p class="movie__option"><strong>Director: </strong>${summary.MV_DIRECTOR}</p>
	                    <p class="movie__option"><strong>Actors: </strong>${summary.MV_ACTOR}</p>
	                    <p class="movie__option"><strong>Age restriction: </strong>${summary.MV_GRADE}</p>
	                </div>
            	</div>
            	<!-- movie-info -->
            	 <div class="clearfix"></div>
            	 <h2 class="page-heading">줄거리</h2>
            	 <p class="movie__describe">${summary.MV_STORY}</p>
			</div>
			<!-- div class=movie -->
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp" flush="false" />