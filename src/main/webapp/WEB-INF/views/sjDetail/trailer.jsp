<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<style>
.cf:after{display: block; content: ''; clear: both;}
.tab_menu{margin: 10px 0 20px 0;}
.tab_menu li{float: left; width: 33.333%; text-align: center; padding: 10px 0; background-color: #c1c1c1; list-style:none; border-radius: 5px;}
.tab_menu li.on{background-color: #03a9f4}
.tab_menu li a{display: block; color: #fff; font-weight: bold;}
</style>
<div class="container-fluid">
	<div class="row-fluid">
	    <!-- form -->
		<form role="form">
		 <!--/span-->
			<div class="span9" id="content">
				<div class="row-fluid">
				   	<!-- block -->
					<div class="block">
					    <div class="navbar navbar-inner block-header">
					        <div class="muted pull-left">메인화면 리스트</div>
					    </div>
					    <div class="tab_menu">
					    	<ul class="cf">
					    		<li class="on"><a href="summary.do">영화 개요</a></li>
					    		<li><a href="trailer.do">트레일러</a></li>
					    		<li><a href="review.do">영화 리뷰</a></li>
					    	</ul>
					    </div>
						<div class="block-content collapse in">
							<div class="span12">
								<div class="table-toolbar" style="margin-bottom:14px;">
									<div class="btn_board">
										<!-- <a class="btn" href=""><i class="icon-eye-open"></i>목록</a> -->
										<!-- <a class="btn btn-inverse" href=""><i class="icon-refresh icon-white"></i>수정</a> -->
										<a class="btn btn-primary" href=""><i class="icon-pencil icon-white"></i>추가</a>
										<!-- <a class="btn btn-danger" href=""><i class="icon-remove icon-white"></i>삭제</a> -->
									</div>
								</div>
								<table id="movieListTable" border="0" class="table table-striped table-bordered">
									<colgroup>
										<col width="35%">
										<col width="50%">
										<col width="15%">
									</colgroup>
									<thead>
										<tr>
											<th>영화제목</th>
											<th>이미지주소</th>
											<th>등록여부</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
									    	<td><a href="visualView.do">view페이지로 이동</a></td>
									    	<td></td>
									    	<td><input type="text" value="미등록" readOnly></td>
										</tr>
										<c:set var="movieListResult" value="${requestScope.movieList}" /> 
										<c:forEach var="listMap" items="${movieListResult}">
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				<!-- /block -->
				</div>
			</div>
		</form>
	</div>
</div>

<jsp:include page="../inc/footer.jsp" flush="false" />