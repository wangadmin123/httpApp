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
<script type="text/javascript">
        
	
	
	
    $(function() {
		$("#function_id").change(function() {
			var function_id=$("#function_id").val();
			if (function_id==""){
			   	$("#submit").attr("disabled", "disabled");
			   	$("#submit").next().text("请确认信息完整性");
			}else{
			    $("#submit").removeAttr("disabled");
			    $("#submit").next().text("");
			}
		});
	}); 
        
    </script>
</head>
<body>
	<div class="rightContent">
		<div class="tabContent">
			<h1 class="tabTitle">删除功能</h1>
			<form action="function/delFunction" method="post">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth">需要删除的功能：</td>
						<td><select class="selectStyle" 
						name="function_id" id="function_id" style="width:120px;">
						<option value="">--请选择--</option>
						<c:forEach var="function" items="${functions }">
							<option value="${function.function_id }">${function.function_name }</option>
						</c:forEach>
						</select></td>
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