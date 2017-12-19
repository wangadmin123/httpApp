<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css"
	href="statics/common/css/login.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css">
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/normalize.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/demo.css" />

<!--必要样式-->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/component.css" />
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript">

	$(function() {
		deleteInformationBugOaRlzybEmployee();
		changeValidateCode();
		$("#user_name").change(function() {

			var user_name = $("#user_name").val();
			$.ajax({
				type : "post",
				url : "getData/checkUsername?user_name=" + user_name,
				datatype : "text",
				success : function(data) {
					var color = data;
					$("#user_name").attr("style", "border:" + color + " 1px solid; width:230px; height:35px;line-height:35px;");
					$("#user_name").next().empty();
					if (color == "red") {
						$("#user_name").next().attr("style", "color:red;font-size: 13px;");
						/* $("#user_name").next().html("请确认用户名！"); */
					} else {
						$("#user_name").attr("style", "border: green 1px solid; width:230px; height:35px;line-height:35px;");
						$("#user_name").next().attr("style", "color:green;font-size: 13px;");
						/* $("#user_name").next().html("用户名正确！"); */
					}
				}
			});
			changeValidateCode();
		});
	});
	function changeValidateCode() {
		$.ajax({
			type : "post",
			url : "random/getrandom",
			datatype : "text",
			success : function(data) {
				/* alert(data); */
				$("#imageTag").attr("src", data);
			}
		});

	}
	/* 删除信息不完整的员工 */
	function deleteInformationBugOaRlzybEmployee() {
		$.ajax({
			url : "Employee/DeleteInformationBugOaRlzybEmployee", //请求的url地址
			dataType : "text", //返回格式为json
			async : true, //请求是否异步，默认为异步，这也是ajax重要特性
			type : "POST", //请求方式
			error : function() {
				alert("清除信息不完整员工出错！");
			}
		});
	}
</script>
</head>
<body>
	<div class="container demo-1">
		<div class="content">
			<div id="large-header" class="large-header">
				<canvas id="demo-canvas"></canvas>
				<form action="login/userLogin" method="post" style="position:absolute;top:0;left:33%;z-index:9999;margin:auto;">
					<div class="login">
						<div class="loginContent">
							<div class="titleText">
								<h1>太原映辉办公自动化管理系统</h1>
							</div>
							<div class="user">
								<table cellpadding="0" cellspacing="0" border="0"
									class="addTable" style="width: 100%;">
									<tr>
										<td class="tdWidth">用户名：</td>
										<!-- 手机号码正则表达式：pattern="^1[3|4|5|7|8][0-9]{9}$" -->
										<td><input type="text" class="textStyle" name="user_name"
											id="user_name"
											style="width:230px; height:35px;line-height:35px;"
											placeholder="请输入用户名" required value="${username}" /></td>
									</tr>
									<tr>
										<td class="tdWidth">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
										<td><input type="password" class="textStyle"
											name="user_pwd"
											style="width:230px;height:35px;line-height:35px;"
											placeholder="请输入密码" required value="${Userpwd }" /><span>${pwderror}</span></td>
									</tr>
									<tr>
										<td class="tdWidth">验证码：</td>
										<td style="height:35px;line-height:35px;"><input
											type="text" name="rands"
											style="width:80px;height:35px;line-height:35px;vertical-align:bottom;" /> <input
											type="image" src="" id="imageTag"
											onclick="changeValidateCode()"
											style="width:80px;height:35px;line-height:35px;vertical-align:bottom;"
											title="点击图片刷新验证码" /><span>${randserror }</span> <!-- <input type="submit" class="login-sub" value="" /> -->
											<input type="hidden" id="msg" value="${requestScope.msg }" />
										</td>
									</tr>
								</table>
							</div>
							<h2 class="tabTitle2">&nbsp;</h2>
							<div class="btposition2">
								<input type="submit" value="登 录" class="saveBotton" />
							</div>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- /container -->
	<script
		src="${pageContext.request.contextPath }/statics/academic_department/js/TweenLite.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/academic_department/js/EasePack.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/academic_department/js/rAF.js"></script>
	<script
		src="${pageContext.request.contextPath }/statics/academic_department/js/demo-1.js"></script>

</body>
</html>
