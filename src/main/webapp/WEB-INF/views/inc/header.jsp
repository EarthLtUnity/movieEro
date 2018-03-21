<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body class="sticky-menu">
    <div id="loader">
        <div class="loader-ring">
          <div class="loader-ring-light"></div>
          <div class="loader-ring-track"></div>
        </div>
    </div>
    <div class="wrapper">
    
<header id="header" class="menu-top-left">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-6 col-xs-4">
				<a href="./" id="logo" title="Tenguu" class="logo-image" data-bg-image="images/common/logo.png">Tenguu</a>
				<nav class="nav" id="headerNav">
					<ul class="cf">
						<li><a href="#">Movie</a>
							<ul class="dep2">
								<li><a href="#">평점</a></li>
								<li><a href="#">영화 개요</a></li>
								<li><a href="#">줄거리</a></li>
								<li><a href="#">스틸컷</a></li>
							</ul>
						</li>
						<li><a href="#">Hall</a>
							<ul class="dep2">
								<li><a href="#">상영관 대관</a></li>
								<li><a href="#">대관 문의</a></li>
							</ul>						
						</li>
						<li><a href="#">Community</a>
							<ul class="dep2">
								<li><a href="#">같이보기</a></li>
								<li><a href="#">게시판</a></li>
							</ul>						
						</li>
					</ul>
				</nav>
			</div>
			<div class="header_menu col-md-4 col-sm-6 col-xs-8 phl0">
				<div class="header_author">
					<a href="#" data-target="#loginPopup" data-toggle="modal" class="">Sign in/up</a>
					<!-- <a href="#">jongmin</a> -->
					<!-- <img src="images/user.png" class="user" alt="user"> -->
				</div>
				<div class="header_ticket">
					<a href="#order" class="order_btn">My tickets</a>
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
							<li><a href="blog.html">Blog</a></li>
							<li><a href="single.html">Single</a></li>
							<li><a href="#order" class="order_btn">Order</a></li>
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
					    <label for="id">ID</label>
					    <input type="text" class="form-control" size="10" name="id" id="id">
					</div>
					<div class="form-group">
					    <label for="pass">비밀번호</label>
					    <input type="password" class="form-control" size="20" name="passwd" id="passwd">
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
