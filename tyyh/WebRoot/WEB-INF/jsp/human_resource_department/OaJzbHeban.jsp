<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'OaJzbHeban.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cachex">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript">
	$(function() {
		teacherID();
		classTeacherID();
		obtainID();
		motorid();
		specialtyID();
		gradeId();
		stage();

		$("#gradeId").blur(function() {
			yz();
		});
		$("#gradeId2").blur(function() {
			yz();
		});
		$("#name").blur(function() {
			var name = $("#name").val();
			if (name == "") {
				$("#name").css("border", "1px solid red");
			} else {
				$("#name").css("border", "1px solid gray");
			}
		});
		$("#teacherID").blur(function() {
			var teacherID = $("#teacherID").val();
			if (teacherID == 0) {
				$("#teacherID").css("border", "1px solid red");
			} else {
				$("#teacherID").css("border", "1px solid gray");
			}
		});
		$("#classTeacherID").blur(function() {
			var classTeacherID = $("#classTeacherID").val();
			if (classTeacherID == 0) {
				$("#classTeacherID").css("border", "1px solid red");
			} else {
				$("#classTeacherID").css("border", "1px solid gray");
			}
		});
		$("#obtainID").blur(function() {
			var obtainID = $("#obtainID").val();
			if (obtainID == 0) {
				$("#obtainID").css("border", "1px solid red");
			} else {
				$("#obtainID").css("border", "1px solid gray");
			}
		});
		$("#motorid").blur(function() {
			var motorid = $("#motorid").val();
			if (motorid == 0) {
				$("#motorid").css("border", "1px solid red");
			} else {
				$("#motorid").css("border", "1px solid gray");
			}
		});
		$("#specialtyID").blur(function() {
			var specialtyID = $("#specialtyID").val();
			if (specialtyID == 0) {
				$("#specialtyID").css("border", "1px solid red");
			} else {
				$("#specialtyID").css("border", "1px solid gray");
			}
		});
		$("#stage").blur(function() {
			var stage = $("#stage").val();
			if (stage == 0) {
				$("#stage").css("border", "1px solid red");
			} else {
				$("#stage").css("border", "1px solid gray");
			}
		});
		$("#createTime").blur(function() {
			var createTime = $("#createTime").val();
			if (createTime == 0) {
				$("#createTime").css("border", "1px solid red");
			} else {
				$("#createTime").css("border", "1px solid gray");
			}
		});

		$("#btn").click(function() {
			var gradeId = $("#gradeId").val();
			var gradeId2 = $("#gradeId2").val();
			var name = $("#name").val();
			var teacherID = $("#teacherID").val();
			var classTeacherID = $("#classTeacherID").val();
			var obtainID = $("#obtainID").val();
			var motorid = $("#motorid").val();
			var specialtyID = $("#specialtyID").val();
			var createTime = $("#createTime").val();
			var stage = $("#stage").val();
			$("input[type=text]").css("border", "1px solid gray");
			$("select").css("border", "1px solid gray");
			$("input[type=date]").css("border", "1px solid gray");
			if (gradeId == 0) {
				$("#gradeId").css("border", "1px solid red");
			}
			if (gradeId2 == 0) {
				$("#gradeId2").css("border", "1px solid red");
			}
			if (name == "") {
				$("#name").css("border", "1px solid red");
			}
			if (teacherID == 0) {
				$("#teacherID").css("border", "1px solid red");
			}
			if (classTeacherID == 0) {
				$("#classTeacherID").css("border", "1px solid red");
			}
			if (obtainID == 0) {
				$("#obtainID").css("border", "1px solid red");
			}
			if (specialtyID == 0) {
				$("#specialtyID").css("border", "1px solid red");
			}
			if (createTime == "") {
				$("#createTime").css("border", "1px solid red");
			}
			if (motorid == 0) {
				$("#motorid").css("border", "1px solid red");
			}
			if (stage == 0) {
				$("#stage").css("border", "1px solid red");
			}
			if (gradeId != 0 && gradeId2 != 0 && name != "" && teacherID != 0 && classTeacherID != 0 && obtainID != 0 && specialtyID != 0 && createTime != "" && motorid != 0) {
				$.post("oajzb/ins", {
					"stage" : stage,
					"gradeId" : gradeId,
					"gradeId2" : gradeId2,
					"name" : name,
					"teacherID" : teacherID,
					"classTeacherID" : classTeacherID,
					"obtainID" : obtainID,
					"motorid" : motorid,
					"specialtyID" : specialtyID,
					"createTime" : createTime
				}, function(data) {
					if (data == "true") {
						alert("合班成功！");
						NewPage('toJzbStudent');
					} else {
						alert("合班失败！");
					}
				}, "text");
			}

		});
	});

	function yz() {
		var id = $("#gradeId").val();
		var id2 = $("#gradeId2").val();
		if (id != "0" && id2 != "0") {
			if (id == id2) {
				$("#gradeId").css("border", "1px solid red");
				$("#gradeId2").css("border", "1px solid red");
			//$("#p").html("班级不可以相同！");
			} else {
				$("#gradeId").css("border", "1px solid gray");
				$("#gradeId2").css("border", "1px solid gray");
			//$("#p").html("");
			}
		} else {
			$("#gradeId").css("border", "1px solid gray");
			$("#gradeId2").css("border", "1px solid gray");
		}
	}
	;

	/*绑定教员*/
	function teacherID() {
		$.post("oajzb/teacherID", function(dt) {
			$da = $(dt);
			$da.each(function() {
				$("#teacherID").append("<option value='" + this.emp_id + "'>--" + this.emp_name + "--</option>")
			});
		}, "json");
	}
	;

	/*绑定班主任*/
	function classTeacherID() {
		$.post("oajzb/classTeacherID", function(dt) {
			$da = $(dt);
			$da.each(function() {
				$("#classTeacherID").append("<option value='" + this.emp_id + "'>--" + this.emp_name + "--</option>")
			});
		}, "json");
	}
	;

	/*绑定就业老师*/
	function obtainID() {
		$.post("oajzb/obtainID", function(dt) {
			$da = $(dt);
			$da.each(function() {
				$("#obtainID").append("<option value='" + this.emp_id + "'>--" + this.emp_name + "--</option>")
			});
		}, "json");
	}
	;

	/*绑定可用机房*/
	function motorid() {
		$.post("oajzb/motorid", function(dt) {
			$da = $(dt);
			$da.each(function() {
				$("#motorid").append("<option value='" + this.id + "'>--" + this.name + "--</option>")
			});
		}, "json");
	}
	;

	/*绑定班级类型*/
	function specialtyID() {
		$.post("oajzb/specialtyID", function(dt) {
			$da = $(dt);
			$da.each(function() {
				$("#specialtyID").append("<option value='" + this.specialty_Id + "'>--" + this.specialty_name + "--</option>")
			});
		}, "json");
	}
	;

	/*绑定班级*/
	function gradeId() {
		$.post("oajzb/gradeId", function(dt) {
			$da = $(dt);
			$da.each(function() {
				$("#gradeId").append("<option value='" + this.id + "'>--" + this.name + "--</option>")
				$("#gradeId2").append("<option value='" + this.id + "'>--" + this.name + "--</option>")
			});
		}, "json");
	}
	;

	/*绑定所有阶段*/
	function stage() {
		$.post("oajzb/stage", function(dt) {
			$da = $(dt);
			$da.each(function() {
				$("#stage").append("<option value='" + this.id + "'>--" + this.stage + "--</option>")
			});
		}, "json");
	}
	;
