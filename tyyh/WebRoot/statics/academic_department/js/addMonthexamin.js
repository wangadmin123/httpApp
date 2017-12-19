$(function(){
	$("#selectGrade").change(function() {
		
		var studentClassId = $("#selectGrade").val();
		if(studentClassId == null || studentClassId == ""){
			studentClassId = 1;
		}
		$.ajax({
			type:"post",//请求类型
			url:"jzb/getStudentByClassId?studentClassId="+studentClassId,//请求的url
			//data:{pid:studentClassId},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
			$("#addDailystatement").html("");
				var firstTr="<tr><th>学号</th><th>姓名</th><th>机试</th>"+
							"<th>笔试</th>";
				var table = "";
				for(var i = 0; i < data.length; i++){
					table += "<tr><td style=\"width: 200px;\">"
						+data[i].stu_number+"</td><td style=\"width: 200px;\">"
						+data[i].stu_name+"</td><td style=\"width: 200px;\"><input type=\"text\" class=\"textStyle yuxi1\" name=\"written\" style=\"width: 200px;border: none;\"></td><td style=\"width: 200px;\"><input type=\"text\" class=\"textStyle benshang1\" name=\"scjd\" style=\"width: 200px;border: none;\">"+
						"<input type=\"hidden\" name=\"studentId\" value='"+data[i].stu_Id+"' /></tr>";
									
				
				
				}
				$("#addDailystatement").html(firstTr+table);
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				alert("加载日报表失败");
			}
		});
	});
});
