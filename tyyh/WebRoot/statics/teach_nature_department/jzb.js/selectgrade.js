var path = $("#path").val();
$(function(){
	$(".editgexingfangt").on("click",function(){
		var obj = $(this);
		/*alert(obj.attr("stuInfoId"));*/
		window.location.href=path+"/editInterview?id="+obj.attr("stuInfoId");
	});
});
$(function(){
	$(".deletegexingfangt").on("click",function(){
		var obj = $(this);
		window.location.href=path+"/deleteInterview?id="+obj.attr("stuInfoId");
	});
});
$(function(){
	$("#addgexingfangt").on("click",function(){
		alert(path+"/addstuterview.html");
		window.location.href=path+"/addstuterview.html";
	});
});
$(function(){
	$(".edit").on("click",function(){
		var obj = $(this);
		var id = obj.attr("openclassid");
		window.location.href=path+"/modifykbqk?id="+id;
	});
	$(".delete").on("click",function(){
		var obj = $(this);
		var id = obj.attr("openclassid");
		window.location.href=path+"/delkbqk?id="+id;
	});
});



