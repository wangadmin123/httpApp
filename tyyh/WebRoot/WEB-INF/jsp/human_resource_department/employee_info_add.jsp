<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
<script type="text/javascript"
	src="statics/human_resource_department/js/getSimpleName.js"></script>
<script type="text/javascript">
	/*确定保存弹出框的位置*/
	$(function() {

		deleteInformationBugOaRlzybEmployee();



		$("form input.check[type='text']").add(
			$("form input.check[type='tel']")).add(
			$("form input.check[type='email']")).each(function() {
			$(this).blur(function() {
				var reg = null;
				if ($(this).attr("id") == "emp_name" || $(this).attr("name") == "emp_contact_name") {
					reg = /^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,10})$/;
					if ($(this).val().match(reg) == null) {
						$(this).val("请输入中文姓名！").css("color", "gray").addClass("redBorder");
					} else {
						$(this).removeClass("redBorder");
					}

				} else if ($(this).attr("name") == "emp_origin_detail" || $(this).attr("name") == "emp_now_detail" || $(this).attr("name") == "emp_contact_address_detail") {
					if ($(this).val() != null && $(this).val() != "") {
						$(this).removeClass("redBorder").css("color", "gray");
					} else {
						$(this).addClass("redBorder").css("color", "gray");
					}
				} else if ($(this).attr("name") == "emp_contact_phone") {
					reg = /^((13|14|15|18|17)\d{9})(;(13|14|15|18|17)\d{9})*$/;
					if ($(this).val() == null || $(this).val() == "") {
						$(this).val("请输入手机号码！").css("color", "gray").addClass("redBorder");
					} else if ($(this).val().match(reg) == null) {
						$(this).val("手机号码格式不正确！").css("color", "gray").addClass("redBorder");
					} else {
						$(this).removeClass("redBorder").css("color", "gray");
						;
					}
				} else if ($(this).attr("name") == "emp_hobby") {
					alert($(this).val());
					if ($(this).val() == null || $(this).val() == "") {
						$(this).val("请输入微信号！").css("color", "gray").addClass("redBorder");
					} else {
						$(this).removeClass("redBorder").css("color", "gray");
						;
					}
				}
			}).keydown(function() {
				$(this).css("color", "gray");
			});

		});



		/* 	$("form select.redBorder").focus(function(){
			$(this).removeClass("redBorder");
			}); */
		var saveWidth = $(window).width();
		var saveHeight = $(window).height();
		$(".saveStyle").css("left", saveWidth / 2 - 130);
		$(".saveStyle").css("top", saveHeight / 2 - 40);
		getNationNames();
		getProvinceNames();
		getCityNames();
		getAreaNames();
		getDepartmentNames();
		getGradeNames();
		getRegistrantNames();
		for (var i = 2; i <= 5; i++) {
			$("#tab" + i + " input,textarea").attr("readonly", "readonly");
			$("#tab" + i + " input,textarea").attr("disabled", "disabled");
		}
	});
	/*保存读秒*/
	var miao;
	var myTime;
	$(function() {
		$(".saveBotton").click(function() {
			miao = 2;
			$(".setTime").text(miao);
			$(".saveStyle").css("display", "block");
			myTime = setInterval("divHide()", 1000);

		});
	});
	/*保存读秒结束*/
	function divHide() {
		miao--;
		$(".setTime").text(miao);
		if (miao == 0) {
			clearInterval(myTime);
			$(".saveStyle").hide();
			location.href = "employee_info_search.html";
		}
	}
	/* 获取出生日期及年龄 并给对应标签赋值*/
	function getBirthdayAndAge(emp_idcard) {
		if ($(emp_idcard).val() == null || $(emp_idcard).val() == '') {
			$("#showTakePhotoPage").attr("disabled", "disabled");
			$(emp_idcard).next().css("color", "red");
			$("#birthday").val("");
			$("#age").val("");
			$(emp_idcard).val("请输入身份证号！").css({
				color : "gray"
			}).addClass("redBorder");
		} else {
			var reg = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;
			var emp_idcard_val = $(emp_idcard).val();
			var result = emp_idcard_val.match(reg);
			if (result == null) {
				$(emp_idcard).val("身份证号格式不正确!").css({
					color : "gray"
				}).addClass("redBorder");
			} else {
				checkEmpIdCard();
			}
		}
	}

	/*    验证身份证号是否存在 */
	function checkEmpIdCard() {
		emp_idcardTag = $("#a_emp_idcard");
		var emp_idcard = $(emp_idcardTag).val();
		$.ajax({
			url : "Employee/GetEmployeeCount", //请求的url地址
			dataType : "text", //返回格式为json
			async : true, //请求是否异步，默认为异步，这也是ajax重要特性
			type : "POST", //请求方式
			data : {
				"emp_idcard" : emp_idcard
			},
			success : function(data) {
				if (data == "0") {
					$(emp_idcardTag).removeClass("redBorder").css("color",
						"gray");
					$("#showTakePhotoPage").removeAttr("disabled");
					var emp_idcard_val = $(emp_idcardTag).val().trim();
					/* alert(emp_idcard_val); */
					var birthday_year = emp_idcard_val.substring(6, 10);
					var birthday_month = emp_idcard_val.substring(10, 12);
					var birthday_day = emp_idcard_val.substring(12, 14);
					$("#birthday").val(
						birthday_year + "-" + birthday_month + "-"
						+ birthday_day);
					var current_year = new Date().getFullYear();
					$("#age").val(current_year - birthday_year);
					return true
				} else {
					$(emp_idcardTag).val("该身份证号已经存在！").css({
						color : "gray"
					}).addClass("redBorder");
					return false;
				}
			},
			error : function() {
				alert("验证身份证号出错！");
			}
		});
	}
	/*确认身份证号 */
	function confirmEmpIdcard() {
		if ($("#emp_idcard").val() != '') {
			var result = confirm("请再次确认身份证号！");
			if (result) {
				showTakePhotoPage();
			} else {
				$("#a_emp_idcard").val("");
				$("#birthday").val("");
				$("#age").val("");
				$("#showTakePhotoPage").attr("disabled", "disabled");
			}
		} else {
			$("#a_emp_idcard").val("请输入身份证号！").css({
				color : "gray"
			});

		}

	}
