<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />

<c:set var="rvo" value="${requestScope.noticeReplyVO}"/>
<c:set var="nvo" value="${requestScope.noticeVO}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="ID" value="${sessionScope.member}"/>

<section class="block_board" id="board">
	<div class="Jaekyeom_wrap">
		<table class="table table-responsive table-bordered">
					<caption class="sr-only">게시판 제목</caption>
					<colgroup>
						<col width="24%">
						<col width="50%">
						<col width="20%">
						<col width="6%">
					</colgroup>
					<thead>
						<tr valign="middle" class="tr_th">
							<th colspan="4">구매하기 게시판 본문글</th>
						</tr>	
					</thead>
					<tbody>
						<tr>
							<td>
								<div>작성자</div>
							</td>	
							<td colspan="3" class = "tit">
								${nvo.MB_ID}
							</td>
						</tr>	
						<tr>
							<td>
								<div>제 목</div>
							</td>		
							<td colspan="3" class = "tit">
								${nvo.NOTICE_BOARD_TITLE}
							</td>
						</tr>	
						<tr>
							<td>
								<div>내 용</div>
							</td>		
							<td colspan="3">		
							 <textarea name="BOARD_CONTENT" class = "textarea_content" readonly>
								 ${nvo.NOTICE_BOARD_CONTENT}
							 </textarea>

							</td>			
						</tr>
						<c:if test="${!empty rvo}">
							<c:forEach var="reply" items="${rvo}">
							<tr>
								<td>
									${reply.MB_ID}
								</td>
								<td colspan = "2">
									${reply.NOTICE_REPLY_CONTENT}
								</td>
								<td>
								<c:if test="${reply.MB_ID eq ID}">
									<button >삭제</button>
								</c:if>
								</td>
							</tr>
							</c:forEach>
						</c:if>	
			<%-- 답변, 수정, 삭제, 목록의 링크를 표시합니다. --%>
					</tbody>
				</table>
				<form action="./noticeReplyInsert.do" method="get" enctype="multipart/form-data">
					<table>
						<tr>
							<td>
								<div>댓글</div>
							</td>
							<td colspan="2">
							<input type="hidden" name="NOTICE_BOARD_NO" value="${nvo.NOTICE_BOARD_NO}">
							<input type="hidden" name="MB_ID" value="${nvo.MB_ID}">
							<input Type="text" name="NOTICE_REPLY_CONTENT">
							</td>
							<td>
							<input type="submit" value="등록">
							</td>
						</tr>
					</table>
				</form>
		<a href="noticeModifyForm.do?NOTICE_BOARD_NO=${nvo.NOTICE_BOARD_NO}" class="btn btn-primary">수정</a>
				<a href="noticeDeleteForm.do?NOTICE_BOARD_NO=${nvo.NOTICE_BOARD_NO}" class="btn btn-primary">삭제</a>
				<a href="noticeAdmin.do" class="btn btn-primary">목록으로</a>
	</div>
</section>




<c:import url="../inc/footer.jsp"/>