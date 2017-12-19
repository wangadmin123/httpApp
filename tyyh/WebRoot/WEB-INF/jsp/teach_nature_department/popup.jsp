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
    <title>列表模板</title>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/popup.css"/>
    <script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>

    <script type="text/javascript">
        $(function(){
            /*点击显示弹出框*/
            $(".pooupBotton").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");

            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",50);


        });
    </script>
</head>
<body>
<div><input type="button" class="pooupBotton" value="弹出框"/></div>

<div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 500px; height: 440px;">
    <h1>添加员工<span class="closeX">X</span></h1>
    <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
            <td class="tdWidth"><span>*</span>姓名：</td>
            <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名"  /><span>*姓名不能为空</span></td>
        </tr>
        <tr>
            <td class="tdWidth">年龄：</td>
            <td><input type="number"  min="1" max="100"  class="textStyle" style="width:160px;"/></td>
        </tr>
        <tr>
            <td class="tdWidth">性别：</td>
            <td><input type="radio" value="man" name="sex"  class="radioStyle" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;  <input type="radio" value="woman"  name="sex" class="radioStyle"/>女</td>
        </tr>
        <tr>
            <td class="tdWidth">爱好：</td>
            <td><input type="checkbox"  name="hobby"  class="checkedStyle" checked="checked"/>上网&nbsp;&nbsp;&nbsp;&nbsp;  <input type="checkbox" name="hobby" class="checkedStyle"/>游泳&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="hobby" class="checkedStyle"/>旅游</td>
        </tr>
        <tr>
            <td class="tdWidth">拼音码：</td>
            <td><input type="search" class="searchStyle" style="width:160px;" /></td>
        </tr>
        <tr>
            <td class="tdWidth">邮箱：</td>
            <td><input type="email" class="textStyle" style="width:160px;" /></td>
        </tr>

    </table>
    <h2 class="tabTitle2">&nbsp;</h2>



    <div class="btposition1">
        <input type="button" value="保存" class="saveBotton" />
    </div>
</div>
</body>
</html>
