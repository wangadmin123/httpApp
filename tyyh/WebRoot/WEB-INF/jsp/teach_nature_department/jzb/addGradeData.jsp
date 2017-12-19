<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    function blue1(){
		var number = $("#danci").val();
		$(".word1").attr("value", number);

	}
	function blue2(){
	var number = $("#keshi").val();
	$(".classHour1").attr("value", number);
	}
    /* 保存 */
	function addData() {
		var temp = $("#data").serialize();
		$.post("grand",temp,addDataInfo(),"text");
	}
	/* 跳转到班级数据界面 */
	function addDataInfo() {
		window.location.href="jintonggang2B.html";
	}
	function getData(){
		var dates=$(".dateStyle").val();
		window.location.href="gradeName1?dates="+dates;
	}
	$(function(){
		var count=${count}
		if(count>0){
			alert("今日已录过数据请勿重复录入");
			$("#addData").attr("disabled","disabled");
			$("#addData").css("background","#CCC");
		}
	});
    </script>
</head>
<body>

				<form id="data" method="post">
				
				<table cellpadding="0"  cellspacing="0" border="1"
					class="selectTable" id="nullgrade">
					<tr><th colspan="13">
					<input type="date" class="dateStyle" style="width:160px;" name="a_time" value="${createTime }" onchange="getData()"/></th></tr>
					<tr>
						<th width="5%">学号</th>
						<th	width="5%">姓名</th>
						<th width="10%">上午打卡</th>
						<th width="20%">上午打卡时间</th>
						<th width="10%">上午批注</th>
						<th width="10%">下午打卡</th>
						<th width="20%">下午打卡时间</th>
						<th width="10%">下午批注</th>
						<th width="3%">单词&nbsp;&nbsp;&nbsp;&nbsp;<br/>
							<input type="number" id="danci" onblur="blue1();" placeholder="单词数" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" min="0" style="width:90px;" />
						</th>
						<th width="3%">课时&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="number" id="keshi" onblur="blue2();" placeholder="课时数" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" min="0" style="width:100px;" />
						</th>
						<th width="4%">请假课时</th>
					</tr>
					 <c:forEach items="${oa }" var="oa" varStatus="status">
					<tr>
					<td>
					<input type="hidden" value="${oa.stu_Id }" name="student_id" />
					<input type="hidden" value="${oa.grade_id }" name="grade_id" />
					<input type="text"  value="${oa.stu_number }"  readonly="readonly"  name="stu_number"  style="border: none;width:100px;text-align:center;"/>
					</td>
					<td><input type="text"  value="${oa.stu_name }"  readonly="readonly"  name="stu_name"  style="border: none;width:100px;text-align:center;"/></td>
					<c:set var="am" value="true" />
					<c:set var="pm" value="true" />
				<c:forEach items="${stuDk }" var="stuDk">
				<c:if test="${stuDk.stu_Id==oa.stu_Id }">
					<c:if test="${stuDk.am_dk ne '' or stuDk.am_dk ne null }">
					<td style="text-align:center;">${stuDk.am_dk}</td>
					<td style="text-align:center;">${stuDk.am_time}</td>
					<td><select name="amturn">
						<option>正常</option>
						<option>旷课</option>
						<option>病假</option>
						<option>事假</option>
						<option>迟到</option>
						<option>早退</option>
						</select></td>
					<c:set var="am" value="false" />
					</c:if>
					<c:if test="${stuDk.pm_dk ne '' or stuDk.pm_dk ne null }">
					<td style="text-align:center;">${stuDk.pm_dk}</td>
					<td style="text-align:center;">${stuDk.pm_time}</td>
					<td><select name="pmturn">
						<option>正常</option>
						<option>旷课</option>
						<option>病假</option>
						<option>事假</option>
						<option>迟到</option>
						<option>早退</option>
						</select></td>
						<c:set var="pm" value="false" />
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${am}">
					<td style="text-align:center;">未打卡</td>
					<td style="text-align:center;"></td>
					<td><select name="amturn">
						<option>正常</option>
						<option>旷课</option>
						<option>病假</option>
						<option>事假</option>
						<option>迟到</option>
						<option>早退</option>
						</select></td>
					</c:if>
					<c:if test="${pm}">
					<td style="text-align:center;">未打卡</td>
					<td style="text-align:center;"></td>
					<td><select name="pmturn">
						<option>正常</option>
						<option>旷课</option>
						<option>病假</option>
						<option>事假</option>
						<option>迟到</option>
						<option>早退</option>
						</select></td>
					</c:if>
				<td><input type="number" class="word1" name="word"  style="width:100px;border: none;" placeholder="正确数" min="0"/></td>
				<td><input type="number" class="classHour1" name="classHour"  style="width:100px;border: none;" placeholder="课时数" min="0" /></td>
				<td><input type="number" name="qijiaHour"  style="width:100px;border: none;padding-left:5px;" placeholder="课时数" min="0" value="0" /></td>
			</tr>
			</c:forEach>	
				</table>
				</form>
				<input type="button" value="保存" id="addData" class="searchBotton" onclick="addData()" />
</body>
</html>
