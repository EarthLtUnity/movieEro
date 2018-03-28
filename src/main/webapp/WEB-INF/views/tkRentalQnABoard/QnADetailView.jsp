<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="resources/api/ckeditor/ckeditor.js"></script>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<c:set var="board" value="${requestScope.board}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="listCount" value="${requestScope.listCount}" />
<c:set var="list" value="${requestScope.list}" />
<c:set var="member" value="${sessionScope.member}" />
<html>

	 <c:url var="replyUpdate" value="RentalBoardDetail.do">
	<c:param name="bnum" value="${b.RENTAL_BOARD_NO}"/>
	</c:url>
	<c:url var="replyDelete" value="RentalBoardDetail.do">
	<c:param name="bnum" value="${b.RENTAL_BOARD_NO}"/>
	</c:url>
				<script>
    $(document).ready(function(){
    	listReply2();
  
				function listReply2(){
        			$.ajax({
         			   type: "get",
         			   url: "RentalBoardReplyListJson.do?bno=${board.RENTAL_BOARD_NO}",
         			   success: function(result){
         		       console.log(result);
           		        var output = "<ul class="wpc-box-list">";
                			for(var i in result){
                		    output += "<li class="wpc-box-item">";
                		    output += "<ol>";
		  					output +="<li class="bx-item-c">작성자 : "+result[i].MB_ID+"</li>";
		   					output +="<li class="bx-item-title">내용:"+result[i].RENTAL_BOARD_TITLE+"</li>";
		  				    output +="<li class="bx-item-d">"+result[i].RENTAL_BOARD_DATE+"</li>";
		                    output +="<li class="bx-item-m">";	
		    			if(result[i].MB_ID.equals(${member}){
		   				    output +="<a href="${replyUpdate}">수정</a>&nbsp;&nbsp;";
		   				    output +="<a href="${replyDelete}">삭제</a>";
		   				 }	
              			    output += "</ol>";
                		    output += "</li>";
                	}
            			    output += "</ul>";
                $("#listReply2").html(output);
            }
        });
    }
   }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="section-content">

	<div class="section-content pvb0 bg-cover"
		data-bg-image="images/coming-bg.jpg">
		<div class="row"></div>

	</div>

	<div class="fullscreen-section bg-black pvb0">
		<div class="container wpc-boxoffice pv8">
			<div class="row">
				<form class="form-horizontal" role="form" id="editorForm" enctype="multipart/form-data" method="post" action="" >
					<div class="form-group">
						<div class="form-group">
							<div class="col-lg-12">
								<table id="tb">
									<tr>
										<td>제목</td>
										<td><input type="text" readonly value="${board.RENTAL_BOARD_TITLE}"></td>
									</tr>
									<tr>
										<td>작성자</td>
										
										<td><input type="text" readonly value="${board.MB_ID}" ></td>
									</tr>
									<tr>
										<td>내용</td>
										<td><textarea cols="50" rows="7"
												readonly  id="ckeditor">${board.RENTAL_BOARD_CONTENT}</textarea></td>
									</tr>
								<tr>
										 <c:url var="RentalBoardList"
												value="/RentalBoardList.do">
												<c:param name="page" value="1" />
							 	  	 </c:url> 
									 <c:if test="${member eq board.MB_ID}">
									 
								     	<c:url var="bupview" value="RentalBoardUpdateView.do">
        			 					<c:param name="bnum" value="${board.RENTAL_BOARD_NO}"/>
         								<c:param name="page" value="${currentPage}"/>
       							   	 	</c:url>
        					    		<c:url var="bdelete" value="RentalBoardDelete.do">
        						 		<c:param name="bnum" value="${board.RENTAL_BOARD_NO}"/>
        						 		<c:param name="content" value ="${board.RENTAL_BOARD_CONTENT}"/>
        						    	</c:url>
        					            <td colspan="2" align="center"><a href="${bupview}"> <input type= "button" value ="수정하기"></a>
          								<a href="${bdelete}"> <input type= "button" value ="삭제하기"></a>
          								<a href="${RentalBoardList}"><input type= "button" value ="목록으로"></a></td>
      								 	</c:if>
									
							 	  	 <c:if test="${member ne board.MB_ID}">
							 	  	<td colspan="2" align="center"><a href="${RentalBoardList}"><input type= "button" value ="목록으로"></a></td>
							 	  	</c:if>
							 	</tr>
								</table>
							</div>
						</div>	
					</div>
				</form>
				<div id = "listReply"></div>

					
				</div>
				</div>
				</div>
</section>
<jsp:include page="../inc/footer.jsp" flush="false" />
</body>
				<script>
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
</html>