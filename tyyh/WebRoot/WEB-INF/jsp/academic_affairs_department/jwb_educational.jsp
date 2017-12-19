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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/index.js"></script>
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
		
			
			alert("   上次登录时间："+times)
				
		}
	} 
	});
	/* function updatapwdPage(pageurl){
		$(".right").empty();
		var str = "<iframe  id='frmright' name='frmright' src='"+pageurl+"' frameborder='0' scrolling='yes' style='width:99%; height:99%;'></iframe>";
		$(".right").html(str);
	} */
	</script>
</head>
<body>
	<div class="head">
		<div class="logo">
			<img
				src="${pageContext.request.contextPath }/statics/academic_affairs_department/images/logo.png" />
		</div>
		<ul class="hav">
			<li class="line"
				onclick="NewPage('statics/academic_affairs_department/jwb_function.jsp')">我的桌面</li>
			<!--  <li>人力资源部</li>
    <li>咨询部</li>
    <li>教质部</li>
    <li>学术部</li>
    <li>市场部</li>
    <li>就业部</li>
    <li>网络部</li> -->
			<!-- <li>教务部</li> -->
			<!--  <li>开发部</li>
    <li>校长办公室</li> -->
			<!-- <li>设置</li> -->
		</ul>
		<div class="login" id="admin">
			<span>${loginUser.position.position_name}-${loginUser.emp_name }</span>
			<div class="person">
				<span>个人中心</span> <span onclick="NewPage('pwdupdata/pwdUpdataPage')">修改密码</span>
				<span onclick="openPage('login/Logout')">退出</span>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="left">


			<ul>
				<li><img
					src="${pageContext.request.contextPath }/statics/academic_affairs_department/images/tb4.png" /><span>排课</span>
					<dl class="sonUl">
						<dt>课程管理</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/jwb/addClass.html')">课时安排</dd>
						<%-- <dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/arrangCourse.html')">进行排课</dd>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/getArrangCourse.html')">查看排课</dd> --%>
					</dl></li>
					<li><img src="statics/common/images/tb2.png" /> <span>数据</span>
						<dl class="sonUl">
							<dt>日常数据</dt>
							<dd class="ddDiv" onclick="NewPage('showClassData')">查看班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest1')">查看周考</dd>
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest1')">查看月考</dd>
							
							</dl></li>
				<li><img
					src="${pageContext.request.contextPath }/statics/academic_affairs_department/images/tb6.png" />
					<span>开班</span>
					<dl class="sonUl">
						<dt>添加班级</dt>
						<dd class="ddDiv" onclick="NewPage('jwb/classProject.html')">添加班级</dd>
						<dd class="ddDiv" onclick="NewPage('oajzb/OaJzbHeban')">合并班级</dd>
						<dd class="ddDiv" onclick="NewPage('jwb/class_info1.html')">班级基本信息表</dd>
					</dl></li>
				<li><img src="statics/common/images/tb2.png"> <span>学员</span>
					<dl class="sonUl" style="height: 629px; display: none;">
						<dt>学员管理</dt>
						<dd class="ddDiv" onclick="NewPage('toJzbAllStudent')">全部学员档案</dd>
					</dl></li>
			</ul>


		</div>
		<div class="right">
			<input type="hidden" name="是否已登录" id="OrLogin" value="${OrLogin}">
			<input type="hidden" name="上次登录ip" id="ipaddress"
				value="${lastLoginInfo.account_login_ipaddress }"> <input
				type="hidden" name="上次登录时间" id="times"
				value="${lastLoginInfo.account_login_times }">

			<iframe id="frmright" name="frmright"
				src="statics/academic_affairs_department/jwb_function.jsp"
				frameborder="0" scrolling="yes" style="width:99%; height:99%;"></iframe>
		</div>
	</div>
</body>
</html>
