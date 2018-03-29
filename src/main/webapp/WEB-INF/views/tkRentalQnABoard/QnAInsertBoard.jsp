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
			<div class="row">
				<form class="form-horizontal" role="form" id="editorForm" enctype="multipart/form-data" method="post" action="RentalBoardInsert.do" >
					<div class="form-group">
						<div class="form-group">
							<div class="col-lg-12">
						
							<input type="hidden" name="MB_ID" value= "${member}">
							
								<table align="center" id="tb">
									<tr>
										<td>제목:</td>
										<td><input type="text" name="RENTAL_BOARD_TITLE">
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
							</div>
						</div>	
					</div>
				</form>

<script type="text/javascript">
$(function() {

	CKEDITOR.replace('ckeditor', {
		width : '100%',
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
</script>

			</div>
		</div>

	</div>

	<div class="fullscreen-section">
		<!-- 뭐 넣을까?? -->
	</div>
</section>
<jsp:include page="../inc/footer.jsp" flush="false" />