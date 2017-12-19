<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>月考成绩表</title>
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
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/laydate/laydate.js"></script> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/showMonthtest.js"></script>

<script
	src="${pageContext.request.contextPath }/statics/academic_department/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/academic_department/js/DatePicker.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/academic_department/js/SimpleCanleder.js"></script>
<link
	href="${pageContext.request.contextPath }/statics/academic_department/css/SimpleCanleder.css"
	rel="stylesheet">
<style type="text/css">
.yulanBotton {
	cursor: pointer;
	background-color: #44bb00;
	width: 70px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	border: 0px;
	border-radius: 3px;
	margin-right: 20px;
	position: relative;
	left: 93%;
	top: 85%;
}

.textStyle {
	width: 100px;
}

.fromright {
	position: relative;
	left: 80%;
	top: 50px;
}

.xiala {
	position: relative;
	top: 0px;
	right: 10px;
}
</style>
<script type="text/javascript">
	/*查询月考成绩*/
	function showMonthtest() {
		var studentClassId = $("#selectGrade").val();
		var createTime = $("#createTime").val();
		$.ajax({
			type : "post", // 请求类型
			url : "getMonthByClassIdAndCreateTime?studentClassId=" + studentClassId
				+ "&&createTime=" + createTime, // 请求的url
			// data:{pid:studentClassId},//请求参数
			dataType : "json", // ajax接口（请求url）返回的数据类型
			success : function(data) { // data：返回数据（json对象）
				$("#showMonthtest").html("");
				var firstTr = "<tr><th>学号</th><th>姓名</th><th>笔试</th><th>机试</th>";
				var table = "";
				for (var i = 0; i < data.length; i++) {
					var time = data[i].createtime;
					var date = new Date;
					var d2 = time.substring(0,7)
					var d = date.getFullYear()+"-"+(date.getMonth()+1)
					if("${loginUser.position.position_id }" == 20||d == d2){
						table += "<tr><td style=\"width: 200px;\">"
							+ data[i].stu_number
							+ "</td><td style=\"width: 200px;\">"
							+ data[i].stu_name
							+ "</td><td style=\"width: 200px;\"><a href='javascript:void(0)' name=" + time + " onclick='xgyk(" + data[i].studentId + ",1,this)'>" + data[i].written
							+ "</a></td><td style=\"width: 200px;\"><a href='javascript:void(0)' name=" + time + " onclick='xgyk(" + data[i].studentId + ",2,this)'>" + data[i].scjd
							+ "</a></td></tr>";
					}else{
						table += "<tr><td style=\"width: 200px;\">"
							+ data[i].stu_number
							+ "</td><td style=\"width: 200px;\">"
							+ data[i].stu_name
							+ "</td><td style=\"width: 200px;\">" + data[i].written
							+ "</td><td style=\"width: 200px;\">" + data[i].scjd
							+ "</td></tr>";
					}
						
					

				}
				$("#showMonthtest").html(firstTr + table);
			},
			error : function(data) { // 当访问时候，404，500 等非200的错误状态码
				alert("加载月考成绩失败");
			}
		});
	}

	function xgyk(id, i, e) {
		var jc = $("#whatweek").val();
		var gradeId = $("#selectGrade").val();
		var score = prompt("请输入新成绩", "");
		if (score != null && score != "") {
			$.post("xgyk", {
				"id" : id,
				"jc" : jc,
				"time" : $(e).attr("name"),
				"gradeId" : gradeId,
				"score" : score,
				"i" : i
			}, function(data) {
				if (data >= 1) {
					alert("修改成功！");
					showMonthtest();
				} else {
					alert("修改失败！");
				}
			}, "text");
		}
	}

	$(function() {
		showMonthtest();
	});
</script>
</head>
<body>
	<div class="rightContent">

		<from class="fromright"> <select name="classId" onchange="showMonthtest()"
			id="selectGrade" class="xiala">
			<c:if test="${gradeList != null}">
				<c:forEach var="grade" items="${gradeList}">
					<option
						<c:if test="${grade.id eq requestScope.classId}">selected="selected"</c:if>
						value="${grade.id}">${grade.name}</option>
				</c:forEach>
			</c:if>
		</select> <input type="text" id="createTime"  value="${createTime}"
			name="createTime" style="width:80px;" /> <script
			type="text/javascript">
				$(function() {
					$("#createTime").simpleCanleder();
				});
			</script> <%-- <input type="date" class="dateStyle" name="createTime"
			id="createTime" value="${createTime}" style="width:160px; " /> --%> <input
			type="submit" value="搜索" class="searchBotton" id="sousuo"
			onclick="showMonthtest()" /> </from>

		<div class="tabContent">

			<div class="serach">

				<table cellpadding="0" cellspacing="0" class="searchTable"
					border="0" style="width:80%;">

					<tr>
						<h2 align="center">月考成绩表</h2>

					</tr>

				</table>

			</div>

			<div class="divTable">
				<center>
					<table cellpadding="0" cellspacing="0" border="1"
						class="selectTable" style="font-size: 15px;  width: 90%;"
						id="showMonthtest">


					</table>
				</center>
			</div>
		</div>
	</div>
</body>
</html>
