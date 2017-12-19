<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>查看日报表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
	href="${pageContext.request.contextPath }/statics/academic_department/css/formStyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/add.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/globle.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/tab.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/showDailystatement.js"></script>
<style type="text/css">
.fromright {
	position: relative;
	left: 70%;
}

.xiala {
	position: relative;
	top: 1px;
	right: 10px;
}
</style>
</head>

<body>
	<div class="rightContent">

		<div class="tabs">
			<span class="spanHover">学生日报表</span>
		</div>
		<div class="tabContent">
			<h1 class="tabTitle">学生日报表</h1>


			<from class="fromright"> <select name="classId"
				id="selectGrade" class="xiala">
				<c:if test="${gradeList != null}">
					<c:forEach var="grade" items="${gradeList}">
						<option
							<c:if test="${grade.id eq requestScope.classId}">selected="selected"</c:if>
							value="${grade.id}">${grade.name}</option>
					</c:forEach>
				</c:if>
			</select> <input type="date" name="createTime" id="createTime"
				class="dateStyle" value="${createTime}" style="width:160px; " /> <input
				type="button" value="搜索" class="searchBotton" id="sousuo"
				onclick="showDailystatement()" /> </from>
			<div class="divTable">
				<center>
					<table cellpadding="0" cellspacing="0" border="1"
						class="selectTable" style="width: 90%;" id="showDailystatement">

						<c:if test="${bianji eq true }">
							<style>
							#edit {
								display: none;
							}
							</style>
						</c:if>
						
					</table>
				</center>
			</div>
		</div>
	</div>
</body>
</html>
