//访问控制器
	function empController1(index){
		var query = $("#querymonthly").serialize();	
		alert("a");
			query+="&currentPageNo="+index;
			$.ajax({
				type:"post",//请求类型
				url:"OaXsbMonthly/selectgrademonthlyss?"+query,//请求的url
				dataType:"json",//ajax接口（请求url）返回的数据类型
				success: MonList,
				error:function(data){//当访问时候，404，500 等非200的错误状态码
					alert("加载周考信息失败！");
				}
			});
	}
	//提取分配数据
	function MonList(data){
		var monthlyList = data;
		showMonthlyList(monthlyList);
	}
	//显示周考数据
	function showMonthlyList(monthlyList){
		alert("a");
	 	$("#monthlyscore").html("");

		var options = "<tr><th>学号</th><th>姓名</th><th>出勤率</th><th>上机率</th><th>单词率</th><th>笔试(100)</th><th>机试(100)</th></tr>";
		for(var i = 0; i < monthlyList.length; i++){
			options += "<tr><td>"+monthlyList[i].stuID+"</td><td>"+monthlyList[i].stu_name+"</td><td>100%</td><td>100%</td><td>100%</td><td>"+monthlyList[i].written+"</td><td>"+monthlyList[i].scjd+"</td></tr>";
		}
		$("#monthlyscore").html(options);
		
		/*"+employmentList[i].employment_studentId.id+"*/
	}
	//页面加载数据提交数据
	$(function(){
			
			$("#monthlybutton").click(function(){
			empController1(1);
	});

});