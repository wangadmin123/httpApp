<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>合同信息</title>
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

	function showDate(index){
	  	//获得搜索条件
		var emp_name = $("#emp_name").val();
		var contract_id = $("#contract_id").val();
		var contract_startDate = $("#contract_startDate").val();
		var contract_endDate = $("#contract_endDate").val();
		var contract_status = $("#contract_status").val(); 
	  	$.ajax({
			type:"POST",
			url:"employee_contract_search",
			dataType:"json",
			data:{
				emp_name:emp_name,
				contract_startDate:contract_startDate,
				contract_endDate:contract_endDate,
				contract_id:contract_id,
				contract_status:contract_status,
				pageIndex:index
			},
			success: showList,
			error:function(){
				alert("数据不存在");
			}
		});
	 }

	 function showList(data){
		var datas = eval("("+data+")");
	  	var pageCount = datas.totalPageCount;
	  	var index= datas.currentPageNo;
	  	var count = datas.totalCount;
	  	
	  	var oaRlzybEmployees = datas.oaRlzybEmployees;
	  	showStuList(oaRlzybEmployees);
	  	showPageIndex(pageCount,index, count);
	 }

	function dateFmt(time){
		var t = new Date(time);
		var year = t.getFullYear(); //年
		var month = t.getMonth() + 1; //月
		var day = t.getDate(); //日
		if(month < 10){
			month = "0" + month;
		}
		if(day < 10){
			day = "0" + day;
		}
		var dateTimeStr= year + "-" + month + "-"+day;
		return dateTimeStr;
	}

	function showStuList(oaRlzybEmployees){
	  	$(".selectTable").html("");
		var str = "<tr>";
			str += "<th>编号</th>";
			str += "<th>姓名</th>";
			str += "<th>岗位</th>";
			str += "<th>部门</th>";
			str += "<th>合同编号</th>";
			str += "<th>合同状态</th>";
			str += "<th>归属公司</th>";
			str += "<th>起始日期</th>";
			str += "<th>截止日期</th>";
			str += "<th>管理</th>";
			str += "</tr>";
		
		for(var i = 0; i < oaRlzybEmployees.length; i++){
		
			str += "<tr>";
			
			
			var id = i + 1;
			if(id < 10){
				id = "000" + id;
			}else if(id < 100){
				id = "00" + id;
			}else if(id < 1000){
				id = "0" + id;
			}else{
				id = "" + id;
			}
			str += "<td>" + id  + "</td>";
			
			str += "<td>" + oaRlzybEmployees[i].emp_name + "</td>";
			str += "<td>" + oaRlzybEmployees[i].position_name + "</td>";
			str += "<td>" + oaRlzybEmployees[i].depart_name + "</td>";
			
			if(oaRlzybEmployees[i].contract_status == "未签订"){
				str += "<td>" + "</td>";
				str += "<td>" + oaRlzybEmployees[i].contract_status + "</td>";
				str += "<td>" + "</td>";
				str += "<td>" + "</td>";
				str += "<td>" + "</td>";
			}else{
				str += "<td>" + oaRlzybEmployees[i].contract_id + "</td>";
				str += "<td>" + oaRlzybEmployees[i].contract_status + "</td>";
				str += "<td>" + oaRlzybEmployees[i].contract_belong_company + "</td>";
				str += "<td>" + dateFmt(oaRlzybEmployees[i].contract_startDate) + "</td>";
				str += "<td>" + dateFmt(oaRlzybEmployees[i].contract_endDate) + "</td>";
			}
			
			str += "<td>";
			
			if(oaRlzybEmployees[i].contract_status == "未签订"){
				str += "<a href='javascript:;' class='addContract'   emp_id = '"+oaRlzybEmployees[i].emp_id+"'   >签订合同</a>";
			}else if(oaRlzybEmployees[i].contract_status == "已签订"){
				str += "<a>已签订</a>";
			}if(oaRlzybEmployees[i].contract_status == "已到期"||oaRlzybEmployees[i].contract_status == "即将到期"){
				str += "<a href='javascript:;' class='addContract'   emp_id = '"+oaRlzybEmployees[i].emp_id+"'   >续签</a>";
			}
			
			str += "<input type='hidden' id='emp_id' value='"+oaRlzybEmployees[i].emp_id+"'> </td>";
			str += "</tr>";
		} 		
		
		$(".selectTable").html(str);
		
		$(".addContract").click(function(){
			var emp_id = $(this).attr("emp_id");
			/* alert(emp_id);  */
			location.href="employee_contract_add?emp_id="+emp_id; 
			
		});
	}
	
	
	function showPageIndex( pageCount,  index, count){
	  	$("#page").html("");//避免出现页码累加的情况
	  	
	  	var str = "";
	  	$("#index").val(index);
	  	
	  	var start = (index-1) * 10 + 1;
	  	var end = index * 10;
	  	if(end > count){
	  		end = count;
	  	}
	  		
	  	if(end == 0){
	  		str += " 当前无数据 ";
	  	}else{
	  		str += " 当前" + start + "-" + end + "  条 ";
	  	}
	  	/* 显示页码 */
	  	for(var i = 1; i<= pageCount; i++){	
	  		str += " <a href='javascript:onclick=showDate("+ i +")'  style='color: #333;' >"+i+"</a> ";  			
	  	}
	  	
	  	/* 	③　当当前页为末页时，”下一页”不显示 */
	  	
	  	str += " 共" +  pageCount + "页";
	  	
	  	$("#page").html(str);
	  	$("#countId").html("结果数：<input type='text' class='textStyle' style='width:50px;'  value='" + count + "' disabled='disabled'/>人");
     }

	 $(function(){
	  	showDate(1);
	  		
	  	$("#chaxun").click(function(){
	  		showDate(1);
	  	});
	  	
	  	$("#qing").click(function(){
	  		$("#emp_name").val("");
	  		$("#contract_id").val("");
	  		$("#contract_startDate").val("");
	  		$("#contract_endDate").val("");
	  		$("#contract_status").val("");
	  		
	  	});
	 });
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
     <form method="post" action="employee_contract_search">
	    <div class="search">
	         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;">
		        <tr>
				  <td class='tdWidth'>姓名：&nbsp;<input type="search" name="emp_name" id="emp_name" class="searchStyle" style="width:120px;"/>
			      &nbsp;&nbsp;&nbsp;合同编号：&nbsp;<input type="number" name="contract_id" id="contract_id"  class="searchStyle" style="width:100px;"/>
		         &nbsp;&nbsp;&nbsp; 起始日期：&nbsp;<input type="date" name="contract_startDate" id="contract_startDate" class="dateStyle" style="width:160px;" />
		          &nbsp;&nbsp;&nbsp;截止日期：&nbsp;<input type="date" name="contract_endDate" id="contract_endDate" class="dateStyle" style="width:160px;" />
		          &nbsp;&nbsp;&nbsp;合同状态：&nbsp;<select name="contract_status" id="contract_status">
		          			<option value=""> --请选择-- </option>
							<option value="已签订">已签订</option>
							<option value="已到期">已到期</option>
							<option value="未签订">未签订</option>
						</select>
		          </td>
		           
		        </tr>
		        <tr>
		           <td><input type="button" value="搜索 " class="searchBotton" id="chaxun"><input type="button" value="清空搜索条件" class="searchBotton" style="width:120px" id="qing">
		           <span id="countId"></span>
		           </td>
		      
		        </tr>
			</table>
		    <input type="hidden" name="pageIndex" id="index"/>
	    </div>
	</form>
    <h1 class="tabTitle">合同信息</h1>
    <div class="divTable" >
    <table cellpadding="0" cellspacing="0" border="1" class="selectTable">
        
        
        
    </table>
	  
<!-- 分页 start -->

	<br/>
	<div class="page-bar" id="page"> 
		
	</div> 

<!-- 分页 end -->
    <script src="statics/common/js/rollpage.js"></script>
        
    </div>

  </div>
</div>
</body>
</html>
