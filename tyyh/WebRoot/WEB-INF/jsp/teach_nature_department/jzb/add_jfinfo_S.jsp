<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
   <base href="<%=basePath%>">    
<title>选项卡</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/add_jfinfo_S.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/2Commend.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript">


function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid");};
	if(emp_name_in!=""){$(ww).attr("style","border:#A9A9A9 1px solid");};
	}	
	/* 验证是否为空，是空是保存按钮不能按 */
	
function check(form) {

		var nameValue = window.document.getElementById("a").value;
		var ageValue = window.document.getElementById("b").value;
		var ageValued = window.document.getElementById("d").value;
		if (nameValue == "" || ageValue == "" ||ageValued=="" ) {
			document.getElementById("c").disabled = true;
			return false;
		} else {

			document.getElementById("c").disabled = false;
		}

		return true;
	}
	$(function() {

		var nameValue = window.document.getElementById("a").value;
		var ageValue = window.document.getElementById("b").value;
		var ageValued = window.document.getElementById("d").value;
		if (nameValue == "" || ageValue == "" ||ageValued=="" ) {

			document.getElementById("c").disabled = true;
			return false;
		}
	});
</script>
</head>
<body >
<div class="w">
	<div class="popupStyle" style="width:965px; height: 550px;background-color:white;border:1px solid menu;">
    <p><span class="addstu" >新增奖罚信息</span></p>
    
    <form action="${pageContext.request.contextPath }/OaJzbPunish/addOaJzbPunish"  method="post">
    	<div class="qu" >
		    <table class="addTable" >
		       <tr>
		            <td class="stutalk"><span style="color: red;">*</span>学期：</td>
		            <td width="150">${oaJwbSemester.stage }
                	</td>
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>奖罚时间：</td>
		            <td><input type="date"  oninput="check(this)" id="a" onblur="showw(this)" class="textStyle"  placeholder="请输入奖罚时间"  name="punish_time" /></td>
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>奖罚原因：</td>
		            <td><input type="text" oninput="check(this)" id="b" onblur="showw(this)" class="textStyle"  name="punish_cause"/></td>
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>奖罚方式：</td>
		            <td><input type="text"  oninput="check(this)" id="d" onblur="showw(this)" class="textStyle"  name="punish_way"/></td>
		        </tr>
		        <tr>
		            <td class="stutalk">实施人：${loginUser.name }</td>
		            <td width="150">

                	</td>
		        </tr>
		        <tr>
			    <td class="stutalk">备注：<br/><span class="redFont">(最多50字)</td>
			    <td  ><textarea cols="50"  rows="5" name="remarks"  maxlength="50" onchange="this.value=this.value.substring(0, 50)" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)" ></textarea></td>
			  </tr>
		     </table>
	    </div>
	    <div class="btposition1">
	        <input type="submit" id="c" value="保存" class="saveBotton" />
	    </div>
    </form>
   </div>
</div>
</body>
</html>
