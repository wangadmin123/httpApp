<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>修改学员访谈信息</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/2Commend.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/update_talk_s.css">


</head>
<body >
	<!--以下是家访修改页面  -->
	<div class="P_update_update" >
	 <p><span class="addstu" >修改学生访谈记录</span>
	 <br>  
	 <form action="${pageContext.request.contextPath }/updateInterview?id=${stuInterview.id}" method="post" enctype="multipart/form-data">
	    <table class="addTable">
	        <tr>
	        
	            <td class="tdWidth"> 访谈人：</td>
	            <td class="td">${stuInterview.emp_name }</td>
	        </tr>
	        <tr>
	            <td class="tdWidth">学&nbsp;&nbsp;期：</td>
	            <td class="td">${semId.stage }</td>
	           <%--  <select name="Term_id" class="ZY_tj" style=" width: 100%; height:30px;">
		      				<option>-请选择-</option>
		           			<c:forEach items="${semId }" var="sem">
		           				<option value="${sem.id }" selected="selected">${sem.stage }</option>
		           			</c:forEach>
                			</select> --%>
                
	        </tr>
	        <tr>
	            <td class="tdWidth">访谈类型：</td>
	            <td class="td"><select name="interviewMode_id" class="ZY_tj" style=" width: 100%; height:30px;">
		      				<option>-请选择-</option>
		            		<c:forEach items="${interview }" var="inter">
                  				<option value="${inter.id }" selected="selected">${inter.interviewType }</option>
		           			</c:forEach></select>
		        </td>
	        </tr>
	        <tr>
		            <td class="stutalk" >教员：</td>
		            <td><select class="ZY_tj">
		            		<option selected="selected" value="在场">在场</option>
		            		<option value="未在场">未在场</option>
		            </select></td>
		        </tr>
		         <tr>
		            <td class="stutalk">笔试：</td>
		            <td><input name="writerTest" type="Number" value="${stuInterview.writerTest }"/></td>
		        </tr>
		        <tr>
		            <td class="stutalk">机试：</td>
		            <td><input name="engineTest" type="Number" value="${stuInterview.engineTest }"/></td>
		        </tr>
	       <!--  <tr>
	            <td class="tdWidth">访谈时间：</td>
	            <td class="td" /><input type="date"/> </td>
	        </tr>
	        <tr>
	            <td class="tdWidth">录入时间：</td>
	            <td class="td" /><input type="date"/></td>
	        </tr> -->
	        <tr>
	            <td class="tdWidth">访谈结果：<br/><span class="redFont">(最多50字)</td>
	            <td class="textarea_td"><textarea name="interviewContent" cols="20" rows="4" maxlength="50" onchange="this.value=this.value.substring(0, 50)" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)">${stuInterview.interviewContent }</textarea></td>
	        </tr>
		 </table>
	    <h2 class="tabTitle2">&nbsp;</h2>		
	    <div class="btposition1" >
	        <input type="submit" value="保存" class="saveBotton" />
	    </div>
		 </form>
	</div>
</body>
</html>
