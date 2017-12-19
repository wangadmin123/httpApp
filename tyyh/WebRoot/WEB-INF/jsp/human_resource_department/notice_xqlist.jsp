<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
<link rel="stylesheet" type="text/css"
	href="statics/common/css/popup.css" />
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/tab.js"></script>
<script type="text/javascript" src="statics/common/js/ajaxfileupload.js"></script>
<script type="text/javascript"
	src="statics/human_resource_department/js/getSimpleName.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/formShow.js"></script>
<style type="text/css">


</style>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/formShow.js"></script>
<script type="text/javascript" src="layer-v3.0.1/layer/layer.js"></script>
<script type="text/javascript">
function fh(wd){
	 if(wd==1){
			location.href="Employee/uqNotice.html?npid=${npid}&&user_id=${user_id}";
		}else{
			location.href="Employee/ydNotice_add.html?user_id=${user_id}";
		}
		
	}
</script>

</head>

<body style="width:98%;">
	<br/>
	<div class="tabTitle"> 通知提醒详情</div>
	<br/>
	<div class="divTable" style="margin-left:20px;">
		<table class="selectTable" width="800" border="0" cellspacing="0" cellpadding="0"
			style="text-align:left;">
			<%-- <c:forEach items="${notices}" var="ee"> --%>
			<tr>
				<td style="text-align:right;" width="100"><em>*</em>&nbsp;&nbsp;发件人：</td>
				<td>${ee.name} - ${ee.position_name}</td>
			</tr>
			<tr>
				<td style="text-align:right;" width="100"><em>*</em>&nbsp;&nbsp;发送时间：</td>
				<td><fmt:formatDate value="${ee.fstime}"
						pattern="yyyy-MM-dd hh:mm:ss" /></td>

			</tr>
			<tr>
				<td style="text-align:right;"><em>*</em>&nbsp;&nbsp;标题：</td>
				<td>${ee.title }</td>
			</tr>
			<tr>
			<td class="tdWidth">内容：</td>
					<td><textarea class="areaStyle" name="content"  style="width:360px;">${ee.content }</textarea>
					</td>
				
			</tr>
      <%--  </c:forEach> --%>
		</table>
	</div>

	<div class="infoTable" style="width:50%">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center"><input type="button" class="inputSubmit"
					onclick="fh(${wd})" value="返回" /></td>
			</tr>
		</table>
	</div>

</body>
</html>
<!-- class="page-left" -->