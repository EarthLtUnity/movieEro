<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp"/>
<c:import url="../inc/header.jsp"/>

<!-- fullwidth-slider -->
<div class="fullwidth-slider">
    <div id="headerslider" class="carousel slide"> 
        <ol class="carousel-indicators">
            <li data-target="#headerslider" data-slide-to="0" class="active"></li>
            <li data-target="#headerslider" data-slide-to="1"></li>
            <li data-target="#headerslider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <div class="fill" data-bg-image="images/bg/main_bg01.jpg">
                 <div class="bs-slider-overlay"></div>
                    <div class="container movie-slider-container"> 
                        <div class="row">
                             <div class="col-sm-12 movie-slider-content"> 
                                <div class="slider-content" >
                                    <ul class="subtitle"  data-animation="animated bounceInRight">
                                        <li>Action</li>
                                        <li>Science Fiction</li>
                                        <li>Adventure</li>
                                    </ul>
                                    <div class="title" data-animation="animated bounceInRight" >Lord of the rings: The return of the kings <i>(2017)</i></div>
                                    <div class="slide_right" data-animation="animated bounceInRight">
                                        <a href="javascript:;" class="btn-trailer">watch trailer</a> <a href="javascript:;" class="btn-ticket">buy ticket</a>
                                        <ul class="award-logo">
                                            <li><img src="images/header/icon1.png" alt="icon" ></li>
                                            <li><img src="images/header/icon2.png" alt="icon"></li>
                                            <li><img src="images/header/icon3.png" alt="icon"></li>
                                            <li><img src="images/header/icon4.png" alt="icon"></li>
                                        </ul>
                                    </div>
                                    <div class="chart-cirle">
                                        <div class="chart-circle-l" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="64" data-text="6.4" >
                                            </div>
                                            <span>IMDB Ratffing</span>
                                        </div>
                                        <div class="chart-circle-r" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="84" data-text="8.4" >
                                            </div>
                                            <span>Rotten Rating</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="fill" data-bg-image="images/bg/main_bg02.jpg">
                 <div class="bs-slider-overlay"></div>
                    <div class="container movie-slider-container"> 
                        <div class="row">
                             <div class="col-sm-12 movie-slider-content"> 
                                <div class="slider-content" >
                                    <ul class="subtitle"  data-animation="animated bounceInRight">
                                        <li>Action</li>
                                        <li>Science Fiction</li>
                                        <li>Adventure</li>
                                    </ul>
                                    <div class="title" data-animation="animated bounceInRight" >The Battle of Algiers (La Battaglia)  <i>(1967)</i></div>
                                    <div class="slide_right" data-animation="animated bounceInRight">
                                        <a href="javascript:;" class="btn-trailer">watch trailer</a> <a href="javascript:;" class="btn-ticket">buy ticket</a>
                                        <ul class="award-logo">
                                            <li><img src="images/header/icon1.png" alt="icon" ></li>
                                            <li><img src="images/header/icon2.png" alt="icon"></li>
                                            <li><img src="images/header/icon3.png" alt="icon"></li>
                                            <li><img src="images/header/icon4.png" alt="icon"></li>
                                        </ul>
                                    </div>
                                    <div class="chart-cirle">
                                        <div class="chart-circle-l" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="94" data-text="9.4">
                                            </div>
                                            <span>IMDB Ratffing</span>
                                        </div>
                                        <div class="chart-circle-r" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="84" data-text="8.4">
                                            </div>
                                            <span>Rotten Rating</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="fill" data-bg-image="images/header/header.png">
                 <div class="bs-slider-overlay"></div>
                    <div class="container movie-slider-container"> 
                        <div class="row">
                             <div class="col-sm-12 movie-slider-content"> 
                                <div class="slider-content" >
                                    <ul class="subtitle"  data-animation="animated bounceInRight">
                                        <li>Action</li>
                                        <li>Science Fiction</li>
                                    </ul>
                                    <div class="title" data-animation="animated bounceInRight" >The Battle of Algiers (Di Algeri)<i>(1967)</i></div>
                                    <div class="slide_right" data-animation="animated bounceInRight">
                                        <a href="javascript:;" class="btn-trailer">watch trailer</a> <a href="javascript:;" class="btn-ticket">buy ticket</a>
                                        <ul class="award-logo">
                                            <li><img src="images/header/icon1.png" alt="icon" ></li>
                                            <li><img src="images/header/icon2.png" alt="icon"></li>
                                            <li><img src="images/header/icon3.png" alt="icon"></li>
                                            <li><img src="images/header/icon4.png" alt="icon"></li>
                                        </ul>
                                    </div>
                                    <div class="chart-cirle" data-animation="animated bounceInUp">
                                        <div class="chart-circle-l" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="86" data-text="8.6">
                                            </div>
                                            <span>IMDB Ratffing</span>
                                        </div>
                                        <div class="chart-circle-r" data-animation="animated bounceInUp">
                                            <div class="circle-chart" data-circle-width="7" data-percent="74" data-text="7.4">
                                            </div>
                                            <span>Rotten Rating</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="carousel-control left" href="#headerslider" data-slide="prev">
            <i class="fa fa-angle-left"></i>
        </a>
        <a class="carousel-control right" href="#headerslider" data-slide="next">
            <i class="fa fa-angle-right"></i>
        </a>
        <!--// Controls -->
    </div>  
