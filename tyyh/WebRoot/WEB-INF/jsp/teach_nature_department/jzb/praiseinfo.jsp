<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
 <meta charset="UTF-8">
    <title>口碑详细信息</title>
    <base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
<script type="text/javascript">

/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="personal.jsp";
	});  
});


</script>
  </head>
  <body>
 <div style="width: 75%;margin: 30px 0px 0px 30px">
 <h1 class="tabTitle">员工口碑详细信息</h1>
 	<table cellpadding="0" cellspacing="0" border="1" class="selectTable">
 	<tr>
 			<td colspan="2">登记时间</td><td colspan="4"><fmt:formatDate value="${praiseinfo.register_time }" pattern="yyyy-MM-dd"/></td>
 		</tr>
 		<tr>
 			<td colspan="2">介绍人</td><td colspan="4">咨询者</td>
 		</tr>
 		<tr>
 			<td colspan="1">姓名</td><td colspan="1">${sponsor.name}</td><td colspan="2">姓名</td></td><td colspan="2">${praiseinfo.consultant_name}</td>
 		</tr>
 		
 		<tr>
 			<td colspan="1">联系方式</td><td colspan="1">${sponsor.phone}</td><td colspan="1">性别</td></td><td colspan="1">${praiseinfo.sex}</td><td colspan="1">所属咨询师</td></td><td colspan="1">${praiseinfo.emp_name}</td>
 		</tr>
 		<tr>
 			<td colspan="1">所属咨询师</td><td colspan="1">${sponsor.emp_name}</td><td colspan="1">年龄</td></td><td colspan="1">${praiseinfo.consultant_age}</td><td colspan="1">联系方式</td></td><td colspan="1">${praiseinfo.contact_way}</td>
 		</tr>
 		<tr>
 			<td colspan="1">所在班级</td><td colspan="1">${sponsor.gradeName}</td><td colspan="1">学历</td></td><td colspan="1">${praiseinfo.education}</td><td colspan="1">紧急联系人</td></td><td colspan="1">${praiseinfo.contacts}</td>
 		</tr>
 		<tr>
 			<td colspan="1">班主任</td><td colspan="1">${sponsor.teachername}</td><td colspan="1">状态</td></td><td colspan="1">${praiseinfo.workcondition_name}</td><td colspan="1">和介绍人的关系</td></td><td colspan="1">${praiseinfo.consultant_nexus}</td>
 		</tr>
 		<tr>
 			<td colspan="1">备注</td><td colspan="1">${sponsor.sponsor_remark}</td><td colspan="1">备注</td><td colspan="3">${praiseinfo.consultant_remarks}</td>
 		</tr>
 		
 	</table>
 	<div class="btposition1">
	    <a href="${pageContext.request.contextPath }/publicPraise.html"><input type="button" value="返回" class="saveBotton" /></a>
	  </div>
 </div>
  </body>
</html>
