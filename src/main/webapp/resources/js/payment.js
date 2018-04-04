/*
 
  결제 테스트 
  <script type="text/javascript" src="js/payment.js"></script>
  로 붙여넣으면됨
  
 */

$(document).ready(function(){
	    		$(".payment").click(function(event){
	    		var IMP = window.IMP;
	    		IMP.init('imp68666223');
	    		
	    			IMP.request_pay({
	    			    pg : 'html5_inicis',//필수
	    			    pay_method : 'card',//필수
	    			    merchant_uid : 'merchant_' + new Date().getTime(),//필수
	    			    name : '주문명:결제테스트',//필수
	    			    amount : 1000,//필수
	    			    buyer_email : 'worua99@nate.com',//필수
	    			    buyer_name : '김재겸',//선택 id
	    			    buyer_tel : '010-2030-1266',//필수
	    			    buyer_addr : '경기도 화성시 병점동',//선택
	    			    buyer_postcode : '123-456'//선택
	    			}, function(rsp) {
	    			    if ( rsp.success ) {
	    			        var msg = '결제가 완료되었습니다.';
	    			        msg += '고유ID : ' + rsp.imp_uid;
	    			        msg += '상점 거래ID : ' + rsp.merchant_uid;
	    			        msg += '결제 금액 : ' + rsp.paid_amount;
	    			        msg += '카드 승인번호 : ' + rsp.apply_num;
	    			    } else {
	    			        var msg = '결제에 실패하였습니다.';
	    			        msg += '에러내용 : ' + rsp.error_msg;
	    			    }
	
	    			    alert(msg);
	    			});
	    		});
	    		location.this;
	    	});