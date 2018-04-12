<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="sticky-menu">
    <div id="loader">
        <div class="loader-ring">
          <div class="loader-ring-light"></div>
          <div class="loader-ring-track"></div>
        </div>
    </div>
    <div class="wrapper" id="wrap">
    
<header id="header" class="menu-top-left">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-6 col-xs-4">
				<h1><a href="./" id="logo" title="Tenguu" class="logo-image" data-bg-image="images/common/logo.png">Movie愛路</a></h1>		
				<nav class="nav" id="headerNav">
					<ul class="cf">
						<li><a href="movieList.do">Movie</a>
							<ul class="dep2">
								<li><a href="movieList.do">영화 목록</a></li>
							</ul>
						</li>
						<li><a href="#">Hall</a>
							<ul class="dep2">
								<li><a href="RentalService.do">상영관 대관</a></li>
								<li><a href="RentalBoardList.do">대관 문의</a></li>
							</ul>						
						</li>
						<li><a href="#">Community</a>
							<ul class="dep2">
								<li><a href="notice.do">공지사항</a></li>
								<li><a href="withBoadIntro.do">같이보기</a></li>
								<li><a href="freeBoadList.do">자유게시판</a></li>
							</ul>						
						</li>
					</ul>
				</nav>
			</div>
			<div class="header_menu col-md-4 col-sm-6 col-xs-8 phl0">
				<div class="header_author">
					<c:set var="memberID" value="${memberID}" />
					<%-- 로그인 여부로 보여지는 메뉴 --%>
					<c:choose>
						<c:when test="${empty memberID}">
							<span id="beforeLoginMenu">
								<a href="#" data-target="#loginPopup" data-toggle="modal" id="signInUp">Sign in/up</a>
							</span>
						</c:when>
						<c:otherwise>
							<span id="afterLoginMenu">
								<a href="mypage.do">${memberID}</a>
								<a href="signOut.do">Sign Out</a>
								<img src="images/temp_user.jpg" class="user" alt="">
							</span>
						</c:otherwise>
					</c:choose>
					<%-- ajax로 호출시 보여지는 메뉴 --%>
					<span id="ajaxLoginMenu" style="display:none">
						<a href="mypage.do" id="ajaxLoginId"></a>
						<a href="signOut.do">Sign Out</a>
						<img src="images/temp_user.jpg" class="user" alt="">
					</span>
				</div>
				<div class="header_ticket">
					<a href="#order" class="order_btn">Ticket</a>
					<span>3</span>
				</div>
				<!-- <a href="javascript:;" id="header-search"></a> -->
				<div class="button_container" id="toggle">
					<span class="top"></span>
					<span class="middle"></span>
					<span class="bottom"></span>
				</div>
				<div class="overlay" id="overlay">
					<a href="javascript:;" class="close-window"></a>
					<nav class="overlay-menu">
						<ul>
							<li ><a href="./">Home</a></li>
							<li><a href="loadMovie.do">Movie</a></li>
							<li><a href="#">Hall</a></li>
							<li><a href="#">Community</a></li>
							<li><a href="#order" class="order_btn">Ticket</a></li>
						</ul>
					</nav>
				</div>            
			</div>
		</div>
	</div>
</header>   

<!-- 로그인 모달창 -->
<div class="modal fade" id="loginPopup" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<!-- 닫기(x) 버튼 -->
				<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
				<h4 class="modal-title">Login</h4>
			</div>
			
			<!-- <form action="./" method="post" id="frmLoginModal" name="frmLoginModal"> -->
				<div class="modal-body">
					<!-- 로그인 폼 -->
					<div class="form-group">
					    <label for="login_id">ID</label>
					    <input type="text" class="form-control" size="10" name="login_id" id="login_id">
					</div>
					<div class="form-group">
					    <label for="login_pass">비밀번호</label>
					    <input type="password" class="form-control" size="20" name="login_pw" id="login_pw">
					</div>
				</div>

				<div class="modal-footer">
					<a href="join.do" class="btn">회원가입</a>
					<button type="button" id="btnLogin" class="btn">로그인</button>
				</div>
			<!-- </form> -->
		</div>
	</div>
</div>
<!--// 로그인 모달창 -->

<!-- 윙배너 -->
<div class="wing_banner_wrap">
	<h2>최근본 목록</h2>
	<div id="wingBanner">	
	</div>
</div>
<!--// 윙배너 -->