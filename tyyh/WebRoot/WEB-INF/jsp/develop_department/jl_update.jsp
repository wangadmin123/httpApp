<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>修改小组模板</title>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/switch.css">
<link href="css/bootstrap.min.css" rel="stylesheet" >
<script type="text/javascript" src="statics/develop_department/js/jquery-1.12.4.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
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
		location.href="jl_xzgl.html";
	}		
}
/*保存读秒结束*/
</script>
<style type="text/css">

td{  
    text-align:center;  
} 
.table{
	width: 90%;
}
</style>
</head>
<body>
<div class="rightContent">

  <div class="col-xs-12 col-md-4">

    <h2 >修改小组</h2>
   
    <hr/>
      <form action="#" method="post" enctype="multipart/form-data">
     
			<table class="table table-hover table-bordered">
				<tr style="background-color: #44BB00">
				<td>第一组</td><td>负责：教支部</td>
				</tr>
				<tr><td>组长</td><td>李鹏</td></tr>
				<tr><td>副组长</td><td>李鹏</td></tr>
				<tr><td>组员1</td><td>李鹏</td></tr>
				<tr><td>组员2</td><td>李鹏</td></tr>
				<tr><td>组员3</td><td>李鹏</td></tr>
					
			</table>
	      
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="保存" class="saveBotton" />
	  </div>
     </form> 

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>

</body>
</html>
