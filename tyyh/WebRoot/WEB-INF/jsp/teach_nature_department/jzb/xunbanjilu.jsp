<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xunbanjilu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="statics/common/css/index.css">
	<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/showpatrol.css"/>
  </head>
  
  <body>
 
<div class="contentConfig">
<div class="qxfp">巡班记录</div>
 <c:forEach var="patrolgrade" items="${patrolgradeList}" varStatus="status">
  <div class="showPatrolDiv">
   	 	<ul>
   	 		<li>班主任:${patrolgrade.emp_name}</li>
   	 		<li>巡班时间:<fmt:formatDate value="${patrolgrade.enteringTime}" pattern="yyyy-MM-dd HH:mm"/></li>
   	 	</ul>
   	 	<div class="showPatrolDiv2">
   	 		巡班结果:
   	 		<c:if test="${patrolgrade.stu_name ne ''}">${patrolgrade.stu_name}</c:if>
   	 		 ${patrolgrade.question}
   	 		<div class="showPatrolDiv3">
   	 			<c:choose>
			         <c:when test="${patrolgrade.flas==false }">
			       <a href="${pageContext.request.contextPath }/delpatrol?id=${patrolgrade.id}<c:if test="${patrolgrade.stu_name eq ''}">&del=3</c:if>" class="deletePatrol">删除</a>
   	 		       <a href="${pageContext.request.contextPath }/editxb.html?id=${patrolgrade.id}<c:if test="${patrolgrade.stu_name eq ''}">&up=3</c:if>" class="updatePatrol">修改</a>        			 
			         </c:when>
			         <c:otherwise>已超48小时</c:otherwise>	         
			         </c:choose>
   	 		</div>
   	 	</div>
   	</div>
   	</c:forEach>
  </div>
  </body>
</html>
