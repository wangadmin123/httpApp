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
        
        <div class="gnmk" onclick=NewPage("consultAssistantAdd.jsp")>
            新增咨询量
        </div>
        <div class="gnmk" onclick=NewPage("consultAssistantQuery.jsp")>
            查询咨询量
        </div>
        <div class="gnmk"  onclick=NewPage("Handout.jsp")>
            分发咨询量
        </div>
        
        <div class="gnmk" onclick=NewPage("consultAssistantEnrollCheck.jsp")>
            报名审核
        </div>
         <div class="gnmk" onclick=NewPage("consultAssistantPraiseCheck.jsp")>
            口碑审核
        </div>
        <div class="gnmk" onclick=NewPage("consultDepartmentDaySheet.jsp")>
            日报表
        </div>
        <div class="gnmk" onclick=NewPage("consultDepartmentWeekSheet.jsp")>
            周报表
        </div>
        <div class="gnmk" onclick=NewPage("consultDepartmentMonthSheet.jsp")>
            月报表
        </div>
        <div class="gnmk" onclick=NewPage("consultDepartmentYearSheet.jsp")>
            年报表
        </div>
        <div class="gnmk">
            查看通知
        </div>
    </div>

</div>
</body>
</html>
