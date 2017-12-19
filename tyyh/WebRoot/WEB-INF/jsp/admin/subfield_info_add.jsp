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
<title>新增功能组信息</title>
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
			<h1 class="tabTitle">新增功能组信息</h1>
			<form action="subfield/addSubfield" method="post">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth"><span></span>功能栏名称：</td>
						<td><input type="text" class="textStyle" id="subfield_name"
							name="subfield_name" required placeholder="请输入功能栏名称" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('功能栏名称不能为空!无法提交')" style="width:160px;" /><span></span></td>
					</tr>
					<tr>
						<td class="tdWidth"><span></span>功能组名称：</td>
						<td><input type="text" class="textStyle" id="show_name"
							name="show_name" required placeholder="请输入功能组名称" onblur="if(this.value.replace(/^ +| +$/g,'')=='')alert('功能组名称不能为空!无法提交')" style="width:160px;" /><span></span></td>
					</tr>
				</table>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="submit" id="submit"  value="保存" class="saveBotton" /><span></span>
				</div>
			</form>
		</div>
	</div>
	<div class="saveStyle">
		保存成功！（<span class="setTime"></span>）
	</div>

</body>
</html>