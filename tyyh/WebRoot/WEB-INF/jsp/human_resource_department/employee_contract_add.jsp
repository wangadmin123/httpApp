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
<title>添加合同信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<style type="text/css">
	.existence{
		color: red;
	}
</style>
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
		location.href="employee_contract_search.html";
	}		
}

$(function(){
	$("#contract_id").blur(function(){
		$(".existence").html("");
		var arr = document.getElementsByName("oaRlzybContractContractId");	//6
		var contract_id = $("#contract_id").val();
		var show = null;
		for(var i = 0; i < arr.length; i++){
			if(contract_id == ""){
				show = " 请输入合同编号";
			}else if(contract_id == arr[i].value){
				show = " 此合同编号已存在";
				break;
			}else{
				show = " √ ";
			}
		}
		$(".existence").html(show);
	});
});


/*保存读秒结束*/
</script>
    <style>

/*        *{border: black solid 1px}*/
    </style>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">添加合同信息</h1>
      <form action="employee_contract_add" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth"><span></span>合同编号：</td>
          <td><input type="text" class="selectStyle" id="contract_id" name="contract_id" style="width:250px;" maxlength="30"  /><span class="existence" name="existence"> 请输入合同编号</span></td>
          <td>
          	<c:if test="${oaRlzybContracts != null }">
          		<c:forEach items="${oaRlzybContracts }" var="oaRlzybContract">
          			<input type="hidden" name="oaRlzybContractContractId" class="oaRlzybContractContractId" value="${oaRlzybContract.contract_id}" />
          		</c:forEach>
          	</c:if>
          </td>
        </tr>
   
        <tr>
          <td class="tdWidth">部门：</td>
          <td><input type="hidden"  name="depart_id" value="${oaRlzybContract.emp_department }" />
		    <input type="text" class="textStyle" style="width:160px;border-style: none;" value="${oaRlzybContract.depart_name }" readonly="readonly"  />
          </td>
        </tr>
        <tr>
          <td class="tdWidth"><span></span>姓名：</td>
          <td><input type="hidden"  name="emp_id" value="${oaRlzybContract.emp_id }" />
		    <input type="text" class="textStyle" style="width:160px;border-style: none;" value="${oaRlzybContract.emp_name }" readonly="readonly"  /></td>
        </tr>
		  <tr>
		    <td class="tdWidth"><span></span>岗位：</td>
		    <td><input type="hidden"  name="position_id" value="${oaRlzybContract.emp_position }" />
		    <input type="text" class="textStyle" style="width:160px;border-style: none;" value="${oaRlzybContract.position_name }" readonly="readonly"  /></td>
		  </tr>
        <tr>
          <td class="tdWidth">起始时间：</td>
          <td >
            <input type="date" class="dateStyle" name="contract_startDate"  style="width:160px;">
          </td> 
        </tr>
        <tr>
          <td class="tdWidth">截止时间：</td>
          <td ><input type="date" class="dateStyle" name="contract_endDate"  style="width:160px;"> </td>
        </tr>
        <tr>
          <td class="tdWidth">归属公司：</td>
          <td ><select name="contract_company"  style="width:230px;">
          	<option value="山西多元合创教育科技有限公司">山西多元合创教育科技有限公司</option>
          	<option value="太原市多元职业培训学校">太原市多元职业培训学校</option>
          	<option value="太原市映辉科技有限公司">太原市映辉科技有限公司</option>
          </select>
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
