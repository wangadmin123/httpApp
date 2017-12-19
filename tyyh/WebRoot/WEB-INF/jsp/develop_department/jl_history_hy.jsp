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
<h2>历史会议管理</h2>
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
	showmeet();
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
		showmeet(GradeID,GroupID);
		
	});
function showmeet(GradeID,GroupID) {
	$.ajax({
		url:"${pageContext.request.contextPath}/KfbMetting/getmetting",
		type:"POST",
		data:{"gradeid":GradeID,"groupid":GroupID},
		success:function(result){	
			//console.log(result);
			build_stus_tbale(result);		
		}
	});
}
function build_stus_tbale(result) {
	$("#mettab tbody").empty();
	var emps = result.extend.mettings;
	$.each(emps, function(index, item) {
		var GroupTD=$("<td></td>").append(item.groupname);
		var witerTD=$("<td></td>").append(item.stu_name);
		var typeTD=$("<td></td>").append(item.type==1?"晨会":"班后会");
		var starttimeTD=$("<td></td>").append(item.starttime);
		var contentTD=$("<td></td>").append($("<textarea></textarea>").append(item.content)
		.attr("cols","60").attr("rows","5").attr("readonly","readonly").attr("style","resize:none"));
		$("<tr></tr>").append(GroupTD).append(witerTD).append(typeTD)
		.append(starttimeTD).append(contentTD).appendTo("#mettab tbody");
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
								onclick="NewPage('develop/jl_xzhy.html')" /></td>
								<td><input type="button" value="搜索" class="searchBotton"
								id="search" /></td>
							</tr>
					</table>
				</form>

			</div>

		<h1 class="tabTitle">会议信息</h1>
			<div class="divTable">
				<table cellpadding="0" cellspacing="0" border="0"
					class="selectTable" id="mettab">
					<thead>
					<tr>
						<th>组名</th>
						<th>记录人</th>
						<th>会议类型</th>
						<th>会议日期</th>
						<th>会议纪要</th>
					</tr>
					</thead>
					<tbody></tbody>

				</table>
			</div>
		</div>

	</div>



	
</body>

</html>
