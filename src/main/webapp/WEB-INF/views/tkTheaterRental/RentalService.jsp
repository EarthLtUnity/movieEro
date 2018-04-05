<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<c:set var="member" value="${sessionScope.member}" />
<script>
function popupOpen(){
	var popUrl = "ex.do";	//팝업창에 출력될 페이지 URL
	var popOption = "width=700, height=500, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>

<section class="section-content">
	<div class="section-content pvb0 bg-cover"
		data-bg-image="images/coming-bg.jpg">
		<div class="row"></div>

	</div>
		<div class="fullscreen-section bg-black pvb0">
		<div class="container wpc-boxoffice pv8">
			<div class="row">
				<div class="col-sm-12 col-xs-12" style= "padding-top: 150px;" >
                <h3 class="heading text-center">영화관 대여서비스</h3>
               
                <div class="ticket-carousel pvt85">
                    <div class="swiper-container carousel-container movie-images" data-col="3" style="width: 900px;">
                        <div class="swiper-wrapper">
                         <c:set var="theater" value="${requestScope.theater}"></c:set>
							<c:forEach var="theaterlist" items="${theater}">
                                <div class="swiper-slide">
                                    <div class="movie-image" data-bg-image="image/bg/main_bg01.jpg">
                                        <div class="entry-hover">
                                            <div class="entry-actions">
                                            	<input type="hidden" value ="${theaterlist.RENTAL_SERVICE_NO}">
                                            	<input type='button' onclick='popupOpen()' value='정보보기'/>
                                                <a href="#order" class="btn-ticket order_btn ">buy ticket</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 </c:forEach>
                          </div>
                    </div>
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>

            </div>
        </div>
    </div>  
    </div>  
    <div class="section-content service pvb0">
   
    </div>        
    <div class="fullscreen-section bg-black pvb0">
        <div class="container wpc-boxoffice pv8">
            <div class="row">
          
           
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>
  

</section>
<jsp:include page="../inc/footer.jsp" flush="false" />
