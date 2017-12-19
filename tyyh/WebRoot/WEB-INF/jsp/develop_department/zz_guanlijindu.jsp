<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	function del(fid) {
		if (window.confirm("是否确认要删除?")) {
			location.href = "develop/zz_deljindu.html?id="+fid
					+ "&&did=" + $("#did").val();
			alert("删除成功");
		} else {
			alert("取消删除");
		}
	}

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
		<br>
		<h2>项目进度</h2>
		</br>
		<hr />
		<div class="tabContent">
			<div class="serach">
				<form action="develop/zz_guanlijindu.html?did=2" method="post">
					<table cellpadding="0" cellspacing="0" class="searchTable"
						border="0" style="width:80%;">
						<tr>
							
							<input type="hidden" id="did" value="${did}" />
							<td><h3>项目名称：</h3></td>
							<td><input type="search" value="${content}" name="content" class="searchStyle"
								style="width:110px;" /></td>
							<td><h3>完成情况：</h3></td>
							<td><select value="${isfinish}" name="isfinish">
									<option value="">--请选择--</option>
									<option value="0">未完成</option>
									<option value="1">待审核</option>
									<option value="2">已完成</option>
							</select></td>

							<td><h3>负责人：</h3></td>
							<td><input type="search" value="${username}" name="username" class="searchStyle"
								style="width:160px;" /></td>
							<td><input type="submit" value="搜索" class="searchBotton" /></td>
							<td><a href="develop/zz_jindu.html?did=${did}"><input
									type="button" class="Botton" value="发布任务" /></a></td>
						</tr>
					</table>

				</form>
			</div>

			<h1 class="tabTitle">
				项目所处阶段:<span style="color:red">${stageList.stagename}</span>

			</h1>
			<div class="divTable">
				<table cellpadding="0" cellspacing="0" border="1"
					class="selectTable" align="center">
					<tr>
						<th>项目名称</th>
						<th>负责人</th>
						<th>开始时间</th>
						<th>结束时间</th>
						<th>审核时间</th>
						<th>完成情况</th>
						<th>所属阶段</th>
						<th>管理</th>

					</tr>

					<c:forEach items="${guanli}" var="f">
						<tr>
							<td>${f.content}</td>
							<td>${f.username}</td>
							<td><fmt:formatDate value="${f.startime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><fmt:formatDate value="${f.endtime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><fmt:formatDate value="${f.finallytime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>

							<td><c:if test="${(f.isfinish)==0}">未完成</c:if> <c:if
									test="${(f.isfinish)==1}">待审核</c:if> <c:if
									test="${(f.isfinish)==2}">已完成</c:if></td>
							<td>${f.stagename}</td>
							<td><a
								href="develop/zz_editjindu.html?id=${f.id}&&did=${did}"
								class="edit">审核</a>
								<c:if test="${(f.overstruts)==false}">
								 <a onclick="del('${f.id}')" style="color:blue;cursor:pointer" class="delete">删除</a></td>
								</c:if>

						</tr>
					</c:forEach>

				</table>

				<div class="btposition2">
					<div></div>
				</div>
			</div>

		</div>
	</div>
	<div class="mbStyle">&nbsp;</div>

</body>
</html>
