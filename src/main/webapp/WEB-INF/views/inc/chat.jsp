<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%-- 로그인시 ajax가 내려준 아이디를 저장--%>
    <input type="hidden" value='' id='ajaxChatID' />

	<article id="chatBox" class="col-sm-4">
	    <h1 class="sr-only">채팅창</h1>
	    <div class="frame">
	        <ul id="asynMsg"></ul>
	        <div>
               	<c:choose>
               		<c:when test="${memberID != null}">
			            <div class="msj-rta macro">                        
			            	<input class="iptText mytext" placeholder="메세지를 입력해주세요"/>
			            </div>
	            	</c:when>
               		<c:otherwise>
			            <div class="msj-rta macro doNotLogin" id="beforeLoginChatIpt">                        
    		                <input class="mytext doNotInput" readonly="readonly" value="로그인해주세요"/>		
			            </div>
               		</c:otherwise>
               	</c:choose>
				<!-- ajax 로그인직후 채팅방 -->
	            <div class="msj-rta macro" id="ajaxChatIpt">                        
	            	<input class="iptText mytext" placeholder="메세지를 입력해주세요"/>
	            </div>	
				<!--// ajax 로그인직후 채팅방 -->
				
	            <div class="msg_send_wrap">
	                <span id="btnMsgSend" class="glyphicon glyphicon-share-alt"></span>
	            </div>                
	        </div>
	    </div>
	</article> 
