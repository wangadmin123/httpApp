<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/index.js"></script>
	
</head>
<body>

<div class="contentConfig">
    <div class="qxfp">我的桌面 </div>
<!-- 添加部分 -->
	 <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('oaJwbGradeslist.html')" style="width:130px;">
           班级信息
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/toJzbAllStudent')" style="width:130px;">
           学生信息管理
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/addDailystatement')" style="width:130px;">
           录入作业完成情况
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/showDailystatement')" style="width:130px;">
           查看作业完成情况
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/addDaytest')" style="width:130px;">
           录入日考成绩表
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/showDaytest')" style="width:130px;">
           查看日考成绩表
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/addWeektest')" style="width:130px;">
           录入周考成绩表
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest')" style="width:130px;">
           查看周考成绩表
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/addMonthtest')" style="width:130px;">
           录入月考成绩表
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest')" style="width:130px;">
           查看月考成绩表
    	</div>    	
    </div>
</div>
</body>
</html>