<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>C&nbsp;班学生统计表班主任</title>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
    <script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
    <script type="text/javascript" src="statics/teach_nature_department/laydate/laydate.js"></script>
    <script type="text/javascript" src=" statics/teach_nature_department/jzb.js/grade.js"></script>


  
    <script type="text/javascript">
    $(function(){
	//动态加载成员关系
	var am = $("#stuAmturn").val();
	$("#amturns").html("");
	var options = "";
	if(am != null && am != undefined && am == "√"){
		options += "<option selected=\"selected\">√</option>";
		options += "<option>０</option>";
		options += "<option>￠</option>";
		options += "<option>×</option>";
		options += "<option>#</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "０"){
		options += "<option selected=\"selected\">０</option>";
		options += "<option>√</option>";
		options += "<option>￠</option>";
		options += "<option>×</option>";
		options += "<option>#</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "￠"){
		options += "<option selected=\"selected\">￠</option>";
		options += "<option>√</option>";
		options += "<option>０</option>";
		options += "<option>×</option>";
		options += "<option>#</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "×"){
		options += "<option selected=\"selected\">×</option>";
		options += "<option>√</option>";
		options += "<option>０</option>";
		options += "<option>￠</option>";
		options += "<option>#</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "#"){
		options += "<option selected=\"selected\">#</option>";
		options += "<option>√</option>";
		options += "<option>０</option>";
		options += "<option>￠</option>";
		options += "<option>×</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "Δ"){
		options += "<option selected=\"selected\">Δ</option>";
		options += "<option>√</option>";
		options += "<option>０</option>";
		options += "<option>￠</option>";
		options += "<option>×</option>";
		options += "<option>#</option>";
	}
	$("#amturns").html(options);
});


    $(function(){
	//动态加载成员关系
	var am = $("#stuPmturn").val();
	$("#pmturns").html("");
	var options = "";
	if(am != null && am != undefined && am == "√"){
		options += "<option selected=\"selected\">√</option>";
		options += "<option>０</option>";
		options += "<option>￠</option>";
		options += "<option>×</option>";
		options += "<option>#</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "０"){
		options += "<option selected=\"selected\">０</option>";
		options += "<option>√</option>";
		options += "<option>￠</option>";
		options += "<option>×</option>";
		options += "<option>#</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "￠"){
		options += "<option selected=\"selected\">￠</option>";
		options += "<option>√</option>";
		options += "<option>０</option>";
		options += "<option>×</option>";
		options += "<option>#</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "×"){
		options += "<option selected=\"selected\">×</option>";
		options += "<option>√</option>";
		options += "<option>０</option>";
		options += "<option>￠</option>";
		options += "<option>#</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "#"){
		options += "<option selected=\"selected\">#</option>";
		options += "<option>√</option>";
		options += "<option>０</option>";
		options += "<option>￠</option>";
		options += "<option>×</option>";
		options += "<option>Δ</option>";
	}else if(am != null && am != undefined && am == "Δ"){
		options += "<option selected=\"selected\">Δ</option>";
		options += "<option>√</option>";
		options += "<option>０</option>";
		options += "<option>￠</option>";
		options += "<option>×</option>";
		options += "<option>#</option>";
	}
	$("#pmturns").html(options);
});
    </script>
</head>
<body>
		<div class="rightContent">

	<div class="tabContent">
		<h1 class="tabTitle">修改班级数据</h1>
		<form
			action="${pageContext.request.contextPath}/editGradeData"
			method="post" enctype="multipart/form-data">
			
			<table cellpadding="0" cellspacing="0" border="0" class="addTable">
				<tr>
					<td class="tdWidth">学号：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaGradeData.student_id }" readonly="readonly" name="student_id" />
						<input name="time" type="hidden" value="${oaGradeData.time}"/>
						</td>
				</tr>
				<tr>
					<td class="tdWidth">姓名：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaGradeData.stu_name}" readonly="readonly" name="stu_name" /></td>
				</tr>
				<tr>
					<td class="tdWidth">上午出勤：</td>
					<td><input type="hidden" value="${oaGradeData.amturn}" id="stuAmturn" />
						<select  class="ZY_tj" style=" width:160px; height: 30px;" name="amturn" id="amturns" class="form-control"  required="required"></select></td>
				</tr>
				<tr>
					<td class="tdWidth">下午出勤：</td>
					<td><input type="hidden" value="${oaGradeData.pmturn}" id="stuPmturn" />
						<select  class="ZY_tj" style=" width:160px; height: 30px;" name="pmturn" id="pmturns" class="form-control"  required="required"></select></td>
				</tr>
				<tr>
					<td class="tdWidth">单词：</td>
					<td><input type="number" class="textStyle" style="width:160px;"
						value="${oaGradeData.word}" name="word" /></td>
				</tr>
				<tr>
					<td class="tdWidth">当天课时：</td>
					<td><input type="number" step="0.01" class="textStyle" style="width:160px;"
						value="${oaGradeData.classHour}" name="classHour" /></td>
				</tr>
				<tr>
					<td class="tdWidth">备注：</td>
					<td><input type="text" class="textStyle" style="width:160px;"
						value="${oaGradeData.remarks}" name="remarks" /></td>
				</tr>
			</table>
			<h2 class="tabTitle2">&nbsp;</h2>
			<div class="btposition1">
				<input type="submit" value="保存" class="saveBotton" />
			</div>
		</form>


	</div>
</div>
</body>
</html>
