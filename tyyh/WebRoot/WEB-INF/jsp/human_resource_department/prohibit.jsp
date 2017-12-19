<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
 <base href="<%=basePath%>">
    <meta charset="UTF-8">
	

<link rel="stylesheet" type="text/css" href="statics/common/css/prohibit.css">
<title>禁止访问</title>
	<!--[if IE 6]>
	<script src="/js/DD_belatedPNG.js"></script>
	<script type="text/javascript">
	  if(typeof(DD_belatedPNG)=='object') DD_belatedPNG.fix('*');
	</script>
	<![endif]-->
 </head>
<body>
	<div class="content">
		<p class="head">太原映辉自动化办公系统</p>
		<p class="title">本软件适配Google Chrome 10.0浏览器运行使用</p>
		<p class="title1">为获得更好的体验，推荐下载</p>
		<div class="BrowserContent">
			<div class="Browser">
				<p><a href="http://www.google.cn/intl/zh-CN/chrome/browser/"><img src="statics/common/images/chrom.png"/></a></p>
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
