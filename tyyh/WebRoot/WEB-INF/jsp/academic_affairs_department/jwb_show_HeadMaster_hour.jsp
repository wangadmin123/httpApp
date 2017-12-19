<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>班主任课时统计表</title>
    
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
      <td>授课人：</td> <td><input type="search"  class="searchStyle" style="width:160px;"/></td>
          
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

    <h1 class="tabTitle">课时信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="1" class="selectTable">
        <tr>
      
          <th>姓名</th>
          <th>所带班级</th>
          <th>授课内容</th>
          <th>阶段</th>
          <th>标准课时</th>
          <th>另加课时</th>
          <th>原因</th>
          <th>合计</th>
        </tr>

         <tr>
      
          <td rowspan="3">蔚丽飒</td>
          <td>C11</td>
          <td>COT-时间、情绪及压力管理</td>
          <td>PRE</td>
          <td>100</td>
          <td>0</td>
           <td>无</td>
              <td>无</td>
          
        </tr>
         <tr>
     
         
          <td>C12</td>
          <td>COT-我的团队我的班</td>
          <td>Java</td>
          <td>100</td>
          <td>0</td>
            <td>无</td>   
              <td>无</td>
          
        </tr>
         <tr>
      
          
          <td>C13</td>
          <td>COT-开启职场大门</td>
          <td>Java</td>
          <td>100</td>
          <td>0</td>
            <td>无</td>   
              <td>无</td>   
        </tr>


         <tr>
       <td rowspan="2">刘丁珂</td>
          <td>T78</td>
          <td>开学典礼</td>
          <td>S1</td>
          <td>100</td>
          <td>0</td>
          <td>无</td>
              <td>无</td>  
        </tr>

         <tr>
        
          <td>学社</td>
          <td>学社英语小讲堂</td>
          <td> </td>
          <td>100</td>
          <td>0</td>
          <td>无</td>
              <td>无</td>
            </tr>


         <tr>
          <td>田鑫鑫</td>
          <td>C10</td>
          <td>COT-职场大门已打开</td>
          <td>Java</td>
          <td>100</td>
          <td>0</td>
           <td>无</td>
              <td>无</td>
        </tr>

        
      </table>
    <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
       
  </body>
</html>
