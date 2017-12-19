<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>员工个人信息</title>
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/search.css" />
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/formStyle.css" />
<script type="text/javascript"
	src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="statics/develop_department/js/globle.js"></script>
<script type="text/javascript"
	src="statics/develop_department/laydate/laydate.js"></script>


<script type="text/javascript">
	$(function() {
		/*点击删除*/
		$(".deleteBotton").click(function() {
		});
		/* $(".submit").click(function() {
			location.href = "zy_wancheng.jsp";
		}); */
		/* $("#tjrw").click(function() {
			$.ajax({
			url:"develop/projectsave.html",
			type:"POST",
			data:{"projectid":${project.id },"isfinish":${project.isfinish }},
			
			}); */

	});
	/* $(".modifyVersion").on("click",function(){
	 var obj = $(this);
	 var isfinish = obj.attr("isfinish",item.isfinish);
	
	 var projectid = obj.attr("projectid");
	
	
	 if(isfinish == "1" ){//待审核、审核未通过状态下才可以进行修改操作
	 alert("该任务的状态为：已完成,不能继续提交！");

	 }else{
	 window.location.href="Develop/projectsave.html?projectid="+ projectid ;
	 }
	 }); */
</script>




<style type="text/css">
.qiandao {
	position: absolute;
	right: 400px;
	top: 55px;
}

.divTable {
	background-color: #EDEDED;
	height: 300px;
	width: 1400px;
}

.chuqin {
	width: 20%;
	background-color: white;
	margin: 20px;
	float: left;
	top: 20px;
}

.chidao {
	background-color: #ED6E58;
	height: 50px;
	line-height: 50px;
	font-size: 25px;
	color: white;
	font-weight: bolder;
}

.zaotui {
	background-color: #ffffff;
	height: 50px;
	line-height: 50px;
	font-size: 25px;
	font-weight: bolder;
}

.noqiandao {
	background-color: #24BFEF;
	height: 50px;
	line-height: 50px;
	font-size: 25px;
	color: white;
	font-weight: bolder;
}

.qingjia {
	background-color: #44BB00;
	height: 50px;
	line-height: 50px;
	font-size: 25px;
	color: white;
	font-weight: bolder;
}
</style>
</head>
<body onload="time()">
	<div class="rightContent">

		<div class="tabContent">
			<h2>员工个人信息</h2>
			<br>
			<hr>
			<div class="serach" style="width: 100%">


				<h4>所属小组：${user.groupname} &nbsp;&nbsp;职位：${user.jobname }&nbsp;&nbsp;姓名：
					${user.stu_name}</h4>
				<br />
				<hr />
				<br />
				<h1 class="tabTitle">您近期考核分值为：${fsCount }分</h1>
			<div class="divTable">
				<!-- 时间<input type="button" value="本月" class="thismonth"><input
					type="button" value="上月" class="lastmonth"> &nbsp;<input
					type="date" class="dateStyle" style="width: 160px;">-<input
					type="date" class="dateStyle" style="width: 160px;">-->
				<br>
				<div class="chuqin">
					<dl>
						<dt class="chidao">&nbsp;迟到&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cdCount }</dt>
						<c:forEach items="${cdTimeList}" var="cd">
							<dt>
								<fmt:formatDate value="${cd.clocktime }" pattern="yyyy-MM-dd HH:mm:ss" />
							</dt>
						</c:forEach>
					</dl>
				</div>
				<div class="chuqin">
					<dl>
						<dt class="zaotui">&nbsp;早退&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ztCount }</dt>
						<c:forEach items="${ztTimeList}" var="zt">
							<dt>
								<fmt:formatDate value="${zt.outtiam }" pattern="yyyy-MM-dd HH:mm:ss" />
							</dt>
						</c:forEach>
						
					</dl>
				</div>
				<div class="chuqin">
					<dl>
						<dt class="noqiandao">&nbsp;未签到&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${scoreCount }</dt>
						<c:forEach items="${scoreTimeList}" var="s">
							<dt>
								<fmt:formatDate value="${s.outtiam }" pattern="yyyy-MM-dd HH:mm:ss" />
							</dt>
						</c:forEach>
					</dl>
				</div>
				<div class="chuqin">
					<dl>
						<dt class="qingjia">&nbsp;请假&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${LeaveCount
							}</dt>

						<c:forEach items="${LeaveTimeList}" var="l">
							<dt>
								<fmt:formatDate value="${l.startime }" pattern="yyyy-MM-dd " />
							</dt>
						</c:forEach>

					</dl>
				</div>
			</div>
			<br /> <br />
				<p>
					<b>您近期的任务是：</b><br /> <br />
					<%-- <form 
					action="develop/projectsave.html?id=${project.id}"
					method="post"> --%>
				<table border="1" cellspacing="0" width="60%">
					<thead>
						<tr role="row">
							<th tabindex="0" aria-controls="datatable-responsive" rowspan="1"
								colspan="1"
								aria-label="First name: activate to sort column descending"
								aria-sort="ascending">时间</th>
							<th tabindex="0" aria-controls="datatable-responsive" rowspan="1"
								colspan="1"
								aria-label="First name: activate to sort column descending"
								aria-sort="ascending">内容</th>
							<th tabindex="0" aria-controls="datatable-responsive" rowspan="1"
								colspan="1"
								aria-label="First name: activate to sort column descending"
								aria-sort="ascending">任务状态</th>
							<th tabindex="0" aria-controls="datatable-responsive" rowspan="1"
								colspan="1"
								aria-label="First name: activate to sort column descending"
								aria-sort="ascending">操作</th>	
						</tr>
					</thead>

					<tbody>

						<c:forEach var="project" items="${projectList }"
							varStatus="status">

							<tr role="row" class="odd">
								<td><fmt:formatDate value="${project.startime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
								<td>${project.content }</td>
								<td>
								<c:if test="${(project.isfinish)==0}">未完成</c:if>
								 <c:if test="${(project.isfinish)==1}">待审核</c:if>
								 <c:if test="${(project.isfinish)==2}">已完成</c:if>
								 </td>
								 
								<td>
								<c:if test="${(project.isfinish)==0}">
									<a href="develop/projectsave.html?id=${project.id }&&uid=${uid}"
									class="modifyVersion" data-toggle="tooltip"
									data-placement="top" title="" data-original-title="提交任务">提交任务</a></c:if>
								 <c:if test="${(project.isfinish)==1}"><a style="color:green ">已提交</a></c:if>
								 <c:if test="${(project.isfinish)==2}"><a style="color:green ">已提交</a></c:if>
							
									<!-- <button id="tjrw">提交任务</button> --></td>
						</c:forEach>
					</tbody>


				</table>
				<!-- </form> -->
				</p>
				<br /> <br />

				<!-- <br>
				   <input type="button" value="返回" class="saveBotton" onclick="javascript:history.go(-1);"/>
				
                <br/> -->
			</div>

			

		</div>
</body>
</html>
