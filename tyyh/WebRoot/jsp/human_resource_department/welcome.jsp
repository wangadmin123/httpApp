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
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css" />
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>

</head>
<body>

<div class="contentConfig">
		<div class="qxfp">今日待办事宜</div>
		<div class="gn_nav">
<%-- 	
			<c:if test="${loginUser.position.position_name eq '班主任'}">
				<div class="gnmk" onclick="NewPage('oaJwbGradeslist.html')"
					style="width:130px;">班级信息</div>
				<!-- <div class="gnmk" onclick="NewPage('addpatrol.html')"
					style="width:130px;">新增巡班记录</div> -->
				<div class="gnmk" onclick="NewPage('toJzbStudent')"
					style="width:130px;">学员信息</div>
				<div class="gnmk" onclick="NewPage('toJzbAllStudent')"
					style="width:130px;">全部学员档案</div>
					
				<div class="gnmk" onclick="NewPage('oaJzbReceiveConsultlist.html')"
					style="width:130px;">接收报名咨询量</div>
				<!-- <div class="gnmk" onclick="NewPage('publicPraise.html')"
					style="width:130px;">查看个人口碑</div>
				<div class="gnmk" onclick="NewPage('addTzPersonal.html')"
					style="width:130px;">添加口碑</div> -->
				<div class="gnmk" onclick="NewPage('Dailygeren')"
					style="width:130px;">个人日报表</div>
				<div class="gnmk" onclick="NewPage('DailyStaffList')"
					style="width:130px;">员工日报表</div>
					 <!-- onclick="NewPage('addadilyview')addadilyview" --> 
				<div class="gnmk" style="width:130px;"><a href="addadilyview?teacheraa=${loginUser.emp_id}" style="color: #606060;width:160px;display:block;">新增日报表</a></div>
				<div class="gnmk" onclick="NewPage('jwb/showScore.html')"
					style="width:130px;">查看月考</div>
			</c:if>
			<c:if test="${loginUser.position.position_name eq '教质部主管'}">
				
				
				<div class="gnmk" onclick="NewPage('oaJwbGradeslist.html')"
					style="width:130px;">班级信息</div>
				<div class="gnmk" onclick="NewPage('addSpecialty.html')"
					style="width:130px;">新增特色课程</div>
				<!-- <div class="gnmk" onclick="NewPage('addpatrol.html')"
					style="width:130px;">新增巡班记录</div> -->
				<div class="gnmk" onclick="NewPage('toJzbStudent')"
					style="width:130px;">学员信息</div>
				<div class="gnmk" onclick="NewPage('toAddStuInfo.html')"
					style="width:130px;">新建学员档案</div>
				<div class="gnmk" onclick="NewPage('toJzbAllStudent')"
					style="width:130px;">全部学员档案</div>
				<div class="gnmk" onclick="NewPage('oaJzbReceiveConsultlist.html')"
					style="width:130px;">接收报名咨询量</div>
				<!-- <div class="gnmk" onclick="NewPage('publicPraise.html')"
					style="width:130px;">查看个人口碑</div>
				<div class="gnmk" onclick="NewPage('personal')" style="width:130px;">
					查看员工口碑</div>
				<div class="gnmk" onclick="NewPage('addTzPersonal.html')"
					style="width:130px;">添加口碑</div> -->
				<div class="gnmk" onclick="NewPage('Dailygeren')"
					style="width:130px;">个人日报表</div>
				<div class="gnmk" onclick="NewPage('DailyStaffList')"
					style="width:130px;">员工日报表</div>
					<input type="hidden" value="${loginUser.emp_id}" name="teacheraa"/>	
				<div class="gnmk" style="width:130px;"><a href="addadilyview?teacheraa=${loginUser.emp_id}"  style="color: #606060;width:160px;display:block;">新增日报表</a></div>
				<div class="gnmk" onclick="NewPage('jwb/showScore.html')"
					style="width:130px;">查看月考</div>
			</c:if>
			<c:if test="${loginUser.position.position_name eq '就业专员' or loginUser.position.position_name eq '就业部主管'}">
				<div class="gnmk" onclick="NewPage('employment_department/mianshi')"
					style="width:130px;">模拟面试</div>
				<div class="gnmk" onclick="NewPage('employment_department/showlist.html')"
					style="width:130px;">企业资源</div>
				<div class="gnmk" onclick="NewPage('employment_department/add.html')"
					style="width:130px;">新增企业</div>
					<div class="gnmk" onclick="NewPage('employment_department/huifang')"
					style="width:130px;">学员回访记录</div>
					<div class="gnmk" onclick="NewPage('employment_department/employment')"
					style="width:130px;">就业学生信息</div>
			</c:if>
			<c:if test="${loginUser.position.position_name eq '学术教质经理' }">
				<div class="gnmk" onclick="NewPage('oaJwbGradeslist.html')"
					style="width:130px;">班级信息</div>
				<div class="gnmk" onclick="NewPage('toJzbAllStudent')"
					style="width:130px;">全部学员档案</div>
				<div class="gnmk" onclick="NewPage('DailyStaffList')"
					style="width:130px;">员工日报表</div>
					<input type="hidden" value="${loginUser.emp_id}" name="teacheraa"/>	
				<div class="gnmk" onclick="NewPage('jwb/showScore.html')"
					style="width:130px;">查看月考</div>
      				<div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/toJzbAllStudent')" style="width:130px;">
			          	 学生信息管理
			    	</div>    	
		        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/showDailystatement')" style="width:130px;">
		        	   查看作业完成情况
		    	</div>    	
			        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/showDaytest')" style="width:130px;">
			           查看日考成绩表
			    	</div>    	
			        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/showWeektest')" style="width:130px;">
			           查看周考成绩表
			    	</div>    	
			        <div class="gnmk"  onclick="NewPage('${pageContext.request.contextPath }/xsb/showMonthtest')" style="width:130px;">
			           查看月考成绩表
			    </div>
			</c:if>
			<c:if test="${not empty  userFunctionsindex}">
				<c:forEach var="function" items="${userFunctionsindex}">
					<div class="gnmk" onclick="NewPage('${function.function_url}')"
						style="width:130px;">${function.function_name}</div>
				</c:forEach>
			</c:if>--%>
			<div class="gnmk" onclick="NewPage('oaJwbGradesDaylist.html')"
					style="width:130px;">班级日常数据</div>
				<div class="gnmk" onclick="NewPage('addadilyview?teacheraa=${loginUser.emp_id}')"
					style="width:130px;">填写个人日报表</div>	
		</div> 
		
	</div>
</body>
</html>
