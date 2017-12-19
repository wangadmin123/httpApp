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
#prompt{color:red;font-size: 10px;}
#gray {width: 100%;height: 100%;background: rgba(0, 0, 0, 0.3);position: fixed;top: 0px;display: none;z-index: 99;}
.model {position: fixed;border: 1px solid #e5e5e5;width: 500px;height: auto;padding-top: 30px;display: none;z-index: 9999;	background-color: #fff;	text-align: center;}
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
</style>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/workorder/getemp/${loginUser.position.depart_id}",
			type : "POST",
			success : function(result) {
				//console.log(result);
				$("#empid").empty();
				var emp = result.extend.emps;
				$.each(emp, function(index, item) {
					$("<option>" + item.emp_name + "</option>").attr("value", item.emp_id).appendTo("#empid");
				});
			}
		});
		$("#add_btn").click(function() {
			$("#prompt").html("");
			$("#add_info_form")[0].reset();
			$("#gray").show();
			$("#popup_add").show(); //查找ID为popup的DIV show()显示#gray
			tc_center();
		});

		$("#add_workorder_btn").click(function() {
			var json =createjson();
			var pointer=$("#workOrder_pointer").val();
			var empid=$("#empid").val();
			var percentage=$("#workOrder_percentage").val();

			if(!$(".tabinfo tbody").has('td').length){
			alert("请不要下发空工单");
				return false;
			}
			$.ajax({
				url : "${pageContext.request.contextPath}/workorder/addworkorder",
				type : "POST",
				data:{"pointer":pointer,"empid":empid,"percentage":percentage,"json":json},
				success : function(result) {
				//console.log(result);
				alert(result.extend.remind);
			}
			});
		});

		function close_model() {
			$("#gray").hide();
			$("#popup_add").hide();
		}
		$(".guanbi").click(function() {
			close_model();
			return false;
		});
			$("#add_info_form").submit(function(){
			var item = $("#item").val();
			var content = $("#content").val();
			var method = $("#method").val();
			var criteria = $("#criteria").val();
			var finishDate = $("#finishDate").val();
			var regpercentage=/^([0-9]|[0-9]{2}|100)$/;
			var percentage = parseInt($("#percentage").val());
			var qz=	100-parseInt($("#workOrder_percentage").val());
			if(!regpercentage.test(percentage)){
				$("#prompt").html("权重最大值为100");	
					return false;		
			}
			if(percentage>qz){
				$("#prompt").html("总权重100，您还剩余"+qz+"权重可以分配");	

				return false;		
			}
			var itemtd = $("<td></td>").append(item);
			var contenttd = $("<td></td>").append(content);
			var methodtd = $("<td></td>").append(method);
			var criteriatd = $("<td></td>").append(criteria);
			var finishDatetd = $("<td></td>").append(finishDate);
			var percentagetd = $("<td></td>").append(percentage);
			var cza=$("<a>删除本行<a/>").attr("href","javascript:void(0)").addClass("remove");
			var cztd = $("<td></td>").append(cza);
			$("<tr></tr>").append("<td></td>").append(itemtd)
				.append(contenttd).append(methodtd).append(criteriatd)
				.append(finishDatetd).append(percentagetd).append(cztd).appendTo(".tabinfo tbody");
			num();
			close_model();
			return false;
		});
		function num() {
			var oTable = document.getElementById("bbsTab");
			for (var i = 0; i < oTable.rows.length; i++) {
				oTable.rows[i].cells[0].innerHTML = (i + 1);
			}
			var sumsqz = 0;
			$.each($("#bbsTab tr"), function() {
				sumsqz += parseInt($(this).find("td:eq(6)").text());
			});
			$("#workOrder_percentage").val(sumsqz);
		}
		$(document).on("click",".remove",function() {
	 			$(this).parent().parent().remove();
	 			num();
			});
		function createjson() {
			var tabLen = document.getElementById("bbsTab");
			var jsonT = "[";
			for (var i = 0; i < tabLen.rows.length; i++) {
					if (i == 0) {
						jsonT += "{\"xh\":\"" + tabLen.rows[i].cells[0].
						innerHTML + "\",\"wodetails_item\":\"" + tabLen.rows[i].cells[1].
						innerHTML + "\",\"wodetails_content\":\"" + tabLen.rows[i].cells[2].
						innerHTML + "\",\"wodetails_method\":\"" + tabLen.rows[i].cells[3].
						innerHTML + "\",\"wodetails_criteria\":\"" + tabLen.rows[i].cells[4].
						innerHTML + "\",\"wodetails_finishDate\":\"" + tabLen.rows[i].cells[5].
						innerHTML + "\",\"wodetails_percentage\":\""+tabLen.rows[i].cells[6].innerHTML+"\"}"
					} else {
						jsonT += ",{\"xh\":\"" + tabLen.rows[i].cells[0].
						innerHTML + "\",\"wodetails_item\":\"" + tabLen.rows[i].cells[1].
						innerHTML + "\",\"wodetails_content\":\"" + tabLen.rows[i].cells[2].
						innerHTML + "\",\"wodetails_method\":\"" + tabLen.rows[i].cells[3].
						innerHTML + "\",\"wodetails_criteria\":\"" + tabLen.rows[i].cells[4].
						innerHTML + "\",\"wodetails_finishDate\":\"" + tabLen.rows[i].cells[5].
						innerHTML + "\",\"wodetails_percentage\":\""+tabLen.rows[i].cells[6].innerHTML+"\"}"
				}
			}
			jsonT+="]";
		//	alert(jsonT);
		return jsonT;
		}

		//窗口水平居中
		function tc_center() {
			var _top = ($(window).height() - $(".model").height()) / 2;
			var _left = ($(window).width() - $(".model").width()) / 2;
			$(".model").css({
				top : _top,
				left : _left
			});
		}
	});

