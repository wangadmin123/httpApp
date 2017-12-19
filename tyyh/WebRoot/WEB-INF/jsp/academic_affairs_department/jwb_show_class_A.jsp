<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>A班基本数据表</title>
    
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/add.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/tab.js"></script>
<script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/DatePicker.js"></script>
    <script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/SimpleCanleder.js"></script>
    <link href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/SimpleCanleder.css" rel="stylesheet">

</head>
<body>
<div class="rightContent">
  <div class="tabContent">
  <div class="serach">
    	<form action="jwb/class_A.html" accept-charset="UTF-8">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
      <td>班级：</td> <td><input type="search" name="grade"  value="${grade }" class="searchStyle" style="width:160px;"/></td>
          
          <td><label for="search_begindate">要查询的月份：</label></td>
           <td><input type="month" name="selectDate" value="${selectDate }"  class="dateStyle" style="width:160px;" /></td>
           <td><input type="submit"  value="搜索" class="searchBotton" /></td>
        </tr>
       </table>
        <input type="hidden" name="pageIndex" value="1"/>
       </form>
    </div>
    <h1 class="tabTitle">A班数据表</h1> 
     <div class="divTable" >
       <div class="serach">    
         <form>
          <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr>     
          <th>班级</th>
          <th>阶段</th>
          <th>班主任</th>
          <th>教员</th>
          <th>就业老师</th>
          <th>出勤</th>
          <th>作业(本上)完成率</th>
          <th>上机练习完成率</th>
          <th>当堂上机完成率</th>
          <th>日期</th>
          <th>实际人数</th>
           <th>备注(标注清楚阶段)</th>
        </tr>
		<c:forEach var="Grade" items="${ObJwblist }" varStatus="status">
         <tr>
          <td class="GradeName">${Grade.name }</td>
          <td>${Grade.stage }</td>
          <td>${Grade.classTeacher }</td>
          <td>${Grade.teacher }</td>
          <td>${Grade.obtain }</td>
          <td><fmt:formatNumber type="number" 
          		value="${Grade.classHourPT*100 }" maxFractionDigits="2"/>%</td>
          <td pattern="#.00" class="manami" id="manami">
          	<c:if test="${Grade.manamiPT==null }">
          		0
          	</c:if>
          	<c:if test="${Grade.manamiPT!=null }">
          		<fmt:formatNumber type="number" 
          		value="${Grade.manamiPT*100 }" maxFractionDigits="2"/>%
          	</c:if>
          </td>
           <td><fmt:formatNumber type="number" 
          		value="${Grade.obuPT*100 }" maxFractionDigits="2"/>%</td>
           <td><fmt:formatNumber type="number" 
          		value="${Grade.homeworkPT*100 }" maxFractionDigits="2"/>%</td>             
          <td class="createTime">${Grade.createTime }</td>
           <td>${Grade.studentNum }</td>
            <td>无</td>
        </tr>
        </c:forEach>
        
      </table>
        <div class="btposition2">         
    </div>
    </div>
</div>
</div>
</body>
</html>
