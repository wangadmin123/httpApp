var path = $("#path").val();
$(function(){
	/*查询学员详细信息*/
	$(".link").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		alert(path+"/oaJzbStudentInfo/"+obj.attr("stuid"));
		window.location.href=path+"/oaJzbAllStudentInfo/"+obj.attr("stuid");
	});
	/*编辑学员详细信息*/
	$(".edit").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		alert(path+"/editStuInfo/"+obj.attr("stuid"));
		window.location.href=path+"/editStuInfo/"+obj.attr("stuid");
	});
	/*删除学员详细信息*/
	$(".delete").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		var obj = $(this);
		alert(path+"/deleteStuInfo/"+obj.attr("stuid"));
		window.location.href=path+"/deleteStuInfo/"+obj.attr("stuid");
	});
});