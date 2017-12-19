<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<input type="hidden" id="path" value="${pageContext.request.contextPath }" />
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <meta content="telephone=no" name="format-detection" />
<title>添加学生信息</title>
	<link rel="stylesheet" type="text/css"
		href="statics/teach_nature_department/css/index.css">
		<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
			<link rel="stylesheet" type="text/css"
				href="statics/teach_nature_department/css/all.css">
				<link rel="stylesheet" type="text/css"
					href="statics/teach_nature_department/css/zt.css">
					<link rel="stylesheet" type="text/css"
						href="statics/teach_nature_department/css/formStyle.css" />
					<link rel="stylesheet" type="text/css"
						href="statics/teach_nature_department/css/add.css" />
					<link rel="stylesheet" type="text/css"
						href="statics/teach_nature_department/css/popup.css" />
					<script type="text/javascript"
						src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
					<script type="text/javascript"
						src="statics/teach_nature_department/js/globle.js"></script>
					<script type="text/javascript"
						src="statics/teach_nature_department/js/tab.js"></script>
					<script type="text/javascript"
						src="statics/teach_nature_department/jzb.js/pinyin.js"></script>
<script type="text/javascript">


var path = $("#path").val();


/* 添加学员基本信息ajax */
function stuNextStep1() {
	var temp = $("#basicStu").serialize();
	$.post(path+"/addStuInfo",temp,addBasicInfo,"text");
	
}

/* 添加成功保存按钮变成下一步 */
function addBasicInfo(data){
	$(".student1").css("display","none");
	$(".student2").css("display","block");
}

/* 添加学员详细信息ajax */
function stuNextStep2() {
	var temp = $("#detailedStu").serialize();
	$.post(path+"/modifyAdddetailedStuInfo",temp,adddetailedInfo,"text");
	
}

/* 添加学员详细信息成功保存按钮变成下一步 */
function adddetailedInfo(data){
	$(".student2").css("display","none");
	$(".student3").css("display","block");
}


/* 添加学员成员信息ajax */
function addMemberStu() {
	var temp = $("#memberStu").serialize();
	$.post(path+"/modifyAddMemberStuInfo",temp,addmemberInfo,"text");
}


