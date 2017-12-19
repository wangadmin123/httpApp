<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
        <div class="gnmk" onclick=NewPage("director/consultDirectorQuery")>
            	查询咨询量
        </div>
        <div class="gnmk" onclick=NewPage("Consultway/ToAssistantDaySheet")>
            	咨询部报表
        </div>
       <div class="gnmk" onclick=NewPage("market/amarketQuery")>
            	渠道信息量
        </div>
        <div class="gnmk" onclick=NewPage("market/amarketSchoolShow")>
            	院校信息
        </div>
        <div class="gnmk" onclick=NewPage("Network/networkQuery")>
            	网络信息量
        </div>
      
       
    </div>

</div>
</body>
</html>
