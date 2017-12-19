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
  <base href="<%=basePath%>"></base>
    <title>修改日报表详情</title>
    
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/updatedaily.css"/>
	<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
	<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
	<meta charset="UTF-8"></meta>
    <meta name="keywords" content="keyword1,keyword2,keyword3"></meta>
    <meta name="description" content="this is my page"></meta>
    <meta name="content-type" content="text/html; charset=UTF-8"></meta>
      <script type="text/javascript">
      $(function(){
       $(".saveOut").click(function(){
      window.location.href="${pageContext.request.contextPath }/DailyStaffList";
      });
      });
      
      
	  $(function(){
	  $(".chekessf").focus();
	  });
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
			location.href="dailylist.jsp";
		}		
	}
	$(function(){
		$(':input').labelauty();
	});
  
  </script>
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body class="body">
  		
    	<p class="dailyP">中心日报工作</p>
 		<div class="dailydivone" >
	 		<ul class="dailyhead">
	 			<li class="dailyheadli1">班主任/教务:<span>${oaJzbDailyworkcontent.emp_name }</span></li>
	 			<li class="dailyheadli2">中心名称:<span>太原映辉</span></li>
	 			<li class="dailyheadli3">日期:<span><fmt:formatDate value="${oaJzbDailyworkcontent.entrytime }" pattern="yyyy-MM-dd"/></span></li>
	 		</ul>
 		</div>
 		<form action="${pageContext.request.contextPath }/updatedailyview/${oaJzbDailyworkcontent.dailyworkcontent_id}" method="post">
 		<div class="dailydivtwo">	
 			<table class="tableOne">
 				<tr>
 					<td colspan="2" style="text-align: left;">当日主要工作:<input type="text" class="chekessf" name="theContentOfThework" value="${oaJzbDailyworkcontent.theContentOfThework }" /></td>
 				</tr>
 				<tr>
 					<td colspan="2" style="text-align: left;">上午:<input type="text" name="morningwork" value="${oaJzbDailyworkcontent.morningwork }" /></td>
 				</tr>
 				<tr>
 					<td colspan="2" style="text-align: left;">下午:<input type="text" name="afternoonjobcontent" value="${oaJzbDailyworkcontent.afternoonjobcontent }" /></td>
 				</tr>
 				<c:forEach items="${oaJzbDailyschedules }" var="oaJzbDailyschedules">
		 				<tr>
		 					<td><fmt:formatDate value="${oaJzbDailyschedules.starttime }" pattern="HH:mm"/>
		 					-<fmt:formatDate value="${oaJzbDailyschedules.outtime }" pattern="HH:mm"/></td>
		 					<td><input type="text" name="contentsoftheclass"  value="${oaJzbDailyschedules.contentsoftheclass }" /></td>
		 				</tr>
 				</c:forEach>
 				<c:forEach items="${oaJzbDailyschedules }" var="oaJzbDailyschedules">
 					<input type="hidden" name="dailyschedule_id" value="${oaJzbDailyschedules.dailyschedule_id }"/>
 				</c:forEach>
 			</table>
 		</div>
 		<div class="dailydivtri">
 			<p>备注:</p>
 			<textarea rows="10" cols="100" style="text-align: center;" name="remarks">${oaJzbDailyworkcontent.remarks }</textarea>
 		</div>   
 		  <div class="btposition1">
		    <input type="submit" value="保存" class="saveBotton" />
		    <input type="button" value="返回" class="saveOut" />
		  </div>
		  <div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
 		</form>
  </body>
</html>
