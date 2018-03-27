<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<c:set var="nvo" value="${requestScope.noticeVO}"/>

<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />
<section class="block_board" id="board">
	<div class="Jaekyeom_wrap">
		<div class="bl_brd_wrap">
					<h1>      asd  </h1>
					<h3 class="widget-title">공지사항 게시글 작성</h3>
					<form action="./noticeBoardModify.do" method="get" enctype="multipart/form-data">
						<div class="row">
							<div class="col-sm-12">
								<input type="text" class="form-control" name="MB_ID" placeholder="Title" value = "${nvo.MB_ID}">
								<input type="text" class="form-control" name="NOTICE_BOARD_TITLE" placeholder="Title" value = "${nvo.NOTICE_BOARD_TITLE}">
								<textarea class="form-control" name = "NOTICE_BOARD_CONTENT" placeholder="Content">${nvo.NOTICE_BOARD_CONTENT}</textarea>
								<input type="hidden" name = "NOTICE_BOARD_NO" value = "${nvo.NOTICE_BOARD_NO}">
							</div>
							<div class="col-sm-12 ">
								<input type="submit" class="button fill rectangle" value="작성"/>
							</div>
					<h1>       asd </h1>
						</div>
					</form>
					<div class="errorMessage"></div>
		</div>
	</div>
</section>

<c:import url="../inc/footer.jsp" />




