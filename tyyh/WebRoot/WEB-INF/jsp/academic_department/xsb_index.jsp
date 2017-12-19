<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>首页</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/index.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/index.js"></script>
<script type="text/javascript">
	$(function() {
		getNoticeCountBytime();
		function getNoticeCountBytime() {
			setInterval(function() {
				cot();
			}, 5000);
		}
		function cot() {
			$.ajax({
				url : "getData/getlogincont",
				type : "POST",
				datatype : "text",
				success : function(data) {
					if (data == "out") {
						alert("您的账号在其他主机登陆!");
						window.location.href = "login/Logout";
					}
				}
			});
		}

		var ipaddress = $("#ipaddress").val();
		var times = $("#times").val();
		var OrLogin = $("#OrLogin").val();

		if (OrLogin == "Login") {

			if (ipaddress == "" && times == "" && a == 1) {
				alert("您好！欢迎您首次登录！")
			} else {


				alert("   上次登录时间：" + times)

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
				src="${pageContext.request.contextPath }/statics/academic_department/images/logo.png" />
		</div>
		<ul class="hav">
			<li class="line"
				onclick="NewPage('statics/academic_department/xsb_welcome.jsp')">我的桌面</li>
			<!-- 			<li>人力资源部</li>
			<li>教务部</li>
			<li>教质部</li> -->
			<li>学术部</li>
			<!-- 			<li>咨询部</li>
			<li>网络部</li>
			<li>市场渠道部</li>
			<li>开发部</li>
			<li>就业部</li>
			<li>校长办公室</li> -->
		</ul>
		<div class="login" id="admin">
			<span>${loginUser.position.position_name}-${loginUser.emp_name
				}</span>
			<div class="person">
				<span
					onclick="NewPage('Employee/ShowEmployee/'+${loginUser.emp_id})">个人中心</span>
				<span onclick="NewPage('pwdupdata/pwdUpdataPage')">修改密码</span> 
				<span onclick="openPage('login/Logout')">退出</span>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="left">
			<ul>
				<!-- 				<dl class="sonUl">
					<dt>我的桌面</dt>
					<dd class="ddDiv" onclick=NewPage("Woindex.html")>常用功能</dd>
				</dl> -->

				</li>
				<li><img
					src="${pageContext.request.contextPath }/statics/common/images/tb2.png" />
					<span>班级</span>
					<dl class="sonUl">
						<dt>班级管理</dt>
						<dd class="ddDiv" id="AStuInfo"
							onclick="NewPage('oaJwbGradeslist.html')">班级信息</dd>
						<dd class="ddDiv" id="AStuInfo"
							onclick="NewPage('jwb/class_info.html')">带班信息表</dd>
					</dl></li>
					<li><img src="statics/common/images/tb2.png" /> <span>数据</span>
						<dl class="sonUl">
							<dt>日常数据</dt>
							<dd class="ddDiv" onclick="NewPage('showClassData')">查看班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest1')">查看周考</dd>
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest1')">查看月考</dd>
							
							</dl></li>
				<li><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb2.png" />
					<span>学生</span>
					<dl class="sonUl">
						<dt>学生信息管理</dt>
						<dd class="ddDiv" id="AStuInfo"
							onclick="NewPage('${pageContext.request.contextPath }/toJzbAllStudent')">学生基本信息</dd>
					</dl></li>

				<li id="dassda"><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb3.png" />
					<span>作业</span>
					<dl class="sonUl">
						<dt>日常作业完成情况</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/addDailystatement')">录入作业完成情况</dd>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/showDailystatement')">查看作业完成情况</dd>

					</dl></li>
				<li><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb4.png" />
					<span>日考</span>
					<dl class="sonUl">
						<dt>日考成绩管理</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/showDaytest')">查看日考成绩表</dd>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/addDaytest')">录入日考成绩表</dd>
					</dl></li>
				<li><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb4.png" />
					<span>周考</span>
					<dl class="sonUl">
						<dt>周考成绩管理</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest')">查看周考成绩表</dd>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/addWeektest')">录入周考成绩表</dd>
					</dl></li>
				<li><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb4.png" />
					<span>月考</span>
					<dl class="sonUl">
						<dt>月考成绩管理</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest')">查看月考成绩表</dd>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/addMonthtest')">录入月考成绩表</dd>
					</dl></li>
				<%-- <li><img
					src="${pageContext.request.contextPath}/statics/teach_nature_department/images/tb4.png" /><span>口碑</span>
					<dl class="sonUl">
						<dt>口碑管理</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/publicPraise.html')">查看个人口碑</dd>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/personal')">查看员工口碑</dd>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/addTzPersonal.html')">添加口碑</dd>
					</dl></li> --%>
				<!-- <li><img src="statics/common/images/tb7.png" /><span>通知</span>

					<dl class="sonUl">
						<dt>通知</dt>
						<dd class="ddDiv"
							onclick="NewPage('Consultway/toconsultNotice_list')">查询通知</dd>
						<dd class="ddDiv"
							onclick="NewPage('Consultway/toconsultNotice_add')">发送通知</dd>
					</dl></li> -->

			</ul>
		</div>
		<div class="right">
			<input type="hidden" name="是否已登录" id="OrLogin" value="${OrLogin}">
			<input type="hidden" name="上次登录ip" id="ipaddress"
				value="${lastLoginInfo.account_login_ipaddress }"> <input
				type="hidden" name="上次登录时间" id="times"
				value="${lastLoginInfo.account_login_times }">

			<iframe id="frmright" name="frmright"
				src="statics/academic_department/xsb_welcome.jsp" frameborder="0"
				scrolling="yes" style="width:99%; height:99%;"></iframe>
		</div>
	</div>
</body>
</html>
