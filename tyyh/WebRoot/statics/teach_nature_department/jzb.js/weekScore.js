//访问控制器
	function empController(index){
		var query = $("#queryweek").serialize();
		
			query+="&currentPageNo="+index;
			$.ajax({
				type:"post",//请求类型
				url:"OaXsbWeek/selectgradess?"+query,//请求的url
				dataType:"json",//ajax接口（请求url）返回的数据类型
				success: empList,
				error:function(data){//当访问时候，404，500 等非200的错误状态码
					alert("加载周考信息失败！");
				}
			});
	}
	
	
	//提取分配数据
	function empList(data){
		var weekList = data;
		showWeekList(weekList);
	}
	

	
	//显示周考数据
	function showWeekList(weekList){
	 	$("#weekscore").html("");

		var options = "<tr><th>学号</th><th>姓名</th><th>笔试(100)</th><th>机试(100)</th></tr>";
		for(var i = 0; i < weekList.length; i++){
			options += "<tr><td>"+weekList[i].stuID+"</td><td>"+weekList[i].stu_name+"</td><td>"+weekList[i].written+"</td><td>"+weekList[i].scjd+"</td></tr>";
		}
		$("#weekscore").html(options);
		
		/*"+employmentList[i].employment_studentId.id+"*/
	}
	
	/*//分页
	function page(currentPageNo,totalPageCount,totalCount){
		   $("#page").html("");
		
		   var options="当前"+(currentPageNo-1)*2+"-"+totalCount+"条";
		   var indexPage =parseInt(currentPageNo);
		   options+="<span><a href='javascript: onclick=empController(1)'>首页</a></span>";
		   if(currentPageNo !=1){
			   options+="<span><a href='javascript: onclick=empController("+(indexPage-1)+")'>上一页</a></span>";			   
		   }

		   for(var i = indexPage; i <= totalPageCount; i++){
			   options+="<span><a href='javascript: onclick=empController("+i+")'>"+i+"</a></span>";
		   }   
		   options+="<span><a href='javascript: onclick=empController("+totalPageCount+")'>最后一页</a></span>";
		   if(currentPageNo != totalPageCount){
			   options+="<span><a href='javascript: onclick=empController("+(indexPage+1)+")'>下一页</a></span>";
			   			   
		   }
		  
	
		   options+="共"+totalPageCount+"页";
		   $("#page").html(options);
	}*/

	//页面加载数据提交数据
	$(function(){
			
			$("#weekbutton").click(function(){
			empController(1);
	});

});
	
	
	