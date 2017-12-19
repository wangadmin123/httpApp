<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet" type="text/css"
	href="statics/common/css/index.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript">
	 
	$(function() {
		ws_init();
		/* 	getNoticeCountBytime(); */
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


				alert("上次登录时间：" + times)

			}
		}
	});

	function updatapwdPage(pageurl) {
		$(".right").empty();
		var str = "<iframe  id='frmright' name='frmright' src='" + pageurl + "' frameborder='0' scrolling='yes' style='width:99%; height:99%;'></iframe>";
		$(".right").html(str);
	}
</script>
</head>
<body>
	<div class="head">
		<div class="logo">
			<img src="statics/common/images/logo.png" />
		</div>
		<ul class="hav">
			<li class="line"
				onclick="updatapwdPage('jsp/human_resource_department/welcome.jsp')">我的桌面</li>
			<c:if test="${loginUser.position.jurisdiction_id == 3}">
				<li onclick="NewPage('select/username')">权限分配</li>
			</c:if>


		</ul>
		<div class="login" id="admin">
			<span>${loginUser.position.depart_name}-${loginUser.position.position_name}-${loginUser.emp_name }</span>
			<div class="person">
				<span
					onclick="NewPage('Employee/ShowEmployee/'+${loginUser.emp_id})">个人中心</span>
				<span onclick="NewPage('pwdupdata/pwdUpdataPage')">修改密码</span> <span
					onclick="openPage('login/Logout')">退出</span>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="left">
			<c:if test="${loginUser.position.position_name eq '班主任'}">
				<ul>
					<li><img src="statics/common/images/tb2.png" /> <span>日常</span>
						<dl class="sonUl">
							<dt>日常数据管理</dt>
							<dd class="ddDiv" onclick="NewPage('oaJwbGradesDaylist.html')">班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('addadilyview?teacheraa=${loginUser.emp_id}')">填写日报</dd>
							
							</dl></li>

						</dl></li>
						<li><img src="statics/common/images/tb2.png" /> <span>数据</span>
						<dl class="sonUl">
							<dt>日常数据</dt>
							<dd class="ddDiv" onclick="NewPage('showClassData')">查看班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest1')">查看周考</dd>
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest1')">查看月考</dd>
							
							</dl></li>
					<li><img src="statics/common/images/tb2.png" /> <span>学员</span>
						<dl class="sonUl">
							<dt>学员管理</dt>
							<dd class="ddDiv" onclick="NewPage('toJzbStudent')">学员管理</dd>
							<dd class="ddDiv" onclick="NewPage('toAddStuInfo.html')">添加学员档案</dd>
							<dd class="ddDiv" onclick="NewPage('toJzbAllStudent')">全部学员档案</dd>
							
						</dl></li>
						
						<li><img src="statics/common/images/tb2.png" /> <span>班级</span>
						<dl class="sonUl">
							<dt>班级管理</dt>
							<dd class="ddDiv" onclick="NewPage('oaJwbGradeslist.html')">班级数据管理</dd>
							<dd class="ddDiv" onclick="NewPage('jwb/class_info.html')">带班信息表</dd>
							
						</dl></li>
						
						<!-- 口碑功能暂时放弃 -->
					<!-- <li><img src="statics/common/images/tb2.png" /> <span>口碑</span>
						<dl class="sonUl">
							<dt>口碑管理</dt>
							<dd class="ddDiv" onclick="NewPage('addTzPersonal.html')">添加口碑</dd>
							<dd class="ddDiv" onclick="NewPage('publicPraise.html')">查看个人口碑</dd>
						</dl></li> -->
					<li><img src="statics/common/images/tb2.png"> <span>日报表</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>日报表管理</dt>
							<dd class="ddDiv"  style="padding-top:10px;"><a href="addadilyview?teacheraa=${loginUser.emp_id}" target="frmright"  style="font-size: 14px;color:black;" >新增日报表</a></dd>
							<dd class="ddDiv" onclick="NewPage('Dailygeren')">个人日报表</dd>
						</dl></li>
					<li><img src="statics/common/images/tb2.png"> <span>月总</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>月总</dt>
							<dd class="ddDiv" onclick="NewPage('jwb/showScore.html')">查看月总</dd>
						</dl></li>
				</ul>
			</c:if>
			<c:if test="${loginUser.position.position_name eq '教质部主管'}">
				<ul>
					<%-- <li><img
						src="${pageContext.request.contextPath }/statics/academic_affairs_department/images/tb6.png" />
						<span>开班</span>
						<dl class="sonUl">
							<dt>添加班级</dt>
							<dd class="ddDiv" onclick="NewPage('jwb/classProject.html')">添加班级</dd>
							<dd class="ddDiv" onclick="NewPage('oajzb/OaJzbHeban')">合并班级</dd>
							<dd class="ddDiv" onclick="NewPage('jwb/class_info1.html')">班级基本信息表</dd>
						</dl></li> --%>
					<li><img src="statics/common/images/tb2.png" /> <span>日常</span>
						<dl class="sonUl">
							<dt>日常数据管理</dt>
							<dd class="ddDiv" onclick="NewPage('oaJwbGradesDaylist.html')">班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('addadilyview?teacheraa=${loginUser.emp_id}')">填写日报</dd>
							
							</dl></li>
						<li><img src="statics/common/images/tb2.png" /> <span>数据</span>
						<dl class="sonUl">
							<dt>日常数据</dt>
							<dd class="ddDiv" onclick="NewPage('showClassData')">查看班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest1')">查看周考</dd>
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest1')">查看月考</dd>
							
							</dl></li>
					<li><img src="statics/common/images/tb2.png"> <span>学员</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>学员管理</dt>
							<dd class="ddDiv" onclick="NewPage('toJzbStudent')">学员信息</dd>
							<dd class="ddDiv" onclick="NewPage('toAddStuInfo.html')">新建学员档案</dd>
							<dd class="ddDiv" onclick="NewPage('toJzbAllStudent')">全部学员档案</dd>
							<dd class="ddDiv"
								onclick="NewPage('oaJzbReceiveConsultlist.html')">接收报名咨询量</dd>
						</dl></li>
						<li><img src="statics/common/images/tb2.png"> <span>班级</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>班级管理</dt>
							<dd class="ddDiv" onclick="NewPage('oaJwbGradeslist.html')">班级数据管理</dd>
							<dd class="ddDiv" onclick="NewPage('addSpecialty.html')">新增特色课程</dd>
							<dd class="ddDiv" onclick="NewPage('jwb/class_info.html')">带班信息表</dd><!-- 
							<dd class="ddDiv" onclick="NewPage('jwb/class_A.html')">A班基本数据表</dd>
							<dd class="ddDiv" onclick="NewPage('jwb/class_C.html')">C班基本数据表</dd> -->
						</dl></li>
					<!-- <li><img src="statics/common/images/tb2.png"> <span>口碑</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>口碑管理</dt>
							<dd class="ddDiv" onclick="NewPage('addTzPersonal.html')">添加口碑</dd>
							<dd class="ddDiv" onclick="NewPage('publicPraise.html')">查看个人口碑</dd>
							<dd class="ddDiv" onclick="NewPage('personal')">查看员工口碑</dd>
						</dl></li> -->
					<li><img src="statics/common/images/tb2.png"> <span>日报表</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>日报表管理</dt>
							<dd class="ddDiv" onclick="NewPage('addadilyview?teacheraa=${loginUser.emp_id}')"><%-- <a href="addadilyview?teacheraa=${loginUser.emp_id}" style="font-size: 14px;color:black;"> --%>新增日报表</a></dd>
							<dd class="ddDiv" onclick="NewPage('Dailygeren')">个人日报表</dd>
							<dd class="ddDiv" onclick="NewPage('DailyStaffList')">员工日报表</dd>
						</dl></li>
					<li><img src="statics/common/images/tb2.png"> <span>月总</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>月总</dt>
							<dd class="ddDiv" onclick="NewPage('jwb/showScore.html')">查看月总</dd>
						</dl></li>
				</ul>
			</c:if>
			<c:if
				test="${loginUser.position.position_name eq '就业部主管' or loginUser.position.position_name eq '就业专员'}">
				<ul>
					<li><img src="statics/common/images/tb2.png" /> <span>数据</span>
						<dl class="sonUl">
							<dt>日常数据</dt>
							<dd class="ddDiv" onclick="NewPage('showClassData')">查看班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest1')">查看周考</dd>
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest1')">查看月考</dd>
							
							</dl></li>
					<li><img src="statics/common/images/tb2.png" /> <span>班级</span>
						<dl class="sonUl">
							<dt>班级管理</dt>
							<dd class="ddDiv" onclick="NewPage('oaJwbGradeslist.html')">班级信息</dd>
							<dd class="ddDiv" onclick="NewPage('jwb/class_info.html')">带班信息表</dd>
						</dl></li>
					<li><img src="statics/common/images/tb2.png"> <span><a>面试</a></span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>面试管理</dt>
							<dd class="ddDiv"
								onclick="NewPage('employment_department/mianshi')">模拟面试</dd>
						</dl></li>
					<li><img src="statics/common/images/tb2.png"> <span><a>企业</a></span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>企业管理</dt>
							<dd class="ddDiv"
								onclick="NewPage('employment_department/showlist.html')">企业资源</dd>
							<dd class="ddDiv"
								onclick="NewPage('employment_department/add.html')">新增企业</dd>
						</dl></li>
					<li><img src="statics/common/images/tb2.png"> <span><a>学员</a></span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>学员管理</dt>
							<dd class="ddDiv" onclick="NewPage('toJzbAllStudent')">查看学员信息</dd>
							<dd class="ddDiv"
								onclick="NewPage('employment_department/huifang')">学员回访记录</dd>
							<dd class="ddDiv"
								onclick="NewPage('employment_department/employment')">就业学生信息</dd>
						</dl></li>
					<!-- <li><img src="statics/common/images/tb2.png"> <span><a>口碑</a></span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>口碑管理</dt>
							<dd class="ddDiv" onclick="NewPage('publicPraise.html')">查看个人口碑</dd>
							<dd class="ddDiv" onclick="NewPage('addTzPersonal.html')">添加口碑</dd>
						</dl></li> -->
					<li><img src="statics/common/images/tb2.png"> <span><a>报表</a></span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>报表管理</dt>
							<dd class="ddDiv"
								onclick="NewPage('employment_department/addtable')">添加报表</dd>
							<dd class="ddDiv"
								onclick="NewPage('employment_department/chakanbaobiao')">查看报表</dd>
						</dl></li>
				</ul>
			</c:if>

			<c:if test="${loginUser.position.position_name eq '学术教质经理'}">
				<ul>
					<li><img src="statics/common/images/tb2.png" /> <span>日常</span>
						<dl class="sonUl">
							<dt>日常数据管理</dt>
							<dd class="ddDiv" onclick="NewPage('oaJwbGradesDaylist.html')">班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('addadilyview?teacheraa=${loginUser.emp_id}')">填写日报</dd>
							
							</dl></li>
							<li><img src="statics/common/images/tb2.png" /> <span>数据</span>
						<dl class="sonUl">
							<dt>日常数据</dt>
							<dd class="ddDiv" onclick="NewPage('showClassData')">查看班级日常数据</dd>
							
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest1')">查看周考</dd>
							<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest1')">查看月考</dd>
							
							</dl></li>
					<%-- <li id="dassda"><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb3.png" />
					<span>作业</span>
					<dl class="sonUl">
						<dt>日常作业完成情况</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/showDailystatement')">查看作业完成情况</dd>

					</dl></li> --%>
				<li><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb4.png" />
					<span>日考</span>
					<dl class="sonUl">
						<dt>日考成绩管理</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/showDaytest')">查看日考成绩表</dd>
					</dl></li>
				<%-- <li><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb4.png" />
					<span>周考</span>
					<dl class="sonUl">
						<dt>周考成绩管理</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest')">查看周考成绩表</dd>
					</dl></li> --%>
			<%-- 	<li><img
					src="${pageContext.request.contextPath }/statics/academic_department/images/tb4.png" />
					<span>月考</span>
					<dl class="sonUl">
						<dt>月考成绩管理</dt>
						<dd class="ddDiv"
							onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest')">查看月考成绩表</dd>
					</dl></li> --%>
					<li><img
						src="${pageContext.request.contextPath }/statics/academic_affairs_department/images/tb6.png" />
						<span>开班</span>
						<dl class="sonUl">
							<dt>添加班级</dt>
							<dd class="ddDiv" onclick="NewPage('jwb/class_info1.html')">班级基本信息表</dd>
						</dl></li>

					<li><img src="statics/common/images/tb2.png"> <span>班级</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>班级管理</dt>
							<dd class="ddDiv" onclick="NewPage('oaJwbGradeslist.html')">班级数据信息</dd>
							<dd class="ddDiv" onclick="NewPage('jwb/class_info.html')">带班信息表</dd><!-- 
							<dd class="ddDiv" onclick="NewPage('jwb/class_A.html')">A班基本数据表</dd>
							<dd class="ddDiv" onclick="NewPage('jwb/class_C.html')">C班基本数据表</dd> -->
						</dl></li>
					<li><img src="statics/common/images/tb2.png"> <span>学员</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>学员管理</dt>
							<dd class="ddDiv" onclick="NewPage('toJzbStudent')">学员信息</dd>
								<dd class="ddDiv" onclick="NewPage('toAddStuInfo.html')">新建学员档案</dd>
							<dd class="ddDiv" onclick="NewPage('toJzbAllStudent')">全部学员档案</dd>
						</dl></li>
					<!-- <li><img src="statics/common/images/tb2.png"> <span>口碑</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>口碑管理</dt>
							<dd class="ddDiv" onclick="NewPage('addTzPersonal.html')">添加口碑</dd>
							<dd class="ddDiv" onclick="NewPage('publicPraise.html')">查看个人口碑</dd>
							<dd class="ddDiv" onclick="NewPage('personal')">查看员工口碑</dd>
						</dl></li> -->
					<li><img src="statics/common/images/tb2.png"> <span>日报表</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>日报表管理</dt>
							<dd class="ddDiv" onclick="NewPage('DailyStaffList')">员工日报表</dd>
						</dl></li>
					<li><img src="statics/common/images/tb2.png"> <span>月总</span>
						<dl class="sonUl" style="height: 629px; display: none;">
							<dt>月总</dt>
							<dd class="ddDiv" onclick="NewPage('jwb/showScore.html')">查看月总</dd>
						</dl></li>
				</ul>
			</c:if>
			
		</div>
		<div class="right">
			<%-- <c:if test="${loginUser.position.depart_id eq 9}">
   			<iframe  id="frmright1" name="frmright" src="jsp/human_resource_department/kfbwelcome.jsp" frameborder="0" scrolling="yes" style="width:99%; height:99%;"></iframe>
   		</c:if> --%>
			<input type="hidden" name="是否已登录" id="OrLogin" value="${OrLogin}">
			<input type="hidden" name="上次登录ip" id="ipaddress"
				value="${lastLoginInfo.account_login_ipaddress }"> <input
				type="hidden" name="上次登录时间" id="times"
				value="${lastLoginInfo.account_login_times }">
			<iframe id="frmright2" name="frmright"
				src="jsp/human_resource_department/welcome.jsp" frameborder="0"
				scrolling="yes" style="width:99%; height:99%;"></iframe>
		</div>
	</div>
	
	
</body>
</html>
