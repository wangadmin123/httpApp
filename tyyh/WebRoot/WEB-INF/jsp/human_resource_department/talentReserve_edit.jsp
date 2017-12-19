<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>编辑人才储备信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript">

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
		location.href="talentReserve_search.html";
	}		
}
function showage(age){
var agestr = $(".dateStyle").val();
var agestr1 = agestr.substring(0,4); 
var today =  new Date();
var year = today.getFullYear();
/* alert(year-agestr1); */
$("#talent_pool_age").val(year-agestr1);
}



/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">编辑人才储备信息</h1>
      <form action="talentReserve_edit" method="post" >
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      	<input type="hidden" value="${oaRlzybTalentPool.talent_pool_id }" id="talent_pool_id" name="talent_pool_id" />
        <tr>
          <td class="tdWidth">姓名：</td>
          <td><input type="text" class="textStyle" id="talent_pool_name" name="talent_pool_name" style="width: 100px" value="${oaRlzybTalentPool.talent_pool_name }"></td>
        </tr>
        <tr>
          <td class="tdWidth">性别：</td>
          <td>
	          <c:if test="${oaRlzybTalentPool.talent_pool_sex == '男' }">
	          	<input type="radio" name="talent_pool_sex" checked class="radioStyle" value="男">男
	          	&nbsp;&nbsp;<input type="radio"  class="radioStyle" name="talent_pool_sex" value="女">女
	          </c:if>
	          <c:if test="${oaRlzybTalentPool.talent_pool_sex == '女' }">
	          	<input type="radio" name="talent_pool_sex"  class="radioStyle" value="男">男
	          	&nbsp;&nbsp;<input type="radio"  class="radioStyle" checked name="talent_pool_sex" value="女">女
	          </c:if>
	          
          </td>
        </tr>
        <tr>
          <td class="tdWidth">出生日期：</td>
          <td><input type="date" name="talent_pool_birthday" id="talent_pool_birthday" value="${oaRlzybTalentPool.talent_pool_birthday }" class="dateStyle"  style="width:160px;"   onchange="showage(this)"/></td>
        </tr>
        <tr>
          <td class="tdWidth">年龄：</td>
          <td><input type="text" class="textStyle" value="${oaRlzybTalentPool.talent_pool_age }" id="talent_pool_age" name="talent_pool_age" style="width:160px;border-style: none" readonly   />
        </tr>
        <tr>
          <td class="tdWidth">应聘日期：</td>
          <td><input type="date" class="dateStyle" id="talent_pool_addTime" name="talent_pool_addTime" value="${oaRlzybTalentPool.talent_pool_addTime }"  style="width:160px;"/></td>
        </tr>
        <tr>
          <td class="tdWidth">应聘职位：</td>
          <td>
            <select class="selectStyle" name="position_id" id="position_id" style="width:120px;">
                <option value="0">--请选择--</option>
                <c:if test="${oaRlzybPositions != null}">
	    			<c:forEach var="oaRlzybPosition" items="${oaRlzybPositions }" >
	    				<c:if test="${oaRlzybTalentPool.position_id == oaRlzybPosition.position_id }">
	    					<option selected="selected" value="${oaRlzybPosition.position_id }">${oaRlzybPosition.position_name }</option>
	    				</c:if>
	    				<c:if test="${oaRlzybTalentPool.position_id != oaRlzybPosition.position_id }">
	    					<option value="${oaRlzybPosition.position_id }">${oaRlzybPosition.position_name }</option>
	    				</c:if>
					</c:forEach>
				</c:if>
            </select>
          </td>
        </tr>
        <tr style="width: 400px">
          <td class="tdWidth">薪资期望：</td>
          <td><input type="text" class="textStyle" id="talent_pool_salaryExpect" style="width:120px;"  name="talent_pool_salaryExpect" value="${oaRlzybTalentPool.talent_pool_salaryExpect }" readonly="readonly" /></td>
        </tr>
        <tr style="width: 400px">
          <td class="tdWidth"></td>
          <td><input type="number" class="textStyle"style="width:120px;" id="start" name="start" >~<input class="textStyle"style="width:120px;" id="end"  type="number" name="end"></td>
        </tr>
        <tr>
          <td class="tdWidth">联系电话：</td>
          <td><input type="text" class="textStyle" style="width:120px;" id="talent_pool_phone" name="talent_pool_phone" value="${oaRlzybTalentPool.talent_pool_phone }"></td>
        </tr>
        <tr>
          <td class="tdWidth">工作经验：</td>
          <td>
            <textarea rows="5" cols="50" id="talent_pool_work_experience" name="talent_pool_work_experience">${oaRlzybTalentPool.talent_pool_work_experience }</textarea>
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
