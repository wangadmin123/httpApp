<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<input type="hidden" id="path" value="${pageContext.request.contextPath }" />
<meta charset="UTF-8">
<base href="<%=basePath%>">
<title>选项卡模板</title>
<link rel="stylesheet" type="text/css"
	href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css"
	href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css"
	href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/teach_nature_department/css/formStyle.css" />
<link rel="stylesheet" type="text/css"
	href="statics/teach_nature_department/css/add.css" />
<script type="text/javascript"
	src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript"
	src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript"
	src="statics/teach_nature_department/js/tab.js"></script>
<%-- 	<script type="text/javascript"
	src="statics/teach_nature_department/jzb.js/update.js"></script> --%>
		<script type="text/javascript"
	src="statics/teach_nature_department/jzb.js/pinyin.js"></script>
					<link rel="stylesheet" type="text/css"
						href="statics/teach_nature_department/css/popup.css" />
<script type="text/javascript">


var path = $("#path").val();
/* 编辑学员基本信息ajax */
function stuNextStep1() {
	var temp = $("#basicStu").serialize();
	$.post(path+"/modifyStuInfo",temp,editBasicInfo,"text");
}

/* 编辑成功保存按钮变成下一步 */
function editBasicInfo(data){
	$(".student1").css("display","none");
	$(".student2").css("display","block");
}

/* 编辑学员详细信息ajax */
function stuNextStep2() {
	var temp = $("#detailedStu").serialize();
	$.post(path+"/editAdddetailedStuInfo",temp,editdetailedInfo,"text");
}

/* 编辑学员详细信息成功保存按钮变成下一步 */
function editdetailedInfo(data){
	$(".student2").css("display","none");
	$(".student3").css("display","block");
}

/* 编辑学员成员信息ajax */
function editMemberStu() {
	var temp = $("#memberStu").serialize();
	$.post(path+"/editAddMemberStuInfo",temp,editmemberInfo,"text");
}


function editmemberInfo(data){
		window.location.href=path+"/toJzbStudent";
}


