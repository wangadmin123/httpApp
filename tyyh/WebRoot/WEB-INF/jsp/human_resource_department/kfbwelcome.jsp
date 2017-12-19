<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>列表模板</title>

<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/search.css" />
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css" />

<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
<script type="text/javascript" src="statics/develop_department/laydate/laydate.js"></script>
	<script type="text/javascript">

	$(function() {
		var userid=${sessionScope.user.id};
		$.ajax({
			url:"${pageContext.request.contextPath}/KfbScore/IsClick/"+userid,
			type:"POST",
			success:function(result){
			var isclick=result.extend.flag;
			if(isclick==0){
				
				$("#outqiandao").attr("disabled", "disabled");
			}else if(isclick==1){
				$("#qiandao").val("已签到");
				$("#qiandao").attr("disabled", "disabled");
			}else{
			$("#qiandao").val("已签到");
			$("#outqiandao").val("已签退");
				$("#qiandao").attr("disabled", "disabled");
				$("#outqiandao").attr("disabled", "disabled");
			}
			}
		});
	});
		function time(){
			var times=new Date();
			var hour=times.getHours();
			var min=times.getMinutes();
			var miao=times.getSeconds();
			setTimeout("time()",1000);
			document.getElementById("date").innerHTML="现在时间是:"+hour+"点"+min+"分"+miao+"秒";

		}
		
	$(function() {
		$("#qiandao").click(function() {
			var now = new Date(); //实例一个时间对象；
			$("#qiandao").val("已签到："+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds());
			var nowtime=now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
			$.ajax({
				url:"${pageContext.request.contextPath}/KfbScore/clickTime/"+nowtime,
				type:"POST",
				success:function(result){
				console.log(result);
				$("#qiandao").attr("disabled", "disabled");
				}
			});
			
		});
	});
	$(function() {
		
		
		$("#outqiandao").click(function() {
			var now = new Date(); //实例一个时间对象；
			$("#outqiandao").val("已签退："+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds());
			var nowtime=now.getFullYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
	 		$.ajax({
				url:"${pageContext.request.contextPath}/KfbScore/outTime/"+nowtime,
				type:"POST",
				success:function(result){
				console.log(result);
				$("#outqiandao").attr("disabled", "disabled");
				}
			}); 
			
		});
		});

			function time(){
			var times=new Date();
			var hour=times.getHours();
			var min=times.getMinutes();
			var miao=times.getSeconds();
			setTimeout("time()",1000);
			document.getElementById("date").innerHTML="现在时间是:"+hour+"点"+min+"分"+miao+"秒";

		}
	</script>
    <style type="text/css">
.qiandao {
	position: absolute;
	right: 485px;
	top: 188px;
	color:#CCC;
}


.outqiandao {
	position: absolute;
	right: 385px;
	top: 188px;
}

.divTable {
	background-color: #EDEDED;
	height: 300px;
	width: 1200px;
}
.noqiandao{
background-color: #24BFEF;
height: 50px;
line-height: 50px;
font-size: 25px;
color: white;
font-weight: bolder;
}
</style>
<body onload="time()">
<br/>
<br/>
<br/>
<br/>
<br/>
<h1 align="center">欢迎你！${user.stu_name}，您是${user.groupname}的${user.jobname}。</h1>

<br/>
<b><p align="center" id="date" style="font-size:19px; color:#F00;"></p></b>


				<div class="qiandao">
					<br/>
					<input type="button" value="点击签到" class="Botton" id="qiandao"
						style="height: 40px; width: 150px;" />
                        
                     <input type="button" value="点击签退" class="outsearchBotton" id="outqiandao"
						style="height: 40px; width: 150px;" />
				</div>
</body>
</html>
