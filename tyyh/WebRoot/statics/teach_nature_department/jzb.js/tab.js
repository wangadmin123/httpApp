// JavaScript Document
$(function(){
	$(".tabs span").click(function(){
		var path=window.location.host;
		var index=document.getElementById("object").value;
		$.ajax({
			type:"get",
			url:"/tyyhoa/grade/showOaXsbGradeList",
			data:{"index":index},
			dataType:"json",
			success:function(data){
				 $("#objectList table").empty(); 
			  	var  str="<tr>组别<th>姓名</th><th>个人得分</th><th>小组得分</th><th>小组表现</th><th>备注</th><th>操作</th></tr>";
			  	for(var i=0;i<data.length;i++){
			  		str+="<tr><td>"+data[i].group_name+"</td><td>"+data[i].student_name+"</td><td>"+data[i].score+"</td><td>"+data[i].group_expression+"</td><td>"+data[i].remarks+"</td><td><a href=\"grade/showOaJzbProject?id="+data[i].id+"\">修改</a><a class=\"deleteOaJzbProject\"  href=\"javascript:;\" oid="+data[i].id+">&nbsp;&nbsp;&nbsp;&nbsp;删除</a></td></tr>";
			  	}
			  	 $("#objectList table").html(str);
			},error:function(data){
				alert("对不起，删除失败");
			}
		});
			$(this).addClass("spanHover");
			$(this).siblings().removeClass("spanHover");
			$(this).siblings().addClass("spanOut");
			/**/
			var $text=$(this).text();
			$("h1").text($text);
			
			$(".divTable").hide();
			$(".divTable").eq($(this).index()).show();
	
	});
	
	$(".deleteOaJzbProject").on("click",function(){
		alert("a");
		var obj = $(this);
		
			/*$.ajax({
				type:"GET",
				url:"/grade/deleteOaJzbProject",
				data:{id:obj.attr("oid")},
				dataType:"json",
				success:function(data){
					if(data.delResult == "true"){//删除成功：移除删除行
						alert("删除成功");
						obj.parents("tr").remove();
					}else if(data.delResult == "false"){//删除失败
						alert("对不起，删除失败");
					}else if(data.delResult == "notexist"){
						alert("对不起,不存在");
					}
				},
				error:function(data){
					alert("对不起，删除失败");
				}
			});*/

	});
});
