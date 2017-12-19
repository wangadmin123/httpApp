<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">

<title>添加周考表</title>

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
<script type="text/javascript">
	function check(js) {
			if($(js).val()<0){
				$(js).val(0);
			}
			if($(js).val()>$("#jishiz").val()){
				$(js).val($("#jishiz").val());
			}
	}

	function check1(bs) {
		if($(bs).val()<0){
				$(bs).val(0);
			}
			if($(bs).val()>$("#bishiz").val()){
				$(bs).val($("#bishiz").val());
			}
	}

	function addWeek() {
		var studentClassId = $("#selectGrade").val();
		$
				.ajax({
					type : "post",//请求类型
					url : "getStudentByClassId?studentClassId="
							+ studentClassId,//请求的url
					//data:{pid:studentClassId},//请求参数
					dataType : "json",//ajax接口（请求url）返回的数据类型
					success : function(data) {//data：返回数据（json对象）
						$("#addDailystatement").html("");
						var firstTr = "<tr><th>学号</th><th>姓名</th><th>机试&nbsp;&nbsp;<input type='number' min='0' style='width:100px;' id='jishiz' oninput='jstongyi(this)' ></th>"
								+ "<th>笔试&nbsp;&nbsp;<input type='number' min='0' style='width:100px;' id='bishiz' oninput='bstongyi(this)' ></th>";
						var table = "";
						for ( var i = 0; i < data.length; i++) {
							table += "<tr><td style=\"width: 200px;\">"
									+ data[i].stu_number
									+ "</td><td style=\"width: 200px;\">"
									+ data[i].stu_name
									+ "</td><td style=\"width: 200px;\"><input type=\"number\" id=\"jishi\" min='0' oninput=\"check(this)\" class=\"textStyle\" name=\"written\"  onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\" style=\"width: 200px;border: none;\"></td><td style=\"width: 200px;\"><input type=\"number\" id=\"bishi\" oninput=\"check1(this)\" class=\"textStyle\" name=\"scjd\" style=\"width: 200px;border: none;\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\">"
									+ "<input type=\"hidden\" onkeyup=\"this.value=this.value.replace(/[^0-9-]+/,'');\" name=\"studentId\" value='"
									+ data[i].stu_Id + "' /></tr>";

						}
						$("#addDailystatement").html(firstTr + table);
					},
					error : function(data) {//当访问时候，404，500 等非200的错误状态码
						alert("加载周考表失败");
					}
				});
	}
	$(function() {
		addWeek();
		$("input#jishi").attr("max",$("#jishiz").val());
	});
	function jstongyi(chenji){
		if($(chenji).val()<0){
		$(chenji).val(0);
		}
		$("input#jishi").val($(chenji).val());
		$("input#jishi").attr("max",$(chenji).val());
	}
	function bstongyi(chenji){
	if($(chenji).val()<0){
		$(chenji).val(0);
		}
		$("input#bishi").val($(chenji).val());
		$("input#bishi").attr("max",$(chenji).val());
	}
</script>

</head>

<body>
	<div class="rightContent">
		<form method="post"
			action="${pageContext.request.contextPath}/xsb/insterWeektestList">
			<div class="tabContent">
				<from class="fromright"> <select name="classId"
					id="selectGrade" class="xiala" onchange="addWeek()">
					<c:if test="${gradeList != null}">
						<c:forEach var="grade" items="${gradeList}">
							<option
								<c:if test="${grade.id == classId}">selected="selected"</c:if>
								value="${grade.id}">${grade.name}</option>
						</c:forEach>
					</c:if>
				</select> <input type="date" class="dateStyle" style="width:160px;"
					name="createTime" value="${createTime}" /> </from>
				<div class="serach">
					<table cellpadding="0" cellspacing="0" class="searchTable"
						border="0" style="width:80%;">
						<tr>
							<h2 align="center">周考录入情况</h2>
						</tr>
					</table>

				</div>

				<div class="divTable">
					<center>
						<table cellpadding="0" cellspacing="0" border="1"
							class="selectTable" style="font-size: 15px; width: 90%;"
							id="addDailystatement">


						</table>
					</center>
					<div>
						<input type="submit" value="保存" class="yulanBotton" />
					</div>

				</div>
			</div>
		</form>
	</div>



</body>
</html>
