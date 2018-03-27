<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp"/>
<c:import url="../inc/header.jsp"/>
<script>
	alert("로그인한 회원만 이용 가능합니다");
	location.href="";
</script>			

<section class="sub_content member_join_wrap">
	<div class="container">
		<div class="row">               
			<h2 class="sub_tit">비회원 접근거부</h2>
		</div>	
	</div> 
</section>

<c:import url="../inc/footer.jsp"/>