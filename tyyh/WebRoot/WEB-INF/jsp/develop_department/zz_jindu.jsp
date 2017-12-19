<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<base href="<%=basePath%>">
<title>进度</title>
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/formStyle.css" />
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/add.css" />
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/switch.css">
<script type="text/javascript"
	src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="statics/develop_department/js/globle.js"></script>
<script type="text/javascript">
	/*确定保存弹出框的位置*/
	$(function() {
		var saveWidth = $(window).width();
		var saveHeight = $(window).height();
		$(".saveStyle").css("left", saveWidth / 2 - 130);
		$(".saveStyle").css("top", saveHeight / 2 - 40);

	});

	/*保存读秒结束*/
</script>
</head>
<body>
	<div class="rightContent">

		<div class="tabContent">
			<h1 class="tabTitle">发布项目任务</h1>
			<form action="develop/faburenwu.html?did=${did}" method="post">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth"><span>*</span>名称：</td>
						<td><input type="text" class="textStyle" name="content"
							style="width:160px;" placeholder="请输入任务名称"  required="required"/><span>*名称不能为空</span></td>
					</tr>

					<tr>
						<td class="tdWidth">所属阶段：</td>
						<td><select name="stageid" required="required">
								<option value="">--请选择--</option>
								<c:forEach var="dataDictionary" items="${stageList}">
									<option value="${dataDictionary.id}">${dataDictionary.stagename}</option>
								</c:forEach>
						</select></td>
					</tr>


					<tr>
						<td class="tdWidth">开始时间：</td>
						<td><input type="date" class="dateStyle" name="startime"
							style="width:160px;" required="required" /></td>
					</tr>
					<tr>
						<td class="tdWidth">结束时间：</td>
						<td><input type="date" class="dateStyle" name="endtime"
							style="width:160px;" required="required" /></td>
					</tr>

					<tr>
						<td class="tdWidth">负责人：</td>
						<td><select name="user_id" required="required">
								<option value="">--请选择--</option>
								<c:forEach var="User" items="${UserList}">
									<option value="${User.id}">${User.stu_name}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td class="tdWidth">任务描述：</td>
						<td><textarea class="areaStyle" name="remark"
								style="width:360px;"></textarea></td>
					</tr>
				</table>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="submit" value="发布" class="saveBotton" />
				</div>
			</form>


		</div>
	</div>

</body>
</html>
