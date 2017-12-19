<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>下发工单</title>
<link rel="stylesheet" type="text/css"
	href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css" />
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<style type="text/css">
#bbsTab {
	margin: 10px 0px;
	width: 60%
}
/* #bbsTab tbody td:nth-child(1) {
	text-align: left;
} */

</style>
<script type="text/javascript">
$(function(){
		var emp_id=${loginUser.emp_id};
			 $.ajax({
			url:"${pageContext.request.contextPath}/workorder/selectAll/"+emp_id,
			type:"POST",
			success:function(result){
			console.log(result);
			var workorder=result.extend.workorders;
			$.each(workorder,function(index,item){
			var titleTD=$("<td></td>").append(item.emp_name+" "+item.workOrder_IssuedDate+" 工单");
			var qzTD=$("<td></td>").append(item.workOrder_percentage)
			var zfTD=$("<td></td>").append(item.workOrder_totalPoints==null?" ":item.workOrder_totalPoints)
			var a=$("<a>查看<a/>").attr("href","javascript:void(0)").attr("wid",item.workOrder_id).addClass("aclick");
			var czTD=$("<td></td>").append(a);
			$("<tr></tr>").append(titleTD).append(qzTD).append(zfTD)
			.append(czTD).appendTo("#bbsTab tbody");		
			});
			}
			});

		});	
	 			$(document).on("click",".aclick",function() {
	 			var workorder_id=$(this).attr("wid");
	 			window.open("workorder/workorder_update/"+workorder_id,"frmright");
			});
</script>
</head>
<body>
	<div class="rightContent">
		<h1 class="tabTitle">查看下发的工单</h1>
		<div class="divTable">
			<table cellpadding="0" cellspacing="0" border="0" class="selectTable" id="bbsTab">
			<thead>   <tr><th>标题</th><th>权重</th><th>总分</th><th>操作</th></tr>	   </thead>
			<tbody></tbody>
			</table>
		</div>
	</div>
</body>
</html>

