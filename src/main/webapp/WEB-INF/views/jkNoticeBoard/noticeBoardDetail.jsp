<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />

<%-- <c:set var="rvo" value="${requestScope.noticeReplyVO}"/> --%>
<c:set var="nvo" value="${requestScope.noticeVO}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="ID" value="${sessionScope.member}"/>

<section class="section-content">

	<div class="section-content pvb0 bg-cover"
		data-bg-image="images/coming-bg.jpg">
		<div class="row"></div>

	</div>

	<div class="fullscreen-section bg-black pvb0">
		<div class="container wpc-boxoffice pv8">
			<div class="row">
				<form style= "padding-top: 150px;" class="form-horizontal" role="form" id="editorForm" enctype="multipart/form-data" method="post" action="" >
					<div class="form-group">
						<div class="form-group">
							<div class="col-lg-12">
								<table id="tb">
									<tr>
										<td>제목</td>
										<td><input type="text" readonly value="${nvo.NOTICE_BOARD_TITLE}"></td>
									</tr>
									<tr>
										<td>작성자</td>
										
										<td><input type="text" readonly value="${nvo.MB_ID}" ></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea cols="50" rows="7"
												readonly  id="ckeditor">${nvo.NOTICE_BOARD_CONTENT}</textarea></td>
									</tr>
								<tr>
										 <c:url var="RentalBoardList"
												value="/RentalBoardList.do">
												<c:param name="page" value="1" />
							 	  	 </c:url> 
									 <c:if test="${ID eq nvo.MB_ID}">
									 
								     	<c:url var="bupview" value="RentalBoardUpdateView.do">
        			 					<c:param name="bnum" value="${nvo.NOTICE_BOARD_NO}"/>
         								<c:param name="page" value="${currentPage}"/>
       							   	 	</c:url>
        					    		<c:url var="bdelete" value="RentalBoardDelete.do">
        						 		<c:param name="bnum" value="${nvo.NOTICE_BOARD_NO}"/>
        						 		<c:param name="content" value ="${nvo.NOTICE_BOARD_CONTENT}"/>
        						    	</c:url>
        					            <td colspan="2" align="center"><a href="noticeModifyForm.do?NOTICE_BOARD_NO=${nvo.NOTICE_BOARD_NO}"> <input type= "button" value ="수정하기"></a>
          								<a href="noticeDeleteForm.do?NOTICE_BOARD_NO=${nvo.NOTICE_BOARD_NO}"> <input type= "button" value ="삭제하기"></a>
          								<a href="notice.do"><input type= "button" value ="목록으로"></a></td>
      								 	</c:if>
									
							 	  	 <c:if test="${ID ne nvo.MB_ID}">
							 	  	<td colspan="2" align="center"><a href="${RentalBoardList}"><input type= "button" value ="목록으로"></a></td>
							 	  	</c:if>
							 	</tr>
								</table>
							</div>
						</div>	
					</div>
				</form>
    </div>
   			 </div>
				</div>
</section>



<c:import url="../inc/footer.jsp"/>