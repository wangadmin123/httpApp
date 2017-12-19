<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/teach_nature_department/css/login.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/teach_nature_department/css/add.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/teach_nature_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/teach_nature_department/css/formStyle.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/jsp/teach_nature_department/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<form action="index.jsp" method="post">
<div class="login">
    <div class="loginContent">
        <div class="titleText"><h1>北大青鸟办公自动化管理系统</h1></div>
        <div class="user">

                <table cellpadding="0" cellspacing="0" border="0" class="addTable" style="width: 100%;">
                    <tr>
                        <td class="tdWidth">用户名：</td>
                        <td><input type="text" class="textStyle" style="width:220px;" placeholder="请输入姓名"  /><span>*姓名不能为空</span></td>
                    </tr>
                    <tr>
                        <td class="tdWidth">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
                        <td><input type="password" class="textStyle" style="width:220px;" placeholder="请输入密码"  /><span>*密码不能为空</span></td>
                    </tr>
                    <tr>
                        <td class="tdWidth">验证码：</td>
                        <td><input type="text" class="textStyle" style="width:100px;" placeholder="请输入验证码"  /><img src="images/yzm.png" style="width: 118px; height: 30px; overflow: hidden; vertical-align: middle;"> <span>*验证码不能为空</span></td>
                    </tr>
                </table>

        </div>
        <h2 class="tabTitle2">&nbsp;</h2>
        <div class="btposition2">
            <input type="submit" value="登 录" class="saveBotton" />
        </div>

    </div>
</div>
</form>
</body>
</html>
