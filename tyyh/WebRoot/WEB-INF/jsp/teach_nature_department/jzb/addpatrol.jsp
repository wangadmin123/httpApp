<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<input type="hidden" id="path" value="${pageContext.request.contextPath  }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>新增巡班记录</title>
    <base href="<%=basePath%>">
	<meta charset="UTF-8">
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/addpatrol.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
<script src="statics/teach_nature_department/jzb.js/jquery-1.12.4.js"></script>
<script src="statics/teach_nature_department/jzb.js/jquery-labelauty.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/addpatrol.js"></script>
<link rel="stylesheet" href="statics/teach_nature_department/jzb.css/jquery-labelauty.css">
<script type="text/javascript">
	$(function(){
	$(".saveOut").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		window.location.href="${pageContext.request.contextPath }/oaJwbGradeslist.html";
	});
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
		location.href="../welcome.jsp";
	}		
}
$(function(){
	$(':input').labelauty();
	$(".dowetable1 label").click(function(){
		$("input[name='question']").val($(this).children(".labelauty-checked").text());
	});
});
$(function(){
			$(".gradeonclick").on("click",function(){
			
				var obj = $(this);
				var uid = obj.attr("gradelistid");
				
					$.ajax({
						type:"post",
						url:path+"/selectstudentlist/"+uid,
						dataType:"text",
						success:function(data){	
							//$(".dowetable").html("");
						    $(".divinput").html(data);
					
						  //  var selector=$(".dowetable");
						    //data.appendTo(selector);
							
						}
						
					});
			});
		});
/*保存读秒结束*/
</script>
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
  </head>
  <body>
	<div class="addpatroldiv">
		<h2>新增巡班记录</h2>
		<form action="${pageContext.request.contextPath }/addpatrolinfo" method="get">
		<h3>巡班时间</h3>
		<p>${date }</p>
		<h3>班级</h3>
		<table  class="dowetable3">
			<tr id="deidai">
			<c:forEach var="gradelist" items="${gradelist}" varStatus="status">
				<td><input type="radio" name="grade_id" value="${gradelist.id}" gradelistid="${gradelist.id }" class="gradeonclick" data-labelauty="${gradelist.name}"></td>
				<c:if test="${status.count%5==0}">
				<tr></tr>
				</c:if>
			</c:forEach>
			</tr>
		</table>
		<h3>姓名</h3>	
		<div class="divinput" style="width:550px;"></div>
		<h3 style="clear:both;">问题</h3><input type="hidden" name="question" />
		<table class="dowetable1">
		<tr>
			<c:forEach var="questlists" items="${questlist}" varStatus="status">
				<td><input type="radio" name="problem" value="${questlists.id}" questid="${questlists.id}" data-labelauty="${questlists.question}"></td>
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
