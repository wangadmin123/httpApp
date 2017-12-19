// JavaScript Document
var index=0;//记录的tab索引
$(function(){
	
	
	//开始公用
	//this改为索引
	var getIndex=$("#getIndex").val();
	index=getIndex;
	//alert(index)
	$(".tabs span").eq(index).addClass("spanHover");
	$(".tabs span").eq(index).siblings().removeClass("spanHover");
	$(".tabs span").eq(index).siblings().addClass("spanOut");
	
	$(".divTable").hide();
	$(".divTable").eq(index).show();
	
	
	//结束
	
	/*开始*/
	$(".tabs span").click(function(){

		
		index=$(this).index();
		saveIndex(index);
		$(this).addClass("spanHover");
		$(this).siblings().removeClass("spanHover");
		$(this).siblings().addClass("spanOut");

		/**/
		var $text=$(this).text();
		$("h1").text($text);
		$(".divTable").hide();
		
			$(".divTable").eq($(this).index()).show();

	});
	/*结束*/
	
	/*保存tab索引的方法*/
	function saveIndex(index){
		$.ajax({
			url:"Tabindex/saveIndex",
			data:"index="+index,
			type:"post",
			success:function(res){
				
				index=res;
			},
			error:function(){
				alert("页面异常！")
			}
		});
	}
	
	
});