<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>修改项目答辩分组及成员</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/addpatrol.css"/>
	<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
	<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
	<script src="statics/teach_nature_department/jzb.js/jquery-1.12.4.js"></script>
	<script src="statics/teach_nature_department/jzb.js/jquery-labelauty.js"></script>
	<link rel="stylesheet" href="statics/teach_nature_department/jzb.css/jquery-labelauty.css">

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
		location.href="../welcome.jsp";
	}		
}
$(function(){
	$(':input').labelauty();
});
//点击加载分组
$(function(){
	$(".addGroup").click(function(){
		$(".dowetable3").append("<tr><td><input type='radio' name='grades' data-labelauty='第七组'></td></tr>");
	});	
	
});
/*保存读秒结束*/
</script>
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
	<div class="addpatroldiv">
		<h2>修改分组</h2>
		<form action="">
		<h3>小组</h3>
		<table  class="dowetable3">
			<tr>
				<td><input type="radio" name="grades" data-labelauty="第一组"></td>
				<td><input type="radio" name="grades" data-labelauty="第二组"></td>
				<td><input type="radio" name="grades" data-labelauty="第三组"></td>
				<td><input type="radio" name="grades" data-labelauty="第四组"></td>
				<td><input type="radio" name="grades" data-labelauty="第五组"></td>
				<td><input type="radio" name="grades" data-labelauty="第六组"></td>
			</tr>
			<tr>
				<td><input type="radio" name="grades" data-labelauty="第七组"></td>
				<td><input type="radio" name="grades" data-labelauty="第八组"></td>
				<td><input type="radio" name="grades" data-labelauty="第九组"></td>
				<td><input type="radio" name="grades" data-labelauty="第十组"></td>
			</tr>
		</table>
		
		<h3>小组成员</h3>	
		<table  class="dowetable">		
			<tr>
				<td><input type="checkbox" name="name" data-labelauty="李鹏"></td>
				<td><input type="checkbox" name="name" data-labelauty="小明"></td>
				<td><input type="checkbox" name="name" data-labelauty="小胡"></td>
				<td><input type="checkbox" name="name" data-labelauty="小李"></td>
				<td><input type="checkbox" name="name" data-labelauty="小米"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="name" data-labelauty="小优"></td>
				<td><input type="checkbox" name="name" data-labelauty="小偷"></td>
				<td><input type="checkbox" name="name" data-labelauty="小草"></td>
				<td><input type="checkbox" name="name" data-labelauty="小龙"></td>
				<td><input type="checkbox" name="name" data-labelauty="小三"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="name" data-labelauty="二傻"></td>
				<td><input type="checkbox" name="name" data-labelauty="二蛋"></td>
				<td><input type="checkbox" name="name" data-labelauty="二狗"></td>
				<td><input type="checkbox" name="name" data-labelauty="二龙"></td>
				<td><input type="checkbox" name="name" data-labelauty="二主"></td>
			</tr>
			<tr>
				<td><input type="checkbox" name="name" data-labelauty="散弹"></td>
				<td><input type="checkbox" name="name" data-labelauty="思绪"></td>
				<td><input type="checkbox" name="name" data-labelauty="马克思"></td>
				<td><input type="checkbox" name="name" data-labelauty="嗯饿死"></td>
				<td><input type="checkbox" name="name" data-labelauty="lsaw"></td>
			</tr>
		</table>	
		  <div class="btposition1">
		    <input type="button" value="保存" class="saveBotton" />
		    <input type="button" value="返回" class="saveOut" />
		  </div>
		  
		  <!--保存-->
		<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
<!--结束-->

		</form>
		
	</div>
  </body>
</html>
