<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<section class="sub_content common_board_wrap">
	<!-- 여기부터가 "게시판 뷰 페이지" 소스임 -->
	<div class="container">
	    <div class="common_board_view">
	        <h1 class="sub_tit">뷰 페이지</h1>   
	        <table class="table table-responsive">
	            <caption class="sr-only">게시판 제목</caption>
	            <colgroup>
	                <col width="30%">
	                <col width="15%">
	                <col width="15%">
	                <col width="15%">
	                <col width="15%">
	                <col width="10%">
	            </colgroup>
	            <tbody>
	                <tr>
	                    <th>아이디</th>
	                    <td colspan="5" class="lft"><input type="text" class="form-control ro_bd_writer" name="id" maxlength="20" value="kjm" readonly="readonly"/></td>
	                </tr>
	                <tr>
	                    <th>제목</th>
	                    <td colspan="5" class="lft"><input type="text" class="form-control bd_tit" name="subject" id="wrtSubject" value="게시판 뷰페이지 입니다" maxlength="50" /></td>
	                </tr>
	                <tr>
	                    <th>날짜</th>
	                    <td class="lft">2018-03-18</td>
	                    <th>조회수</th>
	                    <td class="lft">777</td>
	                    <th>답글수</th>
	                    <td class="lft">0</td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <td colspan="5">
	                        <textarea name="ckeditorNoti" id="ckeditorNoti" rows="10" cols="80">
	                            ckEditor로 글 쓴 내용 불러올꺼니깐<br>
	                            ckEditor 라이브러리 사용법 잘 찾아봐라
	                        </textarea>                    
	                        <script>
	                            CKEDITOR.replace('ckeditorNoti');
	                            var ckContent = CKEDITOR.instances.ckeditorNoti
	                            ckContent.getData();			
	                        </script>                    
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	    </div>
	</div>
</section>

<!-- 혼자만 사용할 Javascript 라이브러리 파일 위치(이 밑에 추가) -->
<!-- <script type="text/javascript" src="js/파일명.js"></script> -->
<jsp:include page="../inc/footer.jsp" flush="false" />