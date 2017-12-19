<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>班级日常数据</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
	href="${pageContext.request.contextPath }/statics/academic_department/css/Test.css">
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
	left: 93%;
	top: 85%;
}

.textStyle {
	width: 100px;
}

.fromright {
	position: relative;
	left: 70%;
	top: 50px;
}



.xiala1 {
	position: relative;

	right: 20px;
}

td {
	text-align: center;
}
.table-b {
	margin-top: 15px;
}
.table-b table td {
	border: 1px solid #000
}

.table-b table th {
	border: 1px solid #000
}

.title th {
	width: 100px;
	height: 30px;
}

.time td {
	text-align: left;
}

table tr:nth-child(even) {
	background: #ccc;
}
</style>
<script type="text/javascript">
	function load(classId,time){
		$.ajax({
			url:"getClassData",
			data:{"classId":classId,"time":time},
			dataType:"JSON",
			success:function(data){
				$("#showClassData").html("");
		
			if(data.gradeData.length>0&&data.count.length>0){
			
			/* console.log(data.gradeData); */
			var str;
			for(var i=0;i<1;i++){
			var preparation=data.count[i].preparationCount==""||data.count[i].preparationCount==null?"未填写":data.count[i].preparationCount;
			var obuCount=data.count[i].obuCount==""||data.count[i].obuCount==null?"未填写":data.count[i].obuCount;
			var homeworkCount=data.count[i].homeworkCount==""||data.count[i].homeworkCount==null?"未填写":data.count[i].homeworkCount;
		 	 str="<tr><td colspan='2' rowspan='2' style='width:100px;'><span>班主任：<span>"+data.tList.cName+"</span><br>"
						+"<span>教员：<span>"+data.tList.tName+"</span></span>"
						+"</span></td>"
							+"<th colspan='5'>上课</th>"
						+"<th colspan='3'>集体学习</th>"
						+"</tr>"
						+"<tr class='title'>"
						+"<th>出勤</th>"
						+"<th>单词</th>"
						+"<th>本上</th>"
						+"<th>预习</th>"
						+"<th>上机</th>"
						+"<th>出勤</th>"
						+"<th>课后(实操)</th>"
						+"<th>日考</th>"
						+"</tr>"
						+"<tr>"
						+"<td>学号</td>"
						+"<td>姓名</td>"
						+"<td></td>"
						+"<td></td>"
						+"<td></td>"
						+"<td>"+preparation+"</td>"
						+"<td>"+obuCount+"</td>"
						+"<td></td>"
						+"<td>"+homeworkCount+"</td>"
						+"<td></td>"
						+"</tr>";
				}
				$("#showClassData").append(str);
				$(data.gradeData).each(function(){
				var stuNum=this.stu_number==""||this.stu_number==null?"未填写":this.stu_number;
				var stuName=this.stu_name==""||this.stu_name==null?"未填写":this.stu_name;
				var amturn=this.amturn==""||this.amturn==null?"未填写":this.amturn;
				var word=this.word==""||this.word==null?"未填写":this.word;
				var manami=this.manami==""||this.manami==null?"未填写":this.manami;
				var preparation=this.preparation==""||this.preparation==null?"未填写":this.preparation;
				var obu=this.obu==""||this.obu==null?"未填写":this.obu;
				var pmturn=this.pmturn==""||this.pmturn==null?"未填写":this.pmturn;
				 var homework=this.homework==""||this.homework==null?"未填写":this.homework;
				 var written=this.written==""||this.written==null?"未填写":this.written;
				$("#showClassData").append("<tr>"
												+"<td>"+stuNum+"</td>"
												+"<td>"+stuName+"</td>"
												+"<td>"+amturn+"</td>"
												+"<td>"+word+"</td>"
												+"<td>"+manami+"</td>"
												+"<td>"+preparation+"</td>"
												+"<td>"+obu+"</td>"
												+"<td>"+pmturn+"</td>"
												+"<td>"+homework+"</td>"
												+"<td>"+written+"</td>"
												+"</tr>");
						
				});
				}else{
					
					$("#showClassData").html("");
					$("#showClassData").append("<tr>"
							+"<td style='color:red; font-weight: bold; font-size: 24px;'>"
							+"暂无数据"
							+"</td>"
							+"</tr>");
					
				}
			},error: function(){
				alert("请选择班级和日期");
			}
		});
	}
	function aa(){
	var classId=$(".xiala1").val();
		var time=$(".dateStyle").val();
		
		load(classId,time);
	}
	$(function(){
		var classId=$(".xiala1").val();
		var time=$(".dateStyle").val();
		
		load(classId,time);
	});
</script>
</head>

<body>
	<div class="rightContent">

		<from class="fromright"> <select name="classId"
			id="selectGrade" class="xiala1" onchange="aa()">

			<c:if test="${gradeList != null}">
				<c:forEach var="grade" items="${gradeList}">
					<option
						<c:if test="${grade.id eq requestScope.classId}">selected="selected"</c:if>
						value="${grade.id}">${grade.name}</option>
				</c:forEach>
			</c:if>
		</select>
		<input type="date" onchange="aa()" class="dateStyle" style="width:160px;" name="a_time" value="${createTime }" /></th></tr>	
		<input type="submit" value="搜索" class="searchBotton" id="sousuo"
			onclick="aa()" /> </from>

		<div class="tabContent">

			<div class="serach ">

				<table cellpadding="0" cellspacing="0" class="searchTable"
					border="0" style="width:80%;">

					<tr>
						<h2 align="center">日常数据表</h2>

					</tr>

				</table>
			<div class="divTable table-b">
				<center>
					<table cellpadding="0" cellspacing="0" border="1"
						class="selectTable" style="font-size: 15px; width: 90%;"
						id="showClassData">
						<!-- <tr>
							<td style="color:red; font-weight: bold; font-size: 30px;">
							请选择班级和日期   ! ! !
							</td>
						</tr> -->
						<!-- <tr>
							<td colspan="2" rowspan="3" style="width:100px;"><span>班主任：<span>温娟</span><br>
									<span>教员：<span>李慧琴</span></span>
							</span></td>
							
						</tr>
						<tr class="time" style="background-color:#fff;">
							<th colspan="5">上课</th>
							<th colspan="3">集体学习</th>
						</tr>
						<tr class="title">
							<th>出勤</th>
							<th>单词</th>
							<th>本上</th>
							<th>预习</th>
							<th>上机</th>
							<th>出勤</th>
							<th>课后(实操)</th>
							<th>日考</th>


						</tr>
						<tr>
							<td>学号</td>
							<td>姓名</td>
							<td>×</td>
							<td>×</td>
							<td>×</td>
							<td>×</td>
							<td>×</td>
							<td>×</td>
							<td>×</td>
							<td>×</td>
						</tr> -->
						<!--开始查找数据-->
						<!-- <tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>
						<tr>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
							<td>1</td>
						</tr>

 -->
					</table>
				</center>
			</div>
			</div>

			
		</div>
	</div>
</body>
</html>
