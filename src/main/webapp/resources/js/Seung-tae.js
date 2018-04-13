$(document).ready(function(){
	
	/***********************
	   boardInsertForm.jsp 
	  ***********************/
	//유효성
	$(".btn_submit").on('click',function(){
		var formApplyNo = document.getElementById("WITH_BOARD_APPLY_NO").value;
		var formTitle =  document.getElementById("WITH_BOARD_TITLE").value; 
		var formContent = document.getElementById("WITH_BOARD_CONTENT").value; 
		
	
	if(formApplyNo == "모집인원"){
			alert('모집인원을 입력해주세요');
		}
		else if(formTitle.replace( /(^\s*)|(\s*$)/g, "" ) == ""){
			alert('제목을 입력해주세요');
			formTitle.focus();
		}
		else if (formContent == "" || formContent == null){
			alert('내용을 입력해주세요');
			formContent.focus();
		}
	})
	
	
	
	/***********************
	   boardList.jsp
	  ***********************/
	// 제목 클릭 내용 보이기
	// 방법.1
	/*var isShow = false; // 보이는 상태
	$('.hello').on('click',function(){
		var boardListContent = $(this).parent().parent().parent().find('.steve_panel');
		if(isShow==true){
			//boardListContent.style.display = "none";
			boardListContent.hide();
			//isShow = false;
			console.log(isShow)
		}else{
			boardListContent.show();
			//isShow = true;
			console.log(isShow)
		}
		isShow = !isShow;
	})*/
	
	// 제목 클릭 내용 보이기
	// 방법.2
	$('.hello').on('click',function(){
		var boardListContent = $(this).parent().parent().parent().find('.steve_panel');
		boardListContent.toggleClass('on')
		/*isShow = !isShow;*/
	})	
	
	
})
  
  
 