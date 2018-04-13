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
<c:set var="member" value="${sessionScope.memberID}" />
<html>

<script>
var bno = '${board.RENTAL_BOARD_NO}'; //게시글 번호
var bname = '${member}';
$(function(){
	$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	
	    var insertData = $('#RENTAL_BOARD_REPLY_CONTENT').val();
		if(""==insertData){
		alert("댓글을 입력해주세요");
		}  
		else{
	    commentInsert(insertData); //Insert 함수호출(아래)
		}
	});
});

//댓글 목록 
function commentList(){
    $.ajax({
        url : 'list.do',
        type : 'get',
        data : {RENTAL_BOARD_RE_NO:bno},
        success : function(replylist){
        
            var a =''; 
            for(var i = 0; i<replylist.length; i++){
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+replylist[i].rental_BOARD_REPLY_NO+'">'+'댓글번호 : '+replylist[i].rental_BOARD_REPLY_NO+' / 작성자 : '+replylist[i].mb_ID
                     +' /작성일자:'+replylist[i].rental_BOARD_REPLY_DATE;
                a += '<a onclick="commentUpdate('+replylist[i].rental_BOARD_REPLY_NO+',\''+replylist[i].rental_BOARD_REPLY_CONTENT+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+replylist[i].rental_BOARD_REPLY_NO+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+replylist[i].rental_BOARD_REPLY_NO+'"> <p> 내용 : '+replylist[i].rental_BOARD_REPLY_CONTENT +'</p>';
                a += '</div></div>';
            }
         
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : 'insert.do',
        type : 'post',
        data : {RENTAL_BOARD_REPLY_CONTENT : insertData,
        	    RENTAL_BOARD_RE_NO: bno,
        	    MB_ID : bname	
        	},
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(RENTAL_BOARD_REPLY_NO, RENTAL_BOARD_REPLY_CONTENT){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+RENTAL_BOARD_REPLY_NO+'" value="'+RENTAL_BOARD_REPLY_CONTENT+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+RENTAL_BOARD_REPLY_NO+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+RENTAL_BOARD_REPLY_NO).html(a);
    
}

//댓글 수정
function commentUpdateProc(RENTAL_BOARD_REPLY_NO){
	
    var updateContent = $('[name=content_'+ RENTAL_BOARD_REPLY_NO+']').val();
	console.log("이거출력이되나");
	console.log(RENTAL_BOARD_REPLY_NO); 
	console.log(updateContent);
    $.ajax({
        url : 'update.do',
        type : 'post',
        data : {'RENTAL_BOARD_REPLY_CONTENT' : updateContent, 
        	    'RENTAL_BOARD_REPLY_NO' : RENTAL_BOARD_REPLY_NO},
        success : function(data){
        	alert("수정되었습니다.");
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}

//댓글 삭제 
function commentDelete(RENTAL_BOARD_REPLY_NO){
    $.ajax({
        url : 'delete.do',
        type : 'post',
        data : {'RENTAL_BOARD_REPLY_NO' : RENTAL_BOARD_REPLY_NO},
        success : function(data){
        	alert("삭제되었습니다.");
            if(data == 1) commentList(bno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
$(document).ready(function(){
    commentList();
});
 

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
			<div class="row" >
				<form  class="form-horizontal" role="form" id="editorForm" enctype="multipart/form-data" method="post" action="" >
					<div class="form-group">
						<div class="form-group" style= "padding-top: 150px;">
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
	 <div class="container">
        <div class="commentList"></div>
    </div>
  		<div style="width:650px; text-align: center;"><br>
  			 <div class="container">
     			   <label for="content">comment</label>
      		     <form name="commentInsertForm">
           	    	 <div class="input-group">
           	    		 <input type="text" class="form-control" id="RENTAL_BOARD_REPLY_CONTENT" name="content" placeholder="내용을 입력하세요.">
             	 		 <span class="input-group-btn">
              				 <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
             	 		 </span>
         		 	 </div>
        		</form>
   		    </div>
  		 </div>
	 </div>
   </div>
</div>

</section>
<jsp:include page="../inc/footer.jsp" flush="false" />
</body>
				<script>
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
				</script>
</html>