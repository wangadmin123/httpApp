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
<link rel="stylesheet" type="text/css"	href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css"	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css"	href="statics/common/css/formStyle.css" />
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css" />
<link rel="stylesheet" type="text/css"	href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<style type="text/css">
table {margin: 10px 0px;}
#tab thead td {width: 250px;height: 30px;}
#tab tbody td {height: 30px;}
.tabinfo thead th {height: 30px;}
.tabinfo tfoot td {height: 30px;}
.tabinfo thead th:nth-child(1) {width: 50px;}
.tabinfo thead th:nth-child(2) {width: 240px;}
.tabinfo thead th:nth-child(3) {width: 240px;}
.tabinfo thead th:nth-child(4) {width: 240px;}
.tabinfo thead th:nth-child(5) {width: 240px;}
.tabinfo thead th:nth-child(6) {width: 100px;}
.tabinfo thead th:nth-child(7) {width: 65px;}
.tabinfo thead th:nth-child(8) {width: 65px;}
.score{ }
</style>
<script type="text/javascript">
$(function(){
		var workorder_id=${workorder_id};
		//alert(workorder_id);
	 $.ajax({
			url:"${pageContext.request.contextPath}/workorder/marking/"+workorder_id,
			type:"POST",
			success:function(result){
			console.log(result);
			build_info(result);	
			build_tab(result);
			}
});	

});	
function build_tab(result){
			var wode=result.extend.wodetails;
			$.each(wode,function(index,item){
			var xhTD=$("<td></td>").append(index+1).append($("<input/>").attr("type","hidden").attr("name","wodetails_id").attr("value",item.wodetails_id));
			var sxTD=$("<td></td>").append(item.wodetails_item);
			var nrTD=$("<td></td>").append(item.wodetails_content)
			var bfTD=$("<td></td>").append(item.wodetails_method)
			var bzTD=$("<td></td>").append(item.wodetails_criteria)
			var sjTD=$("<td></td>").append(item.wodetails_finishDate)
			var qzTD=$("<td></td>").append(item.wodetails_percentage)
			var dfTd=$("<td></td>").append($("<input/>").attr("type","number").addClass("score").attr("value",0).attr("max","100")
			.attr("name","wodetails_points").attr("style","width:100%;height:100%;border:0px"))
			$("<tr></tr>").append(xhTD).append(sxTD).append(nrTD)
			.append(bfTD).append(bzTD).append(sjTD).append(qzTD)
			.append(dfTd).appendTo("#bbsTab");	
			var sumsqz = 0;
			$.each($("#bbsTab tr"), function() {
				sumsqz += parseInt($(this).find("td:eq(6)").text());
			});	
			$("#bbstf tr").find("td:eq(1)").text(sumsqz);
			});
}
function build_info(result){
var workorder=result.extend.workorders
$("<h3></h3>").append(workorder.emp_name+" "+workorder.workOrder_IssuedDate+"工单").appendTo("#firstth");
$("<input/>").attr("type","hidden").attr("name","workOrder_id").attr("value",workorder.workOrder_id).appendTo("#firstth");
}
	 $(document).on("keyup",".score",function() {
			var sumzf = 0;
	 		$.each( $("input[name='wodetails_points']"), function() {
	 				sumzf += parseInt($(this).val());	
			//	alert(sumzf);		
			});		
			$("#workOrder_totalPoints").val(sumzf);
			});
</script>
</head>
<body>
	<div class="rightContent">
			<h1 class="tabTitle">工单打分页面</h1>
		<form action="${pageContext.request.contextPath}/workorder/submit_mark" id="mark_form" method="POST">
				<table cellpadding="0" cellspacing="0" border="0" id="tab">
					<thead>
						<jsp:useBean id="now" class="java.util.Date" scope="page" />
						<tr><th colspan="5" id="firstth"></th>
						</tr>
						<tr><td colspan="5">本月考核重点</td></tr>
					</thead>
					<tbody>
						<tr><td colspan="5">
						<table cellpadding="0" cellspacing="0" border="1"class="tabinfo">
						<thead>
						<tr><th>序号</th><th>事项</th><th>考核内容</th><th>考核办法</th><th>考核标准</th><th>完成时间</th><th>权重</th><th>得分</th></tr>
						</thead>
						<tbody id="bbsTab">
						</tbody>
						<tfoot id="bbstf">
						<tr><td colspan="6">合计</td><td></td><td><input type="number" name="workOrder_totalPoints"
						id="workOrder_totalPoints" style="border:0px;width: 100%;height: 100%;" readonly="readonly" /></td></tr>
						</tfoot>
						</table>
						</td>
						</tr>
					</tbody>
					<tr><td colspan="5">备注：扣分项（总部处罚、教学事故、退费、投诉、重大工作失误）</td></tr>
					<tr><td colspan="5"><input type="submit" value="保存打分" class="searchBotton" id="submit_btn"></td></tr>
				</table>
				</form>
	</div>
</body>
</html>
