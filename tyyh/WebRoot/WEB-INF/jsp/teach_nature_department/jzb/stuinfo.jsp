<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>查看学生报档信息</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript">

/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="student_info.jsp";
	});  
});


</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">已付款学员基本信息</h1>
      <form action="#" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth"><span></span>学生学号：</td>
          <td>1</td>
        </tr>   
        <tr>
          <td class="tdWidth">学生姓名：</td>
          <td>59460830001</td>
        </tr>
        <tr>
          <td class="tdWidth">性别：</td>
          <td>张鹏</td>
        </tr>
        <tr>
          <td class="tdWidth">年龄：</td>
          <td>Zhang Peng</td> 
        </tr>
        <tr>
          <td class="tdWidth">班级名称：</td>
          <td>男</td> 
        </tr>
        <tr>
          <td class="tdWidth">是否住宿舍：</td>
          <td>142326199501285918</td> 
        </tr>
          <tr>
          <td class="tdWidth"><span></span>联系电话：</td>
          <td>18217010338</td>
        </tr>   
        <tr>
          <td class="tdWidth">紧急联系人：</td>
          <td>7031682T75</td>
        </tr>
        
        
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="返回" class="saveBotton" />
	  </div>
     </form> 
</div>
</div>
</body>
</html>
