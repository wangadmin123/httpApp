<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html >
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
<script type="text/javascript" src="statics/human_resource_department/js/getSimpleName.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/formShow.js"></script>
<script type="text/javascript">

	
$(document).ready(function(e) {
    $("#all").click(function(){    
    	if(this.checked){    
        	$(".dfinput3").attr("checked", true);   
    	}else{    
        	$(".dfinput3").attr("checked", false); 
   		}    
	});
	
$(".dfinput3").click(function(){
		var $isChecked = $(".dfinput3").is(":checked");	
		if($isChecked==false){
			$("#userCheck").html("请选择接收方.");
		}
		if($isChecked==true){
			$("#userCheck").html("");
		}
});	
$("#form").submit(function(e) {
       if(check()){
			var flag=window.confirm('确定发送?');
			if(flag==true){
				return true;
			}
		}
        return false;
    });
	function check(){
		var flag=true;
		var $isChecked = $(".dfinput3").is(":checked");	
		if($isChecked==false){
			$("#userCheck").html("请选择接收方");
			flag= false;
		}
		var val=$("#bt").val();
		if(val==""){
			$("#btcw").html("标题不能为空");			
			flag= false;
		}else{			
			if($("#bt").val().length>50){
				$("#btcw").html("标题长度不能超过50位");			
				flag= false;
			}
		}
		
		
		return flag;
	}
	function checkuser(){
		var $isChecked = $(".dfinput3").is(":checked");	
		if($isChecked==false){
			$("#userCheck").html("请选择接收方.");
			return false;
		}
		return true;
	}
	
});

	/*用户名验证*/
	function checkbt() {
		var user = document.getElementById("bt");
		var userId = document.getElementById("btcw");
		userId.innerHTML = "";
		if ("" == user.value) {
			userId.innerHTML = "标题不能为空";
			return false;
		}else{
			if($("#bt").val().length>50){
				userId.innerHTML = "标题长度不能超过50位";
				return false;
			}
		}
		return true;
	}
	
</script>
</head>
<body style="width:98%;">
    <br/>
	<div class="titleStyle"> 发送通知</div>
	<br/>
	<hr/>
	<br/>
	<form action="Employee/addNotice_add.html?user_id=${user_id}" method="post" id="form" enctype="multipart/form-data" name="emails">
	   
	
	<div class="myTable" style="margin-left:20px;">
	  <table width="1000"  border="1" cellspacing="0" cellpadding="0"  style="text-align:left;">
	     <tr style=" height:30px;">
	      <td width="150"  style="text-align:right;"><em>*</em>&nbsp;&nbsp;发送方：</td>
	      
	     <td><input type="hidden"  name="user_id"   value="${user_id}">
	     <input style=" height:28px;" type="text"  value="${user_name}" class="dfinput3"></td>
	      
	    </tr >
	    <tr style=" height:30px;">
	      <td width="150" rowspan="2"  style="text-align:right;"><em>*</em>&nbsp;&nbsp;接受方：</td>
	      <td width="800" style="text-align:left;">
	      <input type="checkbox" id="all" class="dfinput3" />全选&nbsp;&nbsp;
	     </td>
	    
	    </tr>
	    <tr style=" height:90px;">
	        <!-- <td>&nbsp;</td> -->
	        <td>
	    <%--     <input type="hidden"  name="notice_uid"  value="${user_id}"> --%>
	        <input type="checkbox"  name="checkbox" id="checkbox" value="${user_id}" class="dfinput3">自己&nbsp;&nbsp;
		        <c:forEach items="${userList}" var="user" varStatus="status">
				      <%-- <input type="hidden"  name="notice_uid" value="${user.user_id}" > --%>
				      <input type="checkbox" name="checkbox" id="checkbox" value="${user.user_id}" class="dfinput3">${user.user_name}&nbsp;&nbsp;	
				</c:forEach>
				<a  style="color:red;" id="userCheck"></a>
	         </td>	
		</tr>
	    <tr style=" height:30px;">
	      	<td  style="height:30px; text-align:right;"><em>*</em>&nbsp;&nbsp;标题：</td>
	      	<input   type="hidden" name="delStart" id="delStart" value=""/>
	      	<td>
	      		<input type="text"  name="title" class="dfinput"
	  			id="bt" onblur="checkbt()" style="width:600px;height:28px;"/>
	  			<a style="color: red;" id="btcw"></a>
	  			<input type="hidden" name="id" value="${admin.countyinfo.cid} "/>
	  		</td>
	    </tr>
	    <tr>
	      	<td  style="text-align:right;">内容：</td>
	      	<td style="padding:10px;"><textarea name="content" id="nei" class="textinput" style="width:800px; height:300px;" onblur="nr()"></textarea>
	      		<a style="color: red;" id="btnr"></a>
	      	</td>
	    </tr>
	   
	  </table>
	</div>
<br/>
	<div class="infoTable" style="width:50%">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
	    <tr>
	      	<td style="padding:60px;" >
	      		<input type="submit"  style="height:30px;width:60px;" value="确认发送" class="buttonStyle" />
	       	</td>
	    </tr>
	  </table>
	</div>
    </form>
</body>
</html>

