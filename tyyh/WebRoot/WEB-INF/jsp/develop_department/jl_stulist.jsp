<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>学员管理</title>

<br>
<h2>学员管理</h2>
</br>
<hr />
<br />

<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/search.css" />
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css" />
<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
<script type="text/javascript" src="statics/develop_department/js/index.js"></script>
<script type="text/javascript" src="statics/develop_department/laydate/laydate.js"></script>

<script type="text/javascript">
/*查询学生 */
$(function() {
	showstu("","",1);
	$("#search").click(function() {
		var ID=$("#stuID").val();
		var Name=$("#stuName").val();
		showstu(ID,Name,1);
		
	});
	$("#addbtn").click(function() {
	$.ajax({
		url:"${pageContext.request.contextPath}/KfbUser/InsertUserFromStu",
		type:"GET",
		success:function(result){	
			//console.log(result);
			alert(result.msg);
		}
	});
	});

function showstu(ID,Name,pn) {
	$.ajax({
		url:"${pageContext.request.contextPath}/KfbUser/getstu",
		type:"POST",
		data:{"stu_id":ID,"stu_name":Name,"pn":pn},
		success:function(result){	
			//console.log(result);
			build_stus_tbale(result);
			
		}
	});
}
function build_stus_tbale(result) {
	$("#showtb tbody").empty();
	var emps = result.extend.stus;
	$.each(emps, function(index, item) {
		var IdTD=$("<td></td>").append(item.stu_id);
		var NameTD=$("<td></td>").append(item.stu_name);	
		var AgeTD=$("<td></td>").append(item.stu_age);
		var SexTD=$("<td></td>").append(item.stu_sex);
		var RankTD=$("<td></td>").append(item.appraise);
		var EmailTD=$("<td></td>").append(item.e_mail);
		var PhoneTD=$("<td></td>").append(item.contact_way);
		var WechatTD=$("<td></td>").append(item.wechat);
		$("<tr></tr>").append(IdTD).append(NameTD).append(AgeTD).append(SexTD).append(RankTD).append(EmailTD).append(PhoneTD).append(WechatTD).appendTo("#showtb tbody");
		});
}


//完成全选/全不选
$("#check_all").click(function() {
	//attr 获取checked是undefined;
	//dom原生属性用prop获取，attr获取自定义属性
	//prop修改和读取dom原生属性值
	//$(this).prop("checked");
	$(".check_item").prop("checked",$(this).prop("checked"));
});
$(document).on("click",".check_item",function() {
	//判断当前选中的元素是不是5个
	var flag=$(".check_item:checked").length==$(".check_item").length;
	$("#check_all").prop("checked",flag); 
	
});

});


</script>
</head>
<body>


	<div class="rightContent">

		<div class="tabContent">
			<div class="serach">
				<form id="queryterm">
					<table cellpadding="0" cellspacing="0" class="searchTable"
						border="0" style="width: 80%;">
					
						<tr>
							<td><h3>学号：</h3></td>
							<td><input type="search" class="searchStyle" name="stuID"
								id="stuID" style="width: 160px;" /></td>
							<td><h3>姓名：</h3></td>
							<td><input type="search" class="searchStyle" name="stuName"
								id="stuName" style="width: 160px;" /></td>
							<td><input type="button" value="搜索" class="searchBotton"
								id="search" /><input type="button" value="历史" class="searchBotton"
								onclick="NewPage('develop/jl_history_stu.html')" /><input type="button" value="添加学生到开发部" class="searchBotton"
								id="addbtn" style="width: 130px;"/>	</td>

						</tr>
					</table>
				</form>

			</div>

			<h1 class="tabTitle">基本信息 </h1>
			<div class="divTable">
				<table cellpadding="0" cellspacing="0" border="0" class="selectTable" id="showtb">
					<thead>
						<tr>
							<th>学号</th>
							<th>姓名</th>
							<th>年龄</th>
							<th>性别</th>
							<th>成绩评价</th>
							<th>邮箱</th>
							<th>联系方式</th>
							<th>微信</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>

	</div>



	
</body>

</html>
