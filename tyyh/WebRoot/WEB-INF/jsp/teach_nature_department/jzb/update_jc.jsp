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
    <base href="<%=basePath%>">
<title></title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/2Commend.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/update_jc.css">
</head>
<body >
	<!--以下是家访修改页面  -->
	<form action="${pageContext.request.contextPath}/OaJzbPunish/updateOaJzbPunish/${oaJzbPunish.id}" method="post">
	<div class="P_update_update">
	 <p><span class="addstu">修改奖罚记录</span></p>
	    <table class="addTable">
	   		<tr>
	            <td class="tdWidth"> 奖罚方式:</td>
	            <td class="td"><input type="text" value="${oaJzbPunish.punish_way}" name="punish_way"/></td>	
	        </tr>
	        <tr>
	            <td class="tdWidth"> 奖罚原因:</td>
	            <td class="td"><input type="text" value="${oaJzbPunish.punish_cause}" name="punish_cause"/></td>	
	        </tr>
	        <tr>
	            <td class="tdWidth"> 实施人:</td>
	            <td class="td"><input type="text" value="${oaJzbPunish.empName}" /></td>	
	        </tr>
	        <tr>
	            <td class="tdWidth"> 录入时间:</td>
	            <td class="td"><input type="date" value="<fmt:formatDate value="${oaJzbPunish.entering_time }" pattern="yyyy-MM-dd"/>" disabled="disabled" /></td>	
	        </tr>
	        <tr>
	            <td class="tdWidth"> 惩罚时间:</td>
	            <td class="td"><input type="date" value="<fmt:formatDate value="${oaJzbPunish.punish_time }" pattern="yyyy-MM-dd"/>" name="punish_time"/></td>	
	        </tr>
	        <tr>
	         <td class="stutalk">备注：<br/><span class="redFont">(最多50字)</td>
			    <td  ><textarea cols="50"  rows="5" name="remarks"  maxlength="50" onchange="this.value=this.value.substring(0, 50)" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)" >${oaJzbPunish.remarks}</textarea></td>
			     
	        </tr>   
		 </table>
	    <h2 class="tabTitle2">&nbsp;</h2>		
	    <div class="btposition1">
	        <input type="submit" value="保存" class="saveBotton" />
	    </div>
	</div>
	</form>
</body>
</html>
