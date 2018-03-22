alert('같이 보기 게시판에 오신것을 환영 합니다.');

var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
      alert('if');
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
      alert('else');
    } 
  });
}