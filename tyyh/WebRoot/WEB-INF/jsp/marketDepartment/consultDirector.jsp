<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<html lang="en">


<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>首页</title>
<style type="text/css">

	.close{
		background-image:url(statics/common/images/btn_close_down.png);
		}
	.close:hover{
		background-image:url(statics/common/images/btn_close_hover.png);
	}	
</style>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript">
 var user='${loginUser.emp_id }';
	  function  ws_init(){
				 var target="ws://"+ window.location.host +"/tyyh/web/chat?nickName="+user;
		   		  if ('WebSocket' in window) {
		                 ws = new WebSocket(target);
		             } else if ('MozWebSocket' in window) {
		                 ws = new MozWebSocket(target);
		             } else {
		                 alert('WebSocket is not supported by this browser.');
		                 return;
		             }
		   		 
		   		  ws.onmessage=function(event){
		   			  		eval("var msg="+event.data+";");
							console.info(msg);
		   		  			if(msg.to==user){
		   		  				$("#content").text(msg.content);
		   		  				$("#tishi").slideDown();
		   		  			}
		   		  } 
	   	 }  
$(function() {
		ws_init();
		$(".close").click(function(){
			$("#tishi").slideUp();
		});
		getNoticeCountBytime();
		function getNoticeCountBytime(){
 		setInterval(function(){cot();},5000);
 	}
	function cot(){
		 	$.ajax({
				url:"getData/getlogincont",
				type:"POST",
				datatype:"text",
				success:function(data){
					if(data == "out"){
					alert("您的账号在其他主机登陆!");
						window.location.href="login/Logout";
					}
				}
			});
	}
	
	var ipaddress=$("#ipaddress").val();
	var times=$("#times").val();
	var OrLogin=$("#OrLogin").val();
	
	if(OrLogin=="Login"){
		
		if(ipaddress=="" && times=="" ){
			alert("您好！欢迎您首次登录！")
		}else{
		
			
			alert("   上次登录时间："+times
				)
				
		}
	}
	});
	function guan (){
		ws.send("close");
		openPage('login/Logout')
	}
 
	
	
	$(function() {
		$(".line").click();
	});

	
</script>
</head>
<body>
<div class="head">
  <div class="logo"><img src="statics/common/images/logo.png" /></div>
  <ul class="hav">
   <li class="line" onclick="NewPage('statics/market_department/consultDirectorWelcome.jsp')">我的桌面</li>
      
    <!-- <li onclick=NewPage("config.html")>权限分配</li> -->
  </ul>
  <div class="login" id="admin">
       <span >咨询部-${loginUser.position.position_name}-${loginUser.emp_name }</span>
      <div class="person">
           <span  onclick="NewPage('Employee/ShowEmployee/'+${loginUser.emp_id})">个人中心</span>
           <span onclick="NewPage('pwdupdata/pwdUpdataPage')">修改密码</span>
           <span onclick="guan()">退出</span>
      </div>
</div>
</div>
<div class="content">
   <div class="left">
       <ul>
             
           <li ><img src="statics/common/images/tb2.png"  />
               <span>咨询量</span>
                  <dl class="sonUl">
                    <dt>咨询量管理</dt>
                     <dd class="ddDiv" onclick=NewPage("director/consultDirectorAdd")>新增咨询量</dd>
                     <dd class="ddDiv" onclick=NewPage("director/consultDirectorQuery")>管理咨询量</dd>
                  </dl>
           </li>

           
           <li><img src="statics/common/images/tb3.png" /><span>报表</span>
                <dl class="sonUl">
                    <dt>报表</dt>


                     <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantDaySheet")>报表</dd>
                     <!-- <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantWeekSheet")>周报表</dd>
                     <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantMonthSheet")>月报表</dd>
                     <dd class="ddDiv" onclick=NewPage("Consultway/ToAssistantYearSheet")>年报表</dd> -->
                  </dl></li>
           
           <li><img src="statics/common/images/tb3.png" />
       			  <span>管理</span>
           		<dl class="sonUl">
           			<dt>信息管理</dt>
           			<dd class="ddDiv" onclick=NewPage("director/conDirectorlesson")>咨询课程管理</dd>
           			<dd class="ddDiv" onclick=NewPage("director/conDirectorway")>咨询方式管理</dd>
           		</dl>
           </li>
           
           <li><img src="statics/common/images/tb3.png" />
       			  <span>导入</span>
           		<dl class="sonUl">
           			<dt>导入咨询量</dt>
           			<dd class="ddDiv" onclick=NewPage("director/daoruconsulter")>导入咨询量</dd>
           			
           		</dl>
           </li>
          
           
           <li><img src="statics/common/images/tb3.png" />
       			  <span>记录</span>
           		<dl class="sonUl">
           			<dt>操作记录</dt>
           			<dd class="ddDiv" onclick=NewPage("oaScbOperation/OperationSelect")>操作记录</dd>
           		</dl>
           </li>


       </ul>


   </div>
   
   <div class="right">
   <input type="hidden" name="是否已登录" id="OrLogin" value="${OrLogin}">
   	<input type="hidden" name="上次登录ip" id="ipaddress" value="${lastLoginInfo.account_login_ipaddress }">
   		<input type="hidden" name="上次登录时间" id="times" value="${lastLoginInfo.account_login_times }">
      <iframe  id="frmright" name="frmright" src="statics/market_department/consultDirectorWelcome.jsp" frameborder="0"
                scrolling="yes" style="width:99%; height:99%;"></iframe>
   </div>

</div>
	<!-- 通知弹框样式 -->
 	 <div id="tishi" style=" border-radius:5px; background:#d6d3d3; border: #2972cc solid; z-index:99999999; position: fixed; left: 78%; top: 78%; width: 266px; height: 125px;  display:none;" >
    	<div class=".title" style=" background-color:#2972cc; width:266px; height:20px; font-size: 14px; line-height: 20px; font-weight: bold; color: #fff;" >
        	提示
    		<div style="float:right; height:18px; width:35px;" class="close" title="关闭"></div>
    	</div>	
        <div>
        	<div style="text-align: center; line-height: 90px; font-size: 14px;" id="content">

            </div>
          		
        </div>
    </div>
</body>
</html>
