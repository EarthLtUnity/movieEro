<!DOCTYPE html>

<html>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Labels</title>
    <style>
.cycle-slideshow, .cycle-slideshow * { -webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box; }
.cycle-slideshow { width: 100%;  height: 250px;  min-width: 200px; max-width: 500px; margin: 10px auto; padding: 0; position: relative;}

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
.cycle-pager span { 
    font-family: arial; font-size: 50px; width: 16px; height: 16px; 
    display: inline-block; color: #ddd; cursor: pointer; 
}
.cycle-pager span.cycle-pager-active { color: #D69746;}
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
        var address = '서울 중랑구 중랑역로 72 (동구햇살아파트)'; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var marker = null;
        var geocoder = new google.maps.Geocoder();
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker = new google.maps.Marker({
                                map: map,
                                icon: image, // 마커로 사용할 이미지(변수)
                                title: '한밭도서관', // 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                                position: results[0].geometry.location
                            });
 
                var content = "한밭도서관<br/><br/>Tel: 042-580-4114"; // 말풍선 안에 들어갈 내용
             
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
<div Style="float :left; width : 50%;  height: 100%; ">
<div class="cycle-slideshow"
    data-cycle-fx=scrollHorz
    data-cycle-timeout=2000
>
<div class="cycle-pager"></div>
    <img src="images/theater/gnmovie1.jpg">
	<img src="images/theater/gnmovie2.jpg">
	<img src="images/theater/gnmovie3.jpg">
	</div>
	<div Style="height: 5%; ">
	<H3>내용 </H3>
	</div>
	<div>
	<H3>내용</H3>
	</div>
	<div>
	<H3>13:00 15:00 17:00 19:00 21:00</H3>
	</div>
	<div>
	<H3>내용</H3>
	<p>내용</p>
	</div>
	<div>
	<H3>가격 2500</H3>
	</div>
	<div>
	<input type="button" value="ê²°ì íê¸°">
	</div>
	</div>
    <div id="map-canvas" style="width: 50%; height: 100%" title="도서관 위치입니다."></div>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB4VzFVpcw6-ypvRJGD5BcNnEs7JirI9Co&libraries=places&callback=initMap">
    </script>
  </body>
</html>