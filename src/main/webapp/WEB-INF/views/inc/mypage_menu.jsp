<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="reserveCnt" value="${requestScope.reserveCnt }"/>
<c:set var="listcount" value="${requestScope.listcount }"/>
<ul>
	<li>
		<div class="mypage_user_pic">
			<img src="images/common/ico_person.png" alt="" />
		</div>
		<p>김종민 님 / <a href="memberModifyForm.do">회원정보수정</a></p>
	</li>
	<li><a href="mypage.do"><strong>${reserveCnt}</strong><br>영화결제내역</a></li>
	<li><a href="#"><strong>3</strong><br>모임정보</a></li>
	<li><a href="myrentalinfo.do"><strong>${listcount}</strong><br>대관정보</a></li>
</ul>
