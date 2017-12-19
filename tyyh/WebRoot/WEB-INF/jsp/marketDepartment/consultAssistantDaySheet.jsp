<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>日报表</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<script type="text/javascript">
/*表格全选*/
$(function(){
	  $("#all").click(function(){
        var checked=$(this).is(":checked");
        $(".selectTable tr td").children().attr("checked",checked);
      });
    //判断是否全选
		function ifAllChecked(){
			var checkedBoxs=$(".selectTable tr td").children();
			var sum=checkedBoxs.size();
			var k=0;
			checkedBoxs.each(function(index,dom){
				if($(dom).is(":checked")) k++;
			});
			if(k==sum){
				$("#all").attr("checked",true);
			}else{
				$("#all").attr("checked",false);
			}
		}
        ifAllChecked();//页面加载完后运行
	
});
/*表格全选结束*/

function find(){
	
		var temp = $("#formQ").serialize();
	
	
	$.post("Consultway/AssistantDaySheetFind",temp,showListInfo,"json");
	
}
function showListInfo(data){

	$("#DaySheet").empty();
	
	for(var i=0;i<data.length;i++){
		var DaySheetmap=data[i];
		var show=DaySheetmap.show;
		var phoneToComePercentums=DaySheetmap.phoneToComePercentums;
		var ComeToenrollPercentums=DaySheetmap.ComeToenrollPercentums;
		var ControllerToenrollPercentums=DaySheetmap.ControllerToenrollPercentums;
		if(show==1){
		if(phoneToComePercentums=="暂无" && ComeToenrollPercentums=="暂无" && ControllerToenrollPercentums=="暂无"){
        	$("#DaySheet").append("<tr style='background-color: #F0F0F0 ;'>"
          +"<td>"+DaySheetmap.DayTime+"</td>"
          +"<td>"+DaySheetmap.phoneControllers+"</td>"
          +"<td>"+DaySheetmap.ControllersDirectCome+"</td>"
          +"<td>"+DaySheetmap.AllControllers+"</td>"
          +"<td>"+DaySheetmap.phoneControllersCome+"</td>"
          +"<td>"+DaySheetmap.AllComes+"</td>"
          +"<td>"+DaySheetmap.Allenrolls+"</td>"
          +"<td>"+DaySheetmap.AllpayStatus+"</td>"
          +"<td>"+DaySheetmap.phoneToComePercentums+"</td>"
          +"<td>"+DaySheetmap.ComeToenrollPercentums+"</td>"
          +"<td>"+DaySheetmap.ControllerToenrollPercentums+"</td></tr>");	
        }else{
        	$("#DaySheet").append("<tr style='background-color: #FFECF5 ;'>"
          +"<td>"+DaySheetmap.DayTime+"</td>"
          +"<td>"+DaySheetmap.phoneControllers+"</td>"
          +"<td>"+DaySheetmap.ControllersDirectCome+"</td>"
          +"<td>"+DaySheetmap.AllControllers+"</td>"
          +"<td>"+DaySheetmap.phoneControllersCome+"</td>"
          +"<td>"+DaySheetmap.AllComes+"</td>"
          +"<td>"+DaySheetmap.Allenrolls+"</td>"
          +"<td>"+DaySheetmap.AllpayStatus+"</td>"
          +"<td>"+DaySheetmap.phoneToComePercentums+"</td>"
          +"<td>"+DaySheetmap.ComeToenrollPercentums+"</td>"
          +"<td>"+DaySheetmap.ControllerToenrollPercentums+"</td></tr>");	
        	}
		
        }else{
        	if(phoneToComePercentums=="暂无" && ComeToenrollPercentums=="暂无" && ControllerToenrollPercentums=="暂无"){
        		
        	}else{
        		$("#DaySheet").append("<tr style='background-color: #FFECF5 ;' >"
			          +"<td>"+DaySheetmap.DayTime+"</td>"
			          +"<td>"+DaySheetmap.phoneControllers+"</td>"
			          +"<td>"+DaySheetmap.ControllersDirectCome+"</td>"
			          +"<td>"+DaySheetmap.AllControllers+"</td>"
			          +"<td>"+DaySheetmap.phoneControllersCome+"</td>"
			          +"<td>"+DaySheetmap.AllComes+"</td>"
			          +"<td>"+DaySheetmap.Allenrolls+"</td>"
			          +"<td>"+DaySheetmap.AllpayStatus+"</td>"
			          +"<td>"+DaySheetmap.phoneToComePercentums+"</td>"
			          +"<td>"+DaySheetmap.ComeToenrollPercentums+"</td>"
			          +"<td>"+DaySheetmap.ControllerToenrollPercentums+"</td></tr>");
			 }
        }
        
	}
}

$(function(){

find();
});

function DaySheet(){
	window.location.href="Consultway/ToAssistantDaySheet";
}
function WeekSheet(){
	window.location.href="Consultway/ToAssistantWeekSheet";
}
function MonthSheet(){
	window.location.href="Consultway/ToAssistantMonthSheet";
}
function YearSheet(){
	window.location.href="Consultway/ToAssistantYearSheet";
}

</script>
</head>
<body>
<div class="rightContent">
	<div class="tabs" id="tabs"  >
      <span class="spanHover" onclick="DaySheet()">日报表</span>
      <span class="spanOut"  onclick="WeekSheet()">周报表</span>
      <span class="spanOut"  onclick="MonthSheet()">月报表</span>
      <span class="spanOut" id="spanLast"  onclick="YearSheet()" >年报表</span>
  	</div>
  <div class="tabContent">
  <h1 class="tabTitle">日报表</h1>
    <div class="serach">
    <form id="formQ" action="Consultway/ToDaySheetexport"  method="post" >
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
       		 <td class="tdWidth" colspan="5" style="text-align: center;">咨询师：
                            <select class="selectStyle" style="width:130px;" name="consultTeacher">
                                <option value="0">全部</option>
                               <!--  <input type="radio"  value="0" name="consultTeacher"  class="radioStyle"  />全部&nbsp; -->
                                <c:if test="${ConsultTeacherList !=null}">
									<c:forEach var="teacher" items="${ConsultTeacherList}">
									<%-- <input type="radio"  value="${teacher.emp_id}" name="consultTeacher"  class="radioStyle"  />${teacher.emp_name}&nbsp; --%>
									
										<option <c:if test="${teacher.emp_id == consultTeacher}">selected="selected"</c:if>
										 value="${teacher.emp_id}">${teacher.emp_name}
										</option>
									</c:forEach>
				  				</c:if>
                            </select>
              </td>       
                <td>日期：<input type="date" class="dateStyle" name="firstConsultTimes" style="width:130px;" /></td>
          		 <td class="tdWidth">是否显示无数据的日期：
                   <input type="radio"  name="show" value="1"  class="radioStyle" checked="checked"/>是&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio"  name="show" value="2"  class="radioStyle"/>否</td>
          		
           </tr>
            
       </table>
       <div style="border: 1px; float: right;">
            	<input type="button" id="btn" onclick="find()" class="saveBotton" value="搜索" />
            	 <input type="submit" class="saveBotton"  value="导出"/>
       </div>
       </form>
    </div>

    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
       <thead>
        <tr>
          <th>日期</th>
          <th>电话咨询量</th>
          <th>直上咨询量</th>
          <th>总咨询量</th>
          <th>电话上门量</th>
          <th>总上门量</th>
          <th>总报名量</th>
          <th>总定金量</th>
          <th>电转率</th>
          <th>面转率</th>
          <th>总转率</th>

        </tr>
        </thead>
        <tbody id="DaySheet">
        
        </tbody>
       <!--  <tr>
          <td>2017-08-08</td>
          <td>50</td>
          <td>10</td>
          <td>5</td>
          <td>30</td>
          <td>5</td>
          <td>15</td>
          <td>25</td>
          <td>40%</td>
          <td>70%</td>
          <td>80%</td>
        </tr> -->
  
 
       
      </table>
	  <!-- <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div> -->
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
</div>
</body>
</html>
