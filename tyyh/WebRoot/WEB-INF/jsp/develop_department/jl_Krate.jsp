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
<style type="text/css">
.yuan {
	margin-left: 27px;
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: #3CF;
	text-align: center;
	color: #FFF;
	font-size: 22px;
}

.serach td {
	text-align: center;
	width: 20px;
	height: auto;
}
</style>
<script type="text/javascript"
	src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="statics/develop_department/js/globle.js"></script>
<script type="text/javascript"
	src="statics/develop_department/laydate/laydate.js"></script>
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

	function showdanji(eid) {

		$.ajax({
			type : "get",//请求类型
			url : "develop/showlistbysid?eid=" + eid + "&&groupid="
					+ $("#gid").val(),//请求的url
			dataType : "json",//ajax接口（请求url）返回的数据类型

			success : showlistbysid,
			error : function(data) {//当访问时候，404，500 等非200的错误状态码
				alert(data);
			}
		});

	}

	function showlistbysid(data) {
		if (data != null) {
			$("#table2").empty();
			$("#table2")
					.append(
							"<tr><th>项目名称</th><th>负责人</th><th>开始时间</th><th>结束时间</th><th>实际完成时间</th><th>完成情况</th></tr>");
			var isfinish = null;

			for ( var i = 0; i < data.length; i++) {
				if (data[i].isfinish == 0) {
					isfinish = "未完成";
				} else if (data[i].isfinish == 1) {
					isfinish = "待审核";
				} else if (data[i].isfinish == 2) {
					isfinish = "已完成";
				}
				$("#table2").append(
						"<tr><td>" + data[i].content + "</td><td>"
								+ data[i].username + "</td><td>"
								+ data[i].startime + "</td><td>"
								+ data[i].endtime + "</td><td>"
								+ data[i].finallytime + "</td><td>" + isfinish
								+ "</td></tr>");
			}
		} else {
			alert("暂无任务！");
		}

	}

	function showpro() {
		$.ajax({
			type : "get",//请求类型
			url : "develop/showprolist",//请求的url
			dataType : "json",//ajax接口（请求url）返回的数据类型

			success : showliststage,
			error : function(data) {//当访问时候，404，500 等非200的错误状态码
				alert("加载信息失败！");
			}
		});

	}
	function showliststage(data) {

		$("#tr1").empty();

		for ( var i = 0; i < data.length; i += 2) {
			$("#tr1").append(
					"<td><h4>" + data[i].stagename + "</h4></td><td></td>");
		}

		$("#tr4").empty();
		for ( var i = 1; i < data.length; i += 2) {
			$("#tr4").append(
					"<td></td><td><h4>" + data[i].stagename + "</h4></td>");
		}
		$("#tr2").empty();
		for ( var i = 0; i < data.length; i += 2) {
			$("#tr2").append(
					"<td><a href='javascript:onclick=showdanji(" + data[i].id
							+ ")'><div class='yuan'>" + data[i].id
							+ "</div></a></td><td></td>");
		}

		$("#tr3").empty();
		for ( var i = 1; i < data.length; i += 2) {
			$("#tr3").append(
					"<td></td><td><a href='javascript:onclick=showdanji("
							+ data[i].id + ")'><div class='yuan'>" + data[i].id
							+ "</div></a></td>");
		}

	}

	$(function() {
		$(".Botton").click(function() {
			location.href = "jindu.html";

		});
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

	});

	showpro();
</script>
</head>
<body>
	<div class="rightContent">
		<h3>
			所处阶段：
			<c:if test="${(jieduanlist)==null}">
				<span style="color:orange;">
				暂无</span>
			</c:if>
		<span style="color:orange;">
				${jieduanlist.stagename}</span>
		</h3>
		<input type="hidden" id="gid" value="${grouid}">
		<div class="tabContent">
			<div class="serach">
				<table cellpadding="0" id="table1" cellspacing="0"
					class="searchTable" border="0" style="width:100%;">
					<tr id="tr1">

					</tr>
					<tr id="tr2">

					</tr>
					<tr id="tr3">

					</tr>
					<tr id="tr4">

					</tr>
				</table>
			</div>

			<h1 class="tabTitle">
				<span style="color:red">${group.groupname} </span>任务列表
			</h1>
			<div class="divTable">
				<table cellpadding="0" cellspacing="0" border="0"
					class="selectTable" id="table2">


				</table>
				<div class="btposition2"></div>
			</div>
			<a href="develop/jl_xmjd.html"> <input type="button" value="返回"
				style="background-color:#0F0; width:65px;height:35px; color:#FFF">
			</a>
		</div>
	</div>
	<div class="mbStyle">&nbsp;</div>

</body>
</html>
