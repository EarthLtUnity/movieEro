<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<c:import url="../inc/head.jsp"/>
<c:import url="../inc/header.jsp"/>

<div class="row" style="margin-top:200px;height:800px">
	<article id="chatBox" class="col-sm-4">
	    <h1 class="sr-only">채팅창</h1>
	    <div class="frame">
	        <ul id="asynMsg"></ul>
	        <div>
	            <div class="msj-rta macro">                        
	                <div class="text text-r" style="background:whitesmoke !important">
	                    <input id="iptText" class="mytext" placeholder="메세지를 입력해주세요"/>
	                </div> 
	
	            </div>
	            <div style="padding:10px;">
	                <span id="btnMsgSend" class="glyphicon glyphicon-share-alt"></span>
	            </div>                
	        </div>
	    </div>
	</article> 
</div>
<script type="text/javascript">
/*
// 웹소켓 생성
var webSocket = new WebSocket('ws://192.168.20.71:8088/movieEro/chatSocket');
// 채팅 입력창
var $iptMsg = $("#iptText").val();

webSocket.onerror = function(event) {
  onError(event)
};
webSocket.onopen = function(event) {
  onOpen(event)
};
webSocket.onmessage = function(event) {
  onMessage(event)
};

// 처음 연결 성공했을 때
function onOpen(event) {
    alert("연결 성공");
}
// 메세지 수신 받을 때
function onMessage(event) {
    //alert("상대방 :"+event.data);
    ClassChat.insertChat("you", event.data, 0);
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
    insertChat : function(who, msg, time){ // insertChat("주체", "메세지", 시간);
        this.setImg();
        if (time === undefined){
                time = 0;
            }
            var control = "";
            var date = this.formatAMPM(new Date());
            
            if (who == "me"){
                control = '<li style="width:100%">' +
                                '<div class="msj macro">' +
                                '<div class="avatar"><img class="img-circle" style="width:100%;" src="'+ this.me.avatar +'" /></div>' +
                                    '<div class="text text-l">' +
                                        '<p>'+ msg +'</p>' +
                                        '<p><small>'+date+'</small></p>' +
                                    '</div>' +
                                '</div>' +
                            '</li>';                    
            }else{
                control = '<li style="width:100%;">' +
                                '<div class="msj-rta macro">' +
                                    '<div class="text text-r">' +
                                        '<p>'+ msg +'</p>' +
                                        '<p><small>'+date+'</small></p>' +
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
        $("#iptText").on("keydown", function(e){
            if (e.which == 13){
                var sendMsg = $(this).val();
                if (sendMsg !== ""){
                	// 웹소켓으로 메세지 전송
                    webSocket.send(sendMsg);            	
                    that.insertChat("me", sendMsg);              
                    $(this).val('');
                }
            }
        });

        $("#btnMsgSend").on('click', function() {
            $("#iptText").trigger({type: 'keydown', which: 13, keyCode: 13});
        });

    } // end of excute();    
};
ClassChat.excute();
*/
</script>
<!-- 
<fieldset>
    <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
    <br/>
    <input id="inputMessage" type="text"/>
    <input type="submit" value="send" onclick="send()" />
</fieldset>
<script type="text/javascript">
var textarea = document.getElementById("messageWindow");
var webSocket = new WebSocket('ws://192.168.20.71:8088/movieEro/broadcasting');
var inputMessage = document.getElementById('inputMessage');
webSocket.onerror = function(event) {
  onError(event)
};
webSocket.onopen = function(event) {
  onOpen(event)
};
webSocket.onmessage = function(event) {
  onMessage(event)
};
function onMessage(event) {
    textarea.value += "상대 : " + event.data + "\n";
}
function onOpen(event) {
    textarea.value += "연결 성공\n";
}
function onError(event) {
  alert(event.data);
}
function send() {
    textarea.value += "나 : " + inputMessage.value + "\n";
    webSocket.send(inputMessage.value);
    inputMessage.value = "";
}
</script>
 -->
<c:import url="../inc/footer.jsp"/>