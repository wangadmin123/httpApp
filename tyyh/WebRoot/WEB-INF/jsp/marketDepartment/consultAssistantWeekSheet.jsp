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
<title>周报表</title>
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
	var	Nowday=$("#Nowday").val();
	var Maxday=$("#Maxday").val();
	var	Minday=$("#Minday").val();
	
	if(Nowday!="" &&  Minday!=""){
		alert("指定日期 与 起始日期 不可同时查询！")
	}else if(Nowday!="" && Maxday!=""){
		alert("指定日期 与 截止日期 不可同时查询！")
	}else if(Maxday !="" && Minday>Maxday){
		alert("起始日期 不可大于 截止日期！")
	}else{
		var temp = $("#formQ").serialize();
		$.post("Consultway/AssistantWeekSheetFind",temp,showListInfo,"json");
	}
	
	
	
	
}
function showListInfo(data){
if(data==null){
alert("日期选择错误！请重新选择")
}else{
	$("#WeekSheet").empty();
		var Nowday=data.Nowday;
		var Maxday=data.Maxday;
		var Minday=data.Minday;
		
		if(Nowday!=null && Nowday!=""){
			$("#WeekSheet").append("<tr>"
			  +"<td>"+data.Nowday+" 所在一周的数据统计：</td>"
	          +"<td>"+data.WeekPhoneControllers+"</td>"
	          +"<td>"+data.WeekControllersDirectCome+"</td>"
	          +"<td>"+data.WeekAllControllers+"</td>"
	          +"<td>"+data.WeekPhoneControllersCome+"</td>"
	          +"<td>"+data.WeekAllComes+"</td>"
	          +"<td>"+data.WeekAllenrolls+"</td>"
	          +"<td>"+data.WeekAllpayStatus+"</td>"
	          +"<td>"+data.WeekphoneToComePercentums+"</td>"
	          +"<td>"+data.WeekComeToenrollPercentums+"</td>"
	          +"<td>"+data.WeekControllerToenrollPercentums+"</td></tr>");
		}else if(Maxday!="" && Minday!=""){
			$("#WeekSheet").append("<tr>"
			  +"<td>"+data.Minday+"——"+data.Maxday+"数据统计：</td>"
	          +"<td>"+data.WeekPhoneControllers+"</td>"
	          +"<td>"+data.WeekControllersDirectCome+"</td>"
	          +"<td>"+data.WeekAllControllers+"</td>"
	          +"<td>"+data.WeekPhoneControllersCome+"</td>"
	          +"<td>"+data.WeekAllComes+"</td>"
	          +"<td>"+data.WeekAllenrolls+"</td>"
	          +"<td>"+data.WeekAllpayStatus+"</td>"
	          +"<td>"+data.WeekphoneToComePercentums+"</td>"
	          +"<td>"+data.WeekComeToenrollPercentums+"</td>"
	          +"<td>"+data.WeekControllerToenrollPercentums+"</td></tr>");
		
		}else if(Maxday!=""){
			$("#WeekSheet").append("<tr>"
			  +"<td>"+data.Maxday+" 之前的数据统计：</td>"
	          +"<td>"+data.WeekPhoneControllers+"</td>"
	          +"<td>"+data.WeekControllersDirectCome+"</td>"
	          +"<td>"+data.WeekAllControllers+"</td>"
	          +"<td>"+data.WeekPhoneControllersCome+"</td>"
	          +"<td>"+data.WeekAllComes+"</td>"
	          +"<td>"+data.WeekAllenrolls+"</td>"
	          +"<td>"+data.WeekAllpayStatus+"</td>"
	          +"<td>"+data.WeekphoneToComePercentums+"</td>"
	          +"<td>"+data.WeekComeToenrollPercentums+"</td>"
	          +"<td>"+data.WeekControllerToenrollPercentums+"</td></tr>");
		}else if(Minday!=""){
			$("#WeekSheet").append("<tr>"
			  +"<td>"+data.Minday+" 之后的数据统计：</td>"
	          +"<td>"+data.WeekPhoneControllers+"</td>"
	          +"<td>"+data.WeekControllersDirectCome+"</td>"
	          +"<td>"+data.WeekAllControllers+"</td>"
	          +"<td>"+data.WeekPhoneControllersCome+"</td>"
	          +"<td>"+data.WeekAllComes+"</td>"
	          +"<td>"+data.WeekAllenrolls+"</td>"
	          +"<td>"+data.WeekAllpayStatus+"</td>"
	          +"<td>"+data.WeekphoneToComePercentums+"</td>"
	          +"<td>"+data.WeekComeToenrollPercentums+"</td>"
	          +"<td>"+data.WeekControllerToenrollPercentums+"</td></tr>");
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
      <span class="spanOut" onclick="DaySheet()">日报表</span>
      <span class="spanHover"  onclick="WeekSheet()">周报表</span>
      <span class="spanOut"  onclick="MonthSheet()">月报表</span>
      <span class="spanOut" id="spanLast"  onclick="YearSheet()" >年报表</span>
  	</div>
  <div class="tabContent">
  <h1 class="tabTitle">周报表</h1>
    <div class="serach">
    <form id="formQ" action="Consultway/ToDayWekktexport"  method="post">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
       		 <td class="tdWidth" colspan="6" style="text-align: center;">咨询师：
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
              </tr> 
              <tr>                       
              <td class="tdWidth" colspan="6" style="text-align: center;">
              指定周日期：<input type="date" class="dateStyle" id="Nowday" name="Nowday" style="width:130px;" />(指定某天所在的一周的周报表)</td>
        </tr>
   
        <tr>
        	<td colspan="6" style="text-align: center;">
        	起始日期：<input type="date" class="dateStyle" id="Minday" name="Minday" style="width:130px;" />(之后)&nbsp;——&nbsp;——&nbsp;
        	截止日期：<input type="date" class="dateStyle" id="Maxday" name="Maxday" style="width:130px;" />（之前）
        	</td>
        </tr>

      
       </table>
       <div style="border: 1px; float: right;">
            	<input type="button" id="btn" onclick="find()" class="saveBotton" value="搜索" />
            	 <input type="submit" class="saveBotton" value="导出"/>
       </div>
       </form>
    </div>

    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
      <thead>
        <tr>
       	  <th>时间</th>
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
        <tbody id="WeekSheet">
        
        </tbody>
        <!-- <tr>
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
	<!--   <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div> -->
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
</div>
</body>
</html>
