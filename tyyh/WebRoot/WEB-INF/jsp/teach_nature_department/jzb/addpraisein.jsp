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
    <meta charset="UTF-8">
<title>新增口碑</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/popup.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/daily.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>

<script type="text/javascript">
/*确定保存弹出框的位置*/
$(function(){
    var mbHeight= $(document).height();
    var delHeight=$(window).height();
    var saveWidth=$(window).width();
    $(".mbStyle").css("height",mbHeight);
    $(".popupStyle").css("left",saveWidth/2-250);
    $(".popupStyle").css("top",delHeight/2-280);
    $(".saveBotton").click(function(){
       location.href="statics/teach_nature_department/jzb/publicPraise.jsp";
         });
   });
/* js为空验证 */
function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;solid;width:160px;");};
	if(emp_name_in!=""){
		$(ww).attr("style","border:#A9A9A9 1px solid;solid;width:160px;");};
	}	
/* 验证是否为空，是空是保存按钮不能按 */
function check(form) {
		var zxzName=window.document.getElementById("zxzName").value;
		
		var jsrName = window.document.getElementById("jsrName").value;
		
		var age = window.document.getElementById("age").value;
		
		var jsrLX = window.document.getElementById("jsrLX").value;
		
		var zxzLX = window.document.getElementById("zxzLX").value;
		
		if (zxzName == "" || jsrName == "" || age==0 || jsrLX=="" || zxzLX=="") {
			document.getElementById("baocun").disabled = true;
			return false;
		} else {
			document.getElementById("baocun").disabled = false;
		}
		return true;
	}
$(function() {
		var zxzName=window.document.getElementById("zxzName").value;
		
		var jsrName = window.document.getElementById("jsrName").value;
		
		var age = window.document.getElementById("age").value;
		
		var jsrLX = window.document.getElementById("jsrLX").value;
		
		var zxzLX = window.document.getElementById("zxzLX").value;
		
		if (zxzName == "" || jsrName == "" || age==0 || jsrLX=="" || zxzLX=="") {
			document.getElementById("baocun").disabled = true;
			return false;
		}
});
</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">新增口碑</h1>
      <form action="${pageContext.request.contextPath }/addOaJzbPraise.html" method="post" enctype="multipart/form-data " id="addpraises" onsubmit="return check(this)">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td  colspan="2">咨询者</td>
          <td  colspan="2">介绍人</td>
        </tr>
        <tr>
          <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;姓名：</td>
          <td><input type="text" class="textStyle" name="consultant_name" oninput="check(this)" onblur="showw(this)" id="zxzName" style="width:160px;" placeholder="请输入姓名" value=""  /></td>
          <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;姓名：</td>
          <td><input type="text" class="textStyle" name="name" oninput="check(this)" onblur="showw(this)" id="jsrName" style="width:160px;" placeholder="请输入姓名" value=""   /></td>
        </tr>
        <tr>
          <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;年龄：</td>
          <td><input type="number" name="consultant_age" min="1" max="100" oninput="check(this)" onblur="showw(this)" id="age" class="textStyle" placeholder="请输入年龄" value="" style="width:160px;" /></td>
          <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;联系方式：</td>
           <td><input type="text" name="phone" class="textStyle" oninput="check(this)" onblur="showw(this)" id="jsrLX" style="width:160px;" value="" /></td>
        </tr>
        <tr>
          <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;性别：</td>
          <td>
              <input type="radio"  name="sex" class="checkedStyle" value="男" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;
		 	  <input type="radio"  name="sex" class="checkedStyle" value="女"/>女</td>  
         <td class="stutalk" style="text-align:right;"><span style="color: red;">*</span>&nbsp;&nbsp;是否跟进：</td>
		 <td><input type="radio"  name="follow" class="checkedStyle" value="跟进" checked="checked"/>跟进&nbsp;&nbsp;&nbsp;&nbsp;
		 	<input type="radio"  name="follow" class="checkedStyle" value="不跟进"/>不跟进</td>  
        </tr>
        <tr>
          <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;状态：</td>
          <td>
              <c:forEach items="${statuslist }" var="status">
              	<input type="radio"  name="status" class="checkedStyle" value="${status.id }" checked="checked"/>${status.status }&nbsp;&nbsp;&nbsp;&nbsp;
              </c:forEach>
          </td>
          <td class="tdWidth">&nbsp;&nbsp;所在班级：</td>
          <td><select class="ZY_tj" style=" width: 160px; height:30px;" name="gradeId">
         			<option  value="0">--请选择--</option>
		      	<c:forEach items="${gradelist }" var="grade">
		      		<option  value="${grade.id }">${grade.name }</option>
		      	</c:forEach>
            	</select></td>    
        </tr>
          <tr>
           <td class="tdWidth"><span style="color: red;">*</span>学历：</td>
              <td><select class="selectStyle" name="Record_id" oninput="check(this)" onblur="showw(this)" id="xueli" style=" width: 160px; height:30px;">
                  <c:forEach items="${edulist }" var="edu">
                  	 <option value="${edu.id }">${edu.education }</option>
                  </c:forEach>
              </select></td>
              <%-- <td class="tdWidth">班主任：</td>
              <td>
                  <c:forEach items="${emplist }" var="emplist">
                  <input type="radio"  name="Teacher_id" class="checkedStyle" value="${emplist.emp_id }" checked="checked"/>${emplist.emp_name }&nbsp;&nbsp;&nbsp;&nbsp;
                  </c:forEach>
         	 </td> --%>
         	 <td class="tdWidth">和咨询者关系：</td>
         	  <td><input type="text" class="textStyle" style="width:160px;" name="Consultant_nexus"/></td>
          </tr>
          <tr>
          	  <td class="tdWidth"><span style="color: red;">*</span>&nbsp;&nbsp;	联系方式：</td>
              <td><input name="contact_way" type="text" class="textStyle" oninput="check(this)" onblur="showw(this)" id="zxzLX" style="width:160px;" value="" /></td>
              <td class="tdWidth">备注：</td>
              <td><textarea  class="areaStyle" style="width:360px;" name="Sponsor_remark"></textarea></td>
          </tr>
          <tr>
              <td class="tdWidth">紧急联系人方式：</td>
              <td><input type="text" class="textStyle"  style="width:160px;" value="" name="contacts"/></td>
              
          </tr>
          <tr>
              <td class="tdWidth" >备注：</td>
              <td>
                  <textarea  class="areaStyle" style="width:360px;" name="Consultant_remarks"></textarea>
             </td>
          </tr>
        <tr>    
        </tr>
      </table>	
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1" style="margin-left:600px;">
	    <input type="submit" value="保存" class="saveBotton" id="baocun"/>
	  </div>
     </form>    
</div>
</div>

</body>
</html>