</div>
<!--// fullwidth-slider -->      
<section class="section-content">
    <div class="container-fluid pv11 ">
        <div class="row">
            <div class="col-sm-12">
                <h3 class="heading text-center">Now playing</h3>
                <div class="ticket-carousel pvt85">
                    <div class="swiper-container carousel-container movie-images" data-col="5">
                        <div class="swiper-wrapper">
                        		<div class="swiper-slide">
                                    <div class="movie-image" data-bg-image="images/bg/main_bg01.jpg">
                                        <div class="entry-hover">
                                            <div class="entry-actions">
                                                <a href="https://vimeo.com/28177848" class="btn-trailers video-player">watch trailer</a>
                                                <a href="#order" class="btn-ticket order_btn ">buy ticket</a>
                                            </div>
                                        </div>
                                        <div class="entry-desc">
                                            <div class="rating">
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                            </div>
                                            <h3 class="entry-title">X-Men:Apocalypse</h3>
                                            <ul class="entry-date">
                                                <li>11 :00</li>  
                                                <li>13 :50</li>  
                                                <li>14 :00</li>  
                                                <li>18 :00</li>  
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movie-image" data-bg-image="images/bg/main_bg01.jpg">
                                        <div class="entry-hover">
                                            <div class="entry-actions">
                                                <a href="https://vimeo.com/28177848" class="btn-trailers video-player">watch trailer</a>
                                                <a href="#order" class="btn-ticket order_btn ">buy ticket</a>
                                            </div>
                                        </div>
                                        <div class="entry-desc">
                                            <div class="rating">
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                            </div>
                                            <h3 class="entry-title">X-Men:Apocalypse</h3>
                                            <ul class="entry-date">
                                                <li>11 :00</li>  
                                                <li>13 :50</li>  
                                                <li>14 :00</li>  
                                                <li>18 :00</li>  
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movie-image" data-bg-image="images/bg/main_bg01.jpg">
                                        <div class="entry-hover">
                                            <div class="entry-actions">
                                                <a href="https://vimeo.com/28177848" class="btn-trailers video-player">watch trailer</a>
                                                <a href="#order" class="btn-ticket order_btn ">buy ticket</a>
                                            </div>
                                        </div>
                                        <div class="entry-desc">
                                            <div class="rating">
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                            </div>
                                            <h3 class="entry-title">X-Men:Apocalypse</h3>
                                            <ul class="entry-date">
                                                <li>11 :00</li>  
                                                <li>13 :50</li>  
                                                <li>14 :00</li>  
                                                <li>18 :00</li>  
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movie-image" data-bg-image="images/bg/main_bg01.jpg">
                                        <div class="entry-hover">
                                            <div class="entry-actions">
                                                <a href="https://vimeo.com/28177848" class="btn-trailers video-player">watch trailer</a>
                                                <a href="#order" class="btn-ticket order_btn ">buy ticket</a>
                                            </div>
                                        </div>
                                        <div class="entry-desc">
                                            <div class="rating">
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                            </div>
                                            <h3 class="entry-title">X-Men:Apocalypse</h3>
                                            <ul class="entry-date">
                                                <li>11 :00</li>  
                                                <li>13 :50</li>  
                                                <li>14 :00</li>  
                                                <li>18 :00</li>  
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movie-image" data-bg-image="images/bg/main_bg01.jpg">
                                        <div class="entry-hover">
                                            <div class="entry-actions">
                                                <a href="https://vimeo.com/28177848" class="btn-trailers video-player">watch trailer</a>
                                                <a href="#order" class="btn-ticket order_btn ">buy ticket</a>
                                            </div>
                                        </div>
                                        <div class="entry-desc">
                                            <div class="rating">
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                            </div>
                                            <h3 class="entry-title">X-Men:Apocalypse</h3>
                                            <ul class="entry-date">
                                                <li>11 :00</li>  
                                                <li>13 :50</li>  
                                                <li>14 :00</li>  
                                                <li>18 :00</li>  
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="movie-image" data-bg-image="images/bg/main_bg01.jpg">
                                        <div class="entry-hover">
                                            <div class="entry-actions">
                                                <a href="https://vimeo.com/28177848" class="btn-trailers video-player">watch trailer</a>
                                                <a href="#order" class="btn-ticket order_btn ">buy ticket</a>
                                            </div>
                                        </div>
                                        <div class="entry-desc">
                                            <div class="rating">
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                                <input name="stars" type="radio">
                                                <label>☆</label>
                                            </div>
                                            <h3 class="entry-title">X-Men:Apocalypse</h3>
                                            <ul class="entry-date">
                                                <li>11 :00</li>  
                                                <li>13 :50</li>  
                                                <li>14 :00</li>  
                                                <li>18 :00</li>  
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                          </div>
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>

            </div>
        </div>
    </div>    
    <div class="section-content pvb0 bg-cover" data-bg-image="images/coming-bg.jpg">
        <div c  lass="container pvt80">
            <div class="row">
                <div class="col-md-12">
                    <div id="slider_coming" class="flexslider">
                       
                    </div>
                </div>
            </div>	
            <div id="carousel_coming" class="flexslider">
     
            </div>
        </div>
    </div>        
    <div class="section-content service pvb0">
   
    </div>        
    <div class="fullscreen-section bg-black pvb0">
        <div class="container wpc-boxoffice pv8">
            <div class="row">
          
           
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>
  

</section>

<c:import url="../inc/footer.jsp"/>