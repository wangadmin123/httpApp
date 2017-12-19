<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
<base href="<%=basePath%>">
<title>首页</title>
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/index.css">
<script type="text/javascript"
	src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="statics/develop_department/js/index.js"></script>
<script type="text/javascript">
	$(function() {
		$(".logo").click(function() {
			location.href = "/tyyhoa/";
		});
	});
</script>
</head>
<body>
	<div class="head">
		<div class="logo">
			<a href="develop/kfb_index.html"><img
				src="statics/develop_department/images/logo.png" /></a>
		</div>
		<ul class="hav">
			<li>欢迎来到开发部！</li>
		</ul>
		<div class="login">孟淑君</div>
	</div>
	<div class="content">
		<div class="left">
			<ul>
				<li class="liHover"><img
					src="statics/develop_department/images/tb1.png" /><span>考勤</span>
					<dl class="sonUl">
						<dt>管理</dt>
						<dd class="ddDiv" onclick='NewPage("develop/zy_leavelist.html?uid=${uid}") '>请假管理</dd>
					</dl></li>
				<li><img src="statics/develop_department/images/tb2.png" />
					<span><a href="">项目</a></span>

					<dl class="sonUl">
						<dt>管理</dt>
						 	<dd class="ddDiv" onclick='NewPage("develop/jl_xmjd.html")'>项目进度</dd>
					</dl></li>

				<li><img src="statics/develop_department/images/tb3.png" /><span>个人</span>

					<dl class="sonUl">
						<dt>管理</dt>

						<dd class="ddDiv" onclick='NewPage("develop/zy_info.html?uid=${uid}") '>个人详情</dd>
					</dl></li>
			</ul>


		</div>
		<div class="right">
			<iframe id="frmright" name="frmright" src="welcome.jsp"
				frameborder="0" scrolling="yes" style="width:99%; height:99%;"></iframe>
		</div>
	</div>
</body>
</html>
