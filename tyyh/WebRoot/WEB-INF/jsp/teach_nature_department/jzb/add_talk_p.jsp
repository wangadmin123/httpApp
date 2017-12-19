<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>新增家长访谈</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/add_talk_p.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/2Commend.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script src="statics/teach_nature_department/jzb.js/jquery-labelauty.js"></script>
<link rel="stylesheet" href="statics/teach_nature_department/jzb.css/jquery-labelauty.css">
<script type="text/javascript">

function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	if(emp_name_in!=""){$(ww).attr("style","border:#A9A9A9 1px solid;width:160px");};
	}
function showww(ww){
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
	
	$(function(){
	$(':input').labelauty();
});
</script>
</head>
<body >
<div class="div">
	<div class="popupStyle">
    <p><span class="addstu" >添加家访</span></p>
    <form action="${pageContext.request.contextPath }/add_talk_p" method="post" enctype="multipart/form-data">
    	<div class="ai" >
		    <table class="addTable" >
		        <tr>
		            <td class="stutalk">学期：</td>
		            <td>${oaJwbSemester.stage }</td>
		        </tr>	
		        <tr>
		            <td class="stutalk" style="width: 100px;"><span style="color: red;">*</span>访谈对象：</td>
		            <td><input type="text"  class="textStyle" id="a"   oninput="check(this)" onblur="showw(this)" name="interview_name" placeholder="请输入家长的名称"/></td>
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>访谈时间：</td>
		            <td><input type="date" name="interview_time"  id="d"  oninput="check(this)" onblur="showw(this)" class="textStyle"/></td>
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>访谈方式：</td>
		             <td class="talk_p_checked">
		            <c:forEach items="${OaJzbInterviews }" var="OaJzbInterviews">
<%-- 		            <input type="radio"  name="interview_way"  value="${OaJzbInterviews.interview_id }" class="checkedStyle" checked="checked"/><span>${OaJzbInterviews.interview }</span>&nbsp;&nbsp;&nbsp;&nbsp; --%>
		           	<input type="radio"  name="interview_way" value="${OaJzbInterviews.interview_id }" questid="${OaJzbInterviews.interview_id}" data-labelauty="${OaJzbInterviews.interview }" />&nbsp;&nbsp;
		            </c:forEach>
		            </td>
		        </tr>
		    </table>
	    </div>
		<div class="floats">
			 <table  class="addTable" >
		         <tr>
			         <td class="stutalk">访谈内容：<br/><span class="redFont">(最多50字)</span></td>
			         <td ><textarea name="interview_content" cols="50" id="b"  onblur="showww(this)"  oninput="check(this)" rows="15" maxlength="50" onchange="this.value=this.value.substring(0, 50)" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)" ></textarea></td>
			     </tr>
			     <tr>
			         <td class="stutalk" name="remarks">备注：<br/><span class="redFont">(最多50字)</td>
			         <td  ><textarea cols="50"  rows="6" maxlength="50" onchange="this.value=this.value.substring(0, 50)" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)"></textarea></td>
		         </tr>
		     </table>
	    </div>
	    <div class="btposition1"  >
	        <input type="submit"  value="保存" id="c" class="saveBotton" />
	    </div>
    </form>
   </div>
</div>
</body>
</html>
