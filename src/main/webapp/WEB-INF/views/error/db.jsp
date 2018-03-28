<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp"/>
<c:import url="../inc/header.jsp"/>
<script>
	alert("데이터베이스 에러가 발생했습니다. 관리자에게 문의하세요");
	history.back();
	//location.href=""
</script>			

<section class="sub_content member_join_wrap">
	<div class="container">
		<div class="row">               
			<h2 class="sub_tit">데이터베이스 에러</h2>
		</div>	
	</div> 
</section>

<c:import url="../inc/footer.jsp"/>