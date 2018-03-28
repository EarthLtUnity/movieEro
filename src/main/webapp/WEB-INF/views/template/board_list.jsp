<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../inc/head.jsp" flush="false" />
<jsp:include page="../inc/header.jsp" flush="false" />

<section class="sub_content common_board_wrap">
	<!-- 여기부터가 "게시판 리스트" 페이지 소스임 -->
	<div class="container">
	    <div class="common_board_list">
	        <h1 class="sub_tit">리스트 페이지</h1>
	        <form class="form-inline" action="" method="get" >
	            <div class="text-right mb30">
	                <input type="text" class="form-control" name="" id="">
	                <input type="button" class="btn" name="" id="" value="검색">
	            </div>
	            <table class="table table-responsive mb50" summary="게시판 설명">
	                <caption class="sr-only">게시판 제목</caption>
	                <colgroup>
	                    <col width="10%">
	                    <col width="50%">
	                    <col width="10%">
	                    <col width="20%">
	                    <col width="10%">
	                </colgroup>
	                <thead>
	                    <tr class="tr_th">
	                        <th scope="col">번호</th>
	                        <th scope="col">제목</th>
	                        <th scope="col">첨부</th>
	                        <th scope="col">작성일</th>
	                        <th scope="col">조회수</th>
	                    </tr>													
	                </thead>
	                <tbody>
	                    <tr>
	                        <td><strong class="bd_noti">공 지</strong></td>
	                        <td class="tit"><a href="#">아르미 공지사항 </a></td>
	                        <td><i class="fa fa-file"></i></td> 
	                        <td>2018-02-06</td>
	                        <td>109</td>
	                    </tr>
	                    <tr>
	                        <td><strong class="bd_num">13</strong></td>
	                        <td class="tit"><a href="#">아르미 게시물 제목</a></td>
	                        <td><i class="fa fa-file"></i></td> 
	                        <td>2018-01-18</td>
	                        <td>173</td>
	                    </tr>
	                    <tr>
	                        <td><strong class="bd_num">12</strong></td>
	                        <td class="tit"><a href="#">아르미 게시물 제목</a></td>
	                        <td><i class="fa fa-file"></i></td> 
	                        <td>2018-01-18</td>
	                        <td>173</td>
	                    </tr>
	                    <tr>
	                        <td><strong class="bd_num">11</strong></td>
	                        <td class="tit"><a href="#">아르미 게시물 제목</a></td>
	                        <td><i class="fa fa-file"></i></td> 
	                        <td>2018-01-18</td>
	                        <td>173</td>
	                    </tr>
	                    <tr>
	                        <td><strong class="bd_num">10</strong></td>
	                        <td class="tit"><a href="#">아르미 게시물 제목</a></td>
	                        <td><i class="fa fa-file"></i></td> 
	                        <td>2018-01-18</td>
	                        <td>173</td>
	                    </tr>
	    
	                </tbody>
	            </table>
	            
	            <!-- 페이징 -->
				<div class="post-navigation mv3">
                    <ul>
                    	<li><a href="#" class="arrow">«</a></li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#" class="arrow">»</a></li>
                    </ul>
                </div>	  
	            <!--// 페이징 -->
                          
	            <div class="board_btn_wrap text-right">
	                <input type=submit value="버튼" class="btn">
	            </div>
	        </form>
	    </div>
	</div>
</section>
<!-- 혼자만 사용할 Javascript 라이브러리 파일 위치(이 밑에 추가) -->
<!-- <script type="text/javascript" src="js/파일명.js"></script> -->
<jsp:include page="../inc/footer.jsp" flush="false" />