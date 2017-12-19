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
<title>新增，修改模板</title>
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/formStyle.css" />
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/add.css" />
<link rel="stylesheet" type="text/css"
	href="statics/develop_department/css/switch.css">
<script type="text/javascript"
	src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="statics/develop_department/js/globle.js"></script>
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
			miao = 2;
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
			location.href = "develop/zy_info.html";
		}
	}
	/*保存读秒结束*/
</script>
</head>
<body>
	<div class="rightContent">

		<div class="tabContent">
			<h2 class="tabTitle">提交项目任务</h2>
			<br />
			<hr />
			<form action="develop/zy_updaterenwu.html?id=${project.id}&&uid=${uid}" method="post"
				enctype="multipart/form-data">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">

					<tr>
						<td class="tdWidth">任务名称：</td>
						<td>${project.content }</td>
					</tr>
					<tr>
						<td class="tdWidth">开始时间：</td>
						<td><fmt:formatDate value="${project.startime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					<tr>
						<td class="tdWidth">结束时间：</td>
						<td><fmt:formatDate value="${project.finallytime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					<tr>
						<td class="tdWidth"><span>*</span>负责人：</td>
						<td>${project.username }</td>
					</tr>

					<tr>
						<td class="tdWidth">所属小组：</td>
						<td>${project.groupname }</td>
					</tr>

				<tr>
					<td class="tdWidth">审核：</td>
					<td><select name="isfinish">
							<option value="0">未完成</option>
							<option value="1">待审核</option>
							
					    </select>
					</td>
				</tr>

				<tr>
					<td class="tdWidth">完成情况描述：</td>
					<td><textarea class="areaStyle" name="remark"  style="width:360px;">1${project.remark }</textarea>
					</td>
				</tr>
				</table>
				<h2 class="tabTitle2">&nbsp;</h2>
				<td>
				<div class="btposition1">
				<%-- <p><a href="develop/zy_updaterenwu.html?id=${project.id}&&isfinish={}" class="edit">提交</a></p> --%>
					<input type="submit" value="提交" class="saveBotton" />
				</div>
			</form>


		</div>
	</div>
	<div class="saveStyle">
		提交成功！（<span class="setTime"></span>）
	</div>

</body>
</html>
