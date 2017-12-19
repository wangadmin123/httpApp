<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>查询离岗信息</title>
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
<style type="text/css">
	.deleteStyle{
		position: absolute;
		top:200px;
		left: 580px;
	}
</style>
<script type="text/javascript">
	$(function() {
		/* 加载函数 */
		SelectAllInfo();
		SelectAllDepartment();
		SelectAllLeaveType();
			/* 查询离岗信息 */
	function clearCondition() {
		document.forms[0].reset();
	}
	/* 清空查询条件 */
	$("#clearCondition").click(function() {
		clearCondition();
	});
	});

	/* AJAX异步实现分页内容 */
	function pageNav(frm, num) {
		frm.pageIndex.value = num;
		frm.searchLeave.click();
	};

function SelectAllDepartment() {
		$.post("Leave/addDepartment",showDepartmentList, "text");
	}
	function showDepartmentList(data) {
$("#depart_id").html(data);
}




function SelectAllLeaveType() {
		$.post("Leave/addLeaveType",showLeaveTypeList, "text");
	}
	function showLeaveTypeList(data) {
$("#leave_type").html(data);
}




	/* 查询所有页面 */
	function SelectAllInfo() {
		var condition = $("#searchCondition").serialize();
		$.post("Leave/SelectAllInfo", condition, showLeaveList, "json");
	}
	    var leave_id=null;
        var emp_id = null;
        var leave_type = null;
	function showLeaveList(data) {
     /*    alert(data); */
		var result1 = data.result[0];
		var result2 = data.result[1];
		$(".divTable").html(result1);
		$("#result").val(result2);
		/* 点击添加，跳转到添加页面 */
		$("#addInfo").click(function() {
			NewPage("skiptopage/topage/requestleave_add");
		});

		$(".deleteBotton").click(function() {
			$(".deleteStyle").css("display", "block");
		});
		/*确定删除*/
		$(".bottomStyle1").click(function() {
			$(".deleteStyle").css("display", "none");
		    $.post("Leave/deleteOaRlzybLeave/"+leave_id+"/"+emp_id+"/"+leave_type+"",showResult, "text");
		});
		function showResult(data){
		if(data=="1"){
		$("#searchLeave").click();
		}else{
		alert("删除离岗记录失败！");
		}
		}
		/*删除取消*/
		$(".bottomStyle2").click(function() {
			$(".deleteStyle").css("display", "none");
		});
    
		/* 点击删除信息 */
		$(".delete").click(function() {
			 leave_id = $(this).attr("leave_id");
		/* 	 alert(leave_id); */
			 	 emp_id = $(this).attr("emp_id");
			 /* 	 alert(emp_id); */
			 	 leave_type = $(this).attr("leave_type");
			 	 /* alert(leave_type); */
			$(".deleteStyle").css("display", "block");
		});
		/* 点击添加跳转到查看页面 */
		$(".link").click(function() {
			 leave_id = $(this).attr("leave_id");
			/* alert(leave_id); */
			NewPage("Leave/selectAllByleave_id/" + leave_id + "");
		});
			/* 员工复职操作 */
		$(".edit").click(function() {
		$(this).parent().hide();
		$(this).parent().next().show();
		});
	}
	function checkEmployeeGoBack(checkButton){
	var leave_backTime = $(checkButton).prev().val();
/* 	alert(leave_backTime); */
	 leave_id = $(checkButton).attr("leave_id");
	 emp_id = $(checkButton).attr("emp_id");
	 leave_type = $(checkButton).attr("leave_type");
/* 	alert(leave_id); */
    $.post("Leave/checkEmployeeGoBack",{"leave_backTime":leave_backTime,"leave_id":leave_id,"emp_id":emp_id,"leave_type":leave_type},showResult1, "text");
	function showResult1(data) {
			if(data=="1"){
			$(checkButton).parent().prev().show();
			$(checkButton).parent().hide();
		$("#searchLeave").click();
		}else{
		alert("复职记录添加失败！");
		}
	}
	}
	
</script>

<style>
/*  *{ border:solid black 1px }*/
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
							<td style="width: 70px;">申请人：&nbsp;<input type="search" value="" name="leave_approver" class="searchStyle" style="width:100px;">
							&nbsp;&nbsp;&nbsp;部门：&nbsp;<select class="selectStyle" name="depart_id"   id="depart_id" style="width:100px;">
									<option value="0">请选择</option>
									</select>
									&nbsp;&nbsp;&nbsp;类型：&nbsp;<select class="selectStyle" name="leave_type" id="leave_type"
								style="width:100px;"><option value="0"
										>请选择</option>
								</select>
								&nbsp;&nbsp;&nbsp;起始时间&nbsp;<input type="date" value="" name="leave_startDate"
								class="dateStyle" style="width:130px;" />
							&nbsp;&nbsp;&nbsp;截止时间：&nbsp;<input type="date" value="" name="leave_endDate"
								class="dateStyle" style="width:130px;" /></td>
						</tr>
						<tr>
							<td class="tdWidth" id="resultCount">
							<input type="button" value="搜索" class="searchBotton" name="searchLeave" id="searchLeave" onclick="SelectAllInfo()">
							&nbsp;<input type="button" style="width: 120px;" value="清空搜索条件" class="searchBotton" id="clearCondition" >
							结果数：<input type="text" id="result" class="textStyle" style="width:40px;" disabled="disabled">人</td>
						</tr>
					</table>
					<input type="hidden" name="pageIndex" value="1" />
				</div>
				
			</form>
			    <h1 class="tabTitle">离岗信息</h1>
		</div>
		<div class="divTable"></div>
	</div>
</body>
</html>

