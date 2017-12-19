<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'masterlogin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
	<script type="text/javascript">
        window.onload=function(){
             $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");
        }
        $(function(){
            
            /*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
                
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var mbHeight= $(document).height();
            var delHeight=$(window).height();
            var saveWidth=$(window).width();
            $(".mbStyle").css("height",mbHeight);
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",delHeight/2-220);
        });
    </script>
  </head>
  
  <body>
    <div></div>
<div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 500px; height: 440px;">
    <h1>请选择您要登入的身份<span class="closeX">X</span></h1>
    <div class="right" style="width:100%;height:100%;">
         <div class="gn_nav">
         <div class="gnmk">
            人力资源部
        </div>
        <div class="gnmk"  onclick=NewPage("add.html")>
            教质部
        </div>
        <div class="gnmk" onclick=NewPage("popup.html")>
            学术部
        </div>
        <div class="gnmk" onclick=NewPage("showlist.html")>
            网络部
        </div>
        <div class="gnmk">
            市场部
        </div>
        <div class="gnmk">
            咨询部
        </div>
        
        </div>
         <div class="btposition1" style="margin:300px 210px 50px;">
             <input type="button" value="直接登入" class="saveBotton" />
         </div>
    <h2 class="tabTitle2" style="border-bottom:0px;">&nbsp;</h2>
</div>
  </body>
</html>
