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
		location.href="selstu.jsp";
	});  
});


</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">查看学生档案</h1>
      <form action="#" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth"><span></span>中心代码：</td>
          <td>594</td>
        </tr>   
        <tr>
          <td class="tdWidth">学员学号：</td>
          <td>59460830001</td>
        </tr>
        <tr>
          <td class="tdWidth">学员姓名：</td>
          <td>张鹏</td>
        </tr>
        <tr>
          <td class="tdWidth">姓名拼音：</td>
          <td>Zhang Peng</td> 
        </tr>
        <tr>
          <td class="tdWidth">性别：</td>
          <td>男</td> 
        </tr>
        <tr>
          <td class="tdWidth">证件号码：</td>
          <td>142326199501285918</td> 
        </tr>
          <tr>
          <td class="tdWidth"><span></span>教材编码：</td>
          <td>18217010338</td>
        </tr>   
        <tr>
          <td class="tdWidth">班级编号：</td>
          <td>7031682T75</td>
        </tr>
        <tr>
          <td class="tdWidth">班主任姓名：</td>
          <td>高春艳</td>
        </tr>
        <tr>
          <td class="tdWidth">学员状态：</td>
          <td>在读</td> 
        </tr>
        <tr>
          <td class="tdWidth">已持有证书：</td>
          <td>计算机初级证书</td> 
        </tr>
        <tr>
          <td class="tdWidth">最高学历：</td>
          <td>中专</td> 
        </tr>
          <tr>
          <td class="tdWidth"><span></span>专业：</td>
          <td>计算机应用</td>
        </tr>   
        <tr>
          <td class="tdWidth">毕业学校：</td>
          <td>山西省贸易学校</td>
        </tr>
        <tr>
          <td class="tdWidth">工作状态：</td>
          <td>待业</td>
        </tr>
        <tr>
          <td class="tdWidth">工作单位：</td>
          <td>无</td> 
        </tr>
        <tr>
          <td class="tdWidth">工作种类：</td>
          <td>目前暂无工作</td> 
        </tr>
        <tr>
          <td class="tdWidth">手机号码：</td>
          <td>13466876574</td> 
        </tr>
         <tr>
          <td class="tdWidth">通信地址：</td>
          <td>山西省太原市晋源区晋祠镇西镇村</td> 
        </tr>
        <tr>
          <td class="tdWidth">邮政编码：</td>
          <td>030025</td> 
        </tr>
         <tr>
          <td class="tdWidth">就业意向城市：</td>
          <td>太原，北京</td> 
        </tr>
        <tr>
          <td class="tdWidth">备注：</td>
          <td>13466876574</td> 
        </tr>
         <tr>
          <td class="tdWidth">产品编码：</td>
          <td>ACCP8S2</td> 
        </tr>
        <tr>
          <td class="tdWidth">学员类型：</td>
          <td>学员</td> 
        </tr>
        <tr>
          <td class="tdWidth">通行证：</td>
          <td>zhangpengaccp1@sina.com</td> 
        </tr>
         <tr>
          <td class="tdWidth">学历毕业时间：</td>
          <td>2015-07-01</td> 
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