</script>
</head>
<body>
	<div class="rightContent">

		<div class="tabContent">
			<h1 class="tabTitle">添加工单</h1>
			<form id="add_workorder">
				<table cellpadding="0" cellspacing="0" border="0" id="tab">
					<thead>
						<jsp:useBean id="now" class="java.util.Date" scope="page" />
						<tr>
							<th colspan="5"><h3>
									（<fmt:formatDate value="${now}" pattern="MM" />）月份工单
								</h3></th>
						</tr>
						<tr>
							<td>${loginUser.position.depart_name}<input type="hidden"
								id="workOrder_pointer" value="${loginUser.emp_id}"></td>
							<td></td>
							<td>岗位：${loginUser.position.position_name}</td>
							<td>${loginUser.name }</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="3">本月考核重点</td>
							<td>发送给：<select id="empid" name="emp_id" class="searchStyle"
								style="width:100px;">
							</select></td>
							<td><button class="searchBotton" id="add_btn" type="button">增加</button></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="5">
								<table cellpadding="0" cellspacing="0" border="1"
									class="tabinfo">
									<thead>
										<tr>
											<th>序号</th>
											<th>事项</th>
											<th>考核内容</th>
											<th>考核办法</th>
											<th>考核标准</th>
											<th>完成时间</th>
											<th>权重</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody id="bbsTab">

									</tbody>
									<tfoot id="bbstf">
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>		<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>
											<td colspan="6">合计</td>
											<td colspan="2"><input type="number"
												id="workOrder_percentage" name="workOrder_percentage"
												style="border:0px;width: 60px;" value="0" readonly="readonly" /></td>
										</tr>
									</tfoot>
								</table>
							</td>
						</tr>
					</tbody>
					<tr>
						<td colspan="5">备注：扣分项（总部处罚、教学事故、退费、投诉、重大工作失误）</td>
					</tr>



				</table>
			</form>

			<div>
				<input type="button" value="保存" class="searchBotton"
					id="add_workorder_btn" />
			</div>



		</div>
	</div>
	<div class="saveStyle">
		保存成功！（<span class="setTime"></span>）
	</div>
	<div id="gray"></div>
	<div class="model" id="popup_add">
		<form id="add_info_form" onsubmit="return false" >
			<table>
				<tr>
					<td>事项</td>
					<td><textarea rows="5" cols="40" id="item" required></textarea></td>
				</tr>
				<tr>
					<td>考核内容</td>
					<td><textarea rows="5" cols="40" id="content" required></textarea></td>
				</tr>
				<tr>
					<td>考核办法</td>
					<td><textarea rows="5" cols="40" id="method" required></textarea></td>
				</tr>
				<tr>
					<td>考核标准</td>
					<td><textarea rows="5" cols="40" id="criteria" required></textarea></td>
				</tr>
				<tr>
					<td>完成时间</td>
					<td><input type="date" class="dateStyle" id="finishDate"
						style="width:300px; height: 30px;" required/></td>
				</tr>
				<tr>
					<td>权重</td>
					<td><input type="number" id="percentage" 
						style="width:100px; height: 30px;" required><span id="prompt">1</span></td>
					
				</tr>
				<tr>
					<td><button class="guanbi searchBotton">关闭</button></td>
					<td><button id="add_info_btn" class="searchBotton" >保存</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
