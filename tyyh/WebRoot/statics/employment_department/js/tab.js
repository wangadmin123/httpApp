// JavaScript Document


function showJiuye(){
		
		var inn = $("#indexShow").val();	
		if(inn == 1){		
			$(".tabs span").addClass("spanHover");
			$(".tabs span").siblings().removeClass("spanHover");
			$(".tabs span").siblings().addClass("spanOut");	
			var $text=$(this).text();
			$("h1").text("已就业信息");
			$(".divTable").hide();	
			$(".divTable").eq($(this).index()).show();
		}
		
	}
$(function(){
	
	showJiuye();
	
	
	$(".tabs span").click(function(){
			$(this).addClass("spanHover");
			$(this).siblings().removeClass("spanHover");
			$(this).siblings().addClass("spanOut");
			/**/
			var $text=$(this).text();
			$("h1").text("待就业信息");
			
			$(".divTable").hide();
			$(".divTable").eq($(this).index()).show();
	});
	
});