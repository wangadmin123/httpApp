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
<title>周考成绩表</title>
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
<%-- <script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/showWeektest.js"></script> --%>
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
	top: -1px;
	right: 10px;
}

.xiala1 {
	position: relative;
	top: -2px;
	right: 20px;
}
</style>
<script type="text/javascript">
	function aa() {
		var queryCategoryLevel1 = $("#selectGrade").val();
		if (queryCategoryLevel1 != '' && queryCategoryLevel1 != null) {
			$
				.ajax({
					type : "post", //请求类型
					url : "gradeLevelAll", //请求的url
					data : {
						pid : queryCategoryLevel1
					}, //请求参数
					dataType : "json", //ajax接口（请求url）返回的数据类型
					success : function(data) { //data：返回数据（json对象）
						$("#whatweek").html("");
						var options = "";
						for (var i = 0; i < data.length; i++) {

							options += "<option selected='selected' value='" + data[i].whatweek + "'>第"
								+ data[i].whatweek + "次周考</option>";
						}
						$("#whatweek").html(options);
						showWeektest();
					},
					error : function(data) { //当访问时候，404，500 等非200的错误状态码
						alert("加载二级分类失败！");
					}
				});
		} else {
			$("#whatweek").html("");
			var options = "<option value=\"\">--请选择--</option>";
			alert(options);
			$("#whatweek").html(options);
		}
	}

	/**
	 * 查询日考成绩
	 * 
	 */
	function showWeektest() {
		$("#showWeektest").html("");
		var studentClassId = $("#selectGrade").val();
		//	var createTime = $("#createTime").val();
		var whatweek = $("#whatweek").val();
		$
			.ajax({
				type : "post", // 请求类型
				url : "getByClassIdAndTime?studentClassId="
					+ studentClassId
					/*+ "&&createTime=" + createTime*/ + "&&whatweek="
					+ whatweek, // 请求的url
				// data:{pid:studentClassId},//请求参数
				dataType : "json", // ajax接口（请求url）返回的数据类型
				success : function(data) { // data：返回数据（json对象）
					$("#showWeektest").html("");
					var firstTr = "<tr><th>学号</th><th>姓名</th><th>笔试</th><th>机试</th>";
					var table = "";
					for (var i = 0; i < data.length; i++) {
						var time = data[i].createtime;
						var time2 = data[i].writetime;
						var date = new Date();
						var d;
						var d2;
						if (date.getDate().toString().length == 1) {
							d = date.getFullYear() + "-" + (date.getMonth() + 1) + "-0" + date.getDate();
						} else {
							d = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate();
						}
						if ((date.getDate() - 1).toString().length == 1) {
							d2 = date.getFullYear() + "-" + (date.getMonth() + 1) + "-0" + (date.getDate() - 1);
						} else {
							d2 = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + (date.getDate() - 1);
						}
						if (time2 == d || time2 == d2 || "${loginUser.position.position_id }" == 20) {
							table += "<tr><td style=\"width: 200px;\">"
								+ data[i].stu_number
								+ "</td><td style=\"width: 200px;\">"
								+ data[i].stu_name
								+ "</td><td style=\"width: 200px;\"><a href='javascript:void(0)' onclick='xgzk(" + data[i].studentId + ",1)'>"
								+ data[i].written
								+ "</a></td><td style=\"width: 200px;\"><a href='javascript:void(0)' onclick='xgzk(" + data[i].studentId + ",2)'>"
								+ data[i].scjd + "</a></td>";
						} else {
							table += "<tr><td style=\"width: 200px;\">"
								+ data[i].stu_number
								+ "</td><td style=\"width: 200px;\">"
								+ data[i].stu_name
								+ "</td><td style=\"width: 200px;\">"
								+ data[i].written
								+ "</td><td style=\"width: 200px;\">"
								+ data[i].scjd + "</td>";
						}

					}
					$("#showWeektest").html(firstTr + table);
				},
				error : function(data) { // 当访问时候，404，500 等非200的错误状态码
					alert("加载周考失败");
				}
			});
	}

	function xgzk(id, i) {
		var jc = $("#whatweek").val();
		var date = new Date();
		var gradeId = $("#selectGrade").val();
		var score = prompt("请输入新成绩", "");
		if (score != null && score != "") {
			$.post("xgzk", {
				"id" : id,
				"jc" : jc,
				"gradeId" : gradeId,
				"score" : score,
				"i" : i
			}, function(data) {
				if (data >= 1) {
					alert("修改成功！");
					showWeektest();
				} else {
					alert("修改失败！");
				}
			}, "text");
		}
	}

	$(function() {
		aa();
	});
</script>
</head>
<body>
	<div class="rightContent">

		<from class="fromright"> <%-- <span style="font-size: 10px;">第</span>
		
		<input type="text" value="${whatweek}"
		id="whatweek" name="whatweek" style="width: 20px; text-align:center; font-size: 10px;">
		
		<span style="font-size: 10px;">次周考&nbsp;&nbsp;&nbsp;</span> --%> <select
			name="classId" id="selectGrade" class="xiala1" onchange="aa()">

			<c:if test="${gradeList != null}">
				<c:forEach var="grade" items="${gradeList}">
					<option
						<c:if test="${grade.id eq requestScope.classId}">selected="selected"</c:if>
						value="${grade.id}">${grade.name}</option>
				</c:forEach>
			</c:if>
		</select> <select name="whatweek" id="whatweek" onchange="showWeektest()"
			class="xiala">
			<%-- 			
			<c:if test="${weeks != null}">
				<c:forEach var="week" items="${weeks}">
					<option
						<c:if test="${week.whatweek eq requestScope.whatweek}">selected="selected"</c:if>
						value="${week.whatweek}">第${week.whatweek}次周考</option>
				</c:forEach>
			</c:if> --%>
		</select> <%-- <input type="date" class="dateStyle" name="createTime"
			id="createTime" value="${createTime}" style="width:160px; " /> --%> <input
			type="submit" value="搜索" class="searchBotton" id="sousuo"
			onclick="showWeektest()" /> </from>

		<div class="tabContent">

			<div class="serach">

				<table cellpadding="0" cellspacing="0" class="searchTable"
					border="0" style="width:80%;">

					<tr>
						<h2 align="center">周考成绩表</h2>

					</tr>

				</table>

			</div>

			<div class="divTable">
				<center>
					<table cellpadding="0" cellspacing="0" border="1"
						class="selectTable" style="font-size: 15px; width: 90%;"
						id="showWeektest">


					</table>
				</center>
			</div>
		</div>
	</div>
</body>
</html>
