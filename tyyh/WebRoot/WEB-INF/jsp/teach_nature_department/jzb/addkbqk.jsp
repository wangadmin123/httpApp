<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>编辑班级管理信息</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/popup.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/insert.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript">

$(function(){
            /*点击显示弹出框*/
            $(".pooupBotton").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");
            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var mbHeight= $(document).height();
            var delHeight=$(window).height();
            var saveWidth=$(window).width();
            $(".mbStyle").css("height",mbHeight);
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",delHeight/2-240);
            $(".saveBotton").click(function(){
              location.href="../jzb/selectgrade.jsp";
            });
        });
/* js为空验证 */
function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;solid;width:160px;");};
	if(emp_name_in!=""){$(ww).attr("style","border:#A9A9A9 1px solid;solid;width:160px;");};
	}	
/* 验证是否为空，是空是保存按钮不能按 */
function check(form) {
		var name = window.document.getElementById("kb_name").value;
		
		var age = window.document.getElementById("kb_age").value;
		if (name == "" || age==0) {
			document.getElementById("baocun").disabled = true;
			return false;
		} else {
			document.getElementById("baocun").disabled = false;
		}
		return true;
	}
$(function() {
		var name = window.document.getElementById("kb_name").value;
		var age = window.document.getElementById("kb_age").value;
		if (name == "" || age==0) {
			document.getElementById("baocun").disabled = true;
			return false;
		}
});
</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">新增开班情况分析表</h1>
      <form action="${pageContext.request.contextPath }/addopenclass.html" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;姓名：</td>
          <td><input name="Name" type="text" id="kb_name" class="textStyle" style="width:160px;" oninput="check(this)" onblur="showw(this)" placeholder="请输入姓名" value="${studentInfo.stu_name }" /></td>
        </tr>
        <tr>
          <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;性别：</td>
          <td>
          	${studentInfo.stu_sex}
          	<c:if test="${studentInfo.stu_sex == '男'}">
          		<input type="hidden"  name="sex" class="checkedStyle" value="1"/>
          		<!-- <input type="radio"  name="sex" class="checkedStyle" value="1" checked="checked"/>男&nbsp;&nbsp;
              	<input type="radio"  name="sex" class="checkedStyle" value="2"/>女&nbsp;&nbsp; -->
          	</c:if>
          	<c:if test="${studentInfo.stu_sex == '女'}">
          		<input type="hidden"  name="sex" class="checkedStyle" value="2"/>
          		<!-- <input type="radio"  name="sex" class="checkedStyle" value="1"/>男&nbsp;&nbsp;
              	<input type="radio"  name="sex" class="checkedStyle" value="2" checked="checked"/>女&nbsp;&nbsp; -->
          	</c:if>
         </td>
        </tr>
        <tr>
        <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;年龄：</td>
          <td>${studentInfo.stu_age }<input name="age" id="kb_age" type="hidden" required="required" class="textStyle" style="width:160px;" oninput="check(this)" onblur="showw(this)" placeholder="请输入年龄" value="${studentInfo.stu_age }" /></td>
        </tr>
        <tr>
          <td class="tdWidth">学历：</td>
          <td>
          	${studentInfo.education_name}
           	  <c:forEach items="${educationlist }" var="edulist">
           	  	<c:if test="${studentInfo.education_name == edulist.education}">
           	    	<input type="hidden"  name="study_experience" class="checkedStyle" value="${edulist.id }"/>
           	  	</c:if>
           	  	<%-- <c:if test="${studentInfo.education_name != edulist.education}">
           	    	<input type="radio"  name="study_experience" class="checkedStyle" value="${edulist.id }"/>${edulist.education }&nbsp;&nbsp;
           	  	</c:if> --%>
           	  </c:forEach>
         </td>
        </tr>
        <tr>
          <td class="tdWidth">计算机水平：</td>
          <td> 
           	  <input type="radio"  name="computer_horizontal" class="checkedStyle" value="优" checked="checked"/>优&nbsp;&nbsp;
           	  <input type="radio"  name="computer_horizontal" class="checkedStyle" value="一般"/>一般&nbsp;&nbsp;
           	  <input type="radio"  name="computer_horizontal" class="checkedStyle" value="差"/>差&nbsp;&nbsp;
         </td>
        </tr>
       
        <tr>
          <td class="tdWidth">备注：</td>
          <td><input name="remarks" type="text" class="textStyle" style="width:400px;line-height: 40px;" placeholder="请说明详细情况" value="" /></td>
        </tr>
        <tr>
          <td class="tdWidth">就业城市：</td>
          <td><input name="city" type="text" class="textStyle" style="width:200px;line-height: 40px;" placeholder="请输入就业城市" value="" /></td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
      <div class="btposition1" id="btposition2">
        <input type="submit" value="保存" id="baocun" class="pooupBotton" />
      </div>
    </form> 
</div>
</div>
</body>
</html>