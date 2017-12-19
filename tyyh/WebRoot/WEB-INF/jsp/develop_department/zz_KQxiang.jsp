<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="ft"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">



<html lang="en">
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>列表模板</title>
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


		<h1 class="tabTitle">查看考勤详情</h1>
		<div class="divTable">
			<table cellpadding="0" cellspacing="0" border="0" class="selectTable">
				<tr>
					<th>编号</th>
					<th>姓名</th>
					<th>签到时间</th>
					<th>签退时间</th>
					<th>签到状态</th>
					<th>签退状态</th>
					<th>当天分数</th>
					<th>备注</th>
					<th>操作</th>

				</tr>
				<c:forEach items="${kqxianglist}" var="a">
					<tr>
						<td>${a.id}</td>
						<td>${a.stuname}</td>
						<td><ft:formatDate value="${a.clocktime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><ft:formatDate value="${a.outtiam}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><c:if test="${(a.clockstatus)==null}">未签到</c:if> <c:if
								test="${(a.clockstatus)==0}">正常</c:if> <c:if
								test="${(a.clockstatus)==1}">迟到30分以内</c:if> <c:if
								test="${(a.clockstatus)==2}">迟到30分-60以内</c:if> <c:if
								test="${(a.clockstatus)==3}">迟到60以上</c:if></td>
						<td><c:if test="${(a.outstatus)==null}">未签退</c:if> <c:if
								test="${(a.outstatus)==0}">正常</c:if> <c:if
								test="${(a.outstatus)==1}">早退30分以内</c:if> <c:if
								test="${(a.outstatus)==2}">早退30分-60以内</c:if> <c:if
								test="${(a.outstatus)==3}">早退60以上</c:if></td>
						<td>${a.score}</td>
						<td>${a.remark}</td>
						<td><a href="develop/zz_kqedit.html?userid=${userid}&&id=${a.id}&&groupid=${groupid}">修改</a></td>
					</tr>

				</c:forEach>
			</table>
			
			<div class="btposition2">
				<div>
					<a href="develop/zz_kq.html?groupid=${groupid}"><input type="button"
						class="searchBotton" value="返回" /></a> <a
						href="develop/zz_kqadd.html?userid=${userid}&&groupid=${groupid}"><input
						type="button" class="searchBotton" value="添加" /></a>
				</div>
			</div>

		</div>

	</div>
	</div>
	<div class="mbStyle">&nbsp;</div>
	
</body>
</html>