</script>
<style type="text/css">
select {
	width: 150px;
	height: 30px;
	border: 1px solid black;
	border-radius: 5px;
}

input[type=text] {
	width: 150px;
	height: 30px;
	border: 1px solid black;
	border-radius: 5px;
}

input[type=date] {
	border: 1px solid black;
	border-radius: 5px;
	width: 150px;
	height: 30px;
}

tr {
	line-height: 60px;
}

#btn {
	cursor: pointer;
	background-color: #44bb00;
	width: 65px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	color: #fff;
	font-size: 12px;
	font-weight: bold;
	border: 0px;
	border-radius: 3px;
	margin-right: 20px;
}

.title {
	font-size: 14px;
	color: #333333;
	text-indent: 2pt;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #E5E5E5;
}
</style>
</head>

<body>
	<h1 class="title">合并班级</h1>
	<div style="margin: 0 auto; width: 1000px; margin-top: 50px;">
		<form action="" method="post" id="new">
			<table style=" width: 1000px;">
				<tr>
					<td>班级名称：</td>
					<td><input type="text" name="name" id="name" /></td>
					<td rowspan="8" width="450px;">
						<h3 style="text-align: center;margin-top: -190px;">合并班级</h3>
						<p style="margin-left: 105px;">
							班级一： <select id="gradeId" name="gradeId">
								<option value="0" selected="selected">--请选择--</option>
							</select>
						</p>
						<p style="margin-left: 105px;">
							班级二： <select id="gradeId2" name="gradeId2">
								<option value="0" selected="selected">--请选择--</option>
							</select>
						</p>
						<p style="color: red;" id="p"></p>
					</td>
				</tr>
				<tr>
					<td>教员：</td>
					<td><select id="teacherID" name="teacherID">
							<option value="0" selected="selected">--请选择--</option>
					</select></td>
				</tr>
				<tr>
					<td>班主任：</td>
					<td><select id="classTeacherID" name="classTeacherID">
							<option value="0" selected="selected">--请选择--</option>
					</select></td>
				</tr>
				<tr>
					<td>就业老师 ：</td>
					<td><select id="obtainID" name="obtainID">
							<option value="0" selected="selected">--请选择--</option>
					</select></td>
				</tr>
				<tr>
					<td>可用机房：</td>
					<td><select id="motorid" name="motorid">
							<option value="0" selected="selected">--请选择--</option>
					</select></td>
				</tr>
				<tr>
					<td>班级类型：</td>
					<td><select id="specialtyID" name="specialtyID">
							<option value="0" selected="selected">--请选择--</option>
					</select></td>
				</tr>
				<tr>
					<td>班级阶段：</td>
					<td><select id="stage" name="stage">
							<option value="0" selected="selected">--请选择--</option>
					</select></td>
				</tr>
				<tr>
					<td>开班时间：</td>
					<td><input type="date" name="createTime" id="createTime" /></td>
				</tr>
				<tr>
					<td colspan="3" style="text-align: center;"><input
						type="button" value="合并" id="btn" /></td>
				</tr>
			</table>