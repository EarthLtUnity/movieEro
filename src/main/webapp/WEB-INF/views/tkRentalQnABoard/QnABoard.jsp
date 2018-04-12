<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />
<c:set var="member" value="${sessionScope.memberID}" />
<c:set var="point" value="${requestScope.point}" />


<script>

function memberchk(){
	var bname = '${member}';
    if(bname==""){
    	alert("로그인을 해주시기 바랍니다");
    }
}
function point(point){
	BoardList("",point);
	}
 function BoardList(page,point){
    $.ajax({
        url : 'RentalPointList.do',
        type : 'get',
        data : {RENTAL_BOARD_POINT : point,
        		page : page},
       /*  dataType : 'application/json;', */
        success : function(data){
        	if(point==""){
        		data.list[1].rental_BOARD_POINT = "전체"
        	}
	    
       /*     var jsonStr;
           var json;
           if (data.list != null){
              jsonStr = JSON.stringify(data.list); //객체를 문자열로 변환             
              json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
           } */
           
        var a =''; 
            for(var i = 0; i<data.list.length; i++){
			a+="<ul class='wpc-box-list'>";
            a+="<ul class='wpc-box-list'>";
            if("${member}"!=""){
            a+="<a href='RentalBoardDetail.do?bnum="+data.list[i].rental_BOARD_NO
            a+="&page="+data.currentPage+"'onclick=memberchk();'>";
            }
            else if("${member}"==""){
            	a+="<a href='' onclick='memberchk();'>";
            }
            a+="<li class='wpc-box-item'>";
            a+="<ol>";   
            a+="<li class='bx-item-' style='width:9%;'>"+data.list[i].rental_BOARD_POINT+"</li>";
            a+="<li class='bx-item-c' style='width:10%;'>"+data.list[i].mb_ID+"</li>";
            a+="<li class='bx-item-title' style='width:60%;'>";
           
           
            a+=data.list[i].rental_BOARD_TITLE
            a+="</li>";
            if(data.list[i].rental_REPLY>0){
            a+="<li class='bx-item-d' style='width:11%;'>답변:"+data.list[i].rental_REPLY+"</li>";
            }
            else{
            a+="<li class='bx-item-d' style='width:11%;'>답변:"+data.list[i].rental_REPLY+"</li>";
            } 
            a+="<li class='bx-item-m' style='width:10%;'>"+data.list[i].rental_BOARD_DATE+"</li>";
            a+="</ol>";
            a+="</li>";
            a+="</a>";
            a+="<ul>";
            }
            a+="<ul>";
            a+="<li style = 'text-align: center'>";
            if(data.currentPage<=1){
            a+="[이전]&nbsp;";
            }
            else if(data.currentPage>1){
            a+="<a onclick=BoardList("+(data.currentPage-1)+",'"+point+"')>[이전]</a> &nbsp;";
            }
            for(var p = data.startPage; p<(data.endPage+1); p++){
            	if(p == data.currentPage){
            a+="<font color='red' size='4'><b>["+p+"]</b></font>";
            	}
            	else if (p != data.currentPage){
            a+="<a onclick=BoardList("+p+",'"+point+"')>"+p+"</a>";
            	}
            }
            if(data.currentPage >= data.maxPage){
            	a+="[다음]";
            }
            else if(data.currentPage<data.maxPage){
            	 a+="<a onclick=BoardList("+(data.currentPage+1)+",'"+point+"')>[다음]</a></li></ul>";
            }
         	console.log(a);
            $('.BoardList').html(a);
        }, error : function(request,status,error) {
        	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
    }); 
}
 $(function(){
	 BoardList(null,"전체");
 });
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
					<h3>문의 게시판</h3>
					<select name = "point" id="point" class="col-sm-3"  onchange="point(this.options[this.selectedIndex].value)">
					<option value="전체">모든 지점</option>
					<option value="강남지점"> 강남 지점</option>
					<option value="역삼지점"> 역삼 지점</option>
					<option value="압구정지점"> 압구정 지점</option>
					<option value="왕십리지점"> 왕십리 지점</option>
					<option value="홍대지점"> 홍대 지점</option>
					<option value="잠실지점"> 잠실 지점</option>
					</select><br>
					<ol>
					<li style ="float: left; width:8%;text-align: center;">지점</li>
					<li style ="float: left; width:10%;text-align: center;">작성자</li>		
					<li style ="float: left; width:60%;text-align: center;" >제목</li>		
					<li style ="float: left; width:11%; text-align: center;">작성일</li>		
					<li style ="float: left; width:10%;text-align: center;">답변여부</li>
					</ol>
					<br>
					<div class="BoardList">
					
						</div>

						<div>
						<c:if test=	"${!empty member}">
  						<c:url var="inserview" value="RentalBoardInsertView.do"></c:url>
   						</c:if>
						<a href="${inserview}" onclick="memberchk();" ><button>글쓰기</button></a>
						</div>

					</div>
				</div>
			</div>
		</div>



	<div class="fullscreen-section">
		<!-- 뭐 넣을까?? -->
	</div>
	<script type="text/javascript" src="js/google-maps.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
</section>

<jsp:include page="../inc/footer.jsp" flush="false" />
    <script type="text/javascript" src="js/RentalBoard.js"></script>