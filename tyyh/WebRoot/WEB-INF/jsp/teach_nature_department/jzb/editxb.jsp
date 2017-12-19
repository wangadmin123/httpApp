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
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>修改巡班记录</title>

<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">

<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/editxb.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script src="statics/teach_nature_department/jzb.js/jquery-labelauty.js"></script>
<link rel="stylesheet" href="statics/teach_nature_department/jzb.css/jquery-labelauty.css">
<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
	$(".inputaaa").focus();
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});
/*保存读秒*/
var miao;
var myTime;
$(function(){
  /*alert("123");
  var str=$(".areaStyle1").text();
  alert(str);*/
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
		location.href="selectgrade.jsp";
	}		
}
/*保存读秒结束*/
//返回按钮
$(function(){
	$(".fanhui").click(function(){
		location.href="${pageContext.request.contextPath }/";
	});
});
$(function(){
	$(':input').labelauty();
});
</script>
	</head>
	<body>
		<div class="editxbdiv">
			<h3>修改巡班记录</h3>
				<form action="editpatrolsinfo" method="get">
					<div class="editxbdivone">
						<ul>
							<input type="text" style="display: none;" name="gradeid" value="${patrolsinfo.id}"/>
							<li>班主任:<span class="spana">${patrolsinfo.emp_name}</span></li>
							
							<li>巡班时间:<fmt:formatDate value="${patrolsinfo.enteringTime }" pattern="yyyy-MM-dd HH:mm"/></li>			
						
						<li>学生：<span class="spana">${patrolsinfo.stu_name}</span></li>
						<li><span class="spana">巡班结果</span>:
						<table class="dowetable1">
							<tr>
								<c:forEach var="questlists" items="${questlist}" varStatus="status">
									<td><input type="radio" <c:if test="${patrolsinfo.question eq questlists.question}">checked="checked"</c:if>  name="problem" value="${questlists.id}" questid="${questlists.id}" data-labelauty="${questlists.question}"></td>
								</c:forEach>
							</tr>
						</table> </li>
						</ul>
					</div>
					<div class="btposition1">
						    <input type="submit" value="保存" class="saveBotton" />
						  <!--   <input type="button" value="返回" id="outxb" class="saveOut" /> -->
	 				</div>
				</form>	
		</div>
	<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
	</body>
	</html>