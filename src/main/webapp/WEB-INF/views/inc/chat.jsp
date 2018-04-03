<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 로그인 아이디 세션 저장--%>
<c:set var="memberID" value="${memberID}" scope="session"/>

<%-- 로그인시 아이디 저장--%>
<c:if test="${(memberID ne '') and !(empty memberID)}">
    <input type="hidden" value='${memberID}' id='chatID' />
</c:if>

	<article id="chatBox" class="col-sm-4">
	    <h1 class="sr-only">채팅창</h1>
	    <div class="frame">
	        <ul id="asynMsg"></ul>
	        <div>
               	<c:choose>
               		<c:when test="${memberID != null}">
			            <div class="msj-rta macro">                        
			                <div class="text text-l">
			                    <input class="iptText mytext" placeholder="메세지를 입력해주세요"/>
			                </div> 
			            </div>
	            	</c:when>
               		<c:otherwise>
			            <div class="msj-rta macro doNotLogin" id="beforeLoginChatIpt">                        
			                <div class="text text-l">
	    		                <input class="mytext doNotInput" readonly="readonly" value="로그인해주세요"/>		
			                </div> 
			            </div>
               		</c:otherwise>
               	</c:choose>
				<!-- ajax 로그인직후 채팅방 -->
	            <div class="msj-rta macro" id="ajaxChatIpt">                        
	                <div class="text text-l">
	                    <input class="iptText mytext" placeholder="메세지를 입력해주세요"/>
	                </div> 
	            </div>	
				<!--// ajax 로그인직후 채팅방 -->
				
	            <div class="msg_send_wrap">
	                <span id="btnMsgSend" class="glyphicon glyphicon-share-alt"></span>
	            </div>                
	        </div>
	    </div>
	</article> 

<script type="text/javascript">
/** 스크립트 main.js에 옮기고 main.jsp로 html도 옮기기 **/

// 웹소켓 생성
var webSocket = new WebSocket('ws://192.168.20.71:8088/movieEro/chatSocket');
// 채팅 입력창
var $iptText =$(".iptText");
var senderID = '${memberID}';

webSocket.onerror = function(event) {
	onError(event)
};
webSocket.onopen = function(event) {
	onOpen(event)
};
webSocket.onmessage = function(event) {
	//console.log(event);
	onMessage(event)
};

// 처음 연결 성공했을 때
function onOpen(event) {
    //alert("연결 성공");
}
// 메세지 수신 받을 때
function onMessage(event) {
	//console.log(event.data) => {"id":"admin","text":"ㅁㅁㅁㅁ"}
	var jsonParseMsg = JSON.parse(event.data);
	//console.log(jsonParseMsg.id)
	//console.log(jsonParseMsg.text)
    ClassChat.insertChat("you", jsonParseMsg.text, 0, jsonParseMsg.id);
}
// 에러 발생 시
function onError(event) {
	alert(event.data);
}

var ClassChat ={
    me : {},
    you : {},
    setImg : function() { // 내 이미지 상대이미지 세팅
        this.me.avatar = "images/temp_kjm.png";
        this.you.avatar = "http://via.placeholder.com/48x48";
    },
    formatAMPM : function(date) { // 채팅입력시간 저장 메서드
        var hours = date.getHours();
        var minutes = date.getMinutes();
        var ampm = hours >= 12 ? 'PM' : 'AM';
        hours = hours % 12;
        hours = hours ? hours : 12;
        minutes = minutes < 10 ? '0'+minutes : minutes;
        var strTime = hours + ':' + minutes + ' ' + ampm;
        return strTime;
    },
    insertChat : function(who, msg, time, tagetID){ // insertChat("주체", "메세지", 시간, "대상아이디");
        this.setImg();
        
        if (time === undefined){
                time = 0;
            }
            var control = "";
            var date = this.formatAMPM(new Date());
            
            if (who == "me"){
                control = '<li class="other_msg_window">' +
                                '<div class="msj macro">' +
                                '<div class="avatar"><img class="img-circle" style="width:100%;" src="'+ this.me.avatar +'" /></div>' +
                                    '<div class="text text-l">' +
                                        '<p>'+ msg +'</p>' +
                                        '<p><small>'+date+'</small></p>' +
                                    '</div>' +
                                '</div>' +
                            '</li>';                    
            }else{
                control = '<li class="my_msg_window">' +
                                '<div class="msj-rta macro">' +
                                    '<div class="text text-r">' +
                                        '<p>'+ msg +'</p>' +
                                        '<p><strong>'+ tagetID +'</strong> <small>'+date+'</small></p>' +
                                    '</div>' +
                                '<div class="avatar" style="padding:0px 0px 0px 10px !important"><img class="img-circle" style="width:100%;" src="'+this.you.avatar+'" /></div>' +                                
                        '</li>';
            }
            setTimeout(
                function(){                        
                    $("#asynMsg").append(control).scrollTop($("ul").prop('scrollHeight'));
                }, time);
    },
    excute : function() {
        var that = this;
        $iptText.on("keydown", function(e){
            if (e.which == 13){
            	
            	// 메세지의 보내는 사람 아이디와 메세지를 보관하는 객체
                var msg = {
                	id:   senderID,
                	text: $iptText.val()
                };           	

                var sendMsg = $(this).val();
                if (sendMsg !== ""){
                	// 웹소켓으로 메세지 전송
                    webSocket.send(JSON.stringify(msg));
                	// 내 화면에 내 메세지 표시
                    that.insertChat("me", msg.text);              
                    $(this).val('');
                }
            }
        });
        $("#btnMsgSend").on('click', function() {
            $iptText.trigger({type: 'keydown', which: 13, keyCode: 13});
        });

    } // end of excute();    
};
ClassChat.excute();
</script>