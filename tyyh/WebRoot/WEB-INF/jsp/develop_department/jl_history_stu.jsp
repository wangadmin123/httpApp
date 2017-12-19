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
<title>历史学员管理</title>

<br>
<h2>历史学员管理</h2>
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
	showstu();
	build_grade();
	$("#gradeid").change(function(){
 	var gradeid= $(this).val();
 	//alert(gradeid);
 		$.ajax({
		url:"${pageContext.request.contextPath}/KfbGroup/ByGrade/"+gradeid,
		type:"POST",
		success:function(result){	
			$("#groupid").empty();
			var group=result.extend.groups;
			$("<option></option>").append("--请选择--").attr("value",0).appendTo("#groupid");
			$.each(group, function(index,item) {
			$("<option>"+item.groupname+"</option>").attr("value",item.id).appendTo("#groupid");
			});
		}
	});
});
	
	$("#search").click(function() {
		var GradeID=$("#gradeid").val();
		var GroupID=$("#groupid").val();
		var ID=$("#stuID").val();
		var Name=$("#stuName").val();
		//alert(GradeID+GroupID+ID+Name);
		showstu(GradeID,GroupID,ID,Name);
		
	});
function showstu(GradeID,GroupID,ID,Name) {
	$.ajax({
		url:"${pageContext.request.contextPath}/KfbUser/gethistorystu",
		type:"POST",
		data:{"stu_id":ID,"stu_name":Name,"gradeid":GradeID,"groupid":GroupID},
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
		var GroupTD=$("<td></td>").append(item.groupname);
		var JobTD=$("<td></td>").append(item.jobname);
		$("<tr></tr>").append(IdTD).append(NameTD).append(AgeTD).append(SexTD).append(RankTD).append(EmailTD).append(PhoneTD).append(WechatTD).append(GroupTD).append(JobTD).appendTo("#showtb tbody");
		});
}
	function build_grade(){
	 	$.ajax({
		url:"${pageContext.request.contextPath}/KfbUser/getGrade",
		type:"GET",
		success:function(result){	
		$("#gradeid").empty();
		var grade=result.extend.grades;
		$("<option></option>").append("--请选择--").attr("value",0).appendTo("#groupid");
		$("<option></option>").append("--请选择--").attr("value",0).appendTo("#gradeid");
		$.each(grade, function(key, value) {
		// alert(key + "_" + value);
		$("<option>"+value+"</option>").attr("value",key).appendTo("#gradeid");
		});
		}
	});

	}

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
							<td><h3>班级名称：</h3></td>
							<td><select id="gradeid" name="gradeid" class="searchStyle" style="width:160px;">
							
							</select>
							</td>
							<td><h3>小组名称：</h3></td>
							<td>
							<select name="groupid" id="groupid" class="searchStyle" style="width:160px;">
								
							</select>
							</td>
							<td>
							<input type="button" value="返回" class="searchBotton"
								onclick="NewPage('develop/jl_stulist.html')" /></td>
							</tr>
						<tr><td><h3>学号：</h3></td>
							<td><input type="search" class="searchStyle" name="stuID"
								id="stuID" style="width: 160px;" /></td>
							<td><h3>姓名：</h3></td>
							<td><input type="search" class="searchStyle" name="stuName"
								id="stuName" style="width: 160px;" /></td>
							<td><input type="button" value="搜索" class="searchBotton"
								id="search" /></td>
								
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
						   <th>小组</th>
							<th>职务</th>
						</tr>
					</thead>
					<tbody></tbody>
				</table>
			</div>
		</div>

	</div>



	
</body>

</html>
