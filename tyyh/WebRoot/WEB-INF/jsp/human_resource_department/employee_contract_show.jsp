<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查看合同信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript">

/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="employee_contract_search.html";
	});  
});


</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">查看合同信息</h1>
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth"><span></span>合同编号：</td>
          <td>2011002</td>
        </tr>   
        <tr>
          <td class="tdWidth">部门：</td>
          <td>市场部</td>
        </tr>
        <tr>
          <td class="tdWidth">姓名：</td>
          <td>张晓月</td>
        </tr>
        <tr>
          <td class="tdWidth"><span></span>岗位：</td>
          <td>咨询师</td>
        </tr>
        <tr>
        <tr>
          <td class="tdWidth">起始时间：</td>
          <td>2015/1/1</td> 
        </tr>
        <tr>
          <td class="tdWidth">截止时间：</td>
          <td>2017/1/1</td> 
        </tr>
        <tr>
          <td class="tdWidth">归属公司：</td>
          <td>太原映辉科技有限公司</td> 
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="返回" class="saveBotton" />
	  </div>
</div>
</div>
</body>
</html>
