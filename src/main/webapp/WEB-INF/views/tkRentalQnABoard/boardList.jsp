<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp" />
<c:import url="../inc/header.jsp" />

<section class="sub_common_sec block_board">
	<div class="bl_brd_wrap Seungtae_wrap">
		<br><b></b><h1 id="news02">With Me</h1><br>

			<!-- BoardList 투명 창  -->
			<div class="fullscreen-section bg_pale pvb0">
				<div class="container wpc-boxoffice pv8">
					<div class="row">
						<div class="col-sm-7 col-xs-12">
							<h3>board List</h3>
							<br>
							<ul class="wpc-box-list">



								<!-- BoardList 출력 -->
								<li class="wpc-box-item">
									<ol>
										<li class="bx-item-c">3</li>
										<li class="bx-item-title">
											<h4>
												<a href="#" style="color: white">X-Men: Apocalypse</a>
											</h4> <span>Action, thriller</span>
										</li>
										<li class="bx-item-d" ><a href="#" class="join">join</a></li>
										<li class="bx-item-m">1.1m</li>
										<li class="bx-item-m">1.1m</li>
									</ol>
								</li>

								<li class="wpc-box-item">
									<ol>
										<li class="bx-item-c">2</li>
										<li class="bx-item-title">
											<h4>
												<a href="#" style="color: white">X-Men: Apocalypse</a>
											</h4> <span>Action, thriller</span>
										</li>
										<li class="bx-item-d"><a href="#" class="join">join</a></li>
										<li class="bx-item-m">1.1m</li>
										<li class="bx-item-m">1.1m</li>
									</ol>
								</li>

								<li class="wpc-box-item">
									<ol>
										<li class="bx-item-c">1</li>
										<li class="bx-item-title">
											<h4>
												<a href="#" style="color: white">X-Men: Apocalypse</a>
											</h4> <span>Action, thriller</span>
										</li>
										<li class="bx-item-d"><a href="#" class="join">join</a></li>
										<li class="bx-item-m">1.1m</li>
										<li class="bx-item-m">1.1m</li>
									</ol>
								</li>
							</ul>
						</div>


						<!-- 스크롤에 따라 움직이게 감쌈 -->
						<div class="floating">

							<!-- 디테일 & 광고 -->
							<h3>Datail</h3>
							<div class="wpc-testimonails">
								<div class="swiper-container carousel-container">
									<div class="swiper-wrapper">
										<div class="swiper-slide">
											<div class="testimonial">
												<div class="entry-meta">
													<h4>Shela Mathews</h4>
												</div>
												<p>Enthusiastically monetize plug-and-play scenarios
													through quality manufactured products. Monotonectally
													streamline standardized portals after proactive innovation.
													Energistically promote market positioning.</p>
											</div>
										</div>
										<div class="swiper-slide">
											<div class="testimonial">
												<div class="entry-meta">
													<h4>Shela Mathews</h4>
												</div>
												<p>Enthusiastically monetize plug-and-play scenarios
													through quality manufactured products. Monotonectally
													streamline standardized portals after proactive innovation.
													Energistically promote market positioning.</p>
											</div>
										</div>
										<div class="swiper-slide">
											<div class="testimonial">
												<div class="entry-meta">
													<h4>Shela Mathews</h4>
												</div>
												<p>Enthusiastically monetize plug-and-play scenarios
													through quality manufactured products. Monotonectally
													streamline standardized portals after proactive innovation.
													Energistically promote market positioning.</p>
											</div>
										</div>
										<div class="swiper-slide">
											<div class="testimonial">
												<div class="entry-meta">
													<h4>Shela Mathews</h4>
												</div>
												<p>Enthusiastically monetize plug-and-play scenarios
													through quality manufactured products. Monotonectally
													streamline standardized portals after proactive innovation.
													Energistically promote market positioning.</p>
											</div>
										</div>
										<div class="swiper-slide">
											<div class="testimonial">
												<div class="entry-meta">
													<h4>Shela Mathews</h4>
												</div>
												<p>Enthusiastically monetize plug-and-play scenarios
													through quality manufactured products. Monotonectally
													streamline standardized portals after proactive innovation.
													Energistically promote market positioning.</p>
											</div>
										</div>
									</div>
									<div class="swiper-pagination"></div>
								</div>
							</div>
						</div>
						<!-- 스크롤 마침 -->
					</div>
					<!-- row -->
				</div>
				<div align="center">
					<a href="boardInsert" class="btn apply">글쓰기</a>
				</div>
				<br>
				<br>
				<br>

			</div>
	</div>



</section>



<script type="text/javascript" src="js/google-maps.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>

<c:import url="../inc/footer.jsp" />