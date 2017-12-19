<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
     <title>我的桌面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	 
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/formStyle.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/index.js"></script>
	
</head>
<body>

<div class="contentConfig">
    <div class="qxfp">我的桌面 </div>
   <div class="gn_nav">
<!--           <div class="gnmk" onclick="NewPage('arrangCourse.html')">
            排课
        </div>
        <div class="gnmk" onclick="NewPage('getArrangCourse.html')">
          查看排课
        </div> -->
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/jwb/addClass.html')">
            课时安排
        </div>
        <div class="gnmk" onclick="NewPage('jwb/classProject.html')">
            添加班级
        </div>
        <div class="gnmk" onclick="NewPage('oajzb/OaJzbHeban')">
            合并班级
        </div>
        <div class="gnmk" onclick="NewPage('jwb/class_info1.html')">
            班级基本信息
        </div>
    </div>
  
</div>
  </body>
</html>
