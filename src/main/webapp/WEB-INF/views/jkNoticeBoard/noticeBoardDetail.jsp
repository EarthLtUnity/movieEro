<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />


<c:set var="nvo" value="${requestScope.noticeVO}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>


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
						
			<%-- 답변, 수정, 삭제, 목록의 링크를 표시합니다. --%>
					</tbody>
				</table>
				<a href="noticeModifyForm.do?NOTICE_BOARD_NO=${nvo.NOTICE_BOARD_NO}" class="btn btn-primary">수정</a>
	</div>
</section>




<c:import url="../inc/footer.jsp"/>