<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">	
<title>选项卡</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/2Commend.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/update_talk_p.css">

<style type="text/css">
</style>
</head>
<body >
	<!--以下是家访修改页面  -->
	<form action="${pageContext.request.contextPath }/updateJZFTview" method="post">
	<div class="P_update_update">
	 <span class="addstu" >修改家长访谈记录</span>
	   
	    <table   class="addTable" >
	        <tr>
	            <td class="tdWidth"> 访谈人：</td>
	            <td class="border">
			     ${oaJzbPatriarchInterview.emp_name }
	            </td>
	        </tr>
	         <tr>
		            <td class="stutalk">学期：</td>
		            <td>${oaJwbSemester.stage }</td>
		     </tr>
	        <tr>
	            <td class="tdWidth">访谈对象：</td>
	            
	            <td class="border"><input type="text" name="interview_name" value="${oaJzbPatriarchInterview.interview_name }"/></td>	
	            
	        </tr>
	        <tr>
		            <td class="stutalk">访谈方式：</td>
		             <td class="talk_p_checked">
		             
		            <c:forEach items="${OaJzbInterviews }" var="OaJzbInterviews">
		    			 <input type="radio"  name="interview_way"  value="${OaJzbInterviews.interview_id }" class="checkedStyle" checked="checked"/><span>${OaJzbInterviews.interview }</span>&nbsp;&nbsp;&nbsp;&nbsp;
		            </c:forEach>
		            </td>
		    </tr>
	        <tr>
	            <td class="tdWidth">访谈时间：</td>
	            <td class="border"><fmt:formatDate value="${oaJzbPatriarchInterview.interview_time }" pattern="yyyy-MM-dd HH:mm"/></td>
	        </tr>
	        <tr>
	            <td class="tdWidth">访谈结果：<br/><span class="redFont">(最多50字)</td>
	            <td class="border-bottom"><textarea cols="20" rows="4" name="interview_content"  maxlength="50" onchange="this.value=this.value.substring(0, 50)" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)"  >${oaJzbPatriarchInterview.interview_content }</textarea></td>
	        </tr>
		 </table>		
	    <div class="btposition1">
	        <input type="submit" value="保存" class="saveBotton"  />
	    </div>
	</div>
	</form>
</body>
</html>
