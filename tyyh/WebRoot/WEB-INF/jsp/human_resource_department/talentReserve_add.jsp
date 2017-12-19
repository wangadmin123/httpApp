<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>添加人才储备信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});
function showage(age){
var agestr = $(".dateStyle").val();
var agestr1 = agestr.substring(0,4); 
var today =  new Date();
var year = today.getFullYear();
/* alert(year-agestr1); */
$("#age").val(year-agestr1);
}
</script>
  <style>

/*    *{border: solid black 1px}*/
  </style>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">添加人才储备信息</h1>
      <form action="talentReserve.html" method="post" >
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">姓名：</td>
          <td><input type="text" name="talent_pool_name" class="textStyle" style="width: 100px" placeholder="请输入姓名"></td>
        </tr>
        <tr>
          <td class="tdWidth">性别：</td>
          <td><input type="radio" name="talent_pool_sex" class="radioStyle"  checked value="男">男&nbsp;&nbsp;
              <input type="radio" name="talent_pool_sex" class="radioStyle"  value="女">女</td>
        </tr>
        <tr>
          <td class="tdWidth">出生日期：</td>
          <td><input type="date" name="talent_pool_birthday"  class="dateStyle"  style="width:160px;"   onchange="showage(this)"/></td>
        </tr>
        <tr>
          <td class="tdWidth">年龄：</td>
          <td><input type="text" id="age" name="talent_pool_age" class="textStyle" style="width:160px;border-style: none;" readonly   /></td>
        </tr>
        <tr>
          <td class="tdWidth">应聘日期：</td>
          <td><input type="date" name="talent_pool_addTime"  class="dateStyle"  style="width:160px;"/></td>
        </tr>
        <tr>
          <td class="tdWidth">应聘职位：</td>
          <td>
              <select class="textStyle" name="position_id"  style="width:120px;">
                <option value="0">--请选择--</option>
                <c:if test="${oaRlzybPositions != null}">
	    			<c:forEach var="oaRlzybPosition" items="${oaRlzybPositions }" >
	    				<option value="${oaRlzybPosition.position_id }">${oaRlzybPosition.position_name }</option>
					</c:forEach>
				</c:if>
              </select>
          </td> 
        </tr>
        <tr style="width: 400px">
          <td class="tdWidth">薪资期望：</td>
          <td name="talent_pool_salaryExpect">
     			<input type="number" style="width: 60px;" name="start"/>~<input type="number"  style="width: 60px;" name="end" />
     		</td>
        </tr>
        <tr>
          <td class="tdWidth">联系电话：</td>
          <td><input type="text" name="talent_pool_phone"  class="textStyle"  style="width:120px;" placeholder="请输入联系电话"></td>
        </tr>
        <tr>
          <td class="tdWidth">工作经验：</td>
          <td>
            <textarea name="talent_pool_work_experience"  rows="5" cols="50"></textarea>
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
