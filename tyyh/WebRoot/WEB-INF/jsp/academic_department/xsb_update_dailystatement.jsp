<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'xsb_update_dailystatement.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/all.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/formStyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/add.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/switch.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/globle.js"></script>
<script type="text/javascript">
	/*确定保存弹出框的位置*/
	$(function() {
		var saveWidth = $(window).width();
		var saveHeight = $(window).height();
		$(".saveStyle").css("left", saveWidth / 2 - 130);
		$(".saveStyle").css("top", saveHeight / 2 - 40);

	});

	/*保存读秒*/
	var miao;
	var myTime;
	$(function() {
		$(".saveBotton").click(function() {
			miao = 5;
			$(".setTime").text(miao);
			$(".saveStyle").css("display", "block");
			myTime = setInterval("divHide()", 1000);

		});
	});
	function divHide() {
		miao--;
		$(".setTime").text(miao);
		if (miao == 0) {
			clearInterval(myTime);
			$(".saveStyle").hide();
			location.href = "welcome.html";
		}
	}
	/*保存读秒结束*/
</script>
</head>

<div class="rightContent">

	<div class="tabContent">
		<h1 class="tabTitle">修改作业完成情况</h1>
		<form
			action="${pageContext.request.contextPath}/xsb/updateDailystatement"
			method="post" enctype="multipart/form-data">
			<input type="hidden" name="id" value="${oaXsbDailypaper.id}" />
			<table cellpadding="0" cellspacing="0" border="0" class="addTable">

				<tr>
					<td class="tdWidth">学号：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaXsbDailypaper.stu_number}" readonly="readonly" value="" /></td>
				</tr>
				<tr>
					<td class="tdWidth">姓名：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaXsbDailypaper.stu_name}" readonly="readonly" value="" /></td>
				</tr>
				<tr>
					<td class="tdWidth">预习：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaXsbDailypaper.preparation}" name="preparation" /></td>
				</tr>
				<tr>
					<td class="tdWidth">本上：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaXsbDailypaper.manami}" name="manami" /></td>
				</tr>
				<tr>
					<td class="tdWidth">上机：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaXsbDailypaper.obu}" name="obu" /></td>
				</tr>
				<tr>
					<td class="tdWidth">课后：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaXsbDailypaper.homework}" name="homework" /></td>
				</tr>
			</table>
			<h2 class="tabTitle2">&nbsp;</h2>
			<div class="btposition1">
				<input type="submit" value="保存" class="saveBotton" />
			</div>
		</form>


	</div>
</div>
<div class="saveStyle">
	保存成功！（<span class="setTime"></span>）
</div>

</body>
</html>
