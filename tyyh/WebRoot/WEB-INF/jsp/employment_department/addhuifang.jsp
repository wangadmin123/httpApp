<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>新增，修改模板</title>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/switch.css">
<script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
<script type="text/javascript" src="statics/employment_department/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="statics/employment_department/js/jquery.jedate.js"></script>
<link type="text/css" rel="stylesheet" href="statics/employment_department/css/jedate.css">
<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);
    $(".BackBotton").click(function(){
		window.history.back();
	});
});


/*保存读秒*/
var miao;
var myTime;
$(function(){
	$(".saveBotton").click(function(){
	
	    var from=$("#women");
	    var flag1=false;
	 
	    if(from.visit_content.html() != null){
	     flag1=true;
	    }
	    
	    if(flag1){
		miao=2;
		$(".setTime").text(miao);
		$(".saveStyle").css("display","block");
		myTime=setInterval("divHide()",1000);}
	   
    });  
});




	function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:360px");};
	    if(emp_name_in!=""){$(ww).attr("style","width:360px");};
	
	}
	
	
	
	function www(from){
      showw(from.visit_content);
  
      
   
      if( from.visit_content.value=="" || from.visit_content.value==null){
           return false;
      }

       return true;
    
    }
function divHide(){
	miao--;
	$(".setTime").text(miao);
	if(miao==0){
		clearInterval(myTime);
		$(".saveStyle").hide();
		location.href="fangtan.html";
	}		
}
/*保存读秒结束*/
</script>



</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">新增回访</h1>
      <form action="${pageContext.request.contextPath }/employment_department/tianjiahuifang"  id="women" onsubmit="return www(this)" method="post">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
       
                <input type="hidden" value="${stuid }" name="id"/>
                
        <%--         <tr>
               
              <td class="tdWidth">回访日期：</td>
              <td> <input type="date" class="dateStyle"  style="width:160px;" name="createtime"/> 
             
    
              </td>
          </tr> --%>
                <tr>
                <tr>
              <td class="tdWidth">回访方式：</td>
              <td><select class="selectStyle" style="width:120px;" name="visit_way">
                  <option>面谈</option>
                  <option>微信</option>
                  <option>手机</option>
                  <option>邮件</option>
                  <option>其他</option>
              </select></td>
          </tr>
                   <tr> <td class="tdWidth"><span>*</span>回访记录：</td>
                    <td><textarea  class="areaStyle" style="width:360px;" name="visit_content"></textarea></td>
                </tr>

                
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="保存" class="saveBotton" />
	     <input type="button" class="BackBotton" value="返回"/>
	  </div>
     </form> 

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>

</body>
</html>
