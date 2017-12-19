<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>新增班级上课时间和机房</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
	
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  
	
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/addpatrol.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/tab.js"></script>
<script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-labelauty.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/jquery-labelauty.css">
<script type="text/javascript">
/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});
/*保存读秒*/
var miao;
var myTime;
$(function(){
	$(".saveBotton").click(function(){
		miao=2;
		$(".setTime").text(miao);
		$(".saveStyle").css("display","block");
		myTime=setInterval("divHide()",1000);
	   
    });  
});
function divHide(){
	miao--;
	$(".setTime").text(miao);
	if(miao==0){
		clearInterval(myTime);
		$(".saveStyle").hide();
		/* location.href="${pageContext.request.contextPath }/jwb/addProject"; */
	}		
}
$(function(){
	$(':input').labelauty();
});
/*保存读秒结束*/
</script>
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
	<div class="addpatroldiv">
		<h2>新增班级上课时间和机房</h2>
		<form action="${pageContext.request.contextPath }/jwb/addProject" method="post"">
			
		<h3>班级</h3>
		<table  class="dowetable3">
			<tr id="deidai">
			<c:forEach var="gradelist" items="${gradelist}" varStatus="status">
				<c:if test="${(status.count-1)%6==0 }">
					<tr id="deidai">
					</tr>
				</c:if>
				<td><input type="radio" name="grade" value="${gradelist.id}" gradelistid="${gradelist.id }" class="gradeonclick" data-labelauty="${gradelist.name}"></td>
			</c:forEach>
			</tr>
			</table>

			<h3>上课时间</h3>
		<table class="dowetable1">
			<tr>
			<c:forEach var="classtimelists" items="${classtimelist}" varStatus="status">
				<c:if test="${(status.count-1)%4==0 }">
				<tr></tr>
				</c:if>
				<td><input type="checkbox"  name="cycle" value="${classtimelists.class_time}" 
				 data-labelauty="${classtimelists.class_time}"></td>
			</c:forEach>
			</tr>
			
		</table>


		<h3>机房</h3>	
		<table  class="dowetable">		
			<tr>
				<c:forEach var="motorlists" items="${motorlist}" varStatus="status">
				<c:if test="${(status.count-1)%4==0 }">
				<tr></tr>
				</c:if>
				<td><input type="radio" name="motor" value="${motorlists.name}" questid="${motorlists.id}" data-labelauty="${motorlists.name}"></td>
			</c:forEach>
			</tr>
			
		</table>	
		  <div class="btposition1">
		    <input type="submit" value="保存" class="saveBotton" />
		    <input type="button" value="返回" class="saveOut" />
		  </div>
		  
		  <!--保存-->
		<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
<!--结束-->

		</form>
		
	</div>
  </body>

</html>
