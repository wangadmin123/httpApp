<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<title>请假列表模板</title>
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/search.css" />
		<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css" />
		<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
		<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
		<script type="text/javascript" src="statics/develop_department/js/index.js"></script>
		<script type="text/javascript" src="statics/develop_department/laydate/laydate.js"></script>
		<script type="text/javascript">
			$(function() {
				/*点击删除*/
				$(".deleteBotton").click(function() {
					$(".mbStyle").css("display", "block");
					$(".deleteStyle").css("display", "block");
				});
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
				
				
				
				$("#leave").click(function(){
				
					location.href="develop/zz_leaveygadd.html?uid="+${user.id};
					//NewPage("develop/leaveygadd.html");
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
						if($(dom).is(":checked")) k++;
					});
					if(k == sum) {
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
<h2>组长请假管理</h2>
</br>
<hr/>
			<div class="tabContent">
				<div class="serach">
				<form action="develop/zz_leavelist.html" method="post">
					<table cellpadding="0" cellspacing="0" class="searchTable" border="0" style="width:50%;">
						<tr>
							
							<td><h3>姓名：</h3></td>
							<td><input type="search" class="searchStyle" style="width:160px;" name="stuname" /></td>
							<td><input type="submit" value="搜索" class="searchBotton" /></td>
                            <td><input type="button" value="添加" class="searchBotton" id="leave"></td>

						</tr>

					</table>
					</form>
				
				</div>

				<h1 class="tabTitle">基本信息</h1>
				<div class="divTable">
					<table cellpadding="0" cellspacing="0" border="0" class="selectTable">
						<tr>
							<th>学号</th>
							<th>姓名</th>
							<th>职位</th>
							<th>开始时间</th>
							<th>结束时间</th>
                            <th>请假天数</th>
							<th>联系方式</th>
							<th>类型</th>
							<th>管理</th>
						</tr>
						
						<c:forEach items="${zzqingjia}" var="f">
						<tr>
							<td>${f.user_id}</td>
							<td>${f.stuname}</td>
							<td>${f.jobname} </td>
							<td><fmt:formatDate value="${f.startime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><fmt:formatDate value="${f.endtime}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>${f.days}</td>
							<td>${f.phone}</td>
							<td>${(f.type)== 1 ? "事假" : "病假" }</td>
							<td> <a href="develop/Qxiangqing.html?id=${f.id}"
								class="select" type="button">详情</a></td>

						</tr>
						</c:forEach>
					
					</table>
	
				
				</div>

			</div>
		</div>
		<div class="mbStyle">&nbsp;</div>	
	</body>

</html>