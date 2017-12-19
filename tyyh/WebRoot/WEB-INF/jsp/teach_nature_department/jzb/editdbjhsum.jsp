<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>编辑带班计划总结</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/insert.css">
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
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">编辑代班计划</h1>
      <form action="${pageContext.request.contextPath }/UpdateDBJHSum" method="post" enctype="multipart/form-data">
       <table cellpadding="0" cellspacing="0" border="0" class="addTable">    
        <tr>
          <td class="tdWidth">班主任总结：</td>
          <td><textarea  class="areaStyle" style="width:800px;" name="sum"></textarea></td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="保存" class="saveBotton" />
	  </div>
     </form> 
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>