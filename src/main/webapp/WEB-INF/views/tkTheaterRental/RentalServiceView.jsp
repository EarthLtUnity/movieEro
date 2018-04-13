<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<c:set var="theaterview" value="${requestScope.theaterview}"></c:set>
<c:set var="address" value="${theaterview.RENTAL_SERVICE_POSITION}"></c:set>
<c:set var="theaterImage" value="${requestScope.theaterImage}"></c:set>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Labels</title>
<style>
.cycle-slideshow, .cycle-slideshow * { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; }
.cycle-slideshow { width: 100%;  height: 100%;  min-width: 200px; max-width: 500px;  padding: 0; position: relative;}

.cycle-slideshow div.slide { width: 100%; height: 100% }
.cycle-slideshow img { 
    position: absolute; top: 0; left: 0;
    width: 100%; height: 100%; padding: 0; display: block;
}
.cycle-slideshow img:first-child {
    position: static; z-index: 100;
}
.cycle-pager { 
    text-align: center; width: 100%; z-index: 500; position: absolute; top: 2px; overflow: hidden;
}
.cycle-pager h4 { 
    font-family: arial; font-size: 50px; width: 16px; height: 16px; 
    display: inline-block; color: #ddd; cursor: pointer; 
}
.cycle-pager h4.cycle-pager-active { color: #D69746;}
.cycle-pager > * { cursor: pointer;}
#map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
 	}
</style>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
 	<script type="text/javascript">
    function initialize() {
    	var chDate = '<c:out value="${address}"/>'; 	

        var mapOptions = {
                            zoom: 18, // 지도를 띄웠을 때의 줌 크기
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
         
         
        var map = new google.maps.Map(document.getElementById("map-canvas"), // div의 id과 값이 같아야 함. "map-canvas"
                                    mapOptions);
         
        var size_x = 40; // 마커로 사용할 이미지의 가로 크기
        var size_y = 40; // 마커로 사용할 이미지의 세로 크기
     
        // 마커로 사용할 이미지 주소
        var image = new google.maps.MarkerImage( '주소 여기에 기입!',
                                                    new google.maps.Size(size_x, size_y),
                                                    '',
                                                    '',
                                                    new google.maps.Size(size_x, size_y));
         
        // Geocoding *****************************************************
        var address = chDate; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                icon: image, // 마커로 사용할 이미지(변수)
                                title: '<c:out value="${theaterview.RENTAL_SERVICE_TITLE}"/>', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                position: results[0].geometry.location
                            });
 
                var content ='<c:out value="${address}"/><br><c:out value="${theaterview.RENTAL_SERVICE_TITLE}"/>'; // 말풍선 안에 들어갈 내용
             
                // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
                var infowindow = new google.maps.InfoWindow({ content: content});
                google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        // Geocoding // *****************************************************
         
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>
  </head>
  <body>
<div Style="float :left; width : 50%;  height: 50%; ">
	<div class="cycle-slideshow"
    data-cycle-fx=scrollHorz
    data-cycle-timeout=2000>
		<div class="cycle-pager"></div>
		<c:forEach var="theaterImg" items="${theaterImage}">
   		 <img src="http://localhost:8088/adminMovieEro/resources/images/theater/${theaterImg.RENTAL_SERVICE_IMAGE}">
		</c:forEach>
	</div>
</div>
	<div id="map-canvas" style="width: 50%; height: 50%" title="영화관 위치입니다."></div>
		<div style="padding: 6px 6px 6px 6px; border: 8px solid #f2f2f2;">
			<H2>영화관: ${theaterview.RENTAL_SERVICE_TITLE}</H2><hr>
			<h4>주소:${theaterview.RENTAL_SERVICE_POSITION}</h4><hr>
			<h4>정보:${theaterview.RENTAL_SERVICE_INFO}</h4><hr>
			<h4>가격:${theaterview.RENTAL_SERVICE_PRICE}</h4><hr>
			<h4>시간: 09:00~11:00  11:30~13:30  14:00~16:00</h4>
		</div>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4VzFVpcw6-ypvRJGD5BcNnEs7JirI9Co&libraries=places&callback=initMap"></script>
  </body>
</html>