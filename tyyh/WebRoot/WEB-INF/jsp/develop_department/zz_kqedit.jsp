<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>新增，修改模板</title>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/switch.css">
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/globle.js"></script>
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
		location.href="zz_guanlijindu.html";
	}		
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">修改当天分数</h1>
      <form action="develop/zz_kqeditsave.html" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
         <td class="tdWidth"><span>*</span>姓名：</td>
						<td><input type="text" name="stuname" class="textStyle"
							style="width:160px;" value="${editscore.stuname}" /></td>
        </tr>
          <tr>
          <td class="tdWidth"><span>*</span>分数：</td>
          <input type="hidden" name="groupid"  value="${groupid}"/>
          	<input type="hidden" name="id"  value="${id}"/>
          	<input type="hidden" name="userid"  value="${userid}"/>
          <td><input type="number" class="textStyle" name="score" style="width:160px;" value="${editscore.score}" required="required" /></td>
        </tr>

        <tr>
          <td class="tdWidth">备注：</td>
						<td><textarea class="areaStyle" name="remark"
								style="width:360px;" required="required" >${editscore.remark}</textarea></td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="保存" class="saveBotton" />
	  </div>
     </form> 

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>

</body>
</html>
