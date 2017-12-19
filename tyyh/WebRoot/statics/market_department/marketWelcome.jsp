<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
    <div class="gn_nav">
    	<div class="gnmk" onclick='NewPage("market/amarketAdd")'>
            新增信息量
        </div>
        <div class="gnmk" onclick='NewPage("market/amarketQuery")'>
            查询信息量
        </div>
        <div class="gnmk" onclick='NewPage("market/amarketSchoolAdd")'>
            新增学院信息
        </div>
        <div class="gnmk" onclick='NewPage("market/amarketSchoolShow")'>
            查看学院信息
        </div>
        <c:if test="${loginUser.position.position_id==39}">
         <div class="gnmk" onclick=NewPage("director/marketLSSelect")>
        	  查看历史量
        </div>
        </c:if>
         <c:if test="${loginUser.position.position_id!=39}">
         <div class="gnmk" onclick="NewPage('teacher/transferclassTeacher')">
            审核通过
        </div>
        </c:if>
       
      
    </div>

</div>
</body>
</html>
