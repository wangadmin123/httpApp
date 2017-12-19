<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
    <meta charset="UTF-8"/>
<title>编辑班级管理信息</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb_css/insert.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
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
$(".saveBotton");
function divHide(){
	miao--;
	$(".setTime").text(miao);
	
	if(miao==0){
		clearInterval(myTime);
		$(".saveStyle").hide();
		/*  location.href="welcome.jsp"; */
	}		
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">新增项目答辩成绩</h1>
<form action="${pageContext.request.contextPath }/grade/addOaJzbProject " method="post" enctype="multipart/form-data" >
    <div>
       <table cellpadding="0" cellspacing="0" border="1" class="selectTable" style="width:100%;">
        <tr><th colspan="6" style="text-align: center;font-size:15px;">C11班 -- 新增项目答辩成绩表</th></tr>
        <tr>
          <th>姓名</th>
          <th>个人得分</th> 
          <th>小组得分</th> 
          <th style="width:300px;">小组表现</th>
          <th style="width:300px;">备注</th>
        </tr>
        <tr>
	           <select name="groupId">
				  <c:if test="${groupList != null }">
				   <option value="0">--请选择小组</option>
				   		<c:forEach var="group" items="${groupList}">
				   			<option value="${group.id}">${group.group_name}</option>
				   		</c:forEach>
						</c:if>
       		   </select>
	     </tr>
       		 <c:forEach begin="1" end="5">
        	<tr> 
	            <td><input type="text" class="textStyle" style="width:100px;" placeholder="请输入姓名"  name="stuName" /></td>
	            <td><input type="text" class="textStyle" style="width:100px;" placeholder="请输入个人得分"  name="score" /></td> 
	            <td ><input type="text" class="textStyle" style="width:80px;" placeholder="请输入小组得分"  name="groupScore"/></td>
	            <td ><textarea id="areaStyle" class="areaStyle2" placeholder="请输入小组表现" style="width:300px;height:30px;" name="groupExpression"></textarea></td> 
	            <td ><textarea  id="areaStyle" class="areaStyle2" placeholder="备注" style="width:300px;height:30px;"name="remark"> </textarea></td>
        	</tr>  
        </c:forEach>
     </table>   
    <div class="btposition1" style="margin-left:1200px;">
       <input type="submit" value="保存" class="saveBotton" />
    </div>
    </div>
     </form> 
</div>
</div>

<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>