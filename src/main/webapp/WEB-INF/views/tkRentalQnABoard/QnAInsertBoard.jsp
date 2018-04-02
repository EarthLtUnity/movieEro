<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="resources/js/Tea-kyu.js"></script>
<script src="resources/api/ckeditor/ckeditor.js"></script>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<section class="section-content">

	<div class="section-content pvb0 bg-cover"
		data-bg-image="images/coming-bg.jpg">
		<div class="row"></div>

	</div>

	<div class="fullscreen-section bg-black pvb0">
		<div class="container wpc-boxoffice pv8">
			
				<form style= "padding-top: 150px;"
				class="form-horizontal" role="form" id="editorForm" enctype="multipart/form-data" method="post" action="RentalBoardInsert.do" >
						
							<input type="hidden" name="MB_ID" value= "${member}">
							
								<table>
									<tr>
										<td>제목:</td>
										<td><input type="text" name="RENTAL_BOARD_TITLE">
									</tr>
									<tr>
									<td>지점:</td>
									<td>
												<select name = "RENTAL_BOARD_POINT" id="RENTAL_BOARD_POINT" class="col-sm-3">
													<option value="전체">지점 선택</option>
													<option value="강남지점"> 강남 지점</option>
													<option value="역삼지점"> 역삼 지점</option>
													<option value="압구정지점"> 압구정 지점</option>
													<option value="왕십리지점"> 왕십리 지점</option>
													<option value="홍대지점"> 홍대 지점</option>
													<option value="잠실지점"> 잠실 지점</option>
												</select>
									</td>
									</tr>
									<tr>
										<td>작성자</td>
										<td><input type="text" readonly value="${member}" ></td>
									</tr>
							<!-- 		<tr>
									
										<td><input id ="passcheck" type="checkbox">비밀번호 설정여부</td>
										<td><input name ="RENTAL_BOARD_PASS" type="password"></td>						
									</tr> -->
									<tr>
										<td>내용</td>
										<td><textarea cols="50" rows="7"
												name="RENTAL_BOARD_CONTENT" id="ckeditor"></textarea></td>
									</tr>
									<tr>
										<td colspan="2" align="center">
										<input type="submit" value="등록하기"> &nbsp;
											 <c:url var="RentalBoardList"
												value="/RentalBoardList.do">
												<c:param name="page" value="1" />
												
											</c:url> 
											
											<a href="${RentalBoardList}"><input type="button" value="목록으로"></a></td>
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
		filebrowserImageUploadUrl : 'RentalBoardImgInsert.do'
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

});
function memberchk(){
	var bname = '${member}';
    if(bname==""){
    	alert("로그인을 해주시기 바랍니다");
    }
}
</script>