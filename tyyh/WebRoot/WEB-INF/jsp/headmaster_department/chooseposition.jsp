<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!-- 校长选择职位 -->
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'chooseposition.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <style type="text/css">
    .container span a{
    
       color:#333;
    }
    
    .container span a:hover{
    
       color:#ff0000;
    }
    </style>
  </head>
  
  <body>
  	<c:if test="${li!=null}">
  		<c:forEach var="li" items="${li }">
  				<c:if test="${li.depart_id ne '12' }">
  					<h2 style="font-size:15px;color:#999;padding-left:15px;height:30px;line-height:30px;"><span>${li.depart_name}</span></h2>
  				</c:if>
  			<div style="margin-bottom:25px;border-bottom:1px solid #ccc;" class="container">
  				<c:forEach var="li2" items="${li.li }">
  				<c:if test="${li2.emp.emp_now_status ne '离职' }">
  					<c:if test="${li2.position.position_id ne '1'}">
  					 	<c:if test="${li2.position.position_id ne '13'}">
  					 		<c:if test="${li2.position.position_id ne '5'}">
  					 			<c:if test="${li2.position.position_id ne '27'}">
  					 				<c:if test="${li2.position.position_id ne '28'}">
  					 					<c:if test="${li2.position.position_id ne '29'}">
  					 						<c:if test="${li2.position.position_id ne '30'}">
  					 							<c:if test="${li2.position.position_id ne '4'}">
  					 								<c:if test="${li2.position.position_id ne '34'}">
  					 									<c:if test="${li2.position.position_id ne '35'}">
  					 		<span style="font-size:14px;color:#333;padding-left:25px;font-weight:normal;height:30px;line-height:30px;">${li2.position.position_name }&nbsp;&nbsp;:&nbsp;&nbsp;<a href="login/xz?name=${li2.user_name }&pwd=${li2.user_pwd }"   target="_blank" >${li2.emp.emp_name }</a>&nbsp;&nbsp;</span>
  					 									</c:if>
  					 								</c:if>
  					 							</c:if>
  					 						</c:if>
  					 					</c:if>
  					 				</c:if>
  					 			</c:if>
  					 		</c:if>
  					 	</c:if>
  					</c:if>
  				</c:if>
  				</c:forEach>
  		    </div>
   		</c:forEach>	
  	</c:if>
    
  </body>
</html>
