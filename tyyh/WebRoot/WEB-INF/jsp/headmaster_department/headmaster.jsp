<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>首页</title>
	<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
 	<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
	<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript">

$(function() {
		getNoticeCountBytime();
		function getNoticeCountBytime(){
 		setInterval(function(){cot();},5000);
 	}
	function cot(){
		 	$.ajax({
				url:"getData/getlogincont",
				type:"POST",
				datatype:"text",
				success:function(data){
					if(data == "out"){
					alert("您的账号在其他主机登陆!");
						window.location.href="login/Logout";
					}
				}
			});
	}
	
	var ipaddress=$("#ipaddress").val();
	var times=$("#times").val();
	var OrLogin=$("#OrLogin").val();
	
	if(OrLogin=="Login"){
		
		if(ipaddress=="" && times=="" && a==1){
			alert("您好！欢迎您首次登录！")
		}else{
		
			
			alert("   上次登录时间："+times
				)
				
		}
	}
	});
	$(function() {
	
		$(".line").click();
	});
</script>
</head>
<body>
<div class="mbStyle">&nbsp;</div>

<div class="head">
  <div class="logo"><img src="statics/common/images/logo.png" /></div>
  <ul class="hav">
    <li class="line" onclick=NewPage("statics/headmaster_department/headmaster_function.jsp")>我的桌面</li>
      
  </ul>
  <div class="login" id="admin">
       <span >校长办公室</span>-<span >${loginUser.position.position_name}</span>-<span>${loginUser.emp_name }</span>
      <div class="person">
           <span onclick="NewPage('Employee/ShowEmployee/'+${loginUser.emp_id})">个人中心</span>
           <span onclick="NewPage('pwdupdata/pwdUpdataPage')">修改密码</span>
           <span onclick="openPage('login/Logout')">退出</span>
      </div>
  </div>
</div>

<div class="content">
   <div class="left">
       <ul>
           <li><img src="statics/common/images/tb3.png" /><span>咨询</span>
                <dl class="sonUl">
                    <dt>咨询信息管理</dt>
                     <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantDaySheet")>报表</dd>
                     <!-- <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantWeekSheet")>周报表</dd>
                     <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantMonthSheet")>月报表</dd>
                     <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantYearSheet")>年报表</dd> -->
                  </dl></li>
             <li><img src="statics/common/images/tb4.png" /><span>就业</span>
                <dl class="sonUl">
                    <dt>就业信息管理</dt>
                       <dd class="ddDiv" onclick=NewPage("employment_department/employment")>就业学生信息</dd>

                     
                     <!-- <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantWeekSheet")>周报表</dd>
                     <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantMonthSheet")>月报表</dd>
                     <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantYearSheet")>年报表</dd> -->
                  </dl></li>     
                  <li ><img src="${pageContext.request.contextPath }/statics/academic_affairs_department/images/tb4.png"  />
               <span>班级</span>
                  <dl class="sonUl">
                    <dt>班级基本数据</dt>
                    <dd class="ddDiv" onclick="NewPage('oaJwbGradeslist.html')">班级信息</dd>
                    <dd class="ddDiv" onclick="NewPage('jwb/class_info.html')">带班信息表</dd>
                  <dd class="ddDiv" onclick="NewPage('jwb/showScore.html')">各班月总统计表</dd>
                  </dl>      
           </li>
           <li ><img src="${pageContext.request.contextPath }/statics/academic_affairs_department/images/tb4.png"  />
               <span>学员</span>
                  <dl class="sonUl">
                    <dt>学员信息管理</dt>
                    <dd class="ddDiv" onclick="NewPage('toJzbAllStudent')">查看学生信息</dd>
                  </dl>      
           </li>	
       </ul>
   </div>
   <div class="right">
   
  		<input type="hidden" name="是否已登录" id="OrLogin" value="${OrLogin}">
   		<input type="hidden" name="上次登录ip" id="ipaddress" value="${lastLoginInfo.account_login_ipaddress }">
   		<input type="hidden" name="上次登录时间" id="times" value="${lastLoginInfo.account_login_times }">
   				
   		
      <iframe  id="frmright" name="frmright" src="statics/headmaster_department/headmaster_function.jsp" frameborder="0"
                scrolling="yes" style="width:99%; height:99%;"></iframe>
   </div>
  
</div>

</body>
</html>