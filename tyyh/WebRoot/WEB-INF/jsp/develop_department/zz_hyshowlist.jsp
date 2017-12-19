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
<title>会议纪要列表</title>
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
		$(".delete").click(function() {
			$(".mbStyle").css("display", "block");
			$(".deleteStyle").css("display", "block");

		});

		/*点击添加会议记录*/
		$(".addBotton").click(function() {
			location.href = "develop/zz_addhyshowlist.html?uid="+${uid};
		});
		/*确定删除*/
		$(".bottomStyle1").click(function() {
			$(".mbStyle").css("display", "none");
			$(".deleteStyle").css("display", "none");
			alert('你点击了确定')
			location.href = "develop/zz_deletehyshowlist.html";
		});
		/*删除取消*/
		$(".bottomStyle2").click(function() {
			$(".mbStyle").css("display", "none");
			$(".deleteStyle").css("display", "none");
			alert('你点击了取消')
		});
	});
	/* 修改会议记录 */
	$(function() {
		$(".edit").click(function() {
			/* location.href = "develop/zz_edithyshowlist.html?id=${met.id}"; */

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
		<br>
		<h2>会议记录</h2>
		</br>
		<hr />
		<div class="tabContent">
			<div class="serach">
			<form action="develop/zz_hyshowlist.html?uid=${uid }" method="post">
				<table cellpadding="0" cellspacing="0" name="" class="searchTable"
					border="0" style="width:50%;">
					<tr>
                    <%-- <td><fmt:formatDate value="${project.startime}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td> --%>

						<td><h3>开会日期：</h3></td>
						<td><input type="date" class="dateStyle" name="starttime"
							style="width:160px;" /></td>
						<td><input type="submit" value="搜索" class="searchBotton" /></td>
						<td><input type="button" class="addBotton" value="新增" /></td>

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
						
						<th>管理</th>
					</tr>
	
                   <c:forEach items="${mettingList}" var="m">
					<tr>

						<td>${m.groupname }</td>
						<td>${m.stu_name }</td>
						<td>${(m.type)==1?"晨会":"下班会" }</td>
						<td><fmt:formatDate value="${m.starttime }"
										pattern="yyyy-MM-dd " /></td>
						
						<td><textarea class="areaStyle" name="content" style="width:360px;">${m.content }</textarea>
						</td>
						<td><a href="develop/zz_edithyshowlist.html?id=${m.id } &&uid=${uid}"
									class="modifyVersion" data-toggle="tooltip"
									data-placement="top" title="" data-original-title="编辑">编辑</a>
						</td>
							<!-- <td><input type="button" class="edit" value="编辑" /></td> -->
							<!-- <td><input type="button" class="delete" value="删除" /></td> -->
					</tr>
                </c:forEach>

				</table>
				
				
			
			</div>

		</div>
	</div>
	<div class="mbStyle">&nbsp;</div>
	
</body>

</html>