</script>
<script type="text/javascript">

	/* 获得拼音简写并给对应文本框赋值 */
	function getFirstLettersOfName(emp_name) {
		var emp_name_in = $(emp_name).val();
		var emp_name_out = makePy(emp_name_in);
		$("#simple_name").val(emp_name_out);
	}
	/* 填充名族列表 */
	function getNationNames() {
		$.post("Employee/GetNationList", showNationList, "text");
	}
	function showNationList(data) {
		$("#nation_name").html(data);
	}
	/* 填充省列表 */
	function getProvinceNames() {
		$.post("Employee/GetProvinceList", showProvinceList, "text");
	}
	function showProvinceList(data) {
		$("#emp_province_01").html(data);
		$("#emp_province_02").html(data);
		$("#emp_province_03").html(data);
	/* 	$(".emp_city").html("<option value=''>请选择</option>");
		$(".emp_county").html("<option value=''>请选择</option>"); */
	}
	/* 填充市列表 */
	var moldPro;
	function getCityNames(Province) {
		var ProvinceId = $(Province).val();
		moldPro = $(Province).attr("mold");
		/* 	alert(mold); */
		if (ProvinceId == undefined) {
			ProvinceId = null;
		}
		if (moldPro == undefined) {
			$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId
			}, showCityList, "text");
		} else if (moldPro == "province1") {
			$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId,
				"cityName" : 0
			}, showCityList1, "text");
		} else if (moldPro == "province2") {
			$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId,
				"cityName" : 0
			}, showCityList2, "text");
		} else if (moldPro == "province3") {
			$.post("Employee/GetCityList", {
				"ProvinceId" : ProvinceId,
				"cityName" : 0
			}, showCityList3, "text");
		}
		/* 	alert(ProvinceId);  */

	}
	function showCityList(data) {
		/* 		 alert(data);   */
		$("#emp_city_01").html(data);
		$("#emp_city_02").html(data);
		$("#emp_city_03").html(data);
	/* $(".emp_county").html("<option value=''>请选择</option>"); */
	}
	function showCityList1(data) {
		/* 		 alert(data);   */
		/* 	$("#emp_county_01").html("<option value=''>请选择</option>"); */
		$("#emp_city_01").html(data);
		if (moldPro == "province1" || moldPro == "province2" || moldPro == "province3") {
			$("#emp_county_01").html("<option value='0'>---</option>");
		} else {

		}

	/* $(".emp_county").html("<option value=''>请选择</option>"); */
	}
	function showCityList2(data) {
		/* 		 alert(data);   */
		$("#emp_city_02").html(data);
		if (moldPro == "province1" || moldPro == "province2" || moldPro == "province3") {
			$("#emp_county_02").html("<option value='0'>---</option>");
		} else {

		}
	/* $("#emp_county_02").html("<option value=''>请选择</option>"); */
	/* $(".emp_county").html("<option value=''>请选择</option>"); */
	}
	function showCityList3(data) {
		/* 		 alert(data);   */
		$("#emp_city_03").html(data);
		if (moldPro == "province1" || moldPro == "province2" || moldPro == "province3") {
			$("#emp_county_03").html("<option value='0'>---</option>");
		} else {

		}
	/* 		$("#emp_county_03").html("<option value=''>请选择</option>"); */
	/* $(".emp_county").html("<option value=''>请选择</option>"); */
	}
	/* 填充区县列表 */
	function getAreaNames(City) {
		var CityId = $(City).val();
		var mold = $(City).attr("mold");
		if (CityId == undefined) {
			CityId = null;
		}
		if (mold == undefined) {
			$.post("Employee/GetAreaList", {
				"CityId" : CityId
			}, showAreaList, "text");
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
		/* alert(CityId);  */

	}
	function showAreaList(data) {
		/*  alert(data);  */
		$("#emp_county_01").html(data);
		$("#emp_county_02").html(data);
		$("#emp_county_03").html(data);
	}
	function showAreaList1(data) {
		/*  alert(data);  */
		$("#emp_county_01").html(data);
	}
	function showAreaList2(data) {
		/*  alert(data);  */
		$("#emp_county_02").html(data);
	}
	function showAreaList3(data) {
		/*  alert(data);  */
		$("#emp_county_03").html(data);
	}
	/* 填充部门表 */
	function getDepartmentNames() {
		$.post("Employee/GetDepartmentList", showDepartmentList, "text");
	}
	function showDepartmentList(data) {
		$("#emp_position").html("<option value='0'>---</option>");
		/* alert(data);  */
		$("#emp_department").html(data);

	}
	/* 填充职位表 */
	function getPositionNames(Department) {
		var DepartmentId = $(Department).val();
		$.post("Employee/GetPositionList", {
			"DepartmentId" : DepartmentId
		}, showPositionList, "text");
	}
	function showPositionList(data) {
		/* alert(data);  */
		$("#emp_position").html(data);

	}
	/* 填充员工等级列表 */
	function getGradeNames() {
		$.post("Employee/GetGradeList", showGradeList, "text");

	}
	function showGradeList(data) {
		/* alert(data);  */
		$("#emp_grade_id").html(data);

	}
	/* 填充登记人列表 */
	function getRegistrantNames() {
		$.post("Employee/GetRegistrantList", showRegistrantList, "text");
	}
	function showRegistrantList(data) {
		/* alert(data);  */
		$("#emp_registrant").val(data);
	}
	/*克隆技术职称标签*/
	var num = 1;
	function cloneTd(cloneButton) {
		num++;
		var currentTr = "<tr height='100px'><td>技术职称:"
			+ num
			+ "</td><td> <input type='text'  placeholder='请上传格式为：jpg,png,jpeg,pdf的文件'    style='width: 300px;'    class='textStyle' id='imgUrl' style='width:400px;'/><input type='file'  name='a_emp_technical_title_path' onchange='showFilePath(this)' /><input type='button'  value='上传'  onclick='ajaxFileUpload(this)'  /><span  id='message' ></span><img alt='图片丢失'   width='100px' height='100px' src='' style='display: none;vertical-align: middle;'><input type='button' value='继续添加' onclick='cloneTd(this)'></td></td></tr>";
		$("#IdentificationPhoto").append(currentTr);
		cloneButton.setAttribute("disabled", "disabled");
	}
	/* 显示文件标签的值 */
	function showFilePath(file) {
		var filePath = $(file).val();
		$(file).prev().val(filePath);
	}
	/* /* 拍照并上传 */
	var imgData = "";
	window.addEventListener(
		"DOMContentLoaded",
		function() {
			// Grab elements, create settings, etc.
			var canvas = document.getElementById("canvas"),
				context = canvas
					.getContext("2d"),
				video = document
					.getElementById("video"),
				videoObj = {
					"video" : true
				},
				errBack = function(error) {
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
	var setInt = null;
	function uploadPersonPhoto(uploadFile) {
		$(uploadFile).next().html("照片正在上传！").css("color", "red");
		$("#save").removeAttr("disabled");
		document.getElementById("snapimg").src = imgData;
		var imgRecord = imgData.substr(22);
		var emp_idcard = $("#a_emp_idcard").val();
		var zhaopianmiao = 3;
		clearInterval(setInt);
		setInt = setInterval(function() {
			zhaopianmiao -= 1;
			$(uploadFile).next().html("照片上传成功！" + zhaopianmiao + "s后退出拍照").css("color", "green");
			if (zhaopianmiao == 0) {
				$(".mbStyle").css("display", "none");
				$(".popupStyle").css("display", "none");
				clearInterval(setInt);
			}
		}, 1000);
		$.ajax({
			url : "Employee/UploadPersonPhoto", //请求的url地址
			dataType : "text", //返回格式为json
			async : true, //请求是否异步，默认为异步，这也是ajax重要特性
			type : "POST", //请求方式
			data : {
				"imgRecord" : imgRecord,
				"emp_idcard" : emp_idcard
			},
			success : function(data) {
				if (data == "0") {
					$(uploadFile).next().html("照片上传失败！").css("color", "red");
				} else {
					$(uploadFile).next().html("照片上传成功！3s后退出拍照").css("color", "green");
					$("#emp_idcard").attr("disabled", "disabled");
					$("#saveBasicInfo").removeAttr("disabled");
					$("#uploadFile").attr("disabled", "disabled");
					$("#showTakePhotoPage").css("display", "none");
					setInt();
					clearInterval(setInt);
				}
			},
			error : function() {
				alert("上传个人照片出错！");
			}
		});

	}

	/*拍照上传照片 */

	/* 删除信息不完整的员工 */
	function deleteInformationBugOaRlzybEmployee() {
		$.ajax({
			url : "Employee/DeleteInformationBugOaRlzybEmployee", //请求的url地址
			dataType : "text", //返回格式为json
			async : true, //请求是否异步，默认为异步，这也是ajax重要特性
			type : "POST", //请求方式
			error : function() {
				alert("清除信息不完整员工出错！");
			}
		});
	}
	/*点击显示弹出框*/
	function showTakePhotoPage() {
		$(".mbStyle").css("display", "block");
		$(".popupStyle").css("display", "block");
	}
	$(function() {

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
		$(".popupStyle").css("left", saveWidth / 2 - 340);
		$(".popupStyle").css("top", 70);
	});
	/* 	保存员工信息 */
	var clickCount = 0;
	function saveInfo(formInfo) {
		var a_emp_idcard = $("#a_emp_idcard").val();
		/* alert(emp_idcard); */
		var formIndex = $(formInfo).attr("formIndex");
		if (formIndex == 2) {
			var emp_phone = $("#emp_phone").val();
			$("#emp_phoneNumber").val(emp_phone);
		}
		var formInfoDetail = $("form:eq(" + formIndex + ")").serialize();
		/* alert(formInfoDetail); */
		if (formIndex == 0) {
			/* 		$.post("Employee/AddEmployee/AddBasicInfo/" + emp_idcard + "",
							formInfoDetail, showResult2, "text"); */
			var emp_name_val = $("#emp_name").val();
			var emp_Email_val = $("#emp_Email").val();
			var emp_phone_val = $("#emp_phone").val();
			var textStyle = $(".textStyle").val();
			var emp_origin_detail_val = $("#emp_origin_detail").val();
			var emp_now_detail_val = $("#emp_now_detail").val();
			var emp_hobby = $("input[name=emp_hobby]").val();

			var emp_name_val_reg = /^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,10})$/;
			var emp_Email_val_reg = /^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})$/;
			var emp_phone_val_reg = /^((13|14|15|18|17)\d{9})(;(13|14|15|18|17)\d{9})*$/;
			if (emp_name_val.match(emp_name_val_reg) == null) {
				$("#emp_name").val("请输入中文姓名！").css("color", "gray").addClass("redBorder");
				/*  alert("对不起，请输入中文姓名!");  */
				return;
			} else if (emp_Email_val.match(emp_Email_val_reg) == null) {
				$("#emp_Email").val("邮箱格式不正确!").css("color", "gray").addClass("redBorder");
				/*     alert("对不起，您输入的邮箱格式不正确!");  */
				return;
			} else if (emp_phone_val.match(emp_phone_val_reg) == null) {
				$("#emp_phone").val("手机号码格式不正确!").css("color", "gray").addClass("redBorder");
				/*  alert("对不起，您输入的手机号码格式不正确!");  */
				return;
			} else if (checkPhoneNumber() == false || checkEmail() == false) {
				return;
			} else if (emp_now_detail_val == null || emp_now_detail_val == "") {
				$("#emp_now_detail").val("").css("color", "gray").addClass("redBorder");
				return;
			} else if (emp_origin_detail_val == null || emp_origin_detail_val == "") {
				$("#emp_origin_detail").val("").css("color", "gray").addClass("redBorder");
				return;
			}   else if (emp_hobby == null || emp_hobby == "" || emp_hobby=="请输入微信号！") {
				$("input[name=emp_hobby]").val("").css("color", "gray").addClass("redBorder");
				return;
			}else {
				$.ajax({
					url : "Employee/AddEmployee/AddBasicInfo/" + a_emp_idcard
						+ "/0", //请求的url地址
					dataType : "text", //返回格式为json
					async : true, //请求是否异步，默认为异步，这也是ajax重要特性
					type : "POST", //请求方式
					data : formInfoDetail,
					success : function(data) {
						if (data == "0") {
							$(formInfo).next().html("保存失败！").css("color",
								"red");
						} else if (data == "1") {
							$(formInfo).next().html("保存成功！").css("color",
								"green");

							for (var i = 2; i <= 5; i++) {
								$("#tab" + i + " input,select,textarea")
									.removeAttr("readonly", "readonly");
								$("#tab" + i + " input,select,textarea")
									.removeAttr("disabled", "disabled");
							}
							$("input[type='button'][formIndex='0']").attr("disabled", "disabled");
							$("input[type='button'][formIndex='2']").click();
						} else if (data == "2") {
							$(formInfo).next().html("该用户已经存在！").css(
								"color", "red");
						} else if (data == "3") {
							$(formInfo).next().html("未做任何操作！").css("color",
								"red");
						}
					},
					error : function() {
						alert("保存过程出错！");
					}
				});
			}
		}
		if (formIndex == 1) {
			$.ajax({
				url : "Employee/AddEmployee/AddExperienceInfo/"
					+ a_emp_idcard + "/0", //请求的url地址
				dataType : "text", //返回格式为json
				async : true, //请求是否异步，默认为异步，这也是ajax重要特性
				type : "POST", //请求方式
				data : formInfoDetail,
				success : function(data) {
					if (data == "0") {
						$(formInfo).next().html("保存失败！").css("color",
							"red");
					} else if (data == "1") {
						$(formInfo).next().html("保存成功！").css("color",
							"green");
						for (var i = 2; i <= 5; i++) {
							$("#tab" + i + " input,select,textarea")
								.removeAttr("readonly", "readonly");
							$("#tab" + i + " input,select,textarea")
								.removeAttr("disabled", "disabled");
						}
					} else if (data == "2") {
						$(formInfo).next().html("该用户已经存在！").css(
							"color", "red");
					} else if (data == "3") {
						$(formInfo).next().html("未做任何操作！").css("color",
							"red");
					}
				},
				error : function() {
					alert("保存过程出错！");
				}
			});

			/* $.post("Employee/AddEmployee/AddExperienceInfo/"+emp_idcard+"",formInfoDetail,showResult2, "text"); */

		}
		if (formIndex == 2) {
			clickCount++;
			if (clickCount == 1) {
				$(formInfo).next().hide();
			} else {
				$(formInfo).next().show();
			}

			/* $.post("Employee/AddEmployee/AddPositionInfo/"+emp_idcard+"",formInfoDetail,showResult2, "text"); */
			$.ajax({
				url : "Employee/AddEmployee/AddPositionInfo/"
					+ a_emp_idcard + "/0", //请求的url地址
				dataType : "text", //返回格式为json
				async : true, //请求是否异步，默认为异步，这也是ajax重要特性
				type : "POST", //请求方式
				data : formInfoDetail,
				success : function(data) {
					if (data == "0") {
						$(formInfo).next().html("保存失败！").css("color",
							"red");
					} else if (data == "1") {

						$(formInfo).next().html("保存成功！").css("color",
							"green");
						for (var i = 2; i <= 5; i++) {
							$("#tab" + i + " input,select,textarea")
								.removeAttr("readonly", "readonly");
							$("#tab" + i + " input,select,textarea")
								.removeAttr("disabled", "disabled");
						}
					} else if (data == "2") {
						$(formInfo).next().html("该用户已经存在！").css(
							"color", "red");
					} else if (data == "3") {
						$(formInfo).next().html("未做任何操作！").css("color",
							"red");
					}
				},
				error : function() {
					alert("保存过程出错！");
				}
			});

		}
		if (formIndex == 3) {
			/* $.post("Employee/AddEmployee/AddUrgentPersonInfo/"+emp_idcard+"",formInfoDetail,showResult2, "text"); */
			var emp_contact_name_val = $("#emp_contact_name").val();
			var emp_contact_phone_val = $("#emp_contact_phone").val();
			var emp_contact_address_detail_val = $("#emp_contact_address_detail").val();
			
			
			var emp_name_val_reg = /^([a-zA-Z0-9\u4e00-\u9fa5\·]{1,10})$/;
			var emp_phone_val_reg = /^((13|14|15|18|17)\d{9})(;(13|14|15|18|17)\d{9})*$/;
			if (emp_contact_name_val.match(emp_name_val_reg) == null) {
				$("#emp_contact_name").val("请输入中文姓名！").css("color", "gray").addClass("redBorder");
				/*  alert("对不起，请输入中文姓名!");  */
				return;
			} else if (emp_contact_phone_val.match(emp_phone_val_reg) == null) {
				$("#emp_contact_phone").val("手机号码格式不正确!").css("color", "gray").addClass("redBorder");
				/*  alert("对不起，您输入的手机号码格式不正确!");  */
				return;
			} else if (emp_contact_address_detail_val == null || emp_contact_address_detail_val == "") {
				$("#emp_contact_address_detail").val("请输入现住址详细信息!").css("color", "gray").addClass("redBorder");
				return;
			} else {
				$.ajax({
					url : "Employee/AddEmployee/AddUrgentPersonInfo/"
						+ a_emp_idcard + "/0", //请求的url地址
					dataType : "text", //返回格式为json
					async : true, //请求是否异步，默认为异步，这也是ajax重要特性
					type : "POST", //请求方式
					data : formInfoDetail,
					success : function(data) {
						if (data == "0") {
							$(formInfo).next().html("保存失败！").css("color",
								"red");
						} else if (data == "1") {
							$(formInfo).next().html("保存成功！").css("color",
								"green");
							for (var i = 2; i <= 5; i++) {
								$("#tab" + i + " input,select,textarea")
									.removeAttr("readonly", "readonly");
								$("#tab" + i + " input,select,textarea")
									.removeAttr("disabled", "disabled");
							}
						} else if (data == "2") {
							$(formInfo).next().html("该用户已经存在！").css(
								"color", "red");
						} else if (data == "3") {
							$(formInfo).next().html("未做任何操作！").css("color",
								"red");
						}
					},
					error : function() {
						alert("保存过程出错！");
					}
				});

			}
		}

	}
	function ajaxFileUpload(upload) {
		var a_emp_idcard = $("#a_emp_idcard").val();
		var formData = new FormData();
		var fileName = $(upload).prev().attr("name");
		var file = $(upload).prev();
		var img = $(upload).next().next();
		$(upload).next().html("文件上传中！").css("color", "red");
		/*    alert(file[0].files[0]); */
		formData.append("file", file[0].files[0]);
		formData.append("fileName", fileName);
		formData.append("emp_idcard", a_emp_idcard);
		$.ajax({
			url : "Employee/AddEmployeeFile/AddCertificateInfo/" + a_emp_idcard + "/0",
			type : "POST",
			cache : false,
			data : formData,
			dataType : "json",
			processData : false,
			contentType : false,
			success : function(data) {
				if (data.result[0] == "1") {
					/*   alert(data.result[1]); */
					$(upload).next().html("文件上传成功！>>预览").css("color", "green");
					var cutIndex = data.result[1].lastIndexOf("\\");
					var imgPath = data.result[1].substring(cutIndex + 1);
					var imgPath = "/uploadfiles/" + imgPath;
					img.attr("src", imgPath).css("display", "inline-block");
				} else if (data.result[0] == "0") {
					$(upload).next().html("文件上传失败！").css("color", "red");
				} else if (data.result[0] == "2") {
					$(upload).next().html("文件格式不正确！").css("color", "red");
				} else if (data.result[0] == "3") {
					$(upload).next().html("上传文件不能为空！").css("color", "red");
				}
			},
			error : function() {
				alert("网络故障！");
			}
		});
	}
	/* 验证手机号码是否存在 */
	function checkPhoneNumber() {
		var phoneTag = $("#emp_phone");
		var phone_val = $(phoneTag).val();
		if (phone_val == null || phone_val == "") {
			$(phoneTag).val("请输入手机号码!").addClass("redBorder");
			return false;
		} else {
			var reg = /^((13|14|15|18|17)\d{9})(;(13|14|15|18|17)\d{9})*$/;
			if ($(phoneTag).val().match(reg) == null) {
				$(phoneTag).val("手机号码格式不正确!").addClass("redBorder");
				return false;
			} else {
				$.ajax({
					url : "Employee/CheckPhoneNumber", //请求的url地址
					dataType : "text", //返回格式为json
					async : true, //请求是否异步，默认为异步，这也是ajax重要特性
					type : "POST", //请求方式
					data : {
						"phone_val" : phone_val
					},
					success : function(data) {
						if (data == "0") {
							$(phoneTag).removeClass("redBorder");
							return true;
						} else {
							$(phoneTag).val("该手机号码已经存在!").addClass("redBorder");
							return false;
						}
					},
					error : function() {
						alert("验证手机号码出错！");
					}
				});
			}

		}

	}
	/* 验证邮箱是否存在 */
	function checkEmail() {
		var emp_Email_Tag = $("#emp_Email");
		var emp_Email = $(emp_Email_Tag).val();
		if (emp_Email == null || emp_Email == "") {
			$(emp_Email_Tag).val("请输入您常用的邮箱地址！").addClass("redBorder").css("color", "gray");
			return false;
		} else {
			var reg = /^(([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5}){1,25})$/;
			if (emp_Email.match(reg) == null) {
				$(emp_Email_Tag).val("邮箱格式不正确！").addClass("redBorder");
				return false;
			} else {
				$.ajax({
					url : "Employee/CheckEmailAddress", //请求的url地址
					dataType : "text", //返回格式为json
					async : true, //请求是否异步，默认为异步，这也是ajax重要特性
					type : "POST", //请求方式
					data : {
						"emp_Email" : emp_Email
					},
					success : function(data) {
						if (data == "0") {
							$(emp_Email_Tag).removeClass("redBorder");
							return true;
						} else {
							$(emp_Email_Tag).val("该邮箱地址已经存在!").addClass("redBorder");
							return false;
						}
					},
					error : function() {
						alert("验证邮箱地址出错出错！");
					}
				});



			}
		}
	}
	
	//验证微信号
	function checkweixin(){
		var wx = $("input[name=emp_hobby]").val();
		if (wx == null || wx == "") {
			$("input[name=emp_hobby]").val("请输入微信号！").addClass("redBorder").css("color", "gray");
			return false;
		}else{
			$("input[name=emp_hobby]").removeClass("redBorder").css("color", "gray");
		}
		return true;
	}
</script>
<style>
/*   *{border: black 1px solid}  */
.redBorder {
	border: red solid 1px;
}
</style>
</head>
<body>
	<!-- 拍照弹框 -->
	<div class="mbStyle">&nbsp;</div>
	<div class="popupStyle" style="width: 700px; height: 500px;">
		<h1>
			添加个人照片<span class="closeX">X</span>
		</h1>
		<table class="addTable" border="1" style="width: 650px; height: 460px">
			<tr>
				<td class="tdWidth" style="width:100%; "><h1>视频区</h1></td>
				<td class="tdWidth"><h1>照片预览区</h1></td>
			</tr>
			<tr>
				<td class="tdWidth"><video align="center" id="video"
						style="width:100%;" autoplay style="border: solid black 1px"></video></td>

				<td class="tdWidth"><canvas align="center"
						style="display:block;border: black solid 1px" id="canvas"
						width="209" height="209"></canvas></td>
			</tr>
			<tr>
				<td class="tdWidth"><input align="center" type="button"
					value="上传" id="uploadFile" onclick="uploadPersonPhoto(this)"
					disabled="disabled" /><span></span></td>
				<td class="tdWidth"><input align="center" type="button"
					value="拍照" id="snap" /></td>
			</tr>
		</table>
	</div>
	<!-- 拍照弹框结束-->
	<div class="rightContent">
		<h1 class="tabTitle">员工建档</h1>
		<div class="tabContent">
			<!-- <h1 id="tabTitle">基本信息</h1> -->
			<div class="tabs">
				<span class="spanHover">基本信息</span> <span class="spanOut">证件信息</span>
				<span class="spanOut">学习/工作/培训经历/社会关系</span> <span class="spanOut">岗位信息</span>
				<span class="spanOut">紧急联系人信息</span>
			</div>
			<hr style="margin-top:10px;" />
			<p style="font-size: 12px;color: red;font-family:"SimSun"; ">操作须知：
				1.填写标记为*号的必填字段 2.拍照上传个人照片3.保存基本信息及岗位信息(必填)4.保存其他信息(选填)</p>
			<hr style="margin-bottom:10px;" />
			<div class="divTable" id="tab1">
				<form action="Employee/AddEmployee/AddBasicInfo" method="post">
					<table cellpadding="0" cellspacing="0" border="0" class="addTable"
						style="width: 100%;">
						<tr>
							<td style="width: 120px;"><span>*</span>姓名：</td>
							<td style="width: 190px;"><input type="search"
								name="emp_name" id="emp_name"
								onblur="getFirstLettersOfName(this)" class="textStyle check"
								style="width:160px;" placeholder="请输入中文姓名" /></td>
							<td style="width: 160px;"><span>*</span>身份证号：</td>
							<td colspan="2"><input type="text" name="a_emp_idcard"
								placeholder="请输入公民身份证号" id="a_emp_idcard"
								class="textStyle check"
								style="width:160px;display: inline-block;"
								onblur="getBirthdayAndAge(this)" /><span
								style="display: inline-block;"></span></td>

							<td rowspan="5" colspan="2" align="center"><img id="snapimg"
								alt="图片丢失" width="209" height="209"
								src="statics/common/images/headImageIcon.png"
								style="border: black solid 1px;"></td>
							<td style="width: 129px;"></td>
						<tr>
							<td><span>*</span>性别：</td>
							<td><input type="radio" value="男" name="emp_sex"
								class="radioStyle" checked="checked">男&nbsp;<input
								type="radio" value="女" name="emp_sex" class="radioStyle">女&nbsp;
								<input readonly="readonly" type="text" name="emp_name_simple"
								id="simple_name" class="textStyle"
								style="width:160px;border-style: none;display: none;"></td>
							<td>出生日期：</td>
							<td><input type="text" id="birthday" class="textStyle"
								style="width:160px; border-style: none" readonly="readonly;"></td>

							<td></td>
							<td></td>
						<tr>
							<td><span>*</span>学历：</td>
							<td><select name="emp_educational_background"
								style="width:160px;" class="selectStyle ">
									<option value="硕士">硕士</option>
									<option value="本科">本科</option>
									<option value="专科">专科</option>
									<option value="高中">高中</option>
							</select></td>
							<td>年龄：</td>
							<td><input type="text" id="age" class="textStyle"
								style="width:160px;border-style: none" readonly="readonly" /></td>
							<td style="width: 190px;"></td>
							<td></td>

						</tr>
						<tr>
							<td><span>*</span>手机号码：</td>
							<td><input type="tel" name="emp_phone"
								class="textStyle check" id="emp_phone" style="width:160px;"
								placeholder="请输入手机号码" onblur="checkPhoneNumber()"></td>
							<td><span>*</span>邮箱：</td>
							<td><input type="email" name="emp_Email"
								class="textStyle check" id="emp_Email" style="width:160px;"
								placeholder="请输入您常用的邮箱地址" onblur="checkEmail()"></td>
							<td></td>

							<td colspan="2" align="center"></td>
							<td></td>

						</tr>
						<tr>
							<td><span>*</span>婚姻状况：</td>
							<td><select name="emp_marital_status" style="width:160px;"
								class="selectStyle ">
									<option value="未婚">未婚</option>
									<option value="已婚">已婚</option>
							</select></td>
							<td><span>*</span>政治面貌：</td>
							<td><select name="emp_political_status" style="width: 160px"
								class="selectStyle ">
									<option value="群众">群众</option>
									<option value="团员">团员</option>
									<option value="党员">党员</option>
							</select></td>
							<td></td>
							<td style="width: 50px;"></td>
							<td style="width: 50px;"></td>
							<td></td>
						</tr>
						<tr>
							<td><span>*</span>民族：</td>
							<td><select name="nation_name" id="nation_name"
								class="selectStyle " style="width:160px;">
									<option value="0">请选择</option>
							</select></td>
							<td><span>*</span>微信账号：</td>
							<td><input type="text" name="emp_hobby" class="textStyle"
								style="width: 160px;" onblur="checkweixin()" placeholder="请输入微信号！"/></td>


							<td style="text-align: center"></td>
							<td colspan="2" align="center"><input type="button"
								height:="" px="" id="showTakePhotoPage"
								onclick="confirmEmpIdcard()" value="拍照/上传个人照片"
								disabled="disabled"></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td><span>*</span>籍贯：</td>
							<td><select name="emp_province"
								onchange="getCityNames(this)" id="emp_province_01"
								mold="province1" class="selectStyle " style="width:160px;">
									<option value="0">请选择</option>
							</select></td>
							<td><select name="emp_city" id="emp_city_01"
								onchange="getAreaNames(this)" class="selectStyle "
								style="width: 160px;" mold="city1">
									<option value="0">请选择</option>
							</select></td>
							<td><select name="emp_county" id="emp_county_01"
								class="selectStyle " style="width:160px;">
									<option value="0">请选择</option>
							</select></td>
							<td>籍贯补充内容：</td>
							<td colspan="2"><input type="text" name="emp_origin_detail"
								id="emp_origin_detail" class="textStyle check"
								style="width: 300px;" placeholder="请输入现住址详细信息"></td>
							<td></td>
							<td></td>

						</tr>
						<tr>
							<td><span>*</span>现住址：</td>
							<td><select name="emp_now_province"
								onchange="getCityNames(this)" id="emp_province_02"
								class="selectStyle " style="width:160px;" mold="province2">
									<option value="0">请选择</option>
							</select> <!-- <textarea name="emp_address"
									class="areaStyle" style="width:500px;"></textarea> --></td>
							<td><select name="emp_now_city" id="emp_city_02"
								onchange="getAreaNames(this)" class="selectStyle "
								style="width: 160px;" mold="city2">
									<option value="0">请选择</option>
							</select></td>
							<td><select id="emp_county_02" name="emp_now_county"
								class="selectStyle " style="width:160px;">
									<option value="0">请选择</option>
							</select></td>
							<td>现住址补充内容：</td>
							<td colspan="2"><input type="text" name="emp_now_detail"
								id="emp_now_detail" class="textStyle check"
								style="width: 300px;" placeholder="请输入现住址详细信息"></td>
							<td></td>
							<td></td>
						</tr>
					</table>
					<div class="btposition1">
						<input type="button" class="buttonStyle" id="saveBasicInfo"
							onclick="saveInfo(this)" disabled="disabled" formIndex="0"
							value="保存" /><span></span>
					</div>
				</form>
			</div>
			<div class="divTable" style="display:none;" id="tab2">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable"
					id="IdentificationPhoto">
					<tr height="100px">
						<td style="width: 100px;" name="emp_idcard_front"><span>*</span>身份证正面:</td>
						<td style="width: 1000px; vertical-align:middle;"><input
							type="text" class="textStyle" id="imgUrl" style="width: 300px"
							placeholder="请上传格式为：jpg,png,jpeg,pdf的文件" /> <input
							name="a_emp_idcard_front" type="file"
							onchange="showFilePath(this)" /> <input type="button" value="上传"
							onclick="ajaxFileUpload(this)" /><span id="message"></span><img
							alt="图片丢失" width="100px" height="100px" src=""
							style="display: none;vertical-align: middle;" /></td>
					</tr>

					<tr height="100px">
						<td><span>*</span>身份证反面:</td>
						<td><input type="text" class="textStyle" id="imgUrl"
							style="width: 300px" placeholder="请上传格式为：jpg,png,jpeg,pdf的文件" />
							<input type="file" name="a_emp_idcard_reverse"
							onchange="showFilePath(this)" /> <input type="button" value="上传"
							onclick="ajaxFileUpload(this)" /><span id="message"></span><img
							alt="图片丢失" width="100px" height="100px" src=""
							style="display: none;vertical-align: middle;"></td>
					</tr>
					<tr height="100px">
						<td>学位证:</td>
						<td><input type="text" class="textStyle" id="imgUrl"
							style="width: 300px" placeholder="请上传格式为：jpg,png,jpeg,pdf的文件" />
							<input name="a_emp_Degree_certificate" type="file"
							onchange="showFilePath(this)" /> <input type="button" value="上传"
							onclick="ajaxFileUpload(this)" /><span id="message"></span></span><img
							alt="图片丢失" width="100px" height="100px" src=""
							style="display: none;vertical-align: middle;"></td>
					</tr>
					<tr height="100px">
						<td>学历证:</td>
						<td><input type="text" name="a_emp_Education_certificate"
							class="textStyle" id="imgUrl" style="width: 300px"
							placeholder="请上传格式为：jpg,png,jpeg,pdf的文件" /> <input type="file"
							name="a_emp_Education_certificate" onchange="showFilePath(this)" />
							<input type="button" value="上传" onclick="ajaxFileUpload(this)" /><span
							id="message"></span><img alt="图片丢失" width="100px" height="100px"
							src="" style="display: none;vertical-align: middle;"></td>
					</tr>
					<tr height="100px">
						<td>技术职称1:</td>
						<td><input type="text" class="textStyle" id="imgUrl"
							style="width: 300px" placeholder="请上传格式为：jpg,png,jpeg,pdf的文件" />
							<input type="file" name="a_emp_technical_title_path"
							onchange="showFilePath(this)" /> <input type="button" value="上传"
							onclick="ajaxFileUpload(this)" /><span id="message"></span><img
							alt="图片丢失" width="100px" height="100px" src=""
							style="display: none;vertical-align: middle;"> <input
							type="button" value="继续添加" onclick="cloneTd(this)"></td>
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
							<td style="width: 100px;">工作经历：</td>
							<td style="width: 1000px;"><textarea
									name="emp_work_experience" class="areaStyle"
									style="width:800px;"></textarea></td>
						</tr>
						</tr>
						<tr>
							<td>教育经历：</td>
							<td><textarea name="emp_Education_experience"
									class="areaStyle" style="width:800px;"></textarea></td>



						</tr>
						</tr>
						<tr>
							<td>培训经历：</td>

							<td><textarea name="emp_train_experience" class="areaStyle"
									style="width:800px;"></textarea></td>
						</tr>
						</tr>
						<tr>
							<td>社会关系：</td>
							<td><textarea name="emp_society_relation" class="areaStyle"
									style="width:800px;"></textarea></td>
						</tr>
						<tr>
							<td>备注：</td>

							<td><textarea name="emp_remarks" class="areaStyle"
									style="width:800px;"></textarea></td>

						</tr>
					</table>
					<div class="btposition1">
						<input type="button" class="buttonStyle" onclick="saveInfo(this)"
							formIndex="1" value="保存" /><span></span>
					</div>
				</form>

			</div>
			<div class="divTable" style="display:none;" id="tab4">
				<form action="Employee/AddEmployee/AddPositionInfo" method="post">
					<input type="hidden" id="emp_phoneNumber" name="emp_phone" />
					<table cellpadding="0" cellspacing="0" border="0" class="addTable">
						<tr>
							<td style="width: 100px;"><span>*</span>所属部门：</td>
							<td style="width: 190px;"><select class="selectStyle "
								onchange="getPositionNames(this)" name="emp_department"
								id="emp_department" style="width:160px;">
									<option value="0">请选择</option>
							</select></td>
							<td style="width: 120px;"><span>*</span>职位：</td>
							<td style="width: 190px;"><select class="selectStyle "
								name="emp_position" id="emp_position" style="width:160px;">
									<option value="0">请选择</option>
							</select></td>
							<td style="width: 120px;"><span>*</span>用工方式：</td>
							<td style="width: 190px;"><input type="radio" value="全职"
								name="emp_Employment_nature" class="radioStyle"
								checked="checked" />全职&nbsp;&nbsp; <input type="radio"
								value="兼职" name="emp_Employment_nature" class="radioStyle" />兼职</td>


						</tr>
						<tr>
							<td><span>*</span>入职日期：</td>
							<td><input type="date" name="a_emp_Entry_date"
								class="dateStyle " style="width:160px;" /></td>

							<td><span>*</span>试用结束日期：</td>
							<td><input type="date" name="a_emp_tryout_end_date"
								class="dateStyle " style="width:160px;" /></td>

							<td><span>*</span>目前状态：</td>
							<td><input type="radio" value="在职" class="radioStyle"
								name="emp_now_status" checked="checked" />在职&nbsp;&nbsp; <input
								type="radio" value="离职" name="emp_now_status" class="radioStyle" />离职&nbsp;&nbsp;
								<input type="radio" value="停薪留职" name="emp_now_status"
								class="radioStyle" />停薪留职</td>

						</tr>
						<tr>
							<td>技术职称：</td>
							<td><input type="text" name="emp_technical_title_name"
								class="textStyle" style="width:160px;" /></td>

							<td><span>*</span>员工等级：</td>
							<td><select name="emp_grade_id" id="emp_grade_id"
								class="selectStyle " style="width:160px;">
									<option value="0">请选择</option>

							</select></td>

							<td><span>*</span>登记人：</td>
							<td><select name="emp_registrant" id="emp_registrant"
								class="selectStyle " style="width:160px;">
									<option value="${loginUser.emp_id}">${loginUser.emp_name }</option>
							</select></td>
						</tr>
						<tr>
							<td>工资卡号：</td>
							<td><input type="number" name="emp_salary_cardnumber"
								class="textStyle" style="width:160px;" /></td>
							<td>医保卡号：</td>
							<td><input type="number"
								name="emp_medical_insurance_cardnumber" class="textStyle"
								style="width:160px;" /></td>
							<td>养老保险卡号：</td>
							<td><input type="number"
								name="emp_endowment_insurance_cardnumber" class="textStyle"
								style="width:160px;" /></td>
						</tr>
					</table>
					<div class="btposition1">
						<input type="button" class="buttonStyle" onclick="saveInfo(this)"
							formIndex="2" value="保存" /><span></span>
					</div>
				</form>
			</div>
			<div class="divTable" style="display:none;" id="tab3">
				<form action="Employee/AddEmployee/AddUrgentPersonInfo"
					method="post">
					<table cellpadding="0" cellspacing="0" border="0" class="addTable">
						<tr>
							<td style="width: 120px;"><span>*</span>姓名：</td>
							<td style="width: 190px;"><input type="text"
								id="emp_contact_name" name="emp_contact_name"
								class="textStyle check" style="width:160px;"
								placeholder="请输入中文姓名" /></td>

							<td style="width: 190px;"><span>*</span>手机号码：</td>
							<td style="width: 190px;"><input type="tel"
								id="emp_contact_phone" name="emp_contact_phone"
								class="textStyle check" style="width:160px;"
								placeholder="请输入手机号码" /></td>

							<td style="width: 130px;"><span>*</span>与本人关系：</td>
							<td style="width: 270px;"><input type="search"
								name="emp_contact_relationship" class="selectStyle "
								style="width:160px;" /></td>
						</tr>
						<tr>
							<td><span>*</span>现住址：</td>

							<td><select name="emp_contact_address_province"
								onchange="getCityNames(this)" id="emp_province_03"
								class="selectStyle " style="width:160px;" mold="province3">

							</select></td>
							<td><select name="emp_contact_address_city" id="emp_city_03"
								onchange="getAreaNames(this)" class="selectStyle "
								style="width: 160px;" mold="city3">

							</select></td>
							<td><select id="emp_county_03"
								name="emp_contact_address_county" class="selectStyle "
								style="width:160px;">

							</select></td>
							<td>现住址补充内容：</td>
							<td><input type="text" name="emp_contact_address_detail"
								id="emp_contact_address_detail" class="textStyle check"
								style="width:300px;" placeholder="请输入现住址详细信息"></td>
						</tr>
					</table>
					<div class="btposition1">
						<input type="button" class="buttonStyle" onclick="saveInfo(this)"
							formIndex="3" value="保存" /><span></span>
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
