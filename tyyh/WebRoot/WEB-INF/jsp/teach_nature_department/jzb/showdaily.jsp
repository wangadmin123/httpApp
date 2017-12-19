<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
   <base href="<%=basePath%>">
  <meta charset="UTF-8">
 
    <title>显示日报表详情</title>
	<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/showdaily.css"/>
	<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
	$(function(){
	$(".saveOut").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		window.location.href="${pageContext.request.contextPath }/DailyStaffList";
	});
});
	</script>
  </head>

  <body class="body">
  	<form action="">	
    	<p class="dailyP">中心日报工作<p>
 		<div class="dailydivone" >
	 		<ul class="dailyhead">
	 			<li class="dailyheadli1">班主任/教务:<span>${oaJzbDailyworkcontent.emp_name }</span></li>
	 			<li class="dailyheadli2">中心名称:<span>太原映辉</span></li>
	 			<li class="dailyheadli3">日期:<span><fmt:formatDate value="${oaJzbDailyworkcontent.entrytime }" pattern="yyyy-MM-dd"/></span></li>
	 		</ul>
 		</div>
 		<div class="dailydivtwo">
 			<table class="tableOne">
 				<tr>
 					<td colspan="2" style="text-align: left;">当日主要工作:${oaJzbDailyworkcontent.theContentOfThework }</td>
 				</tr>
 				<tr>
 					<td colspan="2" style="text-align: left;">上午主要工作:${oaJzbDailyworkcontent.morningwork }</td>
 				</tr>
 				<tr>
 					<td colspan="2" style="text-align: left;">下午主要工作:${oaJzbDailyworkcontent.afternoonjobcontent }</td>
 				</tr>
 				<c:forEach items="${oaJzbDailyschedules }" var="oaJzbDailyschedules">
		 				<tr>
		 					<td><fmt:formatDate value="${oaJzbDailyschedules.starttime }" pattern="HH:mm"/>
		 					-<fmt:formatDate value="${oaJzbDailyschedules.outtime }" pattern="HH:mm"/></td>
		 					<td>${oaJzbDailyschedules.contentsoftheclass }</td>
		 				</tr>
 				</c:forEach>
 				
 				
 			</table>
 		</div>
 		
 		<div class="dailydivtri">
 			<p>日报内容:</p>
 			<textarea rows="10" id="wbk" cols="100" name="remarks">${oaJzbDailyworkcontent.remarks }</textarea>
 			
 		</div>   
 		<div class="btposition1">
 		<input type="button" value="返回" class="saveOut" style="cursor:pointer;background-color:#44bb00;width:65px;height:30px;line-height:30px;
text-align:center; color:#fff;font-size:12px;font-weight:bold; border:0px; border-radius: 3px; margin-right:20px;
float:right;margin-right: 200px"/>
		   <a href="${pageContext.request.contextPath }/updatedaily"  style="cursor:pointer;background-color:#44bb00;width:65px;height:30px;line-height:30px;
text-align:center; color:#fff;font-size:12px;font-weight:bold; border:0px; border-radius: 3px; margin-right:20px;
float:right;text-decoration: none;">修改</a> 

		</div>
	</form>	
  </body>
</html>
