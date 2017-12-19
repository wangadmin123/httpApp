
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
<title>班级基本数据</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>

<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/insert.css"/>
<link href="statics/teach_nature_department/jzb.css/SimpleCanleder.css" rel="stylesheet">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/laydate/laydate.js"></script>
<script src="statics/teach_nature_department/jzb.js/jquery.min.js"></script>
<script src="statics/teach_nature_department/jzb.js/DatePicker.js"></script>
<script src="statics/teach_nature_department/jzb.js/SimpleCanleder.js"></script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
      <td width="40">班级：</td> <td width="160"><input type="search"  class="searchStyle" style="width:160px;"/></td>
          
          <td width="136"><label for="search_begindate">月份：<select class="ZY_tj">
                  <option>第一月</option>
                  <option>第二月</option>
                  <option>第三月</option>
                  <option>第四月</option>
                  <option>第五月</option>
                  <option>第六月</option>
                  <option>第七月</option>
                  <option>第八月</option>
                  <option>第九月</option>
                  <option>第十月</option>
                  <option>第十一月</option>
                  <option>第十二月</option>
                </select></label></td> 
           <td><input type="button"  value="搜索" class="searchBotton" /></td>
        </tr>
<script type="text/javascript">
        $(function (){
            $("#search_begindate").simpleCanleder();
            });     
</script>     
      
       </table>
    </div>

    <h1 class="tabTitle">班级基本数据</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr>
          <th>班级</th>
          <th>阶段</th>
          <th>班主任</th>
          <th>教员</th>
          <th>出勤</th>
          <th>作业(本上)完成率</th>
          <th>上机练习完成率</th>
          <th>当堂上机完成率</th>
          <th>备注(标注清楚阶段)</th>
          <th>班级基数</th>
          <th>实际人数</th>
        </tr>

         <tr>
      
          <td>C10</td>
          <td>S1</td>
          <td>张三</td>
          <td>李四</td>
          <td>100%</td>
          <td>90%</td>
           <td>99%</td>
           <td>无</td>
              <td>无</td>
          <td>19</td>
           <td>20</td>
        </tr>
         <tr>
     
         <td>C10</td>
          <td>S1</td>
          <td>张三</td>
          <td>李四</td>
          <td>100%</td>
          <td>90%</td>
           <td>99%</td>
           <td>无</td>
              <td>无</td>
          <td>19</td>
           <td>20</td>
          
        </tr>
         <tr>
      
         <td>C10</td>
          <td>S1</td>
          <td>张三</td>
          <td>李四</td>
          <td>100%</td>
          <td>90%</td>
           <td>99%</td>
           <td>无</td>
              <td>无</td>
          <td>19</td>
           <td>20</td>  
        </tr>


         <tr>
       <td>C10</td>
          <td>S1</td>
          <td>张三</td>
          <td>李四</td>
          <td>100%</td>
          <td>90%</td>
           <td>99%</td>
           <td>无</td>
              <td>无</td>
          <td>19</td>
           <td>20</td>
        </tr>

         <tr>
       <td>C10</td>
          <td>S1</td>
          <td>张三</td>
          <td>李四</td>
          <td>100%</td>
          <td>90%</td>
           <td>99%</td>
           <td>无</td>
              <td>无</td>
          <td>19</td>
           <td>20</td>
            </tr>


         <tr>
          <td>C10</td>
          <td>S1</td>
          <td>张三</td>
          <td>李四</td>
          <td>100%</td>
          <td>90%</td>
           <td>99%</td>
           <td>无</td>
              <td>无</td>
          <td>19</td>
           <td>20</td>
              
        </tr>

        
      </table>
    <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
       
</body>
</html>