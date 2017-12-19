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
<title>添加带班计划</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/insert.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/addDbjh.js"></script>
<script type="text/javascript">
//js判断验证为空
function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:800px");};
	if(emp_name_in!=""){$(ww).attr("style","border:#A9A9A9 1px solid;width:800px");};
	}
function showww(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	if(emp_name_in!=""){$(ww).attr("style","border:#A9A9A9 1px solid;width:160px");};
	}
function showwww(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==0){$(ww).attr("style","border:red 1px solid;width:100px");};
	if(emp_name_in!=0){$(ww).attr("style","border:#A9A9A9 1px solid;width:100px");};
	}
	
function check(form) {

		var nameValue = window.document.getElementById("a").value;
		var ageValue = window.document.getElementById("b").value;
		var ageValue1 = window.document.getElementById("c").value;
		var ageValue2 = window.document.getElementById("f").value;
		if (nameValue == "" || ageValue == ""||ageValue1=="" ||ageValue2==0) {
			document.getElementById("d").disabled = true;
			return false;
		} else {

			document.getElementById("d").disabled = false;
		}

		return true;
	}
	$(function() {

		var nameValue = window.document.getElementById("a").value;
		var ageValue = window.document.getElementById("b").value;
		var ageValue1 = window.document.getElementById("c").value;
		var ageValue2 = window.document.getElementById("f").value;
		if (nameValue == "" || ageValue == "" ||ageValue1==""||ageValue2==0) {

			document.getElementById("d").disabled = true;
			return false;
		}
	});

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
	}		
}
  $(function(){
	  $("#sss").focus();
	  });
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">新增带班计划</h1>
      <form action="${pageContext.request.contextPath }/addDBJH" method="post" enctype="multipart/form-data">
     
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
           <td class="tdWidth">老师：</td>
           <td>${loginUser.name }</td>       
        </tr>
        <tr>
          <td class="tdWidth" ><span style="color: red;">*</span>阶段：</td>
          <td>
           <select name="Stage_id"  id="f" oninput="check(this)" onblur="showwww(this)" >
              <option value="0" selected="selected">--请选择--</option>
              <c:forEach items="${OaJzbTermstages }" var="OaJzbTermstages">
              <option value="${OaJzbTermstages.termStage_id }">${OaJzbTermstages.termStage_name }</option>
              </c:forEach>
            </select>
         </td>
        </tr>
        <tr>
          <td class="tdWidth" ><span style="color: red;">*</span>课程内容：</td>
          <td><input type="text" class="dateStyle" id="a" oninput="check(this)" onblur="showww(this)" name="coursecontent" style="width:160px;" /></td>
        </tr>
        <tr>
          <td class="tdWidth"><span style="color: red;">*</span>可能发生问题：</td>
          <td><textarea  class="areaStyle" id="b" oninput="check(this)" onblur="showw(this)" style="width:800px;" name="question"></textarea></td>
        </tr>
        <tr>
          <td class="tdWidth"><span style="color: red;">*</span>主要工作：</td>
          <td><textarea  class="areaStyle" id="c" oninput="check(this)" onblur="showw(this)" style="width:800px;" name="work"></textarea></td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition2">
	    <input type="submit" id="d" value="保存" class="saveBotton" />
	  </div>
     </form> 
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>