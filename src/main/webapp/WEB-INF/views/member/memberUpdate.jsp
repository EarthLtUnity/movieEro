<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<section class="sub_content member_join_wrap">
	<div class="container">
		<div class="row">               
			<h2 class="sub_tit">회원수정</h2>
			<div class="sub_page join_page">
				<form action="./memberInsert.do" method="post" id="frmMemberJoin" name="frmMemberJoin">
					<div class="form-group">
						<label for="id">아이디</label>
						<input type="text" class="form-control" name="mb_id" id="mb_id" value="${member}" readonly="readonly">
					</div>
					<div class="form-group">
					    <label for="pass">비밀번호</label>
					    <input type="password" class="form-control" maxlength="20" name="mb_passwd" id="mb_passwd">
					</div>
					<div class="form-group">
					    <label for="pass">비밀번호 확인</label>
					    <input type="password" class="form-control" maxlength="20" name="mb_passwdChk" id="mb_passwdChk">
						<p id="msgCheckPw" class="check_txt_check">비밀번호를 입력해주세요</p>
					</div>
					<div class="form-group">
					    <label for="id">이름</label>
					    <input type="text" class="form-control" maxlength="10" name="mb_name" id="mb_name">
					</div>
					<div class="form-group">
					    <label for="id">이메일</label>
					    <ul class="li_mail cf">
					    	<li><input type="text" class="form-control" maxlength="20" name="mb_mail" id="mb_mail"></li>
					    	<li>@</li>
					    	<li><input type="text" class="form-control" maxlength="20" name="mb_maildomain" id="mb_maildomain"></li>
					    	<li>
							    <select name="mb_selectMail" id="mb_selectMail">
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
					    <input type="text" class="form-control" maxlength="11" name="mb_phone" id="mb_phone" placeholder="-없이 입력해주세요">
					</div>
					<div class="text-right">
						<button type=button id="btnJoin" class="btn">회원정보수정</button>
						<a href="./" class="btn">메인화면</a>
					</div>
				</form>
	
			</div>
		</div>	
	</div> 
</section>

<jsp:include page="../inc/footer.jsp" flush="false" />