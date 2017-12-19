<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改学院信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
    
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/noe-show.css">
    
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/js/pinying.js"></script>
	<script type="text/javascript">
	$(function(){
		var sName=$("#").val();
		var sAds=$("#").val();
	if(sName!==''&&sAds!=='' ){
		$("#btn").attr("disabled",false);
		$("#btn").css("background-color","#44bb00");
	}else{
		$("#btn").attr("disabled",true);
		$("#btn").css("background-color","#ccc");
	}
	});
		function showw(ww){
	var emp_name_in = $(ww).val();
	
	if(emp_name_in==null||emp_name_in==""){
	$("#btn").attr("disabled",true);
		$("#btn").css("background-color","#ccc");
	$(ww).attr("style","border:red 1px solid;width:160px");};
	if(emp_name_in!=""){
	$("#btn").attr("disabled",false);
		$("#btn").css("background-color","#44bb00");
	$(ww).attr("style","width:160px");};
	}
	function showw1(ww){
	var emp_name_in = $(ww).val();
	
	if(emp_name_in==null||emp_name_in==""){
	$("#btn").attr("disabled",true);
		$("#btn").css("background-color","#ccc");
		$(ww).attr("style","border:red 1px solid;width:560px");};
	if(emp_name_in!=""){
	$("#btn").attr("disabled",false);
		$("#btn").css("background-color","#44bb00");
	$(ww).attr("style","width:560px");};
	}
	</script>
  </head>
  
  <body>
  <div class="school">
   <h1 class="tabTitle">修改院校信息</h1>
   <form action="market/marketSchoollUpdate" method="post">
   <input type="hidden" name="id"  class="textStyle"   value="${oaSchoolinfo.id }" />
   	<table class="addTable">
                <tr>
                    <td class="tdWidth">学校名称：</td>
                    <td><input type="text" name="schoolName" onblur="showw(this)"  class="textStyle" style="width:160px;"  id="reschoolName" value="${oaSchoolinfo.schoolName }" /></td>
                 </tr>
                  <tr>
                    <td class="tdWidth">地址：</td>
                    <td><input type="text" name="schoolAddress"  onblur="showw1(this)" class="searchStyle" style="width:560px;" id="reschoolAddress" value="${oaSchoolinfo.schoolAddress }"/></td>
                </tr>
		 </table>
   <div align="center" id="schoolinfoAll">
   	
                <div id="timePlan">
                    <h4 align="center">院校时间安排</h4>
                    <textarea name="schoolTimePlan"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none; "  >${oaSchoolinfo.schoolTimePlan }</textarea  >
                </div>
                <div id="opptSituation">

                    <h4 align="center">竞争对手情况</h4>
                    <textarea name="opptSituation"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none;"  >${oaSchoolinfo.opptSituation }</textarea  >

                </div>
                <div id="schoolsSchedule">
                    <h4 align="center">院校合作进度</h4>
                    <textarea name="schoolsSchedule"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none;"   >${oaSchoolinfo.schoolsSchedule }</textarea  >
                </div>
                <div id="pushingSchedule">
                    <h4 align="center">地推合作进度</h4>
                    <textarea name="pushingSchedule"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none;"  >${oaSchoolinfo.pushingSchedule }</textarea  ></td>
                </div>
                <div id="studentsSituation">
                    <h4 align="center">学生会情况</h4>
                    <textarea name="studentsSituation"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none;"  >${oaSchoolinfo.studentsSituation }</textarea  ></td>
                </div>
    </div>
    <input type="submit" value="保存" class="searchBotton"   id="btn" />
	</form>
	</div>
  </body>
</html>
