<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">


<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>修改</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/sanji.js"></script>
<script type="text/javascript" src="statics/common/js/pinying.js"></script>

<script type="text/javascript">


/*确定保存弹出框的位置*/
$(function(){

    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});
		var str=name.trim();
		var phoneticize = makePy(str);
		$("#phoneticize").val(phoneticize);
	var miao;
var myTime;
$(function(){

	$(".saveBotton").click(function(){
	    var from=$("#women");
	    var flag1=false;
	    var flag2=false;
	    var flag3=false;

	    if(from.name.html() != null){
	     flag1=true;
	    }
	    if(from.age.html() != null){
	     flag2=true;
	    }
	     if(from.telphone1.html() != null){
	     flag3=true;
	    }
	 
	    if(flag1&&flag2&&flag3){
	    
		miao=2;
		$(".setTime").text(miao);
		$(".saveStyle").css("display","block");
		myTime=setInterval("divHide()",1000);}
	   
    });  
});
function divHide(){
	miao--;
	$(".setTime").text(miao);
	if(miao==0){
		clearInterval(myTime);
		$(".saveStyle").hide();
		location.href="welcome.html";
	}		
}

	function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){
		$(ww).attr("style","border:red 1px solid;width:160px");
	};
	if(emp_name_in!=""){
		$(ww).attr("style","width:160px");
	};
}
/* 验证手机号格式 */
/* 	function showwcontactway(ww){
	var sfzz=/^1[34578]\d{9}$/;
	var emp_name_in = $(ww).val();	
	if(emp_name_in==null||emp_name_in==""||sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","width:160px");
	}else{
		$(ww).attr("style","border:red 1px solid;width:160px");
	}
	}; */
	
/* 	function www(from){
      showw(from.name);
      showw(from.age);
      showw(from.telphone1);

      if( from.name.value=="" || from.name.value==null){
           return false;
      }
      if( from.age.value=="" || from.age.value==null){
           return false;
      }
       if( from.telphone1.value=="" || from.telphone1.value==null){
           return false;
      }
   
       return true;
    
    } */
	$(function(){
		
		$("#btn").attr("disabled", true); 
	
		
		$("#btn").css("background-color","#BEBEBE");
	
	});
//非空验证
function judgeNull(){
	//var ntime=$("#ntime").val(); ntime==""|| ntime!=""&&
	var returnvisitRecord=$("#returnvisitRecord").val();
	var YourDataID=$("#YourDataID").val();
	if(YourDataID==""||returnvisitRecord==""){

		$("#btn").attr("disabled",true); 
		$("#btn").css("background-color","#BEBEBE");
	}
	if(YourDataID!=""&&returnvisitRecord!=""){
		$("#btn").attr("disabled", false); 
		$("#btn").css("background-color","#00BB00");
	}
	/* if(ntime==""){
		$("#ntime").attr("style","border:red 1px solid;width:160px");
	}else{
		$("#ntime").attr("style","border:#CCCCCC 1px solid;width:160px");
	} */
	if(YourDataID==""){
		$("#YourDataID").attr("style","border:red 1px solid;width:160px");
	}else{
		$("#YourDataID").attr("style","border:#CCCCCC 1px solid;width:160px");
	}
	if(returnvisitRecord==""){
		$("#returnvisitRecord").attr("style","border:red 1px solid;width: 800px ;height: 150px; resize:none;");
	}else{
		$("#returnvisitRecord").attr("style","border:#CCCCCC 1px solid;width: 800px ;height: 150px; resize:none;");
	
	}

}


</script>
<script type="text/javascript">
	$(function() {
		$(".line").click();
		document.getElementById('YourDataID').valueAsDate = new Date();
	});
</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">回访</h1>
      <form action="teacher/consultTeacherAdda?employee_id=${loginUser.emp_id}&stutas=${stuId}"  method="post" onsubmit="return www(this)" enctype="multipart/form-data" id="women">
     
       <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      <h5>回访人信息</h5>
         <tr>
          <td class="tdWidth">姓名：</td>
          <td>${oaScbConsulter.name } <input type="hidden" class="textStyle"  name="name" onblur="showw(this)"  style="width:170px;" value=${oaScbConsulter.name } /></td>
          <td style="text-align: right;">性别：</td>
          <td>
          <c:if test="${oaScbConsulter.sex==1}">
     
          <input type="hidden"   value='1' name="sex" checked="checked" class="radioStyle" />男
           </c:if>
           <c:if test="${oaScbConsulter.sex==2}"> 
          
            <input type="hidden"   value='2'  name="sex"   class="radioStyle" checked="checked"/>女</td> 
           </c:if>
          	 
          <td class="tdWidth">年龄：</td>
          <td>${oaScbConsulter.age }<input type="hidden"   min="1" max="100"  name="age" class="textStyle"  style="width:170px;"  value=${oaScbConsulter.age } /></td> 
       
           <td class="tdWidth">联系方式：</td>
          	<td>${oaScbConsulter.telphone1 }<input type="hidden"  name="telphone1"  class="textStyle" style="width:170px;" value=${oaScbConsulter.telphone1 } /></td>
        </tr>
        <tr>
          <td class="tdWidth"><span>*</span>本次回访时间：</td> 
             <td><input type="date" id="YourDataID" class="dateStyle" name="returnvisitTimes" onblur="judgeNull()" style="width:160px;"/></td> 
          <td class="tdWidth"><span>*</span>下次回访时间：</td> 
             <td><input type="date" id="ntime" class="dateStyle" name="nextvisitTimes"  style="width:160px;"/></td> 
        
        </tr>
        <table>
       		<tr>
         
 		  <td class="tdWidth">回访：</td>
          <td><textarea name="returnvisitRecord" id="returnvisitRecord" onblur="judgeNull()" cols="x"  rows="y" style="width: 800px ;height: 150px; resize:none;" ></textarea></td>
		
       	</tr> 
      </table >
         

      </table>
      
      <input type="hidden" name="phoneticize" id="phoneticize" >
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="保存"  onclick="judgeNull()"  class="saveBotton" id="btn" style="float: right;"/>
	  </div>
     </form> 

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>
