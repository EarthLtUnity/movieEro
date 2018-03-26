<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />

<script>
	function noticeInsertForm(){
		location.href = "noticeInsertForm.do"
	};
</script>
<section class="block_board" id="board">
	<div class="Jaekyeom_wrap">
		<div class="bl_brd_wrap">
			<h1 id="news02">공지사항</h1>
			<input type = "button" class = "btn mls20" value = "글쓰기" onclick="noticeInsertForm();"/>
			<ul class="cf">
				
				
				<!-- ROWNUM을 사용해서 ROWNUM이 3으로 나누어서 나머지가 1인경우 첫번째 새로줄에 추가 -->
				<li><%-- 첫번째 새로 줄 --%>					
							<div class="bl_brd_box">
								<h2>
								<a href="#" style="color:#ddd;">Watch Rob Cohen’s action-packed “The Hurricane Heist” in 4DX</a>
								</h2>
								<div class="bl_brd_img">
									<a href="#"><img src="http://www.cj4dx.com/editor/upload/img/1520927158.jpg" alt=""></a>
								</div>
								<p>
									<a href="#" style="color:#666;">&#65279;Watch Rob Cohen’s action-packed “The Hurricane Heist” in 4DX&#65279;Car chase scenes, amped by 4DX motion and vibration+ 4DX environmental effect, crea...</a>					
								</p>
								<a href="#" class="bl_brd_more">MORE</a>
								<ul class="bl_brd_sns cf">
									<li><a href="#" target="_blank">&nbsp;</a></li>
									<li><a href="#" target="_blank">&nbsp;</a></li>
									<!--<li><a href="#" target="_blank"><span class="skip">go instagram</span></a></li>
									<li><a href="#" target="_blank"><span class="skip">go youtube</span></a></li>
									<li><a href="#" target="_blank"><span class="skip">go ??</span></a></li>-->
								</ul>
							</div>
						</li>
						<%-- 첫번째 새로줄 끝 --%>
						
						<!-- ROWNUM을 사용해서 ROWNUM이 3으로 나누어서 나머지가 2인경우 두번째 새로줄에 추가 -->
						<%-- 두번째 새로줄 시작 --%>
						<li>					
							<div class="bl_brd_box">
								<h2>
								<a href="#" style="color:#ddd;">Blast from the Past in 4DX, &lt;Tomb Raider&gt; Action + Adventure continues</a>
								</h2>
								<div class="bl_brd_img">
									<a href="#"><img src="http://www.cj4dx.com/editor/upload/img/1520556116.jpg" alt=""></a>
								</div>
								<p>
									<a href="#" style="color:#666;">

Blast from the Past in 4DX, Tomb Raider Action +
Adventure continues

This is the ultimate 4DX flick’- the start of
the most dangerous adventure in...</a>					
								</p>
								<a href="#" class="bl_brd_more">MORE</a>
								<ul class="bl_brd_sns cf">
									<li><a href="#" target="_blank">&nbsp;</a></li>
									<li><a href="#" target="_blank">&nbsp;</a></li>
									<!--<li><a href="#" target="_blank"><span class="skip">go instagram</span></a></li>
									<li><a href="#" target="_blank"><span class="skip">go youtube</span></a></li>
									<li><a href="#" target="_blank"><span class="skip">go ??</span></a></li>-->
								</ul>
							</div>
						</li>
						<%-- 두번째 새로줄 끝 --%>

						<!-- ROWNUM을 사용해서 ROWNUM이 3으로 나누어서 나머지가 0인경우 첫번째 새로줄에 추가 -->
						<%-- 세번째 새로줄 시작 --%>
						<li>					
							<div class="bl_brd_box">
								<h2>
								<a href="#" style="color:#ddd;">"Black Panther" to Become First Marvel Studios Film to be Released in the ScreenX Format </a>
								</h2>
								<div class="bl_brd_img">
									<a href="#"><img src="http://www.cj4dx.com/editor/upload/img/1518575713.jpg" alt=""></a>
								</div>
								<p>
									<a href="#" style="color:#666;">

Black
Panther to Become First Marvel Studios Film to be
Released in the ScreenX Format

Newest
Marvel Studios Release to be Available in the Immersi...</a>					
								</p>
								<a href="#" class="bl_brd_more">MORE</a>
								<ul class="bl_brd_sns cf">
									<li><a href="#" target="_blank">&nbsp;</a></li>
									<li><a href="#" target="_blank">&nbsp;</a></li>
									<!--<li><a href="#" target="_blank"><span class="skip">go instagram</span></a></li>
									<li><a href="#" target="_blank"><span class="skip">go youtube</span></a></li>
									<li><a href="#" target="_blank"><span class="skip">go ??</span></a></li>-->
								</ul>
							</div>
						</li>	
						<%-- 세번째 새로줄 끝 --%>
						
				
			</ul>
			<div class="btn_brd_wrap">
				<button class="btn_brd_prev">PREV</button>
				<button class="btn_brd_next">NEXT</button>
			</div>

			<div class="paging_wrap">
				<div class="paging">
					<ol>
						<li><a class="active">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">6</a></li>
					</ol>
				</div>
			</div>

		</div>

	</div>
</section>
<c:import url="../inc/footer.jsp" />
