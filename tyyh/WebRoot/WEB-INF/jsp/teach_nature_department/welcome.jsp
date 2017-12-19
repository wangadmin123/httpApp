<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    	<base href="<%=basePath%>">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
    <script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/teach_nature_department/js/index.js"></script>

</head>
<body>

<div class="contentConfig">
    <div class="qxfp">我的桌面 </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/addSpecialty.html')">
            新增特色课程
        </div>
         <div class="gnmk"  onclick="NewPage('jzb/addquestion.jsp')">
            新增巡班问题
        </div>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/oaJwbGradeslist.html')">
            班级信息
        </div>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/addpatrol.html')">
            巡班
        </div>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/oaJzbStudentlist.html')">
           学员信息
        </div>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/toAddStuInfo.html')">
            新建学员档案
        </div>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/oaJzbAllStudentlist.html')">
           全部学员档案
        </div>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/oaJzbReceiveConsultlist.html')">
           报名咨询量
        </div>
        <%--  <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/publicPraise.html')">
           个人口碑
        </div>
         <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/personal.html')">
           员工口碑
        </div>
         <div class="gnmk" onclick="NewPage('jzb/addpraisein.jsp')">
           新增口碑
        </div> --%>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/Dailygeren')">
           个人日报表
        </div>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/DailyStaffList')">
           员工日报表
        </div>
        <div class="gnmk" onclick="NewPage('${pageContext.request.contextPath }/addadilyview')">
           新增日报表
        </div>
        
    </div>

</div>
</body>
</html>
