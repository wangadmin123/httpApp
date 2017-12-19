<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>添加离岗信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>

<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);
	getDepartment();
	getLeaveType();
});


/*保存读秒*/
/* var miao;
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
		location.href="requestleave_search.html";
	}		
} */
/*保存读秒结束*/
</script>
<script type="text/javascript">
	/* 填充部门列表 */
	function getDepartment() {
		$.post("Leave/addDepartment", showDepartment, "text");
	}
	function showDepartment(data) {
		$("#emp_Department").html(data);
	}
	
	/* 填充员工姓名列表 */
	function getEmployeeName(Department) {
		var DepartmentId = $(Department).val();
		$.post("Leave/addEmployee", {
			"DepartmentId" : DepartmentId
		}, showEmployee, "text");
		getEmployeeNameAndPosition(Department);
	}
	function showEmployee(data) {
		$("#emp_Employee").html(data);
	}
	
	
	
	
	
	
		/* 填充批准人姓名列表 */
	function getEmployeeNameAndPosition(Department) {
		var DepartmentId = $(Department).val();
		$.post("Leave/addEmployeeContainPosition", {
			"DepartmentId" : DepartmentId
		}, showEmployeeContainPosition, "text");
	}
	function showEmployeeContainPosition(data) {
		$("#leave_approver").html(data);
	}
	
	
	
	
	
	
	
	
	
	
	/* 填充员工对应岗位名称 */
	function getPosition(Position) {
		var PositionId = $(Position).val();
		$.post("Leave/addPosition", {
			"PositionId" : PositionId
		}, showPosition, "text");
	}
	function showPosition(data) {
		$("#emp_position").val(data);
	}
	
	
	/* 填充离岗类型 */
	function getLeaveType() {
		$.post("Leave/addLeaveType", showLeaveType, "text");
		
	}
	function showLeaveType(data) {
		/* alert(data); */
		$("#leave_type").html(data);
	}
	
	/* 计算合计天数 */
	function getTotalDays(){
	var leave_type = $("#leave_type").val();
	var a_leave_startDate = null;
	var a_leave_endDate = null;
	if(leave_type=="外出"){
		 a_leave_startDate = $("#a_leave_startDate").val();
		 a_leave_endDate = $("#a_leave_endDate").val();
	}else{
	a_leave_startDate = $("#a_leave_startDate1").val();
		 a_leave_endDate = $("#a_leave_endDate1").val();
	}

	/* alert(a_leave_startDate); */
	
	/* alert(a_leave_endDate); */
	    /* alert(a_leave_startDate); */
		/* alert(a_leave_endDate); */
		$.post("Leave/addLeaveAllInfo/CountDays",{"a_leave_startDate":a_leave_startDate,"a_leave_endDate":a_leave_endDate,"leave_type":leave_type} ,showTotalDays, "text");
	}
	function showTotalDays(data) {
		/* alert(data); */
		$("#totalDays").val(data);
		if(data=="0"){
		$("#errorMessage").html("您所填的请假日期有误！截止日期不能在起始日期前面!");
		}else{
		$("#errorMessage").html("");
		$("#totalDays").val(data);
		}
	}
	
	
	/* 保存离岗原因(保存所有可以保存的字段) */
	function saveOaRlzybLeave() {
		var condition = $("#oaRlzybLeaveInfo").serialize();
		 $.post("Leave/addLeaveAllInfo/SaveAllInfo",condition,showLeaveReason, "text"); 
	}
	function showLeaveReason(data) {
		/* alert(data); */
		if(data=="1"){
		NewPage("skiptopage/topage/requestleave_search");
		}else if(data=="1"){
		alert("没有进行任何操作！");
		}else{
			alert("添加离岗信息失败！");
		}
	}
	
	function showDifferentMenu(leaveType){
		if($(leaveType).val()=="外出"){
		$("input[type='date']").attr("disabled","disabled").hide();
				$("input[type='datetime-local']").removeAttr("disabled").show();
		}else{
				$("input[type='datetime-local']").attr("disabled","disabled").hide();
				$("input[type='date']").removeAttr("disabled").show();
		}
	}
	/*确定保存弹出框的位置*/
	$(function() {
	 	getNationNames();
		getProvinceNames();
		getCityNames();
		getAreaNames();
		getDepartmentNames(); 
		getPositionNames();
		 getGradeNames(); 
		getRegistrantNames();
		getBirthdayAndAge();
			$("form input[type='text']").add("form input[type='tel']").add("form input[type='email']").css({"borderStyle":"none","backgroundColor":"white"}); 
		$("form input").attr("readonly","readonly"); 
	   $("form input").attr("disabled","disabled"); 
	   $("form select").attr("readonly","readonly"); 
	   $("form select").attr("disabled","disabled");
	    $("form textarea").attr("readonly","readonly"); 
	   $("form textarea").attr("disabled","disabled");
	      $("form textarea").css({"backgroundColor":"white"});
	        $("form select").css({"borderColor":"white","appearance":"none","-moz-appearance":"none","-webkit-appearance":"none","background":"white","paddingRight":"14px"});
	        $("form input[type='date']").css({"borderColor":"white","appearance":"none","-moz-appearance":"none","-webkit-appearance":"none","background":"white","paddingRight":"14px"});
	});
	var count=0;
	/* 获取出生日期及年龄 并给对应标签赋值*/
	var count1 = 0;
	function getBirthdayAndAge(emp_idcardTag) {
    count1++;
	var emp_idcard_val = $(emp_idcardTag).val();
	if(count1==1){
	emp_idcard_val = $("#emp_idcard").val();
		var birthday_year = emp_idcard_val.substring(6, 10);
					var birthday_month = emp_idcard_val.substring(10, 12);
					var birthday_day = emp_idcard_val.substring(12, 14);
					$("#birthday").val(
							birthday_year + "-" + birthday_month + "-"
									+ birthday_day);
					var current_year = new Date().getFullYear();
					$("#age").val(current_year - birthday_year);
	}else{}
	}
</script>
<script type="text/javascript">
	/* 填充名族列表 */
	function getNationNames() {
	var nationName = $("#a_nation_name").val();
		$.post("Employee/GetNationList",{"nationName":nationName}, showNationList, "text");
	}
	function showNationList(data) {
		$("#nation_name").html(data);
	}
	/* 填充省列表 */
	function getProvinceNames() {
	        var ProvinceId = $("#a_emp_province_01").val();
		$.post("Employee/GetProvinceList",{"ProvinceId":ProvinceId},showProvinceList1, "text");
			 ProvinceId = $("#a_emp_province_02").val();
		$.post("Employee/GetProvinceList",{"ProvinceId":ProvinceId},showProvinceList2, "text");
			 ProvinceId = $("#a_emp_province_03").val();
		$.post("Employee/GetProvinceList",{"ProvinceId":ProvinceId},showProvinceList3, "text");
	}
	function showProvinceList1(data) {
		$("#emp_province_01").html(data);
	}
		function showProvinceList2(data) {
	
		$("#emp_province_02").html(data);
	}
		function showProvinceList3(data) {
	
		$("#emp_province_03").html(data);
	}
	/* 填充市列表 */
	function getCityNames(Province) {
		var ProvinceId = $(Province).val();
        var mold = $(Province).attr("mold");
		/* 	alert(mold); */
		if (ProvinceId == undefined) {
			ProvinceId = null;
		}
		if (mold == undefined) {
		     ProvinceId = $("#a_emp_province_01").val();
		    var cityName = $("#a_emp_city_01").val();
			$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId,"cityName":cityName
			}, showCityList1, "text");
			cityName = $("#a_emp_city_02").val();
				     ProvinceId = $("#a_emp_province_02").val();
				$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId,"cityName":cityName
			}, showCityList2, "text");
			cityName = $("#a_emp_city_03").val();
				 ProvinceId = $("#a_emp_province_03").val();
				$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId,"cityName":cityName
			}, showCityList3, "text");
		} else if (mold == "province1") {
			$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId
			}, showCityList1, "text");
		} else if (mold == "province2") {
			$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId
			}, showCityList2, "text");
		} else if (mold == "province3") {
			$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId
			}, showCityList3, "text");
		}

	}
	function showCityList1(data) {
		$("#emp_city_01").html(data);
	}
	function showCityList2(data) {
		$("#emp_city_02").html(data);
	}
	function showCityList3(data) {
		$("#emp_city_03").html(data);
	}
	/* 填充区县列表 */
	function getAreaNames(City) {
		var CityId = $(City).val();
		var mold = $(City).attr("mold");
		if (CityId == undefined) {
			CityId = null;
		}
		if (mold == undefined) {
		 CityId = $("#a_emp_city_01").val();
		var CountyName = $("#a_emp_county_01").val();
			$.post("Employee/GetAreaList", {
				"CityId" : CityId,"CountyName":CountyName
			}, showAreaList1, "text");
					 CityId = $("#a_emp_city_02").val();
		 CountyName = $("#a_emp_county_02").val();
			$.post("Employee/GetAreaList", {
				"CityId" : CityId,"CountyName":CountyName
			}, showAreaList2, "text");
					 CityId = $("#a_emp_city_03").val();
	  CountyName = $("#a_emp_county_03").val();
			$.post("Employee/GetAreaList", {
				"CityId" : CityId,"CountyName":CountyName
			}, showAreaList3, "text");
		} else if (mold == "city1") {
			$.post("Employee/GetAreaList", {
				"CityId" : CityId
			}, showAreaList1, "text");
		} else if (mold == "city2") {
			$.post("Employee/GetAreaList", {
				"CityId" : CityId
			}, showAreaList2, "text");
		} else if (mold == "city3") {
			$.post("Employee/GetAreaList", {
				"CityId" : CityId
			}, showAreaList3, "text");
		}
	

	}
	function showAreaList1(data) {
		$("#emp_county_01").html(data);
	}
	function showAreaList2(data) {
		$("#emp_county_02").html(data);
	}
	function showAreaList3(data) {
		$("#emp_county_03").html(data);
	}
	/* 填充部门表 */
	function getDepartmentNames() {
        var DepartmentName = $("#a_emp_department").val();
		$.post("Employee/GetDepartmentList",{"DepartmentName":DepartmentName},showDepartmentList, "text");
	}
	function showDepartmentList(data) {
		$("#emp_department").html(data);

	}
	/* 填充职位表 */
	function getPositionNames(Department) {
	count++;
	var DepartmentId = null;
	var PositionName = null;
	if(count==1){
		 DepartmentId = $("#a_emp_department").val();
		 PositionName = $("#a_emp_position").val();
	}else{
	DepartmentId = $(Department).val();
	}
		$.post("Employee/GetPositionList", {
			"DepartmentId" : DepartmentId,"PositionName":PositionName
		}, showPositionList, "text");
	}
	function showPositionList(data) {
		$("#emp_position").html(data);

	}
	/* 填充员工等级列表 */
	function getGradeNames() {
	    var GradeName = $("#a_emp_grade_id").val();
		$.post("Employee/GetGradeList",{"GradeName":GradeName},showGradeList, "text");
	}
	function showGradeList(data) {
		$("#emp_grade_id").html(data);

	}
	/* 填充登记人列表 */
	function getRegistrantNames() {
	    var RegistrantName = $("#a_emp_registrant").val();
	   /*  alert(RegistrantName); */
		$.post("Employee/GetRegistrantList",{"RegistrantName":RegistrantName},showRegistrantList, "text");
	}
	function showRegistrantList(data) {
	/* 	alert(data);  */ 
		$("#emp_registrant").html(data);
	}
	
</script>
</head>
<body>
<div class="rightContent">

  
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>


</body><div class="tabContent">
    <h1 class="tabTitle">添加离岗信息</h1>
      <form action="leave/leave_add" id="oaRlzybLeaveInfo" method="post">

		<table cellpadding="0" cellspacing="0" border="0" class="addTable">
			<tr>
				<td class="tdWidth">部门：</td>
				<td>
		          <input type="hidden" name="emp_Department" id="a_emp_department" value="${oaRlzybEmployee.emp_department }"/>
							<select class="selectStyle redBorder"
								onchange="getPositionNames(this)" 
								id="emp_department" style="width:160px;border:none;-webkit-appearance:none;" disabled="disabled">
									<!-- <option>人事部</option> -->
							</select></td>
			</tr>
			<tr>
				<td class="tdWidth">姓名：</td>
				<td>
		          <input type="hidden" name="emp_id" id="a_emp_department" value="${oaRlzybEmployee.emp_id }"/>
		          <select class="selectStyle" id="emp_id" style="width:160px;border:none;-webkit-appearance:none;" disabled="disabled">
		                  <option value="${oaRlzybEmployee.emp_id}">${oaRlzybEmployee.emp_name }</option>
		              </select>
		          </td>
			</tr>
			<tr>
				<td class="tdWidth"><span></span>岗位：</td>
				<td>
		          <input type="hidden" name="position_id" id="a_emp_position" value="${oaRlzybEmployee.emp_position}"/>
							<select class="selectStyle redBorder"
								 id="emp_position" style="width:160px;border:none;-webkit-appearance:none;" disabled="disabled">
								<!-- 	<option>人事专员</option> -->
							</select></td>
			</tr>
			<tr>
				<td style="text-align: right;" >类型：</td>
				<td><select name="leave_type" id="leave_type" onchange="showDifferentMenu(this)"
					class="selectStyle" style="width:120px;">
						<!-- <option>病假</option>
	                <option>事假</option>
	                <option>年假</option>
	                <option>调休</option>
	                <option>婚假</option>
	                <option>丧假</option>
	                <option>产假</option>
	                <option>外出</option> -->
				</select></td>
			</tr>
			<tr>
				<td class="tdWidth">起始日期：</td>
				<td><input name="a_leave_startDate" id="a_leave_startDate"
					type="datetime-local" class="dateStyle"   disabled="disabled"   style="width:230px;display: none;">
					
					<input name="a_leave_startDate" id="a_leave_startDate1"
					type="date" class="dateStyle" style="width:230px;">
					
					</td>
			</tr>
			<tr>
				<td class="tdWidth">截止日期：</td>
				<td><input name="a_leave_endDate" id="a_leave_endDate"
					onchange="getTotalDays()" type="datetime-local" class="dateStyle"  disabled="disabled"
					style="width:230px;display: none;">
					
					<input name="a_leave_endDate" id="a_leave_endDate1"
					onchange="getTotalDays()" type="date" class="dateStyle"
					style="width:230px;">
					
					
					</td>
			</tr>
			<tr>
				<td class="tdWidth"><span></span>合计：</td>
				<td><input type="text" name="" id="totalDays" class="textStyle"
					style="width:160px;border-style: none" readonly=""><span
					id="errorMessage" style="color: red;"></span></td>
			</tr>
			<tr>
				<td class="tdWidth">离岗原因：</td>
				<td><textarea name="leave_reason" class="areaStyle"
						style="width:360px;"></textarea></td>
			</tr>
			<tr>
				<td class="tdWidth">批准人：</td>
				<td>
				<input type="text" name="leave_approver" id="leave_approver" class="selectStyle" style="width:120px;" value="${loginUser.emp_name }" readonly="readonly">
				
				</td>
			</tr>
			
		</table>
		<h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" onclick="saveOaRlzybLeave()" id="saveAllInfos" value="保存" class="saveBotton">
	  </div>
     </form>  

   
</div>
</html>
