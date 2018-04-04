<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />


<c:set var="listCount" value="${requestScope.listCount}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="startPage" value="${requestScope.startPage}"/>
<c:set var="endPage" value="${requestScope.endPage}"/>
<c:set var="maxPage" value="${requestScope.maxPage}"/>
<c:set var="list" value="${requestScope.list}"/>

<section class="block_board" id="board">
<div class="section-content pvb0 bg-cover">

    </div>        
		<div class="fullscreen-section bg-black pvb0">
			<div class="container wpc-boxoffice pv8"><!-- ㄴㄴ -->
				<div class = "row">
					<div class="col-sm-12 col-xs-12">
						<h2 class = "board_title">공지사항 관리자</h2>
						<%-- <form action = "SearchListBuyService.uo" method = "post" class = "text-right">
							<input type = "text" name = "searchList">
							<input type = "submit" value = "검색" class="btn btn btn-info">
						</form> --%>
						<table class="table table-responsive mb50 table-bordered">
						<caption class="sr-only">게시판 제목</caption>
						<colgroup>
							<col width="10%">
							<col width="50%">
							<col width="10%">
							<col width="20%">
							<col width="10%">
						</colgroup>
						<thead>
						<tr class="tr_th">
							<th><strong class="bd_num">번호</strong></th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
							<th>조회수</th>
						</tr>
						</thead>
						<tbody>
						<%-- 게시글 리스트 뽑아오기 for문 --%>
						<c:forEach var="n" items="${list}">	
						
							<tr><td align="center">${n.NOTICE_BOARD_NO}</td>
							<td>
								<c:url var="bdetail" value="/bdetail.do">
									<c:param name="NOTICE_BOARD_NO" value="${n.NOTICE_BOARD_NO}"/>
									<c:param name="page" value="${currentPage}"/>
								</c:url>
								<a href="./noticeDetail.do?NOTICE_BOARD_NO=${n.NOTICE_BOARD_NO}">${n.NOTICE_BOARD_TITLE}</a>
							</td>
							<td align="center">${n.MB_ID}</td>
							<td align="center">${n.NOTICE_BOARD_DATE}</td>
							<td align="center">${n.NOTICE_BOARD_READCNT}</td>
							<td align="center">
								<c:if test="${!empty b.boardOriginalFileName}">
									 ◎
								</c:if><c:if test="${empty b.boardOriginalFileName}">
									&nbsp;
								</c:if>
							</td></tr>
						</c:forEach>
						
						</tbody>
					</table>
					<div class="text-right">
						<a href = "noticeInsertForm.do" class="btn btn-primary">글쓰기</a>
					</div>
				</div>
			</div>
					</div>
				</div>
			</div>
	</div>
</section>


<c:import url="../inc/footer.jsp" />