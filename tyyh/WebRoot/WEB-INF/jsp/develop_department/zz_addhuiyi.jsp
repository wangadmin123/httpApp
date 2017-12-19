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
<title>会议模板</title>
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
			<h1 class="tabTitle">添加会议记录</h1>
			<form action="develop/savehyshowlist.html?uid=${user.id}" method="post">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					 <tr>
						<td class="tdWidth">组名：</td>
						<td><input type="hidden"  name="groupid" value="${user.groupid }"/> 
						<input type="text" class="textStyle" style="border:0px;;width:160px;"
							value="${user.groupname }" readonly ></td>
					</tr>
					
					 <tr>
						<td class="tdWidth"><span>*</span>记录人：</td>
						<td><select name="witer" required="required">
								<option value="">--请选择--</option>
								<c:forEach var="User" items="${UserList}">
									<option value="${User.id}">${User.stu_name}</option>
								</c:forEach>
						</select></td>
					</tr>

					<tr>
						<td class="tdWidth">会议时间：</td>
						<!-- <td><input type="date" class="dateStyle" name="starttime"
							style="width:160px;" /></td> -->
						<td><input type="date" required="required" class="dateStyle" name="starttime"
							style="width:160px;" />
					</tr>
					
					<tr>
						<td class="tdWidth">会议类型：</td>
						<td><select name="type" required="required">
								<option value="">--请选择--</option>
								
								<option value="1">晨会</option>
								<option value="2">班后会</option>
						</select></td>

					</tr>
					<tr>
						<td class="tdWidth">会议记要：</td>
						<td><textarea class="areaStyle" name="content"
								style="width:360px;" required="required"></textarea></td>
					</tr>

				</table>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="submit" value="提交" class="saveBotton" />
				</div>
			</form>
		</div>
	</div>



	<div class="saveStyle">
		提交成功！（<span class="setTime"></span>）
	</div>

</body>
</html>

