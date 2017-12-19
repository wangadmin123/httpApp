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
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript">
$(function(){
/* $("#myDesktop").click(); */
	/* getNoticeCountBytime(); */
		function getNoticeCountBytime(){
 		setInterval(function(){cot();},5000);}
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
		
		if(ipaddress=="" && times=="" && a==1){
			alert("您好！欢迎您首次登录！");
		}else{
			alert("上次登录时间："+times);
				
		}
	}
	});
	$(function() {
		$(".line").click();
	});
</script>
</head>
<body>
<div class="head">
  <div class="logo"><img src="statics/common/images/logo.png" /></div>
  <ul class="hav">
    <li class="line"  id="myDesktop" onclick="NewPage('skiptopage/topage/rlzyb_welcome')">我的桌面</li>
  </ul>
 <div class="login" id="admin">
       <span >人力资源部-${loginUser.position.position_name}-${loginUser.emp_name }</span>
      <div class="person">
           <span  onclick="NewPage('Employee/ShowEmployee/'+${loginUser.emp_id})">个人中心</span>
           <span onclick="NewPage('pwdupdata/pwdUpdataPage')">修改密码</span>
           <span onclick="openPage('login/Logout')">退出</span>
      </div>
  </div>
</div>

<div class="content">
   <div class="left">
       <ul>
           <li ><img src="statics/common/images/tb2.png"  />
               <span>员工</span>
                  <dl class="sonUl">
                    <dt>员工管理</dt>
                    <dd class="ddDiv" onclick="NewPage('skiptopage/topage/employee_info_search')">基本信息</dd>
                    <dd class="ddDiv" onclick="NewPage('skiptopage/topage/employee_info_add')">添加基本信息</dd>
                      <dd class="ddDiv" onclick="NewPage('interview_search.html')">访谈信息</dd>
                      <dd class="ddDiv" onclick="NewPage('Randp_search.html')">奖惩信息</dd>
                      <dd class="ddDiv" onclick="NewPage('talentReserve_search.html')">人才储备信息</dd>
                      <dd class="ddDiv" onclick="NewPage('skiptopage/topage/employee_contract_search')">合同信息</dd>
                      <dd class="ddDiv" onclick="NewPage('managesalary_search.html')">调薪信息</dd>
                      <dd class="ddDiv" onclick="NewPage('transfer_position_search.html')">调岗信息</dd>
                      <dd class="ddDiv" onclick="NewPage('skiptopage/topage/requestleave_search')">离岗信息</dd>
                      <dd class="ddDiv" onclick="NewPage('dimission_search.html')">离职信息</dd> 
                  </dl>
           </li>
          <!-- <li><img src="statics/common/images/tb4.png" /><span>口碑</span>
           		<dl class="sonUl">
                    <dt>口碑管理</dt>
                    	<dd class="ddDiv" onclick="NewPage('publicPraise.html')">查看个人口碑</dd>
                     	<dd class="ddDiv" onclick="NewPage('personal')">查看员工口碑</dd>
                     	<dd class="ddDiv" onclick="NewPage('addTzPersonal.html')">添加口碑</dd>  
                </dl>
            </li> -->
            <!-- <li><img src="statics/common/images/tb3.png" /><span>工单</span>
           		<dl class="sonUl">
                    <dt>工单管理</dt>
                    	<dd class="ddDiv" onclick="NewPage('workorder/workorder_add')">下发工单</dd>
                     	<dd class="ddDiv" onclick="NewPage('workorder/workorder_select')">查看工单</dd>
                </dl>
            </li> -->
            
       </ul>
   </div>
   <div class="right">
    <input type="hidden" name="是否已登录" id="OrLogin" value="${OrLogin}">
   <input type="hidden" name="上次登录ip" id="ipaddress" value="${lastLoginInfo.account_login_ipaddress }">
   		<input type="hidden" name="上次登录时间" id="times" value="${lastLoginInfo.account_login_times }">
      <iframe  id="frmright" name="frmright" src="skiptopage/topage/rlzyb_welcome" frameborder="0"
                scrolling="yes" style="width:99%; height:99%;"></iframe>
   </div>
</div>
</body>
</html>
