<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<footer id="footer" class="footer">
		<div class="ft_top">
			<div class="ft_newletter">
				<div class="ipt_wrap">
					<form action="" name="" method="post">
						<div class="ipt_hide">
							<input type="text" placeholder="우편번호" value="" class="zipPost">
						</div>
						<div class="ipt_view">
							<p>Warning Text</p>
							<input type="text" placeholder="뉴스레터를 구독할 이메일 기입란" value="" name="email" class="eNewsletter">
						</div>
						<div class="ipt_btn">
							<input type="button" id="btnNewletter" value="" class="submit_newsletter">
						</div>
					</form>
					
				</div>
			</div>
			<div class="fnb_menu cf">
				<div class="lft_fnb">
					<p>서울시 강남구 도산대로 156 아르미(논현동)</p>
					<p>대표자명 김종민 | 개인정보보호 책임자 서진</p>
				</div>
            				
				<div class="rgh_fnb">
					<p>ARS 1544-1234</p>
					<p>사업자등록번호 123-45-6789</p>
				</div>
			</div>
		</div>
		<div class="ft_btm">
			<div class="ft_4dx">
				<a href="#"></a>
			</div>
			<div class="ft_copy">
				<p class="copyright">Copyright(c) 아르미. All rights reserved.</p>
			</div>
			<div class="ft_cj">
				<a href="#"></a>
			</div>
		</div>
	</footer>

    </div>
    <!-- Overlay Search -->
    <div id="overlay-search">
        <form method="get" action="./">
            <input type="text" name="s" placeholder="Search..." autocomplete="off">
            <button type="submit">
                <i class="fa fa-search"></i>
            </button>
        </form>
        <a href="javascript:;" class="close-window"></a>
    </div>

	<!-- 영화 결제 파트 -->
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<jsp:include page="reserve.jsp"/>
  
  
    <!-- Default Query plugin -->
    <script type="text/javascript" src="js/packages.min.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
	<!-- jQuery plugin -->
	<script src="resources/api/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="js/slick.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<!-- main script -->    
    <script type="text/javascript" src="js/main.js"></script>
</body>
</html>