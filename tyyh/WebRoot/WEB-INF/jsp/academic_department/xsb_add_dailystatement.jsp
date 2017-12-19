<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">

<title>添加日报表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta name="viewport"
	content="width=device-width,target-densitydpi=high-dpi,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/index.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/all.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/search.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/formStyle.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/Test.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/popup.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/statics/academic_department/css/add.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/js/globle.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/academic_department/laydate/laydate.js"></script>
<script type="text/javascript">
	function check() {
		var text = document.getElementById("yuxi");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}

	function check1() {
		var text = document.getElementById("benshang");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}

	function checkx() {
		var text = document.getElementById("number2");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}

	function check2() {
		var text = document.getElementById("yxmuber");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}
	function check3() {
		var text = document.getElementById("machine");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}
	function check4() {
		var text = document.getElementById("yuxi1");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}

	function check5() {
		var text = document.getElementById("benshang1");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}
	function check6() {
		var text = document.getElementById("shangji1");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}
	function check7() {
		var text = document.getElementById("kehou1");
		text.onkeyup = function() {
			this.value = this.value.replace(/\D/g, '');
			if (text.value > 100) {
				text.value = 100;
			}
		}
	}

	function blue() {
		var number = $("#number").val();
		$(".number1").attr("value", number);
		 allblue();
	}
	function blue1() {
		var number = $("#number2").val();
		$(".yuxi1").attr("value", number);
		 allblue();
	}
	function blue2() {
		var number = $("#benshang").val();
		$(".benshang1").attr("value", number);
		 allblue();
	}
	function yeal() {
		var num = $("#machine").val();
		$(".machine1").attr("value", num);
		 allblue();
	}
	function allblue(){
		var number2 = $("#number2").val();
		var number = $("#number").val();
		var num = $("#machine").val();
	
		if(number2!="" && number!="" && num!=""){
			$("#sub").attr("disabled", false); 
			$("#sub").css("background-color","#00BB00");
		}
		if(number2=="" || number=="" || num==""){
			$("#sub").attr("disabled", true); 
			$("#sub").css("background-color","#BEBEBE");
		}
	}
	function benshangz(){
		$(".benshang1").attr("value",$("#bszy").val());
	}
	function addDaily() {
		$("#sub").show();
		$("#addDailystatement").html("");
		var studentClassId = $("#selectGrade").val();
		var dateStyle = $(".dateStyle").val();
		$.post("xsb/zy", {
			"studentClassId" : studentClassId,
			"dateStyle" : dateStyle
		}, function(d) {
			if (d == 0) {
				$.ajax({
					type : "post", //请求类型
					url : "getStudentByClassId?studentClassId="
						+ studentClassId, //请求的url
					//data:{pid:studentClassId},//请求参数
					dataType : "json", //ajax接口（请求url）返回的数据类型
					success : function(data) { //data：返回数据（json对象）
						$("#addDailystatement").html("");
						var firstTr = "<tr><th>学号</th><th>姓名</th><th>预习&nbsp;&nbsp;&nbsp;"
							+ "<input type=\"text\" name=\"preparationCount\" id=\"number2\" class=\"textStyle\" oninput=\"checkx()\" onblur=\"blue1();\" placeholder=\"预习题数\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\"></th>"
							+ "<th>本上作业&nbsp;&nbsp;&nbsp;<input type=\"text\" name=\"preparationCount\" id=\"bszy\" class=\"textStyle\" oninput='benshangz()' placeholder=\"预习题数\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\"></th>"
							+ "<th>上机&nbsp;&nbsp;&nbsp;"
							+ "<input type=\"text\"  name=\"obuCount\" id=\"number\" class=\"textStyle\" oninput=\"check2()\" onblur=\"blue();\" placeholder=\"上机题数\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\"></th>"
							+ "<th>课后&nbsp;&nbsp;&nbsp;"
							+ "<input type=\"text\"  name=\"homeworkCount\" id=\"machine\" class=\"textStyle\"  oninput=\"check3()\" onblur=\"yeal();\"placeholder=\"课后题数\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\"></th></tr>";
						var table = "";
						for (var i = 0; i < data.length; i++) {
							table += "<tr><td style=\"width: 200px;\">"
								+ data[i].stu_number
								+ "</td><td style=\"width: 200px;\">"
								+ data[i].stu_name
								+ "</td><td style=\"width: 200px;\"><input type=\"text\" class=\"textStyle yuxi1\" id=\"yuxi1\" oninput=\"check4()\" name=\"preparation\" style=\"width: 200px;border: none;\" placeholder=\"预习情况\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\"></td><td style=\"width: 200px;\"><input type=\"text\" id=\"benshang1\" oninput=\"check5()\" class=\"textStyle benshang1\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\" name=\"manami\" style=\"width: 200px;border: none;\" placeholder=\"完成情况\"></td><td style=\"width: 200px;\"><input type=\"text\" id=\"shangji1\" class=\"textStyle number1\" oninput=\"check6()\" name=\"obu\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\" style=\"width: 200px;border: none;\" placeholder=\"上机练习正确数\"></td><td style=\"width: 200px;\"><input type=\"text\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\" class=\"textStyle machine1\" name=\"homework\" id=\"kehou1\" oninput=\"check7()\" style=\"width: 200px;border: none;\" placeholder=\"课后练习正确数\"></td>"
								+ "<input type=\"hidden\" name=\"studentId\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\" value='"
								+ data[i].stu_Id + "' /></tr>";
						}
						$("#addDailystatement").html(firstTr + table);
					},
					error : function(data) { //当访问时候，404，500 等非200的错误状态码
						alert("加载日报表失败");
					}
				});
			}else{
				$("#sub").hide();
				alert("今日已录入作业，若需修改请跳转到查看作业");
			}
		}, "text")


	}
	$(function() {
	
	
	$("#sub").attr("disabled", true); 
	$("#sub").css("background-color","#BEBEBE");
		addDaily();
	});
</script>

<style type="text/css">
.yulanBotton {
	cursor: pointer;
	background-color: #44bb00;
	width: 70px;
	height: 35px;
	line-height: 35px;
	text-align: center;
	color: #fff;
	font-size: 15px;
	font-weight: bold;
	border: 0px;
	border-radius: 3px;
	margin-right: 20px;
	position: relative;
	left: 89%;
}

.textStyle {
	width: 100px;
}

.fromright {
	position: relative;
	left: 80%;
	top: 50px;
}

.xiala {
	position: relative;
	top: 1px;
	right: 10px;
}
</style>
</head>

<body>
	<div class="rightContent">
		<form action="${pageContext.request.contextPath}/xsb/addDaily"
			method="post">
			<div class="tabContent">

				<from class="fromright"> <select name="classId"
					id="selectGrade" class="xiala" onchange="addDaily()">
					<c:if test="${gradeList != null}">
						<c:forEach var="grade" items="${gradeList}">
							<option
								<c:if test="${grade.id == classId}">selected="selected"</c:if>
								value="${grade.id}">${grade.name}</option>
						</c:forEach>
					</c:if>
				</select> <input type="date" class="dateStyle" style="width:160px;"
					name="createTime" value="${createTime}" onchange="addDaily()" /> </from>
				<div class="serach">
					<table cellpadding="0" cellspacing="0" class="searchTable"
						border="0" style="width:80%;">
						<tr>
							<h2 align="center">学生作业完成情况表</h2>
						</tr>
					</table>

				</div>

				<div class="divTable">
					<center>
						<table cellpadding="0" cellspacing="0" border="1"
							class="selectTable" style="width: 90%;" id="addDailystatement">
						</table>
					</center>
					<div>
						<input type="submit" id="sub" value="保存" class="yulanBotton" />
					</div>




				</div>
			</div>
		</form>
	</div>

</body>
</html>