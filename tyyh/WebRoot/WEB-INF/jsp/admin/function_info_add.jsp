<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>新增功能信息</title>
<link rel="stylesheet" type="text/css"
	href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css" />
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
</head>
<body>
	<div class="rightContent">
		<div class="tabContent">
			<h1 class="tabTitle">新增功能信息</h1>
			<form action="function/addfunction" method="post">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth"><span></span>功能名称：</td>
						<td><input type="text" class="textStyle" id="function_name"
							name="function_name" required style="width:160px;" /><span></span></td>
					</tr>
					<tr>
						<td class="tdWidth"><span></span>功能请求：</td>
						<td><input type="text" class="textStyle" id="function_url"
							name="function_url" required style="width:160px;" /><span></span></td>
					</tr>
					<tr>
						<td class="tdWidth"><span></span>导航栏显示：</td>
						<td><select class="selectStyle" name="yn_show" style="width:120px;">
								<option value="1">是</option>
								<option value="0">否</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class="tdWidth"><span></span>权限等级：</td>
						<td><select class="selectStyle" name="function_jurisdiction" style="width:120px;">
								<option value="4">员工</option>
								<option value="3">主管</option>
								<option value="2">经理</option>
								<option value="1">校长</option>
							</select>
						</td>
					</tr>
				</table>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="submit" id="submit" disabled="disabled" value="保存" class="saveBotton" /><span></span>
				</div>
			</form>
		</div>
	</div>
	<div class="saveStyle">
		保存成功！（<span class="setTime"></span>）
	</div>

</body>
</html>