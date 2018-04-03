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
    <div id="order">
        <div class="container">
            <div class="row order-content">
                <div class="col-sm-8 col-xs-12 seat_content ph0">
                    <h2>order a ticket</h2>
                    <div class="entry-order-content">
                        <form id="msform" name="msform">
                            <!-- fieldsets -->
                            <fieldset>
                                 <div class="wpc-content">
                                    <h3>location</h3>
                                    <select name="location">
                                        <option>Tenguu Cinema Tysons corner</option>
                                        <option>Tenguu Cinema </option>
                                        <option>Tenguu Cinema corner</option>
                                        <option>Tenguu Cinema Tysons</option>
                                    </select>
                                    <h3 class="mt3">Movie</h3>
                                    <select>
                                        <option>Dead pool</option>
                                        <option>THE BATTLE OF ALGIERS (DI ALGERI)</option>
                                        <option>LORD OF THE RINGS: THE RETURN OF THE KINGS</option>
                                        <option>Tenguu Cinema Tysons corner</option>
                                    </select>
                                    <h3 class="mt3">Date</h3>
                                    <input type='date' class="datetime"/>
                                    <h3 class="mt3">TIME</h3>
                                    <ul class="order-date">
                                        <li><a href="javascript:;"><i>11:50</i></a></li>
                                        <li><a href="javascript:;"><i>13:40</i></a></li>
                                        <li><a href="javascript:;"><i>16:35</i></a></li>
                                        <li><a href="javascript:;"><i>17:30</i></a></li>
                                        <li><a href="javascript:;"><i>19:50</i></a></li>
                                        <li><a href="javascript:;"><i>21:10</i></a></li>
                                    </ul>
                                </div>
                                <input type="button" name="next" class="next action-button" value="Next" />
                            </fieldset>
                            <fieldset class="seat-content">
                                <div class="wpc-content">
                                    <h3 class="seat_title">seat</h3>
                                    <div id="seat-map"></div>
                                    <div id="legend"></div>
                                </div>
                                <input type="button" name="previous" class="action-button previous" value="Previous" />
                                <input type="submit" name="submit" class="submit action-button" value="Submit" />
                            </fieldset>
                        </form>
                    </div>
                </div>
                <div class="col-sm-4 col-xs-12 order_sidebar ph0">
                    <h2>Your Information</h2>
                    <div class="order-details">
                        <span> Location:</span><p id="locationp">Tenguu Cinema Tysons corner</p>
                        <span>Time:</span>  <p>2016.3.8 18:30</p>
                        <span>Seat: </span>
                        <ul id="selected-seats"></ul>
                        <div>Tickets: <span id="counter">0</span></div>
                        <div>Total: <b>$<span id="total">0</span></b></div>
                    </div>
                    <a href="javascript:;" class="close-window"><i class="fa fa-times"></i></a>
                </div>
            </div>
        </div>
    </div>

    <!-- Include jQuery and Scripts -->
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript" src="js/packages.min.js"></script>
    <script type="text/javascript" src="js/scripts.min.js"></script>
	<!-- jQuery plugin -->
	<script src="resources/api/ckeditor/ckeditor.js"></script>
</body>
</html>