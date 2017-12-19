<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">

	<head>
		<meta charset="UTF-8">
		<base href="<%=basePath%>">
		<title>组员，请假模板</title>
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css" />
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/add.css" />
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/switch.css">
		<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
		<script type="text/javascript">
			/*确定保存弹出框的位置*/
			$(function() {
				var saveWidth = $(window).width();
				var saveHeight = $(window).height();
				$(".saveStyle").css("left", saveWidth / 2 - 130);
				$(".saveStyle").css("top", saveHeight / 2 - 40);
				$.ajax({
				
				});
				$(".saveBotton").click(function() {
				var parms=$("#leave_form").serialize() ;
				parms=decodeURIComponent(parms,true);
							/* 	$.ajax({
						url:"${pageContext.request.contextPath}/develop/leavesaveqingjia.html",
						type:"POST",
						data:parms,
						success:function(result){
						//console.log(result)
						alert(result);
						}
				}); */
				});
			});

			
		</script>
	</head>

	<body>
		<div class="rightContent">
<br>
<h2>请假申请</h2>
</br>
<hr/>
			<div class="tabContent">
				<h1 class="tabTitle">新增请假单</h1>
				<form action="develop/zz_saveleaveygadd.html?uid=${uid }" method="post" id="leave_form">
					<table cellpadding="0" cellspacing="0" border="0" class="addTable">
                    		<tr>
								<td class="tdWidth"><span>*</span>学员ID：</td>
								<td>
								<input type="hidden" name="user_id" value="${user.id}"/>
								<input type="text" class="textStyle" disabled="disabled" style="width:160px;"  value="${user.stu_id}"/></td>
							</tr>
							<tr>
								<td class="tdWidth"><span>*</span>姓名：</td>
								<td><input type="text" class="textStyle" disabled="disabled" style="width:160px;" value="${user.stu_name}"/></td>
								
							</tr>
						<tr>
							<td class="tdWidth">联系电话：</td>
							<td><input type="text" class="textStyle"  required="required"style="width:160px;" name="phone" value="${user.contact_way}"/></td>
						</tr>
						
						<tr>
							<td class="tdWidth"><span>*</span>请假开始时间：</td>
							<td><input type="date" class="dateStyle" required="required" style="width:160px;" name="startime"/></td>
						</tr>
						<tr>
							<td class="tdWidth"><span>*</span>请假结束时间：</td>
							<td><input type="date" class="dateStyle" required="required"  style="width:160px;" name="endtime" /></td>
						</tr>
                        <tr>
							<td class="tdWidth"><span>*</span>请假天数：</td>
							<td><input type="text" class="textStyle" required="required"  style="width:80px;" name="days" /></td>
						</tr>
						<tr>
							<td class="tdWidth">请假类型：</td>
							<td><input type="radio" class="radioStyle" required="required"  checked="checked" name="type" value="1"/>事假&nbsp;&nbsp;&nbsp;&nbsp; 
							<input type="radio" class="radioStyle" name="type" value="2"/>病假</td>
						</tr>
						<tr>
						<td class="tdWidth">请假事由：</td>
						<td><textarea class="areaStyle" name="reason"
								style="width:360px;" required="required"></textarea></td>
					</tr>

					</table>
					<h2 class="tabTitle2">&nbsp;</h2>
					<div class="btposition1">
						<input type="submit" value="提交" class="saveBotton" />
					</div>
				</form>

			</div>
		</div>
		

	</body>

</html>