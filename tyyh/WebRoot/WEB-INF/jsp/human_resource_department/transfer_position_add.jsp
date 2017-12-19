<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>添加调岗信息</title>

<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript">
function showPositionList(data) {
		$("#emp_position").html(data);
	}
/* 填充部门表 */
	function showDepartmentList(data) {
		$("#depart_id").html(data);
	}
	function getDepartmentNames() {
        var DepartmentName = $("#a_emp_department").val();
		$.post("Employee/GetDepartmentList",{"DepartmentName":DepartmentName},showDepartmentList, "text");
	}
/* 填充职位表 */
var count=0;
	function getPositionNames(Department) {
	count++;
	var DepartmentId = null;
	var PositionName = null;
	if(count==1){
		 DepartmentId = $("#a_emp_department").val();
		 PositionName = $("#hidden1").val();
	}else{
	DepartmentId = $(Department).val();
	}
		$.post("Employee/GetPositionList", {
			"DepartmentId" : DepartmentId,"PositionName":PositionName
		}, showPositionList, "text");
	}
/*确定保存弹出框的位置*/
$(function(){
	getDepartmentNames();
	getPositionNames();
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);
});


/*保存读秒*/
var miao;
var myTime;
$(function(){
	$(".saveBotton").click(function(){
		miao=2;
		$(".setTime").text(miao);
		$(".saveStyle").css("display","block");
		myTime=setInterval("divHide()",1000);
	   
    });  
});
function divHide(){
	miao--;
	$(".setTime").text(miao);
	if(miao==0){
		clearInterval(myTime);
		$(".saveStyle").hide();
		location.href="transfer_position_search.html";
	}		
}
/*保存读秒结束*/

$(function(){
	
	$("#depart_id").change(function(){
		depart_id();
	});
	
	function depart_id(){
		var depart_id = $("#depart_id").val();
		$.ajax({
			url:"transfer_position_add1?",
			dataType:"JSON",
			data:{
				"depart_id":depart_id
			},
			dataType:"json",
			success:showEmpName,
			error:function(){
				alert("失败");
			}
		});
	}
	
	$("#emp_id").change(function(){
		emp_id();
	});
	
	function emp_id(){
		var emp_id = $("#emp_id").val(); 
		$.ajax({
			url:"transfer_position_add2",
			dataType:"JSON",
			data:{
				emp_id:emp_id
			},
			success:showPosition,
			error:function(){
				alert("失败");
			}
		
		});
	}
	$("#departId").change(function(){
		showDepartment();
	});
	function showDepartment(){
		var departId = $("#departId").val(); 
		$.ajax({
			url:"showDepartment",
			dataType:"JSON",
			data:{
				departId:departId
			},
			success:showDepartmentName,
			error:function(){
				alert("失败");
			}
		
		});
	}
	function showDepartmentName(data){
		$("#positionId").html();
		
		var str = "";
			
		for(var i = 0;i < data.length;i++){
			str += "<option value=\"" + data[i].position_id + "\">" + data[i].position_name + "</option>";
		}
		
		$("#positionId").html(str);
		
	}
	
	function showEmpName(data){
		$("#emp_id").html("");
		
		var str = "";
			
		for(var i = 0;i < data.length;i++){
			str += "<option value=\"" + data[i].emp_id + "\">" + data[i].emp_name + "</option>";
		}
		
		$("#emp_id").html(str);
		
		
		if(str == ""){
			$("#positionName").val("");
		}else{
			emp_id();
		}
	}
	
	function showPosition(data){
		var str = data.position_name;
		var strId = data.emp_position;
		
		$("#hidden1").val(strId);
		$("#positionName").val(str);
	}
	
});

</script>
    <style type="text/css">
    td{
text-align: left;
}
    
    </style>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">添加调岗信息</h1>
      <form action="transfer_position_add" method="post" >
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">原部门：</td>
          <td style="width:160px;">
          <input type="hidden" name="depart_id" id="a_emp_department" value="${oaRlzybEmployee.emp_department }"/>
			<select class="selectStyle redBorder"
				onchange="getPositionNames(this)" name="emp_department"
				id="depart_id" style="border:none;-webkit-appearance:none;" disabled="disabled">
				<!-- <option>人事部</option> -->
			</select>
          </td>
        </tr>
        <tr>
          <td class="tdWidth">姓名：</td>
          <td>
          <input type="hidden" value="${oaRlzybEmployee.emp_id }" name="emp_id" id="emp_id" />
          <input type="text" name="emp_name" id="emp_name" class="textStyle redBorder"
			style="width:100px;border:none;" readonly="readonly" value="${oaRlzybEmployee.emp_name }" onload="emp_id()" />
          </td>
        </tr>
        <tr>
          <td class="tdWidth"><span></span>原岗位：</td>
          <td>
          <input type="hidden"	id="hidden1" name="position" value="${oaRlzybEmployee.emp_position }"/>
			<select class="selectStyle redBorder"
				name="emp_position" id="emp_position" style="border:none;-webkit-appearance:none;" disabled="disabled">
			</select>
        </tr>
        <tr>
          <td class="tdWidth">目标部门：</td>
          <td>
              <select class="selectStyle" name="departId" id="departId" style="width:180px;">
                <c:if test="${oaRlzybDepartments != null}">
	    			<c:forEach var="oaRlzybDepartment" items="${oaRlzybDepartments }" >
	    				<option value="${oaRlzybDepartment.depart_id }">${oaRlzybDepartment.depart_name }</option>
					</c:forEach>
				</c:if>
              </select>
          </td>
        </tr>
        <tr>
          <td class="tdWidth">目标岗位：</td>
          <td>
            <select class="selectStyle" name="positionId" id="positionId" style="width:180px;" >
              <c:if test="${oaRlzybPositions != null}">
	    		<c:forEach var="oaRlzybPosition" items="${oaRlzybPositions }" >
	    			<option value="${oaRlzybPosition.position_id }">${oaRlzybPosition.position_name }</option>
				</c:forEach>
			  </c:if>
            </select>
          </td>
        </tr>
		<tr>
		  <td class="tdWidth">调岗原因：</td>
		  <td><input type="text" name="transfer_position_reason" class="textStyle" style="width:160px;"/></td>
		</tr>
        <tr>
          <td class="tdWidth">详情说明：</td>
          <td>
            <textarea rows="5" cols="50" name="transfer_position_details" id="transfer_position_details"></textarea>
          </td>
        </tr>
        <tr>
          <td class="tdWidth">调岗时间：</td>
          <td>
             <input type="date" name="transfer_position_time" id="transfer_position_time" class="dateStyle"  style="width:160px;" />
          </td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="保存" class="saveBotton" />
	  </div>
     </form> 
</div>
</div>

</body>
</html>
