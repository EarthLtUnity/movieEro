<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="listCount" value="${requestScope.listCount}"/>
<c:set var="currentPage" value="${requestScope.currentPage}"/>
<c:set var="startPage" value="${requestScope.startPage}"/>
<c:set var="endPage" value="${requestScope.endPage}"/>
<c:set var="maxPage" value="${requestScope.maxPage}"/>
<c:set var="list" value="${requestScope.list}"/>
<c:set var="member" value="${sessionScope.member}"/>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <title>Tenguu Cinema - Movie Theater Template</title>
    <meta name="keywords" content="HTML5,CSS3,HTML,Template,Themeton" >
    <meta name="description" content="Tenguu Cinema - Movie Theater Template">
    <meta name="author" content="Themeton">
    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png"/>

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300ita‌​lic,400italic,500,500italic,700,700italic,900italic,900' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
    <link rel="stylesheet" type="text/css" href="css/packages.min.css">
    <link rel="stylesheet" type="text/css" href="css/default.css">
</head>

         

     
         
<section class="section-content">

    
    
    <div class="fullscreen-section bg-black pvb0">
        <div class="container wpc-boxoffice pv8">
            <div class="row">
                <div class="col-sm-7 col-xs-12">
                    <h3>box office</h3>
                    <ul class="wpc-box-list">
                    
                    
       <c:forEach var="b" items="${list}">
                    
                    
                        <li class="wpc-box-item" > 
                            <ol>
                                <li class="bx-item-t"></li>
                                <li class="bx-item-c">${b.boardNum}</li>
                                <li class="bx-item-title">
                                    <h4><c:out value="${member}" />${b.boardTitle}<br></h4>
                                    <span>${b.boardWriter}</span>
                                </li>
                                <li class="bx-item-d">${b.boardDate}</li>
                                <li class="bx-item-m">${b.boardReadCount}</li>
                            </ol>
                        </li>
                        
                        
                        
                        
                        
      </c:forEach>                    
                    </ul>
                </div>
            </div>
            
            <br>
			<div align="center" >
				<td colspan="6">
				<c:if test="${currentPage <= 1}">[이전] &nbsp;</c:if>
					<c:if test="${currentPage > 1}">
						<c:url var="blistst" value="/blist.do">
							<c:param name="page" value="${currentPage-1}" />
						</c:url>
						<a href="${blistst}">[이전]</a> &nbsp;
					</c:if> 
					<!-- 페이지 숫자 보여주기 --> 
					<c:forEach var="p" begin="${startPage}"	end="${endPage}">
						<c:if test="${p eq currentPage}">
							<font color="red" size="4"><b>[${p}]</b></font>
						</c:if>
						<c:if test="${p ne currentPage}">
							<c:url var="blistchk" value="/blist.do">
								<c:param name="page" value="${p}" />
							</c:url>
							<a href="${blistchk}">${p}</a>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage >= maxPage}">[다음]</c:if>
					<c:if test="${currentPage < maxPage}">
						<c:url var="blistEND" value="/blist.do">
							<c:param name="page" value="${currentPage+1}" />
						</c:url>
						<a href="${blistEND}">[다음]</a>
					</c:if>
				</td>
			</div>


		</div>
          <div align="center">
          <a href="boardInsert" class="btn" >글쓰기</a>
          </div>
    </div>    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<script type="text/javascript" src="js/google-maps.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?callback=initMap"></script>
</section>

    <footer id="footer">
        <div class="container footer-container">
            <div class="row">
                <div class="col-md-2 col-sm-6">
                    <div class="widget">
                        <h5 class="widget-title">Menu</h5>
                        <ul class="menu">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Coming soon</a></li>
                            <li><a href="#">Order</a></li>
                            <li><a href="#">Terms of service</a></li>
                            <li><a href="#">Pricing</a></li>
                        </ul>
                    </div>
                    <div class="widget">
                        <div class="social-links">
                            <a href="javascript:;"><i class="fa fa-facebook"></i></a>
                            <a href="javascript:;"><i class="fa fa-twitter"></i></a>
                            <a href="javascript:;"><i class="fa fa-google-plus"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="widget">
                        <h5 class="widget-title">Address information</h5>
                        <p>
                            California. AMC Dine-In Theatres Marina,
                            Street 26, Distritc 543 #108
                         </p> 
                         <p>
                            <i class="fa fa-mail"></i>Example@mail.com<br>
                            <i class="fa fa-phone"></i> + 123 456 7890
                         </p> 
                    </div>
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-6">
                    <div class="widget">
                    <h5 class="widget-title">Leave a message</h5>
                        <form class="contact_form transparent">
                            <div class="row">
                                <div class="col-sm-12">
                                    <input type="text" class="inputValidation" name="name" placeholder="Name *">
                                </div>
                                <div class="col-sm-12">
                                    <input type="text" class="inputValidation" name="email" placeholder="Email *">
                                </div>
                                <div class="col-sm-12 ">
                                    <textarea class="inputValidation" placeholder="Message *"></textarea>
                                    <button type="submit" class="button fill rectangle">Send to us</button>
                                </div>
                            </div>
                        </form>
                        <div class="errorMessage"></div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <div class="sub-footer">
            <div class="container">
                <div class="row copyright-text">
                    <div class="col-sm-12 text-center">
                        <p class="mv3 mvt0">&copy; Copyrights 2017 Tenguu. All rights reserved</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
  

    <!-- Include jQuery and Scripts -->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/packages.min.js"></script>
    <script type="text/javascript" src="js/scripts.min.js"></script>
<!-- jQuery easing plugin -->
</body>
</html> 