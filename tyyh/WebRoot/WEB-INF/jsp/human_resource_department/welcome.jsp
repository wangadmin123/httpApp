<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<%-- <c:forEach var="position" items="${employee.emp_positions}">
		
		<c:forEach var="function" items="${position.functions}>
			<div class="gnmk"  onclick="NewPage('employee_info_add.html')" style="width:130px;">
           		${function.depart_name}
    		</div> 
		</c:forEach>					   		
   </c:forEach> --%>
   <%-- <c:forEach var="position" items="${employee.emp_positions}">
   	<p>${position.depart_name }</p>
	   	<c:forEach var="function" items="${position.functions}">
	   		<div class="gnmk"  onclick="NewPage('employee_info_add.html')" style="width:130px;">
           		${function.function_name}
    		</div> 
	   	</c:forEach>
	   	<br/>
   </c:forEach> --%>
    <div class="gn_nav">
    	
    	<c:forEach var="subfield" items="${subfieldsindex}">
                    	<c:forEach var="function" items="${subfield.functions}">
                    			<div class="gnmk"  onclick="NewPage('${function.function_url}')" style="width:130px;">
						           	${function.function_name}
						    	</div>
                    	</c:forEach>
   		</c:forEach>
    	<c:if test="${not empty  userFunctionsindex}">
    		<c:forEach var="function" items="${userFunctionsindex}">
    			<div class="gnmk"  onclick="NewPage('${function.function_url}')" style="width:130px;">
						           	${function.function_name}
				</div>
    		</c:forEach>
    	</c:if>
    </div>
</div>
</body>
</html>