/*保存读秒*/
var miao;
var myTime;
$(function(){
	$("#editMemberStu").click(function(){
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
		window.location.href=path+"/oaJzbStudentlist.html";
	}		
}

$(function(){
	//动态加载班级列表
	$.ajax({
		type:"GET",//请求类型
		url:path+"/gradeinfolist",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var gradeinfolist = $("#gradeinfolist").val();
			$("#grades").html("");
			var options = "<option value=\"\">--请选择--</option>";
			for(var i = 0; i < data.length; i++){
				if(gradeinfolist != null && gradeinfolist != undefined && data[i].id == gradeinfolist ){
					options += "<option selected=\"selected\" value=\""+data[i].id+"\" >"+data[i].name+"</option>";
				}else{
					options += "<option value=\""+data[i].id+"\">"+data[i].name+"</option>";
				}
			}
			$("#grades").html(options);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载班级列表失败！");
		}
	
});
});


function shengcheng() {
		//获取输入身份证号码 
		var UUserCard = $("#stuidentity").val();
		//获取出生日期 
		if ($("#stuidentity").val() != "") {
			$("#stubirthday").val(
					UUserCard.substring(6, 10) + "年"
							+ UUserCard.substring(10, 12) + "月"
							+ UUserCard.substring(12, 14) + "日");
		}
		/* 获取年龄 */
		if ($("#stuidentity").val() != "") {
		var date = new Date();
 		var year = date.getFullYear();
 		var birthday_year = parseInt(UUserCard.substr(6,4));
 		var userage= year - birthday_year;
 		$("#stuage").val(userage); 
 		}
	}
	
	
	$(function(){
		//获取输入姓名
		var stuname = $("#stuname").val();
		if( $("#stuname").val() != ""){
		/* 获取拼音 */
			var pinyin = makePy(stuname);
			$("#spellName").val(pinyin);
		}
	});
	
	
	function shengchengpinyin() {
		//获取输入姓名
		var stuname = $("#stuname").val();
		if( $("#stuname").val() != ""){
		/* 获取拼音 */
			var pinyin = makePy(stuname);
			$("#spellName").val(pinyin);
		}
	}
	
	
	/* 验证是否输入为空 */
	function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	if(emp_name_in!=""){$(ww).attr("style","width:160px");};
	}
	
	
	/* 身份证验证 */
	function showidentity(ww){
	var sfzz=/^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""||!sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","border:red 1px solid;width:160px");
	}else if(emp_name_in!=null&&sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","width:160px");
		shengcheng();
	}
	};
	
	
	/* 验证邮政编码格式 */
	function showpostalcode(ww){
	var sfzz=/^[0-9][0-9]{5}$/;
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""||sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","width:160px");
	}else{
		$(ww).attr("style","border:red 1px solid;width:160px");
	}
	};
	
	/* 验证邮箱格式 */
	function showemail(ww){
	var sfzz=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""||sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","width:160px");
	}else{
		$(ww).attr("style","border:red 1px solid;width:160px");
	}
	};
	
	/* 验证手机号格式 */
	function showwcontactway(ww){
	var sfzz=/^1[34578]\d{9}$/;
	var emp_name_in = $(ww).val();	
	if(emp_name_in==null||emp_name_in==""||sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","width:160px");
	}else{
		$(ww).attr("style","border:red 1px solid;width:160px");
	}
	};
	
	/* 验证姓名格式 */
	function showstuName(ww){
	var sfzz=/^[\u4E00-\u9FA5]{1,6}$/;
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""||!sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","border:red 1px solid;width:160px");
	}else if(emp_name_in!=null&&sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","width:160px");
		shengcheng();
	}
	};
	
	
	$(function(){
	//动态加载所学专业
	$.ajax({
		type:"GET",//请求类型
		url:path+"/specialtylist",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var specialtylist = $("#specialtylist").val();
			$("#specialtys").html("");
			var options = "<option value=\"\">--请选择--</option>";
			for(var i = 0; i < data.length; i++){
				if(specialtylist != null && specialtylist != undefined && data[i].specialty_Id == specialtylist ){
					options += "<option selected=\"selected\" value=\""+data[i].specialty_Id+"\" >"+data[i].specialty_name+"</option>";
				}else{
					options += "<option value=\""+data[i].specialty_Id+"\">"+data[i].specialty_name+"</option>";
				}
			}
			$("#specialtys").html(options);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载专业列表失败！");
		}
	
});
});


$(function(){
	//动态加载学历
	$.ajax({
		type:"GET",//请求类型
		url:path+"/educationlist",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var educationlist = $("#educationlist").val();
			$("#educations").html("");
			var options = "<option value=\"\">--请选择--</option>";
			for(var i = 0; i < data.length; i++){
				if(educationlist != null && educationlist != undefined && data[i].id == educationlist ){
					options += "<option selected=\"selected\" value=\""+data[i].id+"\" >"+data[i].education+"</option>";
				}else{
					options += "<option value=\""+data[i].id+"\">"+data[i].education+"</option>";
				}
			}
			$("#educations").html(options);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载学历列表失败！");
		}
	
});
});




$(function(){
	//动态加载信息来源
	$.ajax({
		type:"GET",//请求类型
		url:path+"/infoSourcelist",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var infoSourcelist = $("#infoSourcelist").val();
			$("#infoSources").html("");
			var options = "";
				for(var i = 0; i < data.length; i++){
				if(infoSourcelist != null && infoSourcelist != undefined && data[i].id == infoSourcelist ){
					options += "<option selected=\"selected\" value=\""+data[i].id+"\" >"+data[i].infoSource+"</option>";
				}else{
					options += "<option value=\""+data[i].id+"\">"+data[i].infoSource+"</option>";
				}
			}
			$("#infoSources").html(options);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载专业列表失败！");
		}
});
});



