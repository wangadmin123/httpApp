<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>添加员工基本信息</title>
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
<link rel="stylesheet" type="text/css"
	href="statics/common/css/popup.css" />
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/tab.js"></script>
<script type="text/javascript" src="statics/common/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="statics/human_resource_department/js/getSimpleName.js"></script>
<script type="text/javascript">
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
<style>
* {  /* border: black 1px solid  */ 
	
}
.bold{
 font-weight: bold;
}  


</style>
</head>
<body>
	<div class="rightContent">
		<h1 class="tabTitle">查看员工基本信息</h1>
		<div class="tabContent">
			<!-- <h1 id="tabTitle">基本信息</h1> -->
			<div class="tabs">
				<span class="spanHover">基本信息</span> <span class="spanOut">证件信息</span>
				<span class="spanOut">学习/工作/培训经历/社会关系</span> <span class="spanOut">岗位信息</span>
				<span class="spanOut">紧急联系人信息</span>
			</div>
		<!-- 	<hr style="margin-top:10px;" />
	 	<p style="font-size: 12px;color: red;font-family:"SimSun"; ">操作须知：
			1.填写标记为*号的必填字段 2.拍照上传个人照片3.保存基本信息4.保存其他信息（选填）
		</p>
			<hr style="margin-bottom:10px;" /> -->
			<div class="divTable" id="tab1">
				<form action="Employee/AddEmployee/AddBasicInfo" method="post">
				<input type="hidden"    name="emp_id"   id="emp_id"  value="${oaRlzybEmployee.emp_id}"  />
					<table cellpadding="0" cellspacing="0" border="0" class="addTable"
						style="width: 100%;">
						<tr>
							<td style="width: 90px;" class="bold">姓名：</td>
							<td style="width: 160px;"><input type="text" name="emp_name" id="emp_name"
								onblur="getFirstLettersOfName(this)" class="textStyle redBorder"
								style="width:100px;" value="${oaRlzybEmployee.emp_name }" /></td>
							<td style="width: 100px;" class="bold">身份证号：</td>
							<td colspan="1" style="width: 160px;"><input type="text" name="emp_idcard"
								id="emp_idcard" class="textStyle redBorder"
								style="width:160px;display: inline-block;"
								onblur="getBirthdayAndAge(this)" value="${oaRlzybEmployee.emp_idcard}"/></td>

							<td rowspan="1" colspan="1" align="center"></td>
							<td style="width: 129px;"></td>
							<td></td>
						<tr>
							<td class="bold">性别：</td>
							<td>
							<c:if test="${oaRlzybEmployee.emp_sex eq '男' }">
							<input type="text" value="男" name="emp_sex" 
								class="radioStyle" style="width: 100px;" checked="checked">
							</c:if>
								<c:if test="${oaRlzybEmployee.emp_sex eq '女' }">
							<input
								type="text" value="女" name="emp_sex"   style="width: 100px;"   class="radioStyle" checked="checked" >
							</c:if>
								<input readonly="readonly" type="text" name="emp_name_simple"
								id="simple_name" class="textStyle"
								style="width:160px;border-style: none;display: none;"></td>
							<td class="bold">出生日期：</td>
							<td><input type="text" id="birthday" class="textStyle"
								style="width:160px; border-style: none" readonly="readonly;"></td>
							<td ></td>
							<td colspan="2"  rowspan="4"  ><img id="snapimg" alt="图片丢失"  onerror="javascript:this.src='statics/common/images/loseImageIcon.png' "   src="${oaRlzybEmployee.emp_photo_path }" width="209" height="209" style="border: black solid 1px;"></td>
							<td></td>
							<td></td>
						<tr>
							<td class="bold">学历：</td>
							<td><select name="emp_educational_background"
								style="width:100px;" class="selectStyle redBorder">
								<c:if test="${oaRlzybEmployee.emp_educational_background eq '本科' }">
									<option value="本科" selected="selected">本科</option>
								</c:if>
									<c:if test="${oaRlzybEmployee.emp_educational_background eq '专科' }">
										<option value="专科" selected="selected">专科</option>
								</c:if>
									<c:if test="${oaRlzybEmployee.emp_educational_background eq '高中' }">
								<option value="高中" selected="selected">高中</option>
								</c:if>
								<c:if test="${oaRlzybEmployee.emp_educational_background eq '硕士' }">
								<option value="高中" selected="selected">硕士</option>
								</c:if>
								
									
							</select></td>
							<td class="bold">年龄：</td>
							<td><input type="text" id="age" class="textStyle"
								style="width:160px;border-style: none" readonly="readonly" /></td>
							<td style="width: 90px;"></td>
							<td></td>
<td></td>
<td></td>
						</tr>
						<tr>
							<td class="bold">手机号码：</td>
							<td><input type="tel" name="emp_phone"  value="${oaRlzybEmployee.emp_phone }" class="textStyle redBorder" id="emp_phone"
								style="width:100px;"></td>
							<td class="bold">邮箱：</td>
							<td><input type="email" name="emp_Email" class="textStyle redBorder" value="${oaRlzybEmployee.emp_Email }" id="emp_Email"
								style="width:160px;"></td>
							<td></td>

							<td colspan="1" align="center"><!-- <input type="button"
								height: 30px;"
								id="showTakePhotoPage"
								onclick="confirmEmpIdcard()" value="拍照/上传个人照片"
								 /> --></td>
							<td></td>
<td></td>
						</tr>
						<tr>
							<td class="bold">婚姻状况：</td>
							<td><select name="emp_marital_status" style="width:100px;"
								class="selectStyle redBorder">
								<c:if test="${oaRlzybEmployee.emp_marital_status eq '未婚' }">
								<option value="未婚" selected="selected">未婚</option>
									<option value="已婚">已婚</option>
								</c:if>
										<c:if test="${oaRlzybEmployee.emp_marital_status eq '已婚' }">
								<option value="未婚" >未婚</option>
									<option value="已婚" selected="selected">已婚</option>
								</c:if>
							</select></td>
							<td class="bold">政治面貌：</td>
							<td><select name="emp_political_status" style="width: 160px"
								class="selectStyle redBorder">
								<c:if test="${oaRlzybEmployee.emp_political_status eq '群众' }">
								<option value="群众" selected="selected">群众</option>
									<option value="团员">团员</option>
									<option value="党员">党员</option>
								</c:if>
										<c:if test="${oaRlzybEmployee.emp_political_status eq '团员' }">
								<option value="群众" >群众</option>
									<option value="团员" selected="selected">团员</option>
									<option value="党员">党员</option>
								</c:if>
											<c:if test="${oaRlzybEmployee.emp_political_status eq '党员' }">
								<option value="群众" >群众</option>
									<option value="团员" >团员</option>
									<option value="党员" selected="selected">党员</option>
								</c:if>
							</select></td>
							<td></td>
							<td style="width: 50px;"></td>
							<td style="width: 50px;"></td>
							<td></td>
						</tr>
						<tr>
							<td class="bold">民族：</td>
							<td>
							<input type="hidden" id="a_nation_name" value="${oaRlzybEmployee.nation_name }"/>
							<select name="nation_name" id="nation_name"
								class="selectStyle redBorder" style="width:100px;">
									<option value="满族">满族</option>
									<option value="回族">回族</option>
									<option value="其他少数民族">其他少数民族</option>
							</select></td>
							<td class="bold">微信账号：</td>
							<td><input type="text" name="emp_hobby" class="textStyle" value="${oaRlzybEmployee.emp_hobby }"
								style="width: 160px;" /></td>


							<td style="text-align: center"></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td class="bold">籍贯：</td>
							<td colspan="5">
							<input type="hidden" id="a_emp_province_01" value="${oaRlzybEmployee.emp_province }"/>
							<select name="emp_province"
								onchange="getCityNames(this)" id="emp_province_01"
								mold="province1" class="selectStyle redBorder" style="width:100px;">
							</select><select name="emp_city" id="emp_city_01" onchange="getAreaNames(this)" class="selectStyle redBorder" style="width: 100px;" mold="city1">
								
							</select><select name="emp_county" id="emp_county_01" class="selectStyle redBorder" style="width:100px;">
									
							</select><input type="text" name="emp_origin_detail" class="textStyle redBorder" style="width: 300px;" value="${oaRlzybEmployee.emp_origin_detail }"></td>
							<td>
								<input type="hidden" id="a_emp_city_01" value="${oaRlzybEmployee.emp_city }"/>
							</td>
							<td>
										<input type="hidden" id="a_emp_county_01" value="${oaRlzybEmployee.emp_county }"/>
							</td>
					
							
							
							

						</tr>
						<tr>
							<td class="bold">现住址：</td>
							<td colspan="5">
							<input type="hidden" id="a_emp_province_02" value="${oaRlzybEmployee.emp_now_province }"/>
							<select name="emp_now_province"
								onchange="getCityNames(this)" id="emp_province_02"
								class="selectStyle redBorder" style="width:100px;" mold="province2">
									<!-- 	<option value="山西省">山西省</option>
									<option value="河北省">河北省</option>
									<option value="河南省">河南省</option>
									<option value="浙江省">浙江省</option>
									<option value="广东省">广东省</option>
									<option value="山东省">山东省</option> -->
							</select><select name="emp_now_city" id="emp_city_02" onchange="getAreaNames(this)" class="selectStyle redBorder" style="width: 100px;" mold="city2">
							</select><select id="emp_county_02" name="emp_now_county" class="selectStyle redBorder" style="width:100px;">
									
							</select><input type="text" name="emp_now_detail" class="textStyle redBorder" style="width: 300px;" value="${oaRlzybEmployee.emp_now_detail }"> <!-- <textarea name="emp_address"
									class="areaStyle" style="width:500px;"></textarea> --></td>
							<td>
								<input type="hidden" id="a_emp_city_02" value="${oaRlzybEmployee.emp_now_city }"/>
							</td>
							<td>
									<input type="hidden" id="a_emp_county_02" value="${oaRlzybEmployee.emp_now_county }"/>
							
							
							</td>
							
						
						</tr>
					</table>
					<div class="btposition1">
						<!-- <input type="button" class="buttonStyle" id="saveBasicInfo"
							onclick="saveInfo(this)"  formIndex="0"
							value="保存" /><span></span> -->
					</div>
				</form>
			</div>
			<div class="divTable" style="display:none;" id="tab2">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable"
					id="IdentificationPhoto">
					<tr height="100px">
						<td class="bold" style="width: 100px;">身份证正面:</td>
						<c:choose>
							<c:when test="${oaRlzybEmployee.emp_idcard_front eq '空'}">
								<td></td>
							</c:when>
							<c:otherwise>
								<td style="width: 100px; vertical-align:middle;"><img
									alt="图片丢失" width="100px" height="100px" onerror="javascript:this.src='statics/common/images/loseImageIcon.png' "
									src="${oaRlzybEmployee.emp_idcard_front }"
									style="vertical-align: middle;" /></td>
							</c:otherwise>
						</c:choose>

					</tr>

					<tr height="100px">
						<td class="bold">身份证反面:</td>
						<c:choose>
							<c:when test="${oaRlzybEmployee.emp_idcard_reverse eq '空'}">
								<td></td>
							</c:when>
							<c:otherwise>
								<td><img alt="图片丢失"
									src="${oaRlzybEmployee.emp_idcard_reverse }" width="100px" onerror="javascript:this.src='statics/common/images/loseImageIcon.png' "
									height="100px"  style="vertical-align: middle;"></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr height="100px">
						<td class="bold">学位证:</td>
							<c:choose>
							<c:when test="${oaRlzybEmployee.emp_Degree_certificate eq '空'}">
								<td></td>
							</c:when>
							<c:otherwise>
								<td><img alt="图片丢失" src="${oaRlzybEmployee.emp_Degree_certificate }"  width="100px" height="100px" onerror="javascript:this.src='statics/common/images/loseImageIcon.png' "
							 style="vertical-align: middle;"></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr height="100px">
						<td class="bold">学历证:</td>
						<c:choose>
							<c:when
								test="${oaRlzybEmployee.emp_Education_certificate eq '空'}">
								<td></td>
							</c:when>
							<c:otherwise>
								<td><img alt="图片丢失"
									src="${oaRlzybEmployee.emp_Education_certificate }"
									width="100px" height="100px"  onerror="javascript:this.src='statics/common/images/loseImageIcon.png' "
									style="vertical-align: middle;"></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr height="100px">
					<td class="bold">技术职称列表：  </td>
						<td><c:forEach items="${oaRlzybTechnicalTitleList}" var="oaRlzybTechnicalTitle" >
								<img alt="图片丢失" width="100px" height="100px" onerror="javascript:this.src='statics/common/images/loseImageIcon.png' "
							src="${oaRlzybTechnicalTitle.technical_title_path}" style="vertical-align: middle;">
					</c:forEach>
					</td>
					</tr>
				</table>
			</div>

			<div class="divTable" style="display:none;" id="tab3">
				<form action="Employee/AddEmployee/AddExperienceInfo" method="post">
					<table cellpadding="0" cellspacing="0" border="0" class="addTable"
						id="experience">
						</tr>
						<tr>
							<td class="bold" style="width: 100px;">工作经历：</td>
							<td style="width: 1000px;"><textarea
									name="emp_work_experience" class="areaStyle"  
									style="width:800px;">${oaRlzybEmployee.emp_work_experience}</textarea></td>
						</tr>
						</tr>
						<tr>
							<td class="bold">教育经历：</td>
							<td><textarea name="emp_Education_experience"
									class="areaStyle" style="width:800px;">${oaRlzybEmployee.emp_Education_experience}</textarea></td>
						</tr>
						</tr>
						<tr>
							<td class="bold">培训经历：</td>

							<td><textarea name="emp_train_experience" class="areaStyle"
									style="width:800px;">${oaRlzybEmployee.emp_train_experience}</textarea></td>
						</tr>
						</tr>
						<tr>
							<td class="bold">社会关系：</td>
							<td><textarea name="emp_society_relation" class="areaStyle"
									style="width:800px;">${oaRlzybEmployee.emp_society_relation}</textarea></td>
						</tr>
						<tr>
							<td class="bold">备注：</td>

							<td><textarea name="emp_remarks" class="areaStyle"
									style="width:800px;">${oaRlzybEmployee.emp_remarks}</textarea></td>
						</tr>
					</table>
					<div class="btposition1">
						<!-- <input type="button" class="buttonStyle" onclick="saveInfo(this)"
							formIndex="1" value="保存" /><span></span> -->
					</div>
				</form>

			</div>
			<div class="divTable" style="display:none;" id="tab4">
				<form action="Employee/AddEmployee/AddPositionInfo" method="post">
					<table cellpadding="0" cellspacing="0" border="0" class="addTable">
						<tr>
							<td class="bold" style="width: 100px;">所属部门：</td>
							<td style="width: 190px;">
							<input type="hidden" id="a_emp_department" value="${oaRlzybEmployee.emp_department }"/>
							<select class="selectStyle redBorder"
								onchange="getPositionNames(this)" name="emp_department"
								id="emp_department" style="width:160px;">
									<!-- <option>人事部</option> -->
							</select></td>
							<td class="bold" style="width: 120px;">职位：</td>
							<td style="width: 190px;">
							<input type="hidden" id="a_emp_position" value="${oaRlzybEmployee.emp_position }"/>
							<select class="selectStyle redBorder"
								name="emp_position" id="emp_position" style="width:160px;">
								<!-- 	<option>人事专员</option> -->
							</select></td>
							<td class="bold" style="width: 120px;">用工方式：</td>
							<td style="width: 190px;">
							<c:if test="${oaRlzybEmployee.emp_Employment_nature eq '全职' }">
								<input type="text" value="全职"
								name="emp_Employment_nature" style="width: 100px;"
								checked="checked" />
							</c:if>
							<c:if test="${oaRlzybEmployee.emp_Employment_nature eq '兼职' }">
								  <input
								type="text" value="兼职"  checked="checked" name="emp_Employment_nature"
								style="width: 100px;" /></td>
							</c:if>
						</tr>
						<tr>
							<td class="bold">入职日期：</td>
							<td><input type="date" name="a_emp_Entry_date"
								class="dateStyle redBorder" style="width:160px;" value="${oaRlzybEmployee.emp_Entry_date_str}" /></td>




							<td class="bold">试用结束日期：</td>
							<td><input type="date" name="a_emp_tryout_end_date"
								class="dateStyle redBorder" style="width:160px;" value="${oaRlzybEmployee.emp_tryout_end_date_str}"/></td>

							<td class="bold">目前状态：</td>
							<td>
							<c:if test="${oaRlzybEmployee.emp_now_status eq '在职' }">
								<input type="text" value="在职"  style="width: 100px;"
								name="emp_now_status"  />
							</c:if>
								<c:if test="${oaRlzybEmployee.emp_now_status eq '离职' }">
								<input type="text" value="离职" name="emp_now_status" style="width: 100px;"
								 />
							</c:if>
									<c:if test="${oaRlzybEmployee.emp_now_status eq '停薪留职' }">
								<input type="text" value="停薪留职" name="emp_now_status" style="width: 100px;"
								 />
							</c:if>
							</td>
						</tr>
						<tr>
							<td class="bold">技术职称：</td>
							<td><input type="text" name="emp_technical_title_name"
								class="textStyle" style="width:160px;" value="${oaRlzybEmployee.emp_technical_title_name}"/></td>

							<td class="bold">员工等级：</td>
							<td>
								<input type="hidden" id="a_emp_grade_id" value="${oaRlzybEmployee.emp_grade_id }" />
							<select name="emp_grade_id" id="emp_grade_id"
								class="selectStyle redBorder" style="width:160px;">
									<option value="grade_id">一级</option>
									<option value="grade_id">二级</option>
									<option value="grade_id">三级</option>
									<option value="grade_id">四级</option>
									<option value="grade_id">五级</option>
							</select></td>

							<td class="bold">登记人：</td>
										
							<td>
							<input type="hidden" id="a_emp_registrant" value="${oaRlzybEmployee.emp_registrant }" />
							<select name="emp_registrant" id="emp_registrant"
								class="selectStyle redBorder" style="width:160px;">
									<!-- <option value="emp_registrant">张三</option>
									<option value="emp_registrant">李四</option>
									<option value="emp_registrant">王五</option>
									<option value="emp_registrant">周六</option> -->
							</select></td>
						</tr>
						<tr>
							<td class="bold">工资卡号：</td>
							<td><input type="text" name="emp_salary_cardnumber"
								class="textStyle" style="width:160px;" value="${oaRlzybEmployee.emp_salary_cardnumber }" /></td>
							<td class="bold">医保卡号：</td>
							<td><input type="text"
								name="emp_medical_insurance_cardnumber" class="textStyle"
								style="width:160px;"  value="${oaRlzybEmployee.emp_medical_insurance_cardnumber }" /></td>
							<td class="bold">养老保险卡号：</td>
							<td><input type="text"
								name="emp_endowment_insurance_cardnumber" class="textStyle"
								style="width:160px;"  value="${oaRlzybEmployee.emp_endowment_insurance_cardnumber }" /></td>
						</tr>
					</table>
					<div class="btposition1">
					<!-- 	<input type="button" class="buttonStyle" onclick="saveInfo(this)"
							formIndex="2" value="保存" /><span></span> -->
					</div>
				</form>
			</div>
			<div class="divTable" style="display:none;" id="tab3">
				<form action="Employee/AddEmployee/AddUrgentPersonInfo"
					method="post">
					<table cellpadding="0" cellspacing="0" border="0" class="addTable">
						<tr>
							<td class="bold" style="width: 90px;">姓名：</td>
							<td style="width: 120px;"><input type="text"
								name="emp_contact_name" class="textStyle redBorder"  value="${oaRlzybEmployee.emp_contact_name }"  style="width:100px;"
								 /></td>
							<td class="bold" style="width: 90px;">手机号码：</td>
							<td style="width: 190px;"><input type="text"
								name="emp_contact_phone" class="textStyle redBorder"  value="${oaRlzybEmployee.emp_contact_phone }" style="width:160px;" /></td>

							<td class="bold" style="width: 120px;">与本人关系：</td>
							<td style="width: 270px;"><select
								name="emp_contact_relationship" class="selectStyle redBorder"
								style="width:100px;">
								<c:if test="${oaRlzybEmployee.emp_contact_relationship eq '父子' }">
								<option value="父子" selected="selected">父子</option>
									<option value="母子">母子</option>
									<option value="配偶">配偶</option>
								</c:if>
									<c:if test="${oaRlzybEmployee.emp_contact_relationship eq '母子' }">
								<option value="父子">父子</option>
									<option value="母子" selected="selected">母子</option>
									<option value="配偶">配偶</option>
								</c:if>
									<c:if test="${oaRlzybEmployee.emp_contact_relationship eq '配偶' }">
								<option value="父子">父子</option>
									<option value="母子">母子</option>
									<option value="配偶" selected="selected">配偶</option>
								</c:if>
							</select></td>


						</tr>
						<tr>
							<td class="bold">现住址：</td>

							<td colspan="5">
							
							
							<select name="emp_contact_address_province"
								onchange="getCityNames(this)" id="emp_province_03"
								class="selectStyle redBorder" style="width:100px;" mold="province3">

							</select><select name="emp_contact_address_city" id="emp_city_03" onchange="getAreaNames(this)" class="selectStyle redBorder" style="width: 100px;" mold="city3">

							</select><select id="emp_county_03" name="emp_contact_address_county" class="selectStyle redBorder" style="width:100px;">

							</select><input type="text" name="emp_contact_address_detail" class="textStyle redBorder" style="width:300px;" value="${oaRlzybEmployee.emp_contact_address_detail }"><input type="hidden" id="a_emp_city_03" value="${oaRlzybEmployee.emp_contact_address_city }"><input type="hidden" id="a_emp_county_03" value="${oaRlzybEmployee.emp_contact_address_county }"><input type="hidden" id="a_emp_province_03" value="${oaRlzybEmployee.emp_contact_address_province }"></td>
					
						
						
						</tr>
					</table>
					<div class="btposition1">
						<!-- <input type="button" class="buttonStyle" onclick="saveInfo(this)"
							formIndex="3" value="保存" /><span></span> -->
					</div>
				</form>
			</div>



		</div>
	</div>
	<div class="saveStyle">
		保存成功！（<span class="setTime"></span>）
	</div>


</body>
</html>
