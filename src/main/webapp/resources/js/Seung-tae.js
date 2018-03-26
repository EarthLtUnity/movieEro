/*alert('같이 보기 게시판에 오신것을 환영 합니다.');*/




		  
		$('a[href*="#"]').click(function(){
	  alert('모든 앵커태그 클릭시 나타남');
	  var target = $(this.hash);
      target = target.length ? target : $('[name' + this.hash.slice(1) + ']');
      if (target.length) {
          $('jsp, body').animate({
              scrollTop: target.offset().top
          }, 1000);
          return false;
      }
  
  })

  
  
  
  
  
  
  

 var accordions = document.getElementsByClassName("accordion");
  
  for(var i=0; i<accordions.length; i++){
	
	  accordions[i].onclick=function(){
		  var content = this.nextElementSibling;
		  
		  if(content.style.maxHeight){
			  content.style.maxHeight = null;
			  
		  }else{
			  content.style.maxHeight = content.scrollHeight + "px";
		  }
		
	  } 
  }
  
  
  
  
  
  
  
  
 