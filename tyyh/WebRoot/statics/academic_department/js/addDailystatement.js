$(function() {
	$("#selectGrade")
			.change(
					function() {
						var studentClassId = $("#selectGrade").val();
						$
								.ajax({
									type : "post",// 请求类型
									url : "getStudentByClassId?studentClassId="
											+ studentClassId,// 请求的url
									// data:{pid:studentClassId},//请求参数
									dataType : "json",// ajax接口（请求url）返回的数据类型
									success : function(data) {// data：返回数据（json对象）
										$("#addDailystatement").html("");
										var firstTr = "<tr><th>学号</th><th>姓名</th><th>预习&nbsp;&nbsp;&nbsp;<input type=\"text\" id=\"yuxi\" class=\"textStyle\"  onblur=\"blue1();\" placeholder=\"预习情况\"></th>"
												+ "<th>本上作业&nbsp;&nbsp;&nbsp;<input type=\"text\" id=\"benshang\" class=\"textStyle\"  onblur=\"blue2();\" placeholder=\"完成情况\"></th>"
												+ "<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上机&nbsp;&nbsp;&nbsp;"
												+ "<input type=\"text\" id=\"number\" class=\"textStyle\"  onblur=\"blue();\" placeholder=\"上机题数\"></th>"
												+ "<th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;课后&nbsp;&nbsp;&nbsp;"
												+ "<input type=\"text\" id=\"machine\" class=\"textStyle\" onblur=\"yeal();\"placeholder=\"课后题数\"></th></tr>";
										var table = "";
										for ( var i = 0; i < data.length; i++) {
											table += "<tr><td style=\"width: 200px;\">"
													+ data[i].stu_number
													+ "</td><td style=\"width: 200px;\">"
													+ data[i].stu_name
													+ "</td><td style=\"width: 200px;\"><input type=\"text\" class=\"textStyle yuxi1\" name=\"preparation\" style=\"width: 200px;border: none;\" placeholder=\"预习情况\"></td><td style=\"width: 200px;\"><input type=\"text\" class=\"textStyle benshang1\" name=\"manami\" style=\"width: 200px;border: none;\" placeholder=\"完成情况\"></td><td style=\"width: 200px;\"><input type=\"text\" class=\"textStyle number1\" name=\"obu\" style=\"width: 200px;border: none;\" placeholder=\"上机练习正确数\"></td><td style=\"width: 200px;\"><input type=\"text\" class=\"textStyle machine1\" name=\"homework\" style=\"width: 200px;border: none;\" placeholder=\"课后练习正确数\"></td>"
													+ "<input type=\"hidden\" name=\"studentId\" value='"
													+ data[i].stu_Id
													+ "' /></tr>";
										}
										$("#addDailystatement").html(
												firstTr + table);
									},
									error : function(data) {//当访问时候，404，500 等非200的错误状态码
										alert("加载日报表失败");
									}
								});
					});
});