$(function(){
	//动态加载成员关系
	$.ajax({
		type:"GET",//请求类型
		url:path+"/membershiplist",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var membershiplist = $("#membershiplist").val();
			$("#memberships").html("");
			var options = "<option value=\"\">--请选择--</option>";
			for(var i = 0; i < data.length; i++){
				if(membershiplist != null && membershiplist != undefined && data[i].member_Id == membershiplist ){
					options += "<option selected=\"selected\" value=\""+data[i].member_Id+"\" >"+data[i].member+"</option>";
				}else{
					options += "<option value=\""+data[i].member_Id+"\">"+data[i].member+"</option>";
				}
			}
			$("#memberships").html(options);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载专业列表失败！");
		}
	
});
});



$(function(){
	//动态加载缴费方式
	$.ajax({
		type:"GET",//请求类型
		url:path+"/payfeeslist",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var payfeelist = $("#payfeelist").val();
			$("#payfees").html("");
			var options = "";
			for(var i = 0; i < data.length; i++){
				if(payfeelist != null && payfeelist != undefined && data[i].payfees_id == payfeelist ){
					options += "<input type=\"radio\" class=\"radioStyle\" name=\"paymentmethod_id\" value=\""+data[i].payfees_id+"\" checked=\"checked\">"+data[i].payfees_way+"&nbsp;";
				}else{
					options += "<input type=\"radio\" class=\"radioStyle\" name=\"paymentmethod_id\" value=\""+data[i].payfees_id+"\" >"+data[i].payfees_way+"&nbsp;";
				}
			}
			$("#payfees").html(options);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载专业列表失败！");
		}
	
});
});


	/* 出生日期获取年龄格式 */
	function parseDate(str) {
		if (str.match(/^\d{4}[\-\/\s+]\d{1,2}[\-\/\s+]\d{1,2}$/)) {
			return new Date(str.replace(/[\-\/\s+]/i, '/'));
		} else if (str.match(/^\d{8}$/)) {
			return new Date(str.substring(0, 4) + '/' + str.substring(4, 6)
					+ '/' + str.substring(6));
		} else {
			alert('date parse error');
		}
	};
	function getAge(ww) {
		var age;
		//alert(cell);
		var aDate = new Date();
		var thisYear = aDate.getFullYear();
		var thisMonth = aDate.getMonth() + 1;
		var thisDay = aDate.getDate();
		var birth = parseDate($(ww).val());
		//alert(birth);
		var birthy = birth.getFullYear();
		var birthm = birth.getMonth() + 1;
		var birthd = birth.getDate();
		if (thisYear - birthy < 0) {
			alert("输入错误!");
			age = "";
		} else {
			if (thisMonth - birthm < 0) {
				age = thisYear - birthy - 1;
			} else {
				if (thisDay - birthd >= 0) {
					age = thisYear - birthy;
				} else {
					age = thisYear - birthy - 1;
				}
			}
		}

		return (age);

	};
	
	/* 根据出生日期获取年龄 */
	function showbirthday(ww) {
		if($(ww).val() != ""){
		/* 获取年龄 */
			var age = getAge(ww);
			$("#memberage").val(age);
		}
	}
	
	
	
	
	$(function(){
	//动态加载工作状态
	$.ajax({
		type:"GET",//请求类型
		url:path+"/workconditionlist",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var workconditionlist = $("#workconditionlist").val();
			$("#workconditions").html("");
			var options = "";
			for(var i = 0; i < data.length; i++){
				if(workconditionlist != null && workconditionlist != undefined && data[i].workcondition_id == workconditionlist ){
					options += "<input type=\"radio\" class=\"radioStyle\" name=\"workcondition_id\" value=\""+data[i].workcondition_id+"\" checked=\"checked\">"+data[i].workcondition_name+"&nbsp;";
				}else{
					options += "<input type=\"radio\" class=\"radioStyle\" name=\"workcondition_id\" value=\""+data[i].workcondition_id+"\" >"+data[i].workcondition_name+"&nbsp;";
				}
			}
			$("#workconditions").html(options);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载专业列表失败！");
		}
	
});
});



