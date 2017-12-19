<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>教员课时统计表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/formStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/laydate/laydate.js"></script>
<script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/DatePicker.js"></script>
    <script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/SimpleCanleder.js"></script>
    <link href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/SimpleCanleder.css" rel="stylesheet">

</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
      <td>教员：</td> <td><input type="search"  class="searchStyle" style="width:160px;"/></td>
          
          <td><label for="search_begindate">教学月份：</label></td> <td><input type="date" class="dateStyle" style="width:160px;" /></td>
           <td><input type="button"  value="搜索" class="searchBotton" /></td>
        </tr>
<script type="text/javascript">
        $(function (){
            $("#search_begindate").simpleCanleder();
            });     
</script>     
      
       </table>
    </div>

    <h1 class="tabTitle">教员课时信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="1" class="selectTable" style="font-size: 12px";>
        <tr>
      
          <th>姓名</th>
          <th>所带班级</th>
          <th>授课内容</th>
          <th>阶段</th>
          <th>所带课时数</th>
          <th>另加课时</th>
          <th>原因</th>
          <th>合计</th>
          
        </tr>

         <tr>
      
          <td rowspan="3">史鹏丽</td><!-- 此处需要判断 -->
          <td>Y47</td>
          <td>桥接-12-13；SSM-01-10</td>
          <td>Y2</td>
          <td>176</td>
          <td>0</td>
          <td>无</td>
          <td>176</td>
          
        </tr>
         <tr>
     
          
          <td>T73</td>
          <td>集训</td>
          <td> </td>
          <td>4</td>
          <td>0</td>
          <td>无</td>
          <td>0</td>
        
          
        </tr>
         <tr>
      
          
          <td>C10</td>
          <td>集训</td>
          <td></td>
          <td>6</td>
          <td>0</td>
          <td>无</td>
          <td>0</td>
           
        </tr>


         <tr>
       	  <td> <!-- rowspan="3" -->白大海</td>
          <td>C13</td>
          <td>JAVA-27-52</td>
          <td>Java</td>
          <td>123</td>
          <td>0</td>
          <td>无</td>
          <td>123</td>
        </tr>

         <tr>
         <td>孙学斌</td>
          <td>Y47</td>
          <td>COT-Hi~崭新的第一天</td>
          <td>Java</td>
          <td>2</td>
          <td>0</td>
          <td>无</td>
          <td>0</td>
          </tr>


         <tr>
         <td>张曼</td>
          <td>C11</td>
          <td>JAVA-88-113</td>
          <td>Java</td>
          <td>2</td>
          <td>0</td>
          <td>无</td>
          <td>0</td>
        </tr>

      </table>
    <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
       
  </body>
</html>
