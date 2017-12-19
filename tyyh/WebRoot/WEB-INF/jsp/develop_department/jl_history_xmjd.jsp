<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>项目进度管理</title>
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
<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
<script type="text/javascript" src="statics/develop_department/js/index.js"></script>
<script type="text/javascript" src="statics/develop_department/laydate/laydate.js"></script>

<script type="text/javascript">
	$(function() {
		/*点击删除*/
		$(".delete").click(function() {
			$(".mbStyle").css("display", "block");
			$(".deleteStyle").css("display", "block");
		});
		/*确定删除*/
		$(".bottomStyle1").click(function() {
			$(".mbStyle").css("display", "none");
			$(".deleteStyle").css("display", "none");
			alert('你点击了确定')
		});
		/*删除取消*/
		$(".bottomStyle2").click(function() {
			$(".mbStyle").css("display", "none");
			$(".deleteStyle").css("display", "none");
			alert('你点击了取消')
		});
	});
	$(function() {
		$(".Botton").click(function() {
			location.href = "jindu.html";

		});
	});

	$(function() {
		$(".edit").click(function() {
			location.href = "editjindu.html";

		});
	});
	/*表格全选*/
	$(function() {
		$("#all").click(function() {
			var checked = $(this).is(":checked");
			$(".selectTable tr td").children().attr("checked", checked);
		});
		//判断是否全选
		function ifAllChecked() {
			var checkedBoxs = $(".selectTable tr td").children();
			var sum = checkedBoxs.size();
			var k = 0;
			checkedBoxs.each(function(index, dom) {
				if ($(dom).is(":checked"))
					k++;
			});
			if (k == sum) {
				$("#all").attr("checked", true);
			} else {
				$("#all").attr("checked", false);
			}
		}
		ifAllChecked();//页面加载完后运行

	});
	/*表格全选结束*/
</script>
</head>
<body>
	<div class="rightContent">
		<br />
		<h2>历史项目进度</h2>
		<br />
		<hr>
		<br />
		<div class="tabContent">

			<h1 class="tabTitle">小组项目列表</h1>
			<div class="divTable">
				<table cellpadding="0" cellspacing="0" border="1"
					class="selectTable" style="width:60%">
					<tr>
						<th>项目名称</th>
						<th>所属小组</th>
						<th>组长</th>
						<th>所属阶段</th>

					</tr>
					<c:forEach items="${jllist}" var="f">
						<tr>
							<td>${f.module}</td>
							<td>${f.groupname}</td>
							<td>${f.username}</td>
							<td><a href="develop/jl_Krate.html?groupid=${f.groupid}">详情</a></td>
					</tr>
					</c:forEach>


				</table>
				<div class="btposition2"></div>
			</div>
			<input type="button" value="返回" class="searchBotton"
								onclick="NewPage('develop/jl_xmjd.html')" />
		</div>
	</div>
	<div class="mbStyle">&nbsp;</div>

</body>
</html>
