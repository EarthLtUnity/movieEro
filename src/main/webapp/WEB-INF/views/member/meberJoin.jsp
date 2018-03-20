<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp"/>
<c:import url="../inc/header.jsp"/>

<section class="sub_content member_join_wrap">
	<div class="container">
		<div class="row">               
			<h2 class="sub_tit">회원가입</h2>
			<div class="sub_page join_page">
				<form action="./memberInsert.do" method="post" id="frmMemberJoin" name="frmMemberJoin">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" maxlength="10" name="id" id="id">
						<p id="msgCheckId" class="check_txt_check">아이디를 입력 해주세요</p>
					</div>
					<div class="form-group">
					    <label for="pass">비밀번호</label>
					    <input type="password" class="form-control" maxlength="10" name="passwd" id="passwd">
					</div>
					<div class="form-group">
					    <label for="pass">비밀번호 확인</label>
					    <input type="password" class="form-control" maxlength="10" name="passwdChk" id="passwdChk">
						<p id="msgCheckPw" class="check_txt_check">비밀번호를 입력해주세요</p>
					</div>
					<div class="form-group">
					    <label for="id">이름</label>
					    <input type="text" class="form-control" maxlength="10" name="name" id="name">
					</div>
					<div class="form-group">
					    <label for="id">이메일</label>
					    <ul class="li_mail cf">
					    	<li><input type="text" class="form-control" maxlength="10" name="mail" id="mail"></li>
					    	<li>@</li>
					    	<li><input type="text" class="form-control" maxlength="10" name="maildomain" id="maildomain"></li>
					    	<li>
							    <select name="selectMail" id="selectMail" class="select_mail">
							    	<option value="">선택</option>
							    	<option value="google.com">google.com</option>
							    	<option value="naver.com">naver.com</option>
							    	<option value="hanmail.net">hanmail.net</option>
							    	<option value="hotmail.com">hotmail.com</option>
							    </select>					    	
					    	</li>
					    </ul>   
					</div>
					<div class="form-group">
					    <label for="id">전화번호</label>
					    <input type="text" class="form-control" maxlength="11" name="phone" id="phone" placeholder="-없이 입력해주세요">
					</div>
					<div class="text-right">
						<button type=button id="btnJoin" class="btn">회원가입</button>
						<a href="javascript:history.back()" class="btn">메인화면</a>
					</div>
				</form>
	
			</div>
		</div>	
	</div> 
</section>

<c:import url="../inc/footer.jsp"/>