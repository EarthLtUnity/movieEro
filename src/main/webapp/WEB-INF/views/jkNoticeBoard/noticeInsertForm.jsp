<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="ID" value="${sessionScope.memberID}"/>

<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />
<section class="section-content">

	<div class="section-content pvb0 bg-cover"
		data-bg-image="images/coming-bg.jpg">
		<div class="row"></div>
	</div>

	<div class="fullscreen-section bg-black pvb0">
		<div class="container wpc-boxoffice pv8">
			
				<form style= "padding-top: 150px;"
				class="form-horizontal" role="form" id="editorForm" enctype="multipart/form-data" method="get" action="noticeInsert.do" >
						
							<input type="hidden" name="MB_ID" value="${ID}">
							
								<table>
									<tr>
										<td>제목:</td>
										<td><input type="text" name="NOTICE_BOARD_TITLE" class="ntTitle">
										<input type = "text" value="${ID}" readOnly/>
									</tr>
							<!-- 		<tr>
									
										<td><input id ="passcheck" type="checkbox">비밀번호 설정여부</td>
										<td><input name ="RENTAL_BOARD_PASS" type="password"></td>						
									</tr> -->
									<tr>
										<td>내용</td>
										<td><textarea cols="50" rows="7"
												name="NOTICE_BOARD_CONTENT" id="ckeditor" class="ntContent"></textarea></td>
									</tr>
									<tr>
										<td colspan="2" align="center">
										<input type="submit" value="등록하기"> &nbsp;
											 <c:url var="notice"
												value="/noticeList.do">
												<c:param name="page" value="1" />
												
											</c:url> 
											
											<a href="notice.do"><input type="button" value="목록으로"></a></td>
									</tr>
								</table>
				</form>



			</div>
		</div>

</section>
<jsp:include page="../inc/footer.jsp" flush="false" />
<script type="text/javascript">
$(function() {

	CKEDITOR.replace('ckeditor', {
		width : '1000px',
		height : '400px',
		filebrowserImageUploadUrl : 'noticeBoardImgInsert.do'
	});

	CKEDITOR.on('dialogDefinition', function(ev) {
		var dialogName = ev.data.name;
		var dialogDefinition = ev.data.definition;

		switch (dialogName) {
		case 'image': //Image Properties dialog
			//dialogDefinition.removeContents('info');
			dialogDefinition.removeContents('Link');
			dialogDefinition.removeContents('advanced');
			break;
		}
	});
	
	$( "#target" ).submit(function( event ) {
		  var userId = '${ID}';
		  var bTitle = this.hasClass("ntTitle");
		  var bContent = this.hasClass("ntContent");
		  if(bTitle.val() == ""){
			  alert("제목을 입력하지 않으셨습니다.");
			  bTitle.focus();
			  return false;
		  }
		  if(bContent.val() == ""){
			  alert("본문을 입력하지 않으셨습니다.");
			  bContent.focus();
			  return false;
		  }
		});

});
function membercheck(){
	var userId = '${ID}';
    if(userId==""){
    	alert("로그인을 해주시기 바랍니다");
    }
}
</script>




