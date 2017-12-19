<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
<base href="<%=basePath%>">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/develop_department/js/index.js"></script>
<script type="text/javascript">
$(function(){
	$(".logo").click(function(){
		location.href="/tyyhoa/";
		});
	});
</script>
</head>
<body>
<div class="head">
  <div class="logo"><a href="develop/kfb_index.html"><img src="statics/develop_department/images/logo.png" /></a></div>
  <ul class="hav">
    <li>欢迎来到开发部！</li>
  </ul>
  <div class="login">孟淑君</div>
</div>
<div class="content">
   <div class="left">
       <ul>
             <li class="liHover" ><img src="statics/develop_department/images/tb1.png" /><span>学员</span>
                  <dl class="sonUl">
                     <dt>管理</dt>
                     <dd class="ddDiv" onclick="NewPage('develop/jl_stulist.html')">学员信息</dd>
                     <dd class="ddDiv" onclick="NewPage('develop/jl_xzgl.html')">小组管理</dd>
                
                  
                    
                     
                  </dl>
           
           </li>
           <li ><img src="statics/develop_department/images/tb2.png"  />
               <span><a href="" >考勤</a></span>
               
                  <dl class="sonUl">
                  <dt>管理</dt>
                    <dd class="ddDiv" onclick='NewPage("develop/jl_kq.html")' >考勤管理</dd>
                       <dd class="ddDiv" onclick='NewPage("develop/jl_qj.html")' >请假管理</dd>
                  </dl>
           </li>
     
           <li><img src="statics/develop_department/images/tb3.png" /><span>项目</span>
           
             <dl class="sonUl">
                  <dt>查看</dt>
                          <dd class="ddDiv" onclick='NewPage("develop/jl_xmjd.html")'>项目进度</dd>
                  </dl>
           
           </li>   
           <li><img src="statics/develop_department/images/tb3.png" /><span>会议</span>
           
             <dl class="sonUl">
                  <dt>会议记录</dt>
                          <dd class="ddDiv" onclick='NewPage("develop/jl_xzhy.html")' >小组会议记录</dd>
                  </dl>
           </li>  
       </ul>
   </div>
      <div class="right">
      <iframe  id="frmright" name="frmright" src="jl_welcome.jsp" frameborder="0"
                scrolling="yes" style="width:99%; height:99%;"></iframe>
   </div>
</div>
</body>
</html>
