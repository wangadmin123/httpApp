var path = $("#path").val();
$(function(){
	//查看班级详情
	$(".link").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		window.location.href=path+"/gradeShowListLink/"+obj.attr("gradeid");
	});
	//修改班级详情
	$(".edit").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		window.location.href=path+"/UpdateShowListLink/"+obj.attr("gradeid");
	});
	//删除班级信息
	$(".delete").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		window.location.href=path+"/deleteShowListLink/"+obj.attr("gradeid");
	});
});
