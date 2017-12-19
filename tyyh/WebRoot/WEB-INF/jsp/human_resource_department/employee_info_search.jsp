<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>查询员工基本信息</title>
<link rel="stylesheet" type="text/css"
	href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/search.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css" />
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>
<!-- <script  type="text/javascript"   src="statics/human_resource_department/js/rollpage.js"></script> -->
<style type="text/css">
.deleteStyle {
	position: absolute;
	top: 200px;
	left: 580px;
}
</style>
<script type="text/javascript">
	$(function() {
		deleteInformationBugOaRlzybEmployee();
		searchEmployee();
	});

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






	/* 查询员工 */
	function clearCondition() {
		document.forms[0].reset();
	}
	function page_nav(frm, num) {
		frm.pageIndex.value = num;
		frm.searchEmployee.click();
	}
	var del_emp_id;
	function searchEmployee() {
		var condition = $("#searchCondition").serialize();
		/* alert(condition); */
		$.post("Employee/SearchEmployee", condition, showEmployeeList, "json");
	}
	function showEmployeeList(data) {
		var result1 = data.result[0];
		var result2 = data.result[1];
		$(".divTable").html(result1);
		$("#result").val(result2);



		$("#searchEmployee").click(function() {
			searchEmployee();
		});
		$("#addEmployee").click(function() {
			NewPage("skiptopage/topage/employee_info_add");
		});
		$("#emp_status2").change(function() {
			searchEmployee();
		});
		/*点击访谈跳转到添加访谈页面*/
		$(".interview").click(function() {
			var emp_id = $(this).attr("emp_id");
			NewPage("Employee/interview_add/" + emp_id);
		});
		/*点击调岗跳转到添加调岗页面*/
		$(".job").click(function() {
			var emp_id = $(this).attr("emp_id");
			NewPage("transfer_position_add.html/" + emp_id);
		});
		/*点击离职跳转到添加离职页面*/
		$(".position").click(function() {
			var emp_id = $(this).attr("emp_id");
			/* alert(emp_id); */
			NewPage("Employee/dimission_add/" + emp_id);
		});
		/*点击调薪跳转到添加调薪页面*/
		$(".salary").click(function() {
			var emp_id = $(this).attr("emp_id");
			NewPage("Employee/addEmployee/" + emp_id);
		});
		/*点击奖惩跳转到添加奖惩页面*/
		$(".randp").click(function() {
			var emp_id = $(this).attr("emp_id");
			NewPage("Employee/Randp_add/" + emp_id);
		});
		/*点击离岗跳转到添加离岗页面*/
		$(".transfer").click(function() {
			var emp_id = $(this).attr("emp_id");
			NewPage("Employee/requestleaveEmployee/" + emp_id);
		});

		/* 点击添加跳转到编辑页面 */
		$(".edit").click(function() {
			var emp_id = $(this).attr("emp_id");
			/* alert(emp_id); */
			NewPage("Employee/EditEmployee/" + emp_id);
		});
		/* 点击添加跳转到查看页面 */
		$(".link").click(function() {
			var emp_id = $(this).attr("emp_id");
			/* alert(emp_id); */
			NewPage("Employee/ShowEmployee/" + emp_id);
		});
		/* 点击删除执行的操作 */
		$(".delete").click(function() {
			del_emp_id = $(this).attr("emp_id");
			/* alert(emp_id); */
			$(".deleteStyle").css("display", "block");
		});
		/*确定删除*/
		$(".bottomStyle1").click(function() {
			$(".deleteStyle").css("display", "none");
			$.post("Employee/DeleteEmployee/" + del_emp_id + "", showResult, "text");
		/* 	alert(del_emp_id); */
		});
		function showResult(data) {
			if (data == '1') {
				$("#searchEmployee").click();
			} else {
			}
		}
		/*删除取消*/
		$(".bottomStyle2").click(function() {
			$(".deleteStyle").css("display", "none");
		/* 	alert(del_emp_id); */
		});
		/* 	清空搜索条件 */
		$("#clearCondition").click(function() {
			clearCondition();
		});
	}
</script>


<style> /* *{border: black 1px solid}  */
</style>
</head>
<body>
	<div class="rightContent">
		<div class="tabContent">
			<form method="post" id="searchCondition">
				<div class="serach">
					<table cellpadding="0" cellspacing="0" class="searchTable"
						border="0" style="width:100%;">
						<tr>
							<td>姓名：<input type="text" class="textStyle" value=""
								name="emp_name" style="width:100px;" /></td>
							<td>性别：<input type="radio" name="emp_sex" value="全部"
								checked="checked" />全部&nbsp; <input type="radio" name="emp_sex"
								value="男" />男&nbsp; <input type="radio" name="emp_sex"
								value="女" />女
							</td>

							<td>入职时间开始于：<input type="date" value="" min="1" max="100"
								name="emp_age_begin" class="textStyle" style="width:150px;"></td>

							<td>入职时间终止于：<input type="date" min="1" max="100"
								name="emp_age_end" value="" class="textStyle"
								style="width:150px;"></td>
							<td>员工级别：<select class="selectStyle" name="emp_grade_id"
								style="width:100px;"><option value="0"
										selected="selected">请选择</option>
									<option value="1">一级</option>
									<option value="2">二级</option>
									<option value="3">三级</option>
									<option value="4">四级</option></select></td>
							<td style="width: 120px;"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td colspan="5">结果包含员工类型:&nbsp;&nbsp;<input type="radio"
								class="checkedStyle" value="在职" checked="checked" name="emp_status2" id="emp_status2" onchange="searchEmployee()">在职
								<input type="radio" onchange="searchEmployee()" value="离职"
								name="emp_status2" id="emp_status2" class="checkedStyle">离职&nbsp;<input
								type="radio" onchange="searchEmployee()" value="停薪留职"
								name="emp_status2" id="emp_status2" class="checkedStyle">停薪留职&nbsp;
							</td>
						</tr>
						<tr>
							<td colspan="3"><input type="button" value="搜索"
								class="searchBotton" name="searchEmployee" id="searchEmployee"
								onclick="searchEmployee()" />&nbsp;&nbsp;<input
								type="button" value="添加" class="searchBotton" id="addEmployee"
								onclick="NewPage('skiptopage/topage/employee_info_add')">&nbsp;&nbsp;<input
								type="button" style="width:120px" value="清空搜索条件"
								class="searchBotton" id="clearCondition"
								onclick="clearCondition()"></td>
							<td colspan="2"></td>
							<td id="resultCount"></td>
							<td><input type="number" min="1" max="31"
								name="birthday_day" value="" class="textStyle"
								style="width:100px;display:none;"></td>
							<td><input type="number" min="1" max="12"
								name="birthday_month" value="" class="textStyle"
								style="width:100px;display:none;"></td>
							<td><input type="number" value="" name="birthday_year"
								class="textStyle" style="width:100px;display:none;"></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<input type="hidden" name="pageIndex" value="1" />
				</div>
			</form>
			<h1 class="tabTitle">员工信息</h1>
		</div>
		<div class="divTable"></div>

	</div>

</body>
</html>
