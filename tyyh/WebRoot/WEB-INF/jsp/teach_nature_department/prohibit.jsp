<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/prohibit.css">
<title>禁止访问</title>
 </head>
<body>
	<div class="content">
		<p class="head">太原映辉自动化办公系统</p>
		<p class="title">本软件适配Google Chrome 10.0浏览器运行使用</p>
		<p class="title1">为获得更好的体验，推荐下载</p>
		<div class="BrowserContent">
			<div class="Browser">
				<p><a href="http://www.google.cn/intl/zh-CN/chrome/browser/"><img src="images/chrom.png"/></a></p>
				<p><a href="http://www.google.cn/intl/zh-CN/chrome/browser/">Google Chrome 10.0</a></p>
			</div>
			<!--<div class="Browser">
				<p><a href="http://firefox.com.cn/download/"><img src="images/ff.png"/></a></p>
				<p><a href="http://firefox.com.cn/download/">Firefox</a></p>
			</div>
			<div class="Browser">
				<p><a href="http://windows.microsoft.com/zh-CN/internet-explorer/downloads/ie"><img src="images/ie.png"/></a></p>
				<p><a href="http://windows.microsoft.com/zh-CN/internet-explorer/downloads/ie">Internet Explorer 9+</a></p>
			</div>-->
		</div>
	</div>
 </body>
</html>