function addmemberInfo(data){
		window.location.href=path+"/toJzbStudent";
}

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
	
	function shengchengpinyin() {
		//获取输入姓名
		var stuname = $("#stuname").val();
		if( $("#stuname").val() != ""){
		/* 获取拼音 */
			var pinyin = makePy(stuname);
			$("#spellName").val(pinyin);
		}
	}
	
	/* 验证是否为空 */
	function showw(ww){
	var emp_name_in = $(ww).val();
		if(emp_name_in==null||emp_name_in==""||ww.value.replace(/(^\s*)|(\s*$)/g, "")==""){
				$(ww).attr("style","border:red 1px solid;width:160px");
			}
		if(ww.value.replace(/(^\s*)|(\s*$)/g, "")!=""){$(ww).attr("style","width:160px");};
			
	}
		
	
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
	
	
	/* 验证身份证格式 */
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
	/*
		显示上传文件标签的值	
	*/
	function showFilePath(file) {
				var r= new FileReader(); 
				f=document.getElementById("file").files[0]; 
				r.readAsDataURL(f); 
				r.onload=function  (e) { 
				document.getElementById("snapimg").src=this.result;
				};
				var filePath = $(file).val();
				$(file).prev().val(filePath)
				var UUserCard = $("#stuidentity").val();
				var imgRecord = filePath.substr(12);
				$.post(path+"/UploadPersonPhoto", {
					"imgRecord" : imgRecord,
					"UUserCard":UUserCard,
				}, showResult, "text");
			}
	function uploadPersonPhoto() {
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
	
	
	
	/* 验证是否为空，是空保存按钮不能按 */
	function check(form) {
		var stunameValue = window.document.getElementById("stuname").value;
		var nameValue = window.document.getElementById("stuidentity").value;
		var specialtyValue = window.document.getElementById("specialty").value;
		var wechatValue = window.document.getElementById("wechat").value;
		if (stunameValue=="" || nameValue == "" || specialtyValue == "" || wechatValue == "") {
			document.getElementById("stuNextStep1").disabled = true;
			return false;
		} else {

			document.getElementById("stuNextStep1").disabled = false;
		}

		return true;
	}
	$(function() {
		var stunameValue = window.document.getElementById("stuname").value;
		var nameValue = window.document.getElementById("stuidentity").value;
		var specialtyValue = window.document.getElementById("specialty").value;
		var wechatValue = window.document.getElementById("wechat").value;
		if (stunameValue=="" || nameValue == "" || specialtyValue == "" || wechatValue == "") {
			document.getElementById("stuNextStep1").disabled = true;
			return false;
		}
	});
	
	
	
	
	
	/* 验证是否为空，是空是保存按钮不能按 */
	function checkInfo(form) {
		var educationValue = window.document.getElementById("education").value;
		var infosourceValue = window.document.getElementById("infosource").value;
		var payfeesValue = window.document.getElementById("payfees").value;
		if (educationValue == "" || infosourceValue == "" || payfeesValue == "") {
			document.getElementById("stuNextStep2").disabled = true;
			return false;
		} else {
			document.getElementById("stuNextStep2").disabled = false;
		}

		return true;
	}
	$(function() {
		var educationValue = window.document.getElementById("education").value;
		var infosourceValue = window.document.getElementById("infosource").value;
		var payfeesValue = window.document.getElementById("payfees").value;
		if (educationValue == "" || infosourceValue == "" || payfeesValue == "") {
			document.getElementById("stuNextStep2").disabled = true;
			return false;
		}
	});
	
	
	
	
	
	
	/* 验证是否为空，是空是保存按钮不能按 */
	function checkMember(form) {
		var nameValue = window.document.getElementById("member").value;
		var memberNameValue = window.document.getElementById("memberName").value;
		var workconditionValue = window.document.getElementById("workcondition").value;
		if (nameValue == "" || memberNameValue == "" || workconditionValue == "") {
			document.getElementById("addMemberStu").disabled = true;
			return false;
		} else {

			document.getElementById("addMemberStu").disabled = false;
		}

		return true;
	}
	$(function() {
		var nameValue = window.document.getElementById("member").value;
		var memberNameValue = window.document.getElementById("memberName").value;
		var workconditionValue = window.document.getElementById("workcondition").value;
		if (nameValue == "" || memberNameValue == "" || workconditionValue == "") {

			document.getElementById("addMemberStu").disabled = true;
			return false;
		}
	});
</script></head>
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
					value="拍照" id="snap" /></td>
				<td class="tdWidth"><input align="center" type="button"
					value="上传" id="uploadFile" onclick="uploadPersonPhoto()"
					disabled="disabled" /></td>
			</tr>
		</table>
	</div>
	<!-- 拍照弹框结束-->
	
		<div class="student1">
			<h1 class="tabTitle">新增学员基本信息</h1>
			<!-- <div class="divTable"> -->
			<form id="basicStu" method="post" enctype="multipart/form-data">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth"><font color="red">*</font>班级：</td>
						<td><select class="ZY_tj" style=" width:160px; height: 30px;"
							name="grade_id">
								<option value="">--请选择--</option>
								<c:if test="${grades != null }">
									<c:forEach var="grade" items="${grades}">
										<option
											<c:if test="${grade.id == queryGrade }">selected="selected"</c:if>
											value="${grade.id}">${grade.name}</option>
									</c:forEach>
								</c:if>
						</select></td>
					</tr>
					
					<tr>
						<td class="tdWidth"><font color="red">*</font>学号：</td>
						<td>
							<input type="text" class="textStyle" style="width:160px;" name="stu_number" onblur="showw(this)"/>
						</td>
					</tr>
					
					<tr>
						<td class="tdWidth"><font color="red">*</font>姓名：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="stu_name" onblur="shengchengpinyin(),showw(this),showstuName(this)" oninput="check(this)" id="stuname"/>
				
						<!-- 姓名拼音 -->
						<input style="display: none;" name="spellName" id="spellName"/>
						
						</td>
					</tr>
					<tr>
					<td class="tdWidth"><font color="red">*</font>性别：</td>
						<td><input type="radio" value="男" name="stu_sex" checked="checked"/>男
						<input type="radio" value="女" name="stu_sex"/>女</td>
					</tr>
					<tr>
					<td class="tdWidth"><font color="red">*</font>身份证号：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="ID_number" onblur="showidentity(this)" id="stuidentity" oninput="check(this)"/></td>
					</tr>
					<tr>
					<td class="tdWidth"><font color="red">*</font>出生日期：</td>
						<td><input type="text" class="textStyle" readonly="readonly" name="birthday" id="stubirthday" style="width:160px;"/></td>
					</tr>
					<tr>
						<td class="tdWidth"><font color="red">*</font>年龄：</td>
						<td><input type="text" class="textStyle" style="width:160px;" id="stuage" readonly="readonly" name="stu_age" /></td>
					</tr>
					<tr>
					<td class="tdWidth"><font color="red">*</font>所学专业：</td>
						<td><select class="ZY_tj" style=" width:160px; height: 30px;" name="specialty_id" id="specialty" oninput="check(this)">
								<option value="">--请选择--</option>
								<c:if test="${grades != null }">
									<c:forEach var="specialty" items="${specialtys}">
										<option
											<c:if test="${specialty.specialty_Id == specialty_id }">selected="selected"</c:if>
											value="${specialty.specialty_Id}">${specialty.specialty_name}</option>
									</c:forEach>
								</c:if>
						</select></td>
						
					</tr>
					<tr>
					<td class="tdWidth"><font color="red">*</font>微信号：</td>
						<td><input type="text" class="textStyle" style="width:160px;" onblur="showw(this)" name="wechat" id="wechat" oninput="check(this)"/></td>
					</tr>
					<tr>
						<td class="tdWidth">现住址：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="present_address"/></td>
					</tr>
					<tr>
						<td class="tdWidth">邮政编码：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="postalcode" onblur="showpostalcode(this)"/></td>
					</tr>

					
					
					<tr>
						<td class="tdWidth" style="width: 160px;">联系方式(学员手机号)：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="contact_way" onblur="showwcontactway(this)"/></td>
					</tr>
					
					<tr>
						<td class="tdWidth">学生邮箱：</td>
						<td><input type="text" class="textStyle" style="width:160px;" placeholder="E-mail" name="e_mail" onblur="showemail(this)"/></td>
						<td colspan="3"></td>
					</tr>
						<tr>
						<td class="tdWidth">爱好特长：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="hobbys"/></td>
					</tr>
				</table>
				</form>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<!-- <input type="button" value="保存" class="saveBotton" id="addBasicStu" onclick="addBasicStu()"/> -->
					<input type="button" value="下一步" class="saveBotton" id="stuNextStep1" onclick="stuNextStep1()"/>
				</div>
			</div>
			
			
			<!-- 新增学员详细信息 -->
			<div class="student2" style="display: none;">
			<h1 class="tabTitle">新增学员详细信息</h1>
			<form id="detailedStu" method="post" enctype="multipart/form-data">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
				<tr>
					<td class="tdWidth">学员照片:</td>
					<td align="center"><input type="image"
								id="snapimg" alt="图片丢失" width="209" height="209"
								style="border: black solid 1px;" name="photograph" /></td>
						<td><input type="button"
							id="showTakePhotoPage"
							value="拍照/上传个人照片"
						/><br /><input
							type="text" class="textStyle" id="imgUrl" style="width: 300px" placeholder="请上传格式为：jpg,png,jpeg,pdf的文件" />
							<input name="a_emp_idcard_front" type="file" id="file"
							onchange="showFilePath(this)" />
					<td></td>
				</tr>
				
					<tr>
						<td class="tdWidth" style=" width:160px; height: 30px;"><font color="red">*</font>学历：</td>
						<td><select class="ZY_tj" style=" width:160px; height: 30px;" name="education_id" id="education" oninput="checkInfo(this)" >
								<c:if test="${grades != null }">
									<c:forEach var="education" items="${educations}">
										<option
											<c:if test="${education.id == education_id }">selected="selected"</c:if>
											value="${education.id}">${education.education}</option>
									</c:forEach>
								</c:if>
						</select></td>
						
					</tr>
					<tr>
						<td class="tdWidth" style="width:160px;">高中/中专就读学校：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="high_school"/></td>
						
					</tr>
					<tr>
					<td class="tdWidth" style="width:160px;">大专就读学校：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="secondary_school"/></td>
					</tr>
					<tr>
					<td class="tdWidth">本科就读学校：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="undergraduate_school"/></td>
					</tr>
					<tr>
					<td class="tdWidth">持有证书：</td>
						<td><textarea  class="areaStyle" style="width:560px; margin-bottom: 10px;" name="credentials" ></textarea></td>
					</tr>
					<tr>
					<td class="tdWidth">工作经历：</td>
						<td><textarea  class="areaStyle" style="width:560px; margin-bottom: 10px;" name="work_experience"></textarea></td>
					</tr>
					<tr>
					<td class="tdWidth">学习经历：</td>
						<td><textarea  class="areaStyle" style="width:560px; margin-bottom: 10px;" name="learning_experience"></textarea></td>
					</tr>
					<tr>
					<td class="tdWidth">培训经历：</td>
						<td><textarea  class="areaStyle" style="width:560px;" name="training_experience"></textarea></td>
					</tr>
					<tr>
						<td class="tdWidth">意向就业城市：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="intentional_City"/></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td class="tdWidth">通讯地址(家庭住址)：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="address"/></td>
					</tr>
					<tr>
					<td class="tdWidth" style="width:160px;">宿舍编号(跑校则不填)：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="dormitory_number"/></td>
					</tr>
					<tr>
					<td class="tdWidth" style=" width:160px; height: 30px;"><font color="red">*</font>信息来源：</td>
					<td><select class="ZY_tj" style=" width:160px; height: 30px;" name="infoSource_id">
								<option value="">--请选择--</option>
								<c:if test="${infoSources != null }">
									<c:forEach var="infoSource" items="${infoSources}">
										<option
											<c:if test="${infoSource.id == infoSource_id }">selected="selected"</c:if>
											value="${infoSource.id}">${infoSource.infoSource}</option>
									</c:forEach>
								</c:if>
						</select></td>
				</tr>
					<tr>
						<td class="tdWidth"><font color="red">*</font>缴费方式：</td>
						<td>
						<table>
							<tr>
							<c:set value="1" var="salary"/>
								<c:forEach var="payfeesway" items="${payfeesways}" varStatus="status">
									<td><input type="radio" name="paymentmethod_id"
										value="${payfeesway.payfees_id }" <c:if test="${salary==1}"/> checked="checked"/>${payfeesway.payfees_way }</td>
									<c:set value="2" var="salary"/>
								</c:forEach>
							</tr>
						</table>
					</td>
					</tr>
					<tr>
						<td class="tdWidth">其他说明(备注)：</td>
						<td colspan="5"><textarea  class="areaStyle" style="width:560px;" name="other_help"></textarea>
						</td>
					</tr>
				</table>
				</form>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<!-- <input type="button" value="保存" class="saveBotton" id="adddetailedStu" onclick="adddetailedStu()"/> -->
					<input type="button" value="下一步" class="saveBotton" id="stuNextStep2" onclick="stuNextStep2()"/>
				</div>
			</div>
			
			
			
			
			
			
			
			
			<!-- 新增学员家庭信息 -->
			<div class="student3" style="display:none;">
			<h1 class="tabTitle">新增学员家庭信息</h1>
			<form id="memberStu" method="post" enctype="multipart/form-data">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth" style=" width:160px; height: 30px;"><font color="red">*</font>成员关系：</td>
						<td><select class="ZY_tj" style=" width:160px; height: 30px;" name="membership_id" id="member" oninput="checkMember(this)">
								<option value="">--请选择--</option>
								<c:if test="${memberships != null }">
									<c:forEach var="membership" items="${memberships}">
										<option
											<c:if test="${membership.member_Id == membership_id }">selected="selected"</c:if>
											value="${membership.member_Id}">${membership.member}</option>
									</c:forEach>
								</c:if>
						</select></td>
						</tr>
						<tr>
						<td class="tdWidth"><font color="red">*</font>成员姓名:</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="memberName" id="memberName" oninput="checkMember(this)" onblur="showw(this),showstuName(this)"/></td>
						</tr>
					<tr>
						<td class="tdWidth">出生日期：</td>
						<td>
						<input type="date" class="dateStyle" style="width:160px;" name="a_memberBirthday" onblur="showbirthday(this)"/>
						<!-- 隐藏 -->
						<input style="display: none;" type="text" name="member_age" id="memberage"/>
						</td>
					</tr>				
						
					<tr>
						<td class="tdWidth"></font>工作状态:</td>
						<td>
						<table>
							<tr>
								<c:forEach var="workcondition" items="${workconditions}" varStatus="status">
									<td><input type="radio" name="workcondition_id"
										value="${workcondition.workcondition_id }" />${workcondition.workcondition_name }</td>
								</c:forEach>
							</tr>
						</table>
					</td>
					</tr>
					<tr>
						<td class="tdWidth">工作单位：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="work_unit"/></td>
					</tr>
					<tr>
						<td class="tdWidth"><font color="red">*</font>联系方式：</td>
						<td><input type="text" class="textStyle" style="width:160px;" name="memberContact_way" onblur="showw(this),showwcontactway(this)"/></td>
					</tr>
					<tr>
					<td class="tdWidth">备注：</td>
						<td><textarea  class="areaStyle" style="width:560px;" name="member_remarks"></textarea></td>
					</tr>
				</table>
				</form>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="button" value="保存" class="saveBotton" id="addMemberStu" onclick="addMemberStu()"/>
				</div>
			</div>

	<!--保存-->
	<div class="saveStyle">
		保存成功！（<span class="setTime"></span>）
	</div>
	<!--结束-->
</body>
</html>
