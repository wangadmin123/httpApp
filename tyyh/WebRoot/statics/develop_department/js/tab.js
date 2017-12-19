// JavaScript Document
$(function(){
	$(".tabs span").click(function(){
			$(this).addClass("spanHover");
			$(this).siblings().removeClass("spanHover");
			$(this).siblings().addClass("spanOut");
			/**/
			var $text=$(this).text();
			$("h1").text($text);
			
			$(".divTable").hide();
			$(".divTable").eq($(this).index()).show();
	});
	
});