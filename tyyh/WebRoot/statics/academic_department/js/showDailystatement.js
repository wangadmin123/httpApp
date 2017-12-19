/**
 * 查询日报表
 */
function showDailystatement() {
	var studentClassId = $("#selectGrade").val();
	var createTime=$("#createTime").val();
	var classId =$("#selectGrade").val();
	$.ajax({
		type:"post",//请求类型
		url:"xsb/getDailyByClassIdAndCreateTime?studentClassId="+studentClassId+"&&createTime="+createTime+"&&classId="+classId,//请求的url
		//data:{pid:studentClassId},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）

			var dailyList1 = data.dailyList;
			var dailyList = eval("("+dailyList1+")");
			var fals=data.fals;
			var ricecounts =data.xsb;
			var ricecounts1 = eval("("+ricecounts+")");
			$("#showDailystatement").html("");
			if(dailyList.length>0){
				
			for(var i=0;i<ricecounts1.length;i++){
				var firstTr="<tr><th>学号</th><th>姓名</th><th>预习（"+ricecounts1[i].preparationCount+"）个</th><th>本上</th><th>上机（"+ricecounts1[i].obuCount+"）个</th><th>课后（"+ricecounts1[i].homeworkCount+"）个</th><th>创建时间</th><th>操作</th></tr>";
			}


			var table = "";
			for(var i = 0; i < dailyList.length; i++){
				if(fals[i]){
					table += "<tr><td style=\"width: 200px;\">"+dailyList[i].stu_number+"</td>"
					+"<td style=\"width: 200px;\">"+dailyList[i].stu_name+"</td>"
					if(ricecounts1[i].preparationCount!=dailyList[i].preparation){
						table += "<td style=\"width: 200px;color:red;font-weight:bold\">"+dailyList[i].preparation+"</td>"
					}else{
						table += "<td style=\"width: 200px;\">"+dailyList[i].preparation+"</td>"
					}
					table += "<td style=\"width: 200px;\">"+dailyList[i].manami+"</td>";
					if(ricecounts1[i].obuCount!=dailyList[i].obu){
						table += "<td style=\"width: 200px;color:red;font-weight:bold\">"+dailyList[i].obu+"</td>";
					}else{
						table += "<td style=\"width: 200px;\">"+dailyList[i].obu+"</td>";
					}
					if(ricecounts1[i].homeworkCount!=dailyList[i].homework){
						table += "<td style=\"width: 200px;color:red;font-weight:bold\">"+dailyList[i].homework+"</td>";
					}else{
						table += "<td style=\"width: 200px;\">"+dailyList[i].homework+"</td>";
					}
					table += "<td style=\"width: 200px;\">"+dailyList[i].createtime+"</td>"
					+"<td style=\"width: 200px;\"><span>已超48小时</span></td><tr>";
				}else{
					table += "<tr><td style=\"width: 200px;\">"+dailyList[i].stu_number+"</td>"
					+"<td style=\"width: 200px;\">"+dailyList[i].stu_name+"</td>"
					if(ricecounts1[i].preparationCount!=dailyList[i].preparation){
						table += "<td style=\"width: 200px;color:red;font-weight:bold\">"+dailyList[i].preparation+"</td>"
					}else{
						table += "<td style=\"width: 200px;\">"+dailyList[i].preparation+"</td>"
					}
					table += "<td style=\"width: 200px;\">"+dailyList[i].manami+"</td>";
					if(ricecounts1[i].obuCount!=dailyList[i].obu){
						table += "<td style=\"width: 200px;color:red;font-weight:bold\">"+dailyList[i].obu+"</td>";
					}else{
						table += "<td style=\"width: 200px;\">"+dailyList[i].obu+"</td>";
					}
					if(ricecounts1[i].homeworkCount!=dailyList[i].homework){
						table += "<td style=\"width: 200px;color:red;font-weight:bold\">"+dailyList[i].homework+"</td>";
					}else{
						table += "<td style=\"width: 200px;\">"+dailyList[i].homework+"</td>";
					}
					table += "<td style=\"width: 200px;\">"+dailyList[i].createtime+"</td>"
							+"<td style=\"width: 200px;\"><span><a href='xsb/selectDailyById?dailyId="+dailyList[i].id+"' id='edit'  class='edit'>编辑</a></span></td><tr>";
				}

			}
			$("#showDailystatement").html(firstTr+table);
			}else{
				$("#showDailystatement").html("<p style='color:red;'>未录入数据</p>");	
			}
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载日报失败");
		}
	});

}
$(function(){
	showDailystatement();
});





