<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/2Commend.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/add_talk_S.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script src="statics/teach_nature_department/jzb.js/jquery-labelauty.js"></script>
<link rel="stylesheet" href="statics/teach_nature_department/jzb.css/jquery-labelauty.css">
<script type="text/javascript">
$(function() {
	$(':input').labelauty();
});

/* js为空验证 */
function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px;heigth:30px;");};
	if(emp_name_in!=""){$(ww).attr("style","border:#A9A9A9 1px solid;width:160px;heigth:30px;");};
	}

/* 验证是否为空，是空是保存按钮不能按 */
function check(form) {
		var jyzaichang = window.document.getElementById("jyzaichang").value;
		var witer = window.document.getElementById("witer").value;
		var engine = window.document.getElementById("engine").value;
		var inter = window.document.getElementById("inter").value;
		
		if (jyzaichang == "" || witer == 0 || engine==0 || inter=="") {
			document.getElementById("baocun").disabled = true;
			return false;
		} else {
			document.getElementById("baocun").disabled = false;
		}
		return true;
	}
$(function() {
		var jyzaichang = window.document.getElementById("jyzaichang").value;
		var witer = window.document.getElementById("witer").value;
		var engine = window.document.getElementById("engine").value;
		var inter = window.document.getElementById("inter").value;
		if (jyzaichang == "" || witer == 0 || engine==0 || inter=="") {
			document.getElementById("baocun").disabled = true;
			return false;
		}
});
</script>
</head>
<body >
<div class="div">
	<div class="popupStyle" >
    <p class="addstu" >新增学生访谈</p>
    <form action="${pageContext.request.contextPath }/addTjInterview.html"  method="post" style="padding:20px;">
    	<input type="hidden" name="Term_id" value="${semId.id }" />
    	<div class="div_table" >
		    <table  class="addTable">
		        <tr>
		            <td class="stutalk">&nbsp;&nbsp;学期：</td>
		            <td>${semId.stage }</td>
		        </tr>
		        <tr>
		            <td class="stutalk">&nbsp;&nbsp;访谈对象：</td>
		            <td>${stuID.stu_name }</td>
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>&nbsp;&nbsp;教员：</td>
		            <td><select class="ZY_tj"  oninput="check(this)" onblur="showw(this)" id="jyzaichang" name="TeacherScene" style="width:160px;height: 30px;">
		            		<option selected="selected" value="在场"  >在场</option>
		            		<option value="未在场"  >未在场</option>
		            </select></td>
		        </tr>
		        <tr>
		            <td class="stutalk">&nbsp;&nbsp;当月笔试：</td>
		             <td><label>
		            	<c:if test="${empty month}"><span style="color:red;">暂无记录</span></c:if>${month.written }
		            </label></td>
		            
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>&nbsp;&nbsp;笔试：</td>
		            <td><input name="writerTest" type="Number" oninput="check(this)" onblur="showw(this)" id="witer" value="" max="150" min="0"/></td>
		        </tr>
		        <tr>
		            <td class="stutalk">&nbsp;&nbsp;当月机试：</td>
		            <td><label>
		            	<c:if test="${empty month}"><span style="color:red;">暂无记录</span></c:if>${month.scjd }
		            </label></td>
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>&nbsp;&nbsp;机试：</td>
		            <td><input name="engineTest" type="Number" oninput="check(this)" onblur="showw(this)" id="engine" value="" max="100" min="0"/></td>
		        </tr>
		        <tr>
		            <td class="stutalk"><span style="color: red;">*</span>&nbsp;&nbsp;访谈时间：</td>
		            <td><input name="a_interviewTime" oninput="check(this)" onblur="showw(this)" type="date" id="inter" class="textStyle" /></td>
		        </tr>
	        	<tr>
		            <td class="stutalk"><span style="color: red;">*</span>&nbsp;&nbsp;访谈类型：</td>
		            <c:forEach items="${interview }" var="interviewlist">
		            	<td><input type="radio"  name="interviewMode_id" class="checkedStyle" checked="checked" value="${interviewlist.id }" data-labelauty="${interviewlist.interviewType }"/>&nbsp;&nbsp;</td>  
		            </c:forEach>
		        </tr>
		    </table>
	    </div>
		<div class="float">
			 <table  class="addTable">
		         <tr>
			         <td class="stutalk">访谈内容：<br/><span class="redFont">(最多50字)</td>
			         <td><textarea name="interviewContent"  cols="50"  rows="15" maxlength="50" onchange="this.value=this.value.substring(0, 50)" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)" ></textarea></td>
			     </tr>
			     <tr>
			         <td class="stutalk">备注：<br/><span class="redFont">(最多50字)</td>
			         <td><textarea name="remark" cols="50"  rows="6" maxlength="50" onchange="this.value=this.value.substring(0, 50)" onkeydown="this.value=this.value.substring(0, 50)" onkeyup="this.value=this.value.substring(0, 50)" ></textarea></td>
		         </tr>
		     </table>
	    </div>
	    <div class="btposition1">
	        <input type="submit" value="保存" id="baocun" class="saveBotton" />
	    </div>
    </form>
   </div>
</div>
</body>
</html>
