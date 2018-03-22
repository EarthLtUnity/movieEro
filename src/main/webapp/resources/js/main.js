/**
 * Object Orient Javascript Programming
 * Author      : 김종민
 * last update : 18/03/20
 * */

/* 네비게이션 메뉴 */
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


/* 회원가입 */
// 셀렉트박스로 이메일 도메인 선택시 자동 입력
var mailCopy = {
	$selectMail : $('#selectMail'),
	excute : function() {
		this.$selectMail.on('change', function() {
			$('#maildomain').val($(this).val());
		});
	}
};
mailCopy.excute();

//asyncValidator : 비동기로 아이디 중복 검사
var valiStep1 = false;
var asyncValidator = {
	$id : $('#frmMemberJoin #id'),
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

// pwValidator : 비밀번호와 비번확인 일치여부 체크
var valiStep2 = false;
var pwValidator = {
	msgCheckPw = $('#msgCheckPw'),
	pw1 = $('#passwd').val(),
	pw2 = $('#passwdChk').val(),		
	excute : function() {
		var passCheck = function() {
			if(this.pw1 =='' && this.pw2 =='') {
				this.msgCheckPw.text('비밀번호를 입력해주세요');
				this.msgCheckPw.attr("class","check_txt_warning");
				valiStep2 = false;
			} else if(this.pw1 != this.pw2) {
				this.msgCheckPw.text('비밀번호가 일치하지 않습니다');
				this.msgCheckPw.attr("class","check_txt_warning");
				valiStep2 = false;
			} else if(this.pw1 == this.pw2) {
				this.msgCheckPw.text('비밀번호가 일치합니다');	
				this.msgCheckPw.attr("class","check_txt_success");
				valiStep2 = true;
			}
		}// passCheck()
		$('#passwd').on('keyup', passCheck);
		$('#passwdChk').on('keyup', passCheck);
	}
};
pwValidator.excute();

// nullValidator : null값 없는지 체크
var nullValidator = {
	//frm : '#frmMemberJoin',
	frm : '',
	excute : function(frm) {
		var that = this;
		this.frm = frm;
		$('#selectMail').on('change', function() {
			$('#mailDomain').val($(this).val());
		});
		$('#btnJoin').on('click', function() {
			if($(that.frm+' #id').val()=='') {
				alert('아이디를 입력해주세요');
				$(that.frm+' #id').focus();
			} else if (valiStep1===false) {
				alert('중복된 아이디가 존재합니다. 다른 아이디를 입력해주세요');
				$(that.frm+' #id').focus();
			} else if ($(that.frm+' #passwd').val()=='') {
				alert('비밀번호를 입력해주세요');
				$(that.frm+' #passwd').focus();
			} else if ($(that.frm+' #passwdChk').val()=='') {
				alert('비밀번호 확인을 입력해주세요');
				$(that.frm+' #passwdChk').focus();
			} else if (valiStep2===false) {
				alert('비밀번호가 일치하지 않습니다');
				$(that.frm+' #passwd').focus();
			} else if ($(that.frm+' #name').val()=='') {
				alert('이름을 입력해주세요');
				$(that.frm+' #name').focus();
			} else if ($(that.frm+' #mail').val()=='') {
				alert('이메일을 입력해주세요');
				$(that.frm+' #mail').focus();
			} else if ($(that.frm+' #maildomain').val()=='') {
				alert('이메일 도메인을 입력 혹은 선택해주세요');
				$(that.frm+' #maildomain').focus();
			} else if ($(that.frm+' #phone').val()=='') {
				alert('전화번호를 입력해주세요');
				$(that.frm+' #phone').focus();
			} else if (/^[0-9]*$/.exec($(that.frm+' #phone').val())==null) {	
				alert('전화번호는 숫자만 입력해주세요');
				$(that.frm+' #phone').focus();
			} else if(valiStep1===true&&valiStep2===true){
				$(that.frm).submit();						
			}
							
		});
	}
};
// 정규표현식으로 현재 컨트롤러 구분해서 nullValidator의 메서드 실행
var nowUrl = location.href;
if (/join.do/.exec(nowUrl) != null){
	nullValidator.excute('#frmMemberJoin');
} /*else if (/memberModi.do/.exec(location.href) != null){
	nullValidator.excute('#frmMemberModi');
}*/


/* 로그인 */
// 로그인 유효성 검사후 비동기로 로그인해보기
var modalValidator = {
	$id       : $('#frmLoginModal #id'),
	$pw       : $('#frmLoginModal #passwd'),
	$btnLogin : $('#btnLogin'),
	excute : function() {
		var that = this;
		$btnLogin.on('click', function(){
			if(that.$id.val()==''){
				alert('아이디를 입력해주세요');
				that.id.focus();
				return false;
			} else if (that.pw.val()=='') {
				alert('비밀번호를 입력해주세요');
				that.$pw.focus();
				return false;
			} else{
				$(that.frm).submit();	
				return true;
			}				
		});
	}
};
//아직 미구현
//modalValidator.excute();
