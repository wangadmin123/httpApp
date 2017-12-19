<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <base href="<%=basePath%>">
    <title>My JSP 'ceshi1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css">
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/tab.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/back.js"></script>
    <style type="text/css">
    .li{
    width: 35%;
    height: 44%;
    padding-left:50px;
    display: inline-block;
    position: absolute;
    }
    .ll{
     width: 90%;
     height: 44%;
    
     
    }
    .ww{
     width: 50%;
    
     position: relative;
     top: 15%;
     left:50%;
     
    }
    .ww p{
    color: #C6C6C6;
    font-family: cursive;
    font-size: 18px;
    }
    
        .nn{
   
     padding:5px;
    width: 30%;
    display: inline-block;
    border:1px solid #C6C6C6;
    height: 40%;
    margin-left: 5px;
    
    margin-top: 10px;
    text-align: center;
    border-radius:20px;
    
    }
    </style>
    

  </head>
  
  <body>
  <div class="rightContent">
  <h3>活动详情</h3>
   <br>
  
  <hr/>
 <div class="ll">
 
  <div class="li">
  <br><img alt="1234" src="${sourceStrArray[1] }" style="width: 340px;height: 250px">
  </div>
  
   <div class="ww"><p>  主题：${oaJybActivity.activity_theme }
  <p>班级：${oaJybActivity.activity_class }</p>
  <p>教员：${oaJybActivity.activity_figure }</p>
   <p>地点：${oaJybActivity.activity_address }</p>
    <p>日期：${time}</p>
     <p>类型：${oaJybActivity.activity_type }</p>
      <p>备注：${oaJybActivity.activity_remarks }</p>
</div>

  </div>
  <br/>
  
  <br/>
  <hr>
  
<!--   <div id="demo" class="nn"> <img alt="1234" src="../images1/cx.jpg" style="width: 300px;height: 230px"> </div>
  <div id="enlarge_images" class="nn"> <img alt="1234" src="../images1/cyq.jpg" style="width: 300px;height: 230px"> </div>
   <div class="nn"> <img alt="1234" src="../images1/sy.jpg" style="width: 300px;height: 230px"> </div>
   <div class="nn"> <img alt="1234" src="../images1/zdg.jpg" style="width: 300px;height: 230px"> </div>
   <div class="nn"> <img alt="1234" src="../images1/lb.jpg" style="width: 300px;height: 230px"> </div>
   <div class="nn"> <img alt="1234" src="../images1/hbx.jpg" style="width: 300px;height: 230px"> </div>
   <div class="nn"> <img alt="1234" src="../images1/lt.png" style="width: 300px;height: 230px"> </div>
   <div class="nn"> <img alt="1234" src="../images1/lxp.png" style="width: 300px;height: 230px"> </div>
   <div class="nn"> <img alt="1234" src="../images1/lx.JPG" style="width: 300px;height: 230px"> </div> -->
   
   <c:if test="${sourceStrArray != null }">
									   
		<c:forEach var="station" items="${sourceStrArray}" begin="1" >
									   
	 <div class="nn"> <img alt="1234" src="${station }" style="width: 300px;height: 230px">
	
	  </div>
									   		
			 </c:forEach>
				</c:if>
  
  
  </div>
   <div class="btposition2">
	       <div><input type="button" class="BackBotton" value="返回"/>
	       
	       </div>
	  </div>
  </body>
</html>
