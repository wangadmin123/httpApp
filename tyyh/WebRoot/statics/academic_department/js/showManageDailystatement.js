/**
 * 查询日报表
 */
function showDailystatement() {
	var studentClassId = $("#selectGrade").val();
	var createTime=$("#createTime").val();
	$.ajax({
		type:"post",//请求类型
		url:"xsb/getDailyByClassIdAndCreateTime?studentClassId="+studentClassId+"&&createTime="+createTime,//请求的url
		//data:{pid:studentClassId},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
				var dailyList1 = data.dailyList;
				var dailyList = eval("("+dailyList1+")");
				$("#showDailystatement").html("");
				var firstTr="<tr><th>学号</th><th>姓名</th><th>预习</th><th>本上</th><th>上机</th><th>课后</th><th>创建时间</th><th>操作</th></tr>";
				var table = "";
				for(var i = 0; i < dailyList.length; i++){
						table += "<tr><td style=\"width: 200px;\">"
							+dailyList[i].stu_number+"</td><td style=\"width: 200px;\">"
							+dailyList[i].stu_name+"</td><td style=\"width: 200px;\">"
							+dailyList[i].preparation+"</td><td style=\"width: 200px;\">"
							+dailyList[i].manami+"</td><td style=\"width: 200px;\">"
							+dailyList[i].obu+"</td><td style=\"width: 200px;\">"
							+dailyList[i].homework+"</td><td style=\"width: 200px;\">"
							+dailyList[i].createtime+"</td><tr>";
					
				}
				$("#showDailystatement").html(firstTr+table);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载日报失败");
		}
	});

}
$(function(){
	showDailystatement();
});





