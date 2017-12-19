<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">

	<head>
		<meta charset="UTF-8">
		<base href="<%=basePath%>">
		<title>组员，请假模板</title>
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css" />
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/add.css" />
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/switch.css">
		<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
		<script type="text/javascript">
			/*确定保存弹出框的位置*/
			$(function() {
				var saveWidth = $(window).width();
				var saveHeight = $(window).height();
				$(".saveStyle").css("left", saveWidth / 2 - 130);
				$(".saveStyle").css("top", saveHeight / 2 - 40);

			});

			/*保存读秒*/
			var miao;
			var myTime;
			$(function() {
				$(".saveBotton").click(function() {
					history.back(-1);

				});
			});


			/*保存读秒结束*/
		</script>
	</head>

	<body>
		<div class="rightContent">

			<div class="tabContent">
				<br/>
    			<h2>请假详情</h2>
    			<br/>
    			<hr/>
				<form action="develop/zz_leavelist.html" method="post" enctype="multipart/form-data">
					<table cellpadding="0" cellspacing="0" border="0" class="addTable">
						<tr>
							<td class="tdWidth"><span>*</span>姓名：</td>
							<td>${zzleacelist.stuname }</td>
						</tr>
						
						<tr>
							<td class="tdWidth">联系电话：</td>
							<td>${zzleacelist.phone }</td>
						</tr>
						
						<tr>
							<td class="tdWidth">请假开始时间：</td>
							<td><fmt:formatDate value="${zzleacelist.startime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
						<tr>
							<td class="tdWidth">请假结束时间：</td>
							<td><fmt:formatDate value="${zzleacelist.startime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
                        <tr>
                        	<td class="tdWidth">请假天数：</td>
                            <td>${zzleacelist.days }</td>
                        </tr>
						<tr>
							<td class="tdWidth">请假类型：</td>
							<td>${zzleacelist.type }</td>
						</tr>
                        <tr>
							<td class="tdWidth">请假原因：</td>
							<td>${zzleacelist.reason }</td>
						</tr>
					
					</table>
					<h2 class="tabTitle2">&nbsp;</h2>
					<div class="btposition1">
						<input type="button" value="返回" class="saveBotton" />
					</div>
				</form>

			</div>
		</div>
		

	</body>

</html>