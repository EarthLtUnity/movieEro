/**
 * Object Orient Javascript Programming
 * Author      : 김종민
 * last update : 18/03/20
 * */

/****************** 메인 페이지 ******************/
/*-- 네비게이션 메뉴 --*/
var navMenu = {
	depth1 : $('#headerNav>ul>li'),
	excute : function(){
		this.depth1.on('mouseenter', function() {		
			$(this).children('.dep2').show();
		});
		this.depth1.on('mouseleave', function() {
			$(this).children('.dep2').hide();
		});
	}
};
navMenu.excute();

/*-- 공지사항 게시판 리스트 출력 --*/
var ClassNoticeList = {
	printList: function(list) {
		//console.log(list);
		var row = '';
		$.each(list, function(i, item) {
			// console.log("제목: "+item.NOTICE_BOARD_TITLE);
			// 본문내용 너무 길어 자름
			var adjContent = item.NOTICE_BOARD_CONTENT.substring(0, 100);
			row = '<li><a href="noticeDetail.do?NOTICE_BOARD_NO='+item.NOTICE_BOARD_NO+'"><h2>'+item.NOTICE_BOARD_TITLE+'<h2><em>'+item.NOTICE_BOARD_DATE+'</em><p>'+adjContent+'</p></a></li>';
			$('.ofs_box>ul').append(row);
		});
		
	},
	excute: function() {
		var that = this;
		$.ajax({
			type: 'POST',
			url: './noticeView.do',
			data: {},
			success: function(notiBoardList) {
				that.printList(notiBoardList);
			},
	        error:function(e){  
	            alert(e.responseText);  
	        }
		});									
	}
}
ClassNoticeList.excute();

/*-- 실시간 채팅 --*/
// 웹소켓 생성
var webSocket = new WebSocket('ws://192.168.25.29:8088/movieEro/chatSocket');
//var webSocket = new WebSocket('ws://192.168.20.71:8088/movieEro/chatSocket'); // kh 내자리
// 채팅 입력창
var $iptText =$(".iptText");

// 웹소켓 이벤트 메서드들
// 처음 연결 성공했을 때
webSocket.onopen = function(event) {
	//console.log("웹소켓 연결 성공");
	//var jsonParseMsg = JSON.parse(event.data);
};
// 메세지 수신 받을 때
webSocket.onmessage = function(event) {
	//console.log(event.data) => {"id":"admin","text":"ㅁㅁㅁㅁ"}
	var jsonParseMsg = JSON.parse(event.data);
	//console.log(jsonParseMsg.id)
	//console.log(jsonParseMsg.text)
    ClassChat.insertChat("you", jsonParseMsg.text, 0, jsonParseMsg.id);	
};
// 에러 발생 시
webSocket.onerror = function(event) {
	console.log("웹소켓 생성 에러: "+event.data);	
};

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
                                '<div class="avatar"><img class="img-circle" src="'+ this.me.avatar +'" /></div>' +
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
                                '<div class="avatar"><img class="img-circle" src="'+this.you.avatar+'" /></div>' +                                
                        '</li>';
            }
            setTimeout(
                function(){      
                	// 스크롤 내려서 항상 최신글로
                    $("#asynMsg").append(control).scrollTop($("#asynMsg").prop('scrollHeight'));
                }, time);
    },
    excute : function() {
        var that = this;
        $iptText.on("keydown", function(e){
            if (e.which == 13){
            	
            	// 메세지의 보내는 사람 아이디와 메세지를 보관하는 객체
                var msg = {
                	id:   $('#ajaxChatID').val(),
                	text: $iptText.val()
                };
            	if(msg.id===''){
            		console.log("전송자 id가 존재하지 않습니다");
            	}

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

/*-- Footer --*/
var footer ={
	$ipt_view : $('.ipt_view'),
	$ipt_btn : $('.ipt_btn'),
	excute : function() {
		var that = this;
		// 스르륵 움직이는 뉴스레터
		$('.ipt_view input').on('click', function(){
			that.$ipt_view.animate({'top':'-77px'},300);
			that.$ipt_btn.animate({'top':'-52px'},300);
			return false;
		});	
		$('#wrap').on('click', function(){
			var $target = $('.ipt_wrap');

			if(!$target.is(event.target) && $target.has(event.target).length === 0){
				that.$ipt_view.animate({'top':'-26px'}, 300);
				that.$ipt_btn.animate({'top':'0px'},300);
			}
		});	
		// 뉴스레터 유효성 검사
		$('#btnNewletter').on('click', function(){

			var $email = $('.eNewsletter');
			var $warningTxt = $('.ipt_view p');
			var exptext = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var $postCode = $('.zipPost');

			if( !$email.val() ) {

				$warningTxt.css('visibility', 'visible');
				$warningTxt.text('이메일을 입력해주세요');
				$email.focus();
				return false;

			} else if(!exptext.test( $email.val() )){

				$warningTxt.css('visibility', 'visible');
				$warningTxt.text('유효하지 않은 이메일 양식입니다. 다시 입력해주세요');
				$email.focus();
				return false;

			} else if( !$postCode.val() ) {
				$warningTxt.text('우편번호를 입력해주세요');

			} else{
				$warningTxt.css('visibility', 'hidden');
				$(this).submit();
			}

		});		
	}
};
footer.excute();


/****************** 회원가입 ******************/
/*-- mailCopy : 셀렉트박스로 이메일 도메인 선택시 자동 입력 --*/
var mailCopy = {
	$selectMail : $('#mb_selectMail'),
	excute : function() {
		this.$selectMail.on('change', function() {
			$('#mb_maildomain').val($(this).val());
		});
	}
};
mailCopy.excute();

/*-- asyncValidator : 비동기로 아이디 중복 검사 --*/
var valiStep1 = false;
var asyncValidator = {
	$id : $('#frmMemberJoin #mb_id'),
	$msgCheckId : $('#msgCheckId'),
	excute : function() {
		var that = this;
		that.$id.on('keyup', function(){	
			var desiredId = that.$id.val();
			if(desiredId==='') {
				that.$msgCheckId.text('아이디 입력해주세요');
				that.$msgCheckId.attr("class","check_txt_check");
			} else {
				$.ajax({
					type: 'POST',
					url: './memberIdCheck.do',
					data: {'desiredId':desiredId},
					success: function(data) {
						// alert(data);
						if(data) {
							that.$msgCheckId.text(data+'는 사용 가능한 아이디 입니다.');
							that.$msgCheckId.attr("class","check_txt_success");
							valiStep1 = true;
						} else {
							that.$msgCheckId.text('중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요');
							that.$msgCheckId.attr("class","check_txt_warning");
							valiStep1 = false;
						}
					}
				});		
			}// if
		});				
	} // excute()
};
asyncValidator.excute();

/*-- pwValidator : 비밀번호와 비번확인 일치여부 체크 --*/
var valiStep2 = false;
var pwValidator = {
	excute : function() {
		var passCheck = function() {
			var msgCheckPw = $('#msgCheckPw');
			var pw1 = $('#mb_passwd').val();
			var pw2 = $('#mb_passwdChk').val();
			if(pw1 =='' && pw2 =='') {
				msgCheckPw.text('비밀번호를 입력해주세요');
				msgCheckPw.attr("class","check_txt_warning");
				valiStep2 = false;
			} else if(pw1 != pw2) {
				msgCheckPw.text('비밀번호가 일치하지 않습니다');
				msgCheckPw.attr("class","check_txt_warning");
				valiStep2 = false;
			} else if(pw1 == pw2) {
				msgCheckPw.text('비밀번호가 일치합니다');	
				msgCheckPw.attr("class","check_txt_success");
				valiStep2 = true;
			}
		}// passCheck()
		$('#mb_passwd').on('keyup', passCheck);
		$('#mb_passwdChk').on('keyup', passCheck);
	}
};
pwValidator.excute();

/*-- nullValidator : null값 없는지 체크 --*/
var nullValidator = {
	frm : '', // 파라미터를 유동적 타겟으로 설정
	excute : function(frm) {
		var that = this;
		this.frm = frm;
		$('#mb_selectMail').on('change', function() {
			$('#mb_mailDomain').val($(this).val());
		});
		$('#btnJoin').on('click', function() {
			// 회원가입의 경우 중복 아이디 검사
			if(frm==="#frmMemberJoin") {
				if($(that.frm+' #mb_id').val()==='') {
					alert('아이디를 입력해주세요');
					$(that.frm+' #mb_id').focus();
				} else if (valiStep1===false || $(that.frm+' #mb_id').val()==='FAIL') {
					alert('중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요');
					$(that.frm+' #mb_id').focus();
				}				
			} else{
				valiStep1=true;
				//alert("회원정보수정");
			} 
			// 회원가입과 회원정보수정 모두 수행
			
			if ($(that.frm+' #mb_passwd').val()=='') {
				alert('비밀번호를 입력해주세요');
				$(that.frm+' #mb_passwd').focus();
			} else if ($(that.frm+' #mb_passwdChk').val()=='') {
				alert('비밀번호 확인을 입력해주세요');
				$(that.frm+' #mb_passwdChk').focus();
			} else if (valiStep2===false) {
				alert('비밀번호가 일치하지 않습니다');
				$(that.frm+' #mb_passwd').focus();
			} else if ($(that.frm+' #mb_name').val()=='') {
				alert('이름을 입력해주세요');
				$(that.frm+' #mb_name').focus();
			} else if ($(that.frm+' #mb_mail').val()=='') {
				alert('이메일을 입력해주세요');
				$(that.frm+' #mb_mail').focus();
			} else if ($(that.frm+' #mb_maildomain').val()=='') {
				alert('이메일 도메인을 입력 혹은 선택해주세요');
				$(that.frm+' #mb_maildomain').focus();
			} else if ($(that.frm+' #mb_phone').val()=='') {
				alert('전화번호를 입력해주세요');
				$(that.frm+' #mb_phone').focus();
			} else if (/^[0-9]*$/.exec($(that.frm+' #mb_phone').val())==null) {	
				alert('전화번호는 숫자만 입력해주세요');
				$(that.frm+' #mb_phone').focus();
			} else if(valiStep1===true&&valiStep2===true){
				$(that.frm).submit();						
			}				
				
		});
	}
};

/*-- 정규표현식으로 현재 컨트롤러 구분해서 nullValidator의 메서드 실행 --*/
var nowUrl = location.href;
// 회원가입
if (/join.do/.exec(nowUrl) != null){
	nullValidator.excute('#frmMemberJoin');
// 회원정보수정폼
} else if (/memberModifyForm.do/.exec(location.href) != null){
	nullValidator.excute('#frmMembermodi');
}

/****************** 로그인 ******************/
/*-- loginAjax : 로그인 버튼 비동기 처리 --*/
var loginAjax = {
	excute : function() {
		// 클릭으로 로그인 가능
		$('#btnLogin').on('click', function() {
			$('#login_pw').trigger({type: 'keydown', which: 13, keyCode: 13});
		});
		
		// 비밀번호 입력 후 엔터 치면 로그인 가능
		$('#login_pw').on("keydown", function(e){		
            if (e.which == 13){
            	
    			$.ajax({
    				type: 'POST',
    				url: 'login.do',
    				data: {login_id : $("#login_id").val(), login_pw : $("#login_pw").val()},
    				success: function(member_id) {
    					if(member_id !== "FAIL") {
    						alert(member_id+"님 환영합니다");
    						// ajax로 로그인 성공시 모달창 닫고 로그인 버튼 없애고 로그아웃 버튼 생성
    						$('#loginPopup').modal('hide');
    						$('#beforeLoginMenu').hide();
    						$('#ajaxLoginMenu').show();	
    						$('#ajaxLoginId').text(member_id);
    						
    						$('#beforeLoginChatIpt').hide();
    						$('#ajaxChatIpt').show();
    						$('#ajaxChatID').val(member_id);
    					} else{
    						alert("일치하는 회원정보가 없습니다");
    					}
    				}
    			}); // end of ajax
            }			
		});
	
	}
}
loginAjax.excute();