/* 拍照并上传 */
	var imgData = "";
	window
			.addEventListener(
					"DOMContentLoaded",
					function() {
						// Grab elements, create settings, etc.
						var canvas = document.getElementById("canvas"), context = canvas
								.getContext("2d"), video = document
								.getElementById("video"), videoObj = {
							"video" : true
						}, errBack = function(error) {
							console.log("Video capture error: ", error.code);
						};

						// Put video listeners into place
						if (navigator.getUserMedia) {
							// Standard
							navigator.getUserMedia(videoObj, function(stream) {
								video.srcObject = stream;
								video.play();
							}, errBack);
						} else if (navigator.webkitGetUserMedia) {
							// WebKit-prefixed
							navigator.webkitGetUserMedia(videoObj, function(
									stream) {
								video.src = window.webkitURL
										.createObjectURL(stream);
								video.play();
							}, errBack);
						} else if (navigator.mozGetUserMedia) { // Firefox-prefixed
							navigator.mozGetUserMedia(videoObj,
									function(stream) {
										video.src = window.URL
												.createObjectURL(stream);
										video.play();
									}, errBack);
						}
						// Trigger photo take
						document.getElementById("snap").addEventListener(
								"click", function() {
									$("#uploadFile").removeAttr("disabled");
									context.drawImage(video, 0, 0, 209, 209);
									imgData = canvas.toDataURL();
								});

					}, false);
					
	/*  上传个人照片 */
	function uploadPersonPhoto() {
		$("#studentPhoto").css("display","none");
		$("#snapimg").css("display","block");
		var UUserCard = $("#stuidentity").val();
		$("#save").removeAttr("disabled");
		document.getElementById("snapimg").src = imgData;
		var imgRecord = imgData.substr(22);
		$.post(path+"/UploadPersonPhoto", {
			"imgRecord" : imgRecord,
			"UUserCard":UUserCard,
		}, showResult, "text");
	}
	function showResult(data) {
		$("#uploadFile").attr("disabled", "disabled");
	}
	
	
	/*点击显示弹出框*/
	$(function() {
		/*点击显示弹出框*/
            $("#showTakePhotoPage").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");
            });
		/*关闭*/
		$(".closeX").click(function() {
			$(".mbStyle").css("display", "none");
			$(".popupStyle").css("display", "none");
		});
	});
	/*确定保存弹出框的位置*/
	$(function() {
		var saveWidth = $(window).width();
		var saveHeight = $(window).height();
		$(".popupStyle").css("left", saveWidth / 2 - 400);
		$(".popupStyle").css("top", 50);
	});
	
	
