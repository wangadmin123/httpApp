<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/login.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css">
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
    $(function() {
		$("#renew_pwd").change(function() {
			var new_pwd=$("#new_pwd").val();
			var renew_pwd=$("#renew_pwd").val();
			if (new_pwd != renew_pwd){
			   	$("#submit").attr("disabled", "disabled");
			   	$("#renew_pwd").next().text("请确认密码是否正确");
			}else{
			    $("#submit").removeAttr("disabled");
			    $("#renew_pwd").next().text("");
			}
		});
	});
    </script>
</head>
<body>
<form action="pwdupdata/pwdreset" method="post">
<div class="login">
    <div class="loginContent">
        <div class="titleText"><h1>欢迎&nbsp;${loginUser.emp.emp_name}&nbsp;进入北大青鸟办公自动化管理系统</h1></div>
        <div class="user">


                <table cellpadding="0" cellspacing="0" border="0" class="addTable" style="width: 100%;">
                    <tr>
                        <td class="tdWidth"><span style="font-size: 15px; color: red;">警告:</span></td><!-- 手机号码正则表达式：pattern="^1[3|4|5|7|8][0-9]{9}$" -->
                        <td><span style="font-size: 15px; color: red;">当前账户密码不安全，请修改密码</span></td>
                    </tr>
                   	<tr>
						<td class="tdWidth">请输入新密码：&nbsp;</td>
						<td><input type="password" class="textStyle" id="new_pwd"
							name="new_pwd" required style="width:180px;" /><span></span></td>
					</tr>
                   	<tr>
						<td class="tdWidth">确认新密码：</td>
						<td><input type="password" class="textStyle" id="renew_pwd"
							name="renew_pwd" required style="width:180px;" /><span></span></td>
					</tr>
                </table>
        </div>
        <h2 class="tabTitle2">&nbsp;</h2>
        <div class="btposition2">
            <input type="submit" value="修改" class="saveBotton" id="submit"/>
        </div>

    </div>
</div>
</form>
</body>
</html>
