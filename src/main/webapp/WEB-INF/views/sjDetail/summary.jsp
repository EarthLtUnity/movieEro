<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<c:set var="summary" value="${requestScope.movieSummary}"/>
<c:set var="specific" value="${requestScope.specInfo}"/>
<section class="sub_content">
	<div class="container">
		<div class="col-sm-12">
			<div class="movie">
				<div class="movie__info">
	                <div class="col-sm-4 col-md-3 movie-mobile">
 	                    <div class="movie__images">
	                        <span class="movie__rating">${specific[0].MV_USER_RATING}</span>
	                        <img src="${specific[0].MV_IMAGE}">
	                    </div>
	                </div>
	                <div class="col-sm-8 col-md-9">
	                    <p class="movie__time">${summary[0].MV_RUNTIME}</p>
	                    <p class="movie__option"><strong>Country: </strong>${summary[0].MV_COUNTRY}</p>
	                    <p class="movie__option"><strong>Year: </strong>${specific[0].MV_PUB_DATE}</p>
	                    <p class="movie__option"><strong>Genre: </strong>${summary[0].MV_GENRE}</p>
	                    <p class="movie__option"><strong>Release date: </strong>${summary[0].MV_RELEASE_DATE}</p>
	                    <p class="movie__option"><strong>Director: </strong>${summary[0].MV_DIRECTOR}</p>
	                    <p class="movie__option"><strong>Actors: </strong>${summary[0].MV_ACTOR}</p>
	                    <p class="movie__option"><strong>Age restriction: </strong>${summary[0].MV_GRADE}</p>
	                </div>
            	</div>
            	<!-- movie-info -->
            	 <div class="clearfix"></div>
            	 <h2 class="page-heading">줄거리</h2>
            	 <p class="movie__describe">${summary[0].MV_STORY}</p>
			</div>
			<!-- div class=movie -->
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp" flush="false" />