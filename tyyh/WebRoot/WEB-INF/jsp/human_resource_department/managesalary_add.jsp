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
    <title>添加调薪信息</title>
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

        /*确定保存弹出框的位置*/
        $(function(){
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
                location.href="managesalary_search.html";
            }
        }
        /*保存读秒结束*/
        

 $(function(){

$("#emp_department").change(function(){
		depart_id();
	});
	
	function depart_id(){
		var depart_id = $("#emp_department").val();
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
		
	function showEmpName(data){
		$("#emp_id").html("");
		
		var str = "";
			
		for(var i = 0;i < data.length;i++){
			str += "<option value=\"" + data[i].emp_id + "\">" + data[i].emp_name + "</option>";
		}
		
		$("#emp_id").html(str);
		
		
		if(str == ""){
			$("#position_id").val("");
		}else{
			emp_id();
		}
	}
	
	function showPosition(data){
		var str = data.position_name;
		var strId = data.emp_position;
		
		$("#hidden").val(strId);
		$("#position_id").val(str);
	}
	
});
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

    <div class="tabContent">
        <h1 class="tabTitle">添加调薪信息</h1>
        <form action="managesalary_add" method="post" >
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
               <tr>
		          <td class="tdWidth">部   门：</td>
		          <td>
		          <input type="hidden" name="emp_department" id="a_emp_department" value="${oaRlzybEmployee.emp_department }"/>
							<select class="selectStyle redBorder"
								onchange="getPositionNames(this)" 
								id="emp_department" style="width:160px;border:none;-webkit-appearance:none;" disabled="disabled">
									<!-- <option>人事部</option> -->
							</select></td>
		        </tr>
		        <tr>
		          <td class="tdWidth">姓   名：</td>
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
                    <td class="tdWidth">调薪前薪资：</td>
                   <td><input type="text" name="salary_adjustment_beforeMoney" class="textStyle" style="width:160px;" placeholder=""  />
                   </td>
                   </tr>
                   
                   <tr>
                    <td class="tdWidth">调薪后薪资：</td>
                   <td><input type="text" name="salary_adjustment_afterMoney" class="textStyle" style="width:160px;" placeholder=""  />
                   </tr>
                    <tr>
                    <td class="tdWidth">调薪原因：</td>
                    <td><input type="text" name="salary_adjustment_reason" class="textStyle" style="width:160px;" placeholder="请输入原因"  />
              		 <tr>
              		   <tr>
                    
                  
                    <td class="tdWidth">详情说明：</td>
                    <td><textarea name="salary_adjustment_explain" class="areaStyle" style="width:360px;"></textarea>
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