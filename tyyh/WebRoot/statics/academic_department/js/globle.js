$(function(){
	var clicknum=0;
	$(".yulanBotton").click(function(){
		if(clicknum>0){
			$(this).attr("disabled","disabled");
		}
		clicknum++;
	});
});
