$("#btnJoin").on("click", function(){
	$("#frmMemberJoin").submit();
});

$('#headerNav>ul>li').on('mouseenter', function() {
	$(this).children('.dep2').show();
});
$('#headerNav>ul>li').on('mouseleave', function() {
	$(this).children('.dep2').hide();
})