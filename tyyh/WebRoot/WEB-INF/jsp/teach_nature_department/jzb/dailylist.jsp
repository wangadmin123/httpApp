<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>员工日报表列表</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/daily.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/laydate/laydate.js"></script>
<script type="text/javascript">
/*表格全选*/
$(function(){
       	    show(1); 
});

function search(){
show(1);
}
function show(index){
var formInfo = $(".form").serialize()+"&index="+index;
		$.post("showDailyList",formInfo,showdate,"json");
		function showdate(data){
		
		var OaJzbDailyworkcontent1 = data.OaJzbDailyworkcontent;
		var OaJzbDailyworkcontent = eval("("+OaJzbDailyworkcontent1+")");
		var fals = data.fals;
		var row = data.row;
		var index = data.index;
		var pagecount = data.pagecount;
		showList(OaJzbDailyworkcontent,fals);
		showPage(index,pagecount); 
		}
	};
function showList(OaJzbDailyworkcontent,fals){
			$(".selectTable").empty();
			$(".selectTable").append("<tr><th>员工编号</th><th>姓名</th><th>所属部门</th><th>职务</th><th>日报日期</th><th>操作</th></tr>");
			for(var i = 0; i < OaJzbDailyworkcontent.length ; i++){	
			
	 		if(fals[i]){
			$(".selectTable").append("<tr><td>"+OaJzbDailyworkcontent[i].emp_id+"</td><td>"+OaJzbDailyworkcontent[i].emp_name+"</td>"+
			"<td>"+OaJzbDailyworkcontent[i].depart_name+"</td><td>"+OaJzbDailyworkcontent[i].position_name+"</td><td>"+OaJzbDailyworkcontent[i].entrytime+"</td><td>"+
			 "<a href=\"${pageContext.request.contextPath }/showdailyone1/"+OaJzbDailyworkcontent[i].entrytime+"/"+OaJzbDailyworkcontent[i].teacher_id+"\" class=\"paifa\">查看</a>"+
			 "</td></tr>"); 
			}else{
			$(".selectTable").append("<tr><td>"+OaJzbDailyworkcontent[i].emp_id+"</td><td>"+OaJzbDailyworkcontent[i].emp_name+"</td>"+
			"<td>"+OaJzbDailyworkcontent[i].depart_name+"</td><td>"+OaJzbDailyworkcontent[i].position_name+"</td><td>"+OaJzbDailyworkcontent[i].entrytime+"</td><td>"+
			 "<a href=\"${pageContext.request.contextPath }/showdailyone1/"+OaJzbDailyworkcontent[i].entrytime+"/"+OaJzbDailyworkcontent[i].teacher_id+"\" class=\"paifa\">查看</a>"+
			 "<a href=\"${pageContext.request.contextPath }/deletedailyone/"+OaJzbDailyworkcontent[i].entrytime+"/"+OaJzbDailyworkcontent[i].dailyworkcontent_id+"\" class=\"delete\">删除</a></td></tr>"); 
			}	
			}
}
	
	
function showPage(index,pageCount){
	  	$("#page").empty();
	  	$("#page").append("<a href='javascript:onclick=show(1)'>首页</a>");
	 
	  	if(index!=1){
	  	$("#page").append("<a href='javascript:onclick=show("+(index-1)+")'>上一页</a>");
	  	}
	  	for(var i =1;i<=pageCount;i++){
	  	$("#page").append("<a href='javascript:onclick=show("+i+")'>"+i+"</a>");
	  	}
	  	if(index!=pageCount){
	  		$("#page").append("<a href='javascript:onclick=show("+(index+1)+")'>下一页</a>");
	  	}
	  	$("#page").append("<a href='javascript:onclick=show("+pageCount+")'>末页</a>");
		 }
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
  <form action="" class="form" method="post">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
        <td>姓名：</td> <td>
				<select name="empid"  id="empid" style="width:100px;" class="dateStyle">
					<option value="0" >请选择</option>
					<c:forEach items="${OaRlzybEmployees }" var="OaRlzybEmployees">
					<option value="${OaRlzybEmployees.emp_id }">${OaRlzybEmployees.emp_name }</option>
					</c:forEach>
				</select>
				</td>
		    <td>开始时间：</td> <td><input   type="date" name="bieTime"  id="bieTime" class="dateStyle" style="width:160px;"  /></td>
          <td>结束时间：</td> <td><input    type="date"  name="outTime"  id="outTime" class="dateStyle" style="width:160px;" /></td>
           <td><input type="button"  value="搜索"  onclick="search()"   class="searchBotton" /></td>   
        </tr>   
       </table>
    </div>

    <h1 class="tabTitle">教质部日报表信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        
      </table>
	  <div id="page"></div>
    </div>
</form>
  </div>
</div>
<div class="mbStyle">&nbsp;</div>
</body>
</html>
