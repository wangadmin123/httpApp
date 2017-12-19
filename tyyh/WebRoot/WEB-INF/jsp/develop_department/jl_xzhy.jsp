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
<title>会议纪要管理</title>
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
	<script type="text/javascript" src="statics/develop_department/js/index.js"></script>
<script type="text/javascript">
	$(function() {
	
	$("#btn_s").click(function(){
	var params=decodeURIComponent($("#xzhy_form").serialize(),true);
	
	});
		
		/*点击删除*/
		$(".delete").click(function() {
			$(".mbStyle").css("display", "block");
			$(".deleteStyle").css("display", "block");
		});
		/*点击添加*/
		$(".addBotton").click(function() {

			location.href = "ch.html";
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
		ifAllChecked(); //页面加载完后运行

	});
	/*表格全选结束*/
</script>
</head>

<body>
	<div class="rightContent">
		<br />
		<h2>小组会议管理</h2>
		<br />
		<hr />
		<br />
		<div class="tabContent">
			<div class="serach">
				<form action="${pageContext.request.contextPath}/develop/jl_xzhy.html" method="post" id="xzhy_form">
					<table cellpadding="0" cellspacing="0" class="searchTable"
						border="0" style="width:50%;">
						<tr>
							
							<td><h3>小组名称：</h3></td>
							<td><select name="groupid" id="groupid" class="searchStyle" style="width:160px;">
									<option value="">--请选择--</option>
									<c:forEach var="g" items="${groupList}">
										<option value="${g.id}">${g.groupname}</option>
									</c:forEach>

							</select></td>
							<td><input type="submit" value="搜索" class="searchBotton" /></td>
							<td>
							<input type="button" value="历史" class="searchBotton"
								onclick="NewPage('develop/jl_history_hy.html')"/></td>
						</tr>

					</table>
				</form>
			</div>

			<h1 class="tabTitle">会议信息</h1>
			<div class="divTable">
				<table cellpadding="0" cellspacing="0" border="0"
					class="selectTable">
					<tr>

						<th>组名</th>
						<th>记录人</th>
						<th>会议类型</th>
						<th>会议日期</th>
						<th>会议纪要</th>
					</tr>
					<c:forEach items="${mList}" var="metting">
						<tr>

							<td>${metting.groupname }</td>
							<td>${metting.stu_name}</td>
							<td>${(metting.type)==1?"晨会":"下班会" }</td>
							<td><fmt:formatDate value="${metting.starttime }"
									pattern="yyyy-MM-dd " /></td>
							<td><textarea class="areaStyle" name="content"
								cols="20" rows="5" readonly	style="resize:none">${metting.content }</textarea></td>

						</tr>
					</c:forEach>


				</table>
			</div>

		</div>
	</div>
	
</body>

</html>