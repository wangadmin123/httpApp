<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">

<title>日考成绩表</title>
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/all.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/search.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/formStyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/Test.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/globle.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/laydate/laydate.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/showDaytest.js"></script>

<style type="text/css">
.fromright {
	position: relative;
	left: 70%;
	top: 50px;
}

.xiala {
	position: relative;
	top: 1px;
	right: 10px;
}
</style>
<script type="text/javascript">

	/*查询日考成绩*/
function showDaytest() {

	chaxun();
	

}

function xg(id,e){	
	var score=prompt("请输入新成绩","");
	 if (score!=null && score != ""){
	 	$.post("xg",{"id":id,"score":score,"time":$(e).attr("name")},function(data){
	 		if(data>=1){
	 			alert("修改成功！");
	 			$("#showDaytest").html("");
	 			chaxun();
	 		}else{
	 			alert("修改失败！");
	 		}
	 	},"text");
	 }
}

function chaxun(){
	var studentClassId = $("#selectGrade").val();
	var createTime = $("#createTime").val();
	$.ajax({
		type : "post",// 请求类型
		url : "getDayByClassIdAndCreateTime?studentClassId=" + studentClassId
				+ "&&createTime=" + createTime,// 请求的url
		dataType : "json",// ajax接口（请求url）返回的数据类型
		success : function(data) {// data：返回数据（json对象）
			$("#showDaytest").html("");
			var firstTr = "<tr><th>学号</th><th>姓名</th><th>日考</th></tr>";
			var table = "";
			for ( var i = 0; i < data.length; i++) {
				var time = data[i].createtime;
				var time2 = data[i].writetime;
				var date = new Date();
				var d;
				var d2;
				if(date.getDate().toString().length == 1){
					d=date.getFullYear()+"-"+(date.getMonth()+1)+"-0"+date.getDate();
				}else{
					d=date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
				}
				if((date.getDate()-1).toString().length == 1){
					d2 = date.getFullYear()+"-"+(date.getMonth()+1)+"-0"+(date.getDate()-1);
				}else{
					d2 = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+(date.getDate()-1);
				}
				 
				if(time2 == d || time2 == d2 || "${loginUser.position.position_id }" == 20){
					table += "<tr><td style=\"width: 200px;\">"
						+ data[i].stu_number
						+ "</td><td style=\"width: 200px;\">"
						+ data[i].stu_name
						+ "</td><td style=\"width: 200px;\"><a href='javascript:void(0)' name="+time+" onclick='xg("+data[i].stu_id+",this)'>" + data[i].written
						+ "</a></td><tr>";
				}else{
					table += "<tr><td style=\"width: 200px;\">"
						+ time2+","+d
						+ "</td><td style=\"width: 200px;\">"
						+ data[i].stu_name
						+ "</td><td style=\"width: 200px;\">" + data[i].written
						+ "</td><tr>";
				}
			}
			$("#showDaytest").html(firstTr + table);
		},
		error : function(data) {// 当访问时候，404，500 等非200的错误状态码
			alert("加载日考表失败！");
		}
	});
}

$(function() {
	showDaytest();
});
</script>
</head>
<body>
	<div class="rightContent">


		<from class="fromright"> <select onchange="chaxun()" name="classId"
			id="selectGrade" class="xiala">
			<c:if test="${gradeList != null}">
				<c:forEach var="grade" items="${gradeList}">
					<option
						<c:if test="${grade.id eq requestScope.classId}">selected="selected"</c:if>
						value="${grade.id}">${grade.name}</option>
				</c:forEach>
			</c:if>
		</select> <input type="date" onchange="chaxun()" name="createTime" id="createTime"
			class="dateStyle" value="${createTime}" style="width:160px; " /> <input
			type="button" value="搜索" class="searchBotton" id="sousuo"
			onclick="showDaytest()" /> </from>
		<div class="tabContent">
			<div class="serach">
				<table cellpadding="0" cellspacing="0" class="searchTable"
					border="0" style="width:80%;">
					<tr>
						<h2 align="center">日考成绩表</h2>
					</tr>
				</table>
			</div>

			<div class="divTable">
				<center>
					<table cellpadding="0" cellspacing="0" border="1"
						class="selectTable" style="font-size: 15px; width: 90%;"
						id="showDaytest">

					</table>
				</center>
			</div>
		</div>
	</div>
</body>
</html>