</script>
</head>
<body>
		<!-- 拍照弹框 -->
	<div class="mbStyle">&nbsp;</div>
	<div class="popupStyle" style="width: 800px; height: 640px;">
		<h1>
			添加个人照片<span class="closeX">X</span>
		</h1>
		<table class="addTable" border="1" style="width: 650px; height: 460px">
			<tr>
				<td class="tdWidth" style="width: 280px; "><h1>视频区</h1></td>
				<td class="tdWidth"><h1>照片预览区</h1></td>
			</tr>
			<tr>
				<td class="tdWidth"><video align="center" id="video" style="width:460px;"
				 autoplay style="border: solid black 1px"></video></td>
						
				<td class="tdWidth"><canvas align="center"
						style="display:block;border: black solid 1px" id="canvas"
						width="209" height="209"></canvas></td>
			</tr>
			<tr>
				<td class="tdWidth"><input align="center" type="button"
					value="上传" id="uploadFile" onclick="uploadPersonPhoto()"
					disabled="disabled" /></td>
				<td class="tdWidth"><input align="center" type="button"
					value="拍照" id="snap" /></td>
			</tr>
		</table>
	</div>
	<!-- 拍照弹框结束-->
		<!-- 编辑学员基本信息 -->
		<div class="student1">
			<h1 class="tabTitle">编辑学员基本信息</h1>
			<form id="basicStu" method="post" enctype="multipart/form-data">
			
			
			<!-- 隐藏session传过来的stu_Id -->
				<input style="display: none;" type="text" value="${studentInfo.stu_Id }" name="stu_Id"/>
				
				
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth"><font color="red">*</font>班级：</td>
						<td>
						<input type="hidden" value="${studentInfo.grade_id}" id="gradeinfolist" />
						<select  class="ZY_tj" style=" width: 160px; height: 30px;" name="grade_id" id="grades" class="form-control"  required="required"></select>
						</td>
						<td colspan="3"></td>
					</tr>
					
					<tr>
						<td class="tdWidth"><font color="red">*</font>学号：</td>
						<td>
							<input type="text" class="textStyle" style="width:160px;" name="stu_number" value="${studentInfo.stu_number }" readonly="readonly"/>
						</td>
					</tr>
					
					<tr>
						<td class="tdWidth"><font color="red">*</font>姓名：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="stu_name" value="${studentInfo.stu_name }" onblur="shengchengpinyin(),showw(this)" id="stuname"/>
						<!-- 姓名拼音 -->
						<input style="display: none;" name="spellName" id="spellName"/>
						</td>
					</tr>
					
					<tr>
						<td class="tdWidth"><font color="red">*</font>性别：</td>
						
						<c:choose>
							<c:when test="${studentInfo.stu_sex eq '男' }">
								<td><input type="radio" value="男" name="stu_sex" checked="checked" />男
								<input type="radio" value="女" name="stu_sex" />女</td>
							</c:when>
							<c:otherwise>
								<td><input type="radio" value="男" name="stu_sex" />男
								<input type="radio" value="女" name="stu_sex" checked="checked"/>女</td>
							</c:otherwise>
						</c:choose>
					
					</tr>
					<tr>
						<td class="tdWidth"><font color="red">*</font>学生状态：</td>
						<td>
						<select  class="ZY_tj" style=" width: 160px; height: 30px;" name="status_id" class="form-control"  required="required">
						<option value="1" <c:if test="${studentInfo.status_id==1}">selected="selected"</c:if>>在读</option>
						<option value="2" <c:if test="${studentInfo.status_id==2}">selected="selected"</c:if>>毕业</option>
						<option value="3" <c:if test="${studentInfo.status_id==3}">selected="selected"</c:if>>开除</option>
						<option value="4" <c:if test="${studentInfo.status_id==4}">selected="selected"</c:if>>流失</option>
						</select>
						</td>
					</tr>
					<tr>
					<td class="tdWidth"><font color="red">*</font>身份证号：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="ID_number" onblur="showidentity(this)" id="stuidentity" value="${studentInfo.ID_number }"/></td>
					</tr>
					<tr>
						<td class="tdWidth"><font color="red">*</font>出生日期：</td>
						<td><input type="text" class="textStyle" readonly="readonly" id="stubirthday" style="width:160px;" value="${studentInfo.birthday }" name="birthday" /></td>
					</tr>
					
					<tr>
						<td class="tdWidth"><font color="red">*</font>年龄：</td>
						<td><input type="text" class="textStyle" style="width:160px;" readonly="readonly" name="stu_age" id="stuage" value="${studentInfo.stu_age }"/></td>
					</tr>
					
					<tr>
						<td class="tdWidth"><font color="red">*</font>所学专业：</td>
						<td>
						<input type="hidden" value="${studentInfo.specialty_id}" id="specialtylist" />
						<select  class="ZY_tj" style=" width: 160px; height: 30px;" name="specialty_id" id="specialtys" class="form-control"></select>
						</td>
					</tr>
					
					<tr>
						<td class="tdWidth"><font color="red">*</font>微信号：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="wechat" value="${studentInfo.wechat }"/></td>
					</tr>
					
					<tr>
						<td class="tdWidth">现住址：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="present_address" value="${studentInfo.present_address }"/></td>
					</tr>
					
					<tr>
						<td class="tdWidth">邮政编码：</td>
						<td><input type="text" class="textStyle" style="width:160px;" onblur="showpostalcode(this)" name="postalcode" value="${studentInfo.postalcode }"/></td>
					</tr>
					
					<tr>
					<td class="tdWidth">联系方式(学员手机号)：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="contact_way" onblur="showwcontactway(this)" value="${studentInfo.contact_way }"/></td>
					</tr>
	
					
					
					<tr>
						<td class="tdWidth">学生邮箱：</td>
						<td><input type="text" class="textStyle" style="width:160px;" placeholder="E-mail" onblur="showemail(this)" name="e_mail" value="${studentInfo.e_mail }"/></td>
						<td colspan="3"></td>
					</tr>
						<tr>
						<td class="tdWidth">爱好特长：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="hobbys" value="${studentInfo.hobbys }"/></td>

					</tr>
				</table>
				</form>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="button" value="下一步" class="saveBotton" id="stuNextStep1" onclick="stuNextStep1()"/>
				</div>	
			</div>
			
			
			
			
			
			
			
			
			
			
			
			<!-- 编辑学员详细信息 -->
			<div class="student2" style="display: none;">
			<h1 class="tabTitle">编辑学员详细信息</h1>
			<form id="detailedStu" method="post" enctype="multipart/form-data">
			
			
				<!-- 隐藏session传过来的stu_Id -->
				<input style="display: none;" type="text" value="${studentInfo.stu_Id }" name="stu_Id"/>
				
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">

				<tr>
					<td class="tdWidth">学员照片:</td>
					<td align="center">
					<img src="${studentInfo.photograph } " alt="图片丢失" width="209" height="209" id="studentPhoto"/>
					<input type="image" id="snapimg" alt="图片丢失" width="209" height="209" style="border: black solid 1px;display: none;" name="photograph" />
		
					</td>
						<td><input type="button"
							id="showTakePhotoPage"
							value="拍照/上传个人照片"
						/></td>
					<td></td>
				</tr>

				<tr>
						<td class="tdWidth"><font color="red">*</font>学历：</td>
						<td>
						<input type="hidden" value="${studentInfo.education_id}" id="educationlist" />
						<select  class="ZY_tj" style=" width: 160px; height: 30px;" name="education_id" id="educations" class="form-control"  required="required"></select>
						</td>
						
					</tr>
						<tr>
						<td class="tdWidth" style="width:160px;">高中/中专就读学校：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="high_school" value="${studentInfo.high_school }"/></td>
					</tr>
					<tr>
					<td class="tdWidth" style="width:160px;">大专就读学校：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="secondary_school" value="${studentInfo.secondary_school }"/></td>
					</tr>
					<tr>
					<td class="tdWidth">本科就读学校：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="undergraduate_school" value="${studentInfo.undergraduate_school }"/></td>
					</tr>
					<tr>
					<td class="tdWidth">持有证书：</td>
						<td><textarea  class="areaStyle" style="width:560px; margin-bottom: 10px;" name="credentials">${studentInfo.credentials }</textarea></td>
					</tr>
					<tr>
					<td class="tdWidth">工作经历：</td>
						<td><textarea  class="areaStyle" style="width:560px; margin-bottom: 10px;" name="work_experience">${studentInfo.work_experience }</textarea></td>
					</tr>
					<tr>
					<td class="tdWidth">学习经历：</td>
						<td><textarea  class="areaStyle" style="width:560px; margin-bottom: 10px;" name="learning_experience">${studentInfo.learning_experience }</textarea></td>
					</tr>
					<tr>
					<td class="tdWidth">培训经历：</td>
						<td><textarea  class="areaStyle" style="width:560px;" name="training_experience" >${studentInfo.training_experience }</textarea></td>
					</tr>
					<tr>
						<td class="tdWidth">意向就业城市：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="intentional_City" value="${studentInfo.intentional_City }"/></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td class="tdWidth">通讯地址(家庭住址)：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="address" value="${studentInfo.address }"/></td>
					</tr>
					<tr>
					<td class="tdWidth" style="width:160px;">宿舍编号(跑校则不填)：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="dormitory_number" value="${studentInfo.dormitory_number }"/></td>
					</tr>
					<tr>
						<td class="tdWidth"><font color="red">*</font>信息来源：</td>
						<td>
						<input type="hidden" value="${studentInfo.infoSource_id}" id="infoSourcelist" />
						<select  class="ZY_tj" style=" width:160px; height: 30px;" name="infoSource_id" id="infoSources" class="form-control"  required="required"></select>
						</td>
					</tr>
					<tr>
						<td class="tdWidth"><font color="red">*</font>缴费方式：</td>
						<td colspan="5" id="payfees">	
						<input type="hidden" value="${studentInfo.paymentmethod_id}" id="payfeelist" />
						</td>
					</tr>
					<tr>
						<td class="tdWidth">其他说明(备注)：</td>
						<td colspan="5"><textarea  class="areaStyle" style="width:560px;" name="other_help">${studentInfo.other_help }</textarea>
						</td>
					</tr>
				</table>
				</form>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="button" value="下一步" class="saveBotton" id="stuNextStep2" onclick="stuNextStep2()"/>
				</div>

			</div>
			
			
			
			
			
			
			
			<!-- 新增学员家庭信息 -->
			<div class="student3" style="display:none;">
			<h1 class="tabTitle">新增学员家庭信息</h1>
			<form id="memberStu" method="post" enctype="multipart/form-data">
			
			<!-- 隐藏session传过来的stu_Id -->
			<input style="display: none;" type="text" value="${studentInfo.stu_Id }" name="stu_Id"/>
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth"><font color="red">*</font>成员关系：</td>
						<td>
						<input type="hidden" value="${studentInfo.membership_id}" id="membershiplist" />
						<select  class="ZY_tj" style=" width:160px; height: 30px;" name="membership_id" id="memberships" class="form-control"  required="required"></select>
						</td>
						</tr>
						<tr>
						<td class="tdWidth"><font color="red">*</font>成员姓名:</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="memberName" value="${studentInfo.memberName }" onblur="showstuName(this)"/></td>
						</tr>
					<%-- <tr>
						<td class="tdWidth">出生日期：</td>
						<td>
						<input type="date" class="dateStyle" style="width:160px;" name="a_memberBirthday" onblur="showbirthday(this)" value="${studentInfo.memberBirthday }"/>
						<!-- 隐藏 -->
						<input style="display: none;" type="text" name="member_age" id="memberage" value="${studentInfo.member_age }"/>
						</td>
					</tr> --%>
					<tr>
						<td class="tdWidth"><font color="red">*</font>工作状态:</td>
						<td colspan="5" id="workconditions">	
						<input type="hidden" value="${studentInfo.workcondition_id}" id="workconditionlist" />
						</td>
					</tr>
					<tr>
						<td class="tdWidth">工作单位：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="work_unit" value="${studentInfo.work_unit }"/></td>
					</tr>
					<tr>
						<td class="tdWidth">联系方式：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="memberContact_way" value="${studentInfo.memberContact_way }"/></td>
					</tr>
					<tr>
					<td class="tdWidth">备注：</td>
						<td><textarea  class="areaStyle" style="width:560px;" name="member_remarks">${studentInfo.member_remarks }</textarea></td>
					</tr>
				</table>
				</form>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="button" value="保存" class="saveBotton" id="editMemberStu" onclick="editMemberStu()"/>
				</div>
			</div>

	<!--保存-->
	<div class="saveStyle">
		保存成功！（<span class="setTime"></span>）
	</div>
	<!--结束-->
</body>
</html>
