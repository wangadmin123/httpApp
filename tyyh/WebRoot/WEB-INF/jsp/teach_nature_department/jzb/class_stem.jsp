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
<title>A班基本数据表</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
<script src="statics/teach_nature_department/jzb.js/jquery.min.js"></script>
<script src="statics/teach_nature_department/jzb.js/DatePicker.js"></script>
<script src="statics/teach_nature_department/jzb.js/SimpleCanleder.js"></script>
<link href="statics/teach_nature_department/jzb.css/SimpleCanleder.css" rel="stylesheet">
</head>
<body>
<div class="rightContent">
    <div class="tabContent">
    <h1 class="tabTitle">作业(本)完成率</h1>
    <form>
        <table cellpadding="0" cellspacing="0" border="0" style="font-size: 15px;">
            <td>班级：</td> <td><input type="search"  class="searchStyle" style="width:160px;"/></td>
            <td><input type="button"  value="搜索" class="searchBotton" /></td>
        </table>
    </form>
        <table cellpadding="0" cellspacing="0" border="1" class="selectTable" style="font-size: 15px;">
            <tr>
                <th rowspan="2">班级</th>
                <th rowspan="2">班主任</th>
                <th rowspan="2">教员</th>
                <th colspan="24">作业本完成率</th>
            </tr>
            <tr>
                <th>1月</th>
                <th>2月</th>
                <th>3月</th>
                <th>4月</th>
                <th>5月</th>
                <th>6月</th>
                <th>7月</th>
                <th>8月</th>
                <th>9月</th>
                <th>10月</th>
                <th>11月</th>
                <th>12月</th>
            </tr>
            <tr>
                <td>C11</td>
                <td>蔚丽飒</td>
                <td>张曼</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
                <td>98%</td>
            </tr>
        </table>
	  <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
      <div class="btposition2"></div>
    </div>
</div>
</body>
</html>