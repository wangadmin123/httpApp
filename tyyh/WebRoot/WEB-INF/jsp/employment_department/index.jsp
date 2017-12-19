<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
<script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/employment_department/js/index.js"></script>

</head>
<body>
<div class="head">
  <div class="logo"><img src="statics/employment_department/images/logo.png" /></div>
  <ul class="hav">
    <li class="line" onclick=NewPage("employment_department/welcome")>我的桌面</li>

      <li>就业部</li>


  </ul>
  <div class="login" id="admin">
      <span >孟淑君</span>
      <div class="person">
           <span>个人中心</span>
           <span>修改密码</span>
           <span onclick=openPage("login.html");>退出</span>
      </div>
  </div>
</div>

<div class="content">
   <div class="left">
       <ul>
           <li class="liHover" ><img src="statics/employment_department/images/tb1.png" /><span>企业</span>
               <dl class="sonUl">
                   <dt>企业</dt>
                   <dd class="ddDiv" onclick=NewPage("employment_department/showlist.html")>企业资源</dd>
                   <dd class="ddDiv" onclick=NewPage("employment_department/add.html")>新增企业</dd>

               </dl>

           </li>
           <li ><img src="statics/employment_department/images/tb2.png"  />
               <span><a href="" >学员</a></span>
               <dl class="sonUl">
                   <dt>学员</dt>
                  
                 <!--   <dd class="ddDiv" onclick=NewPage("yixiang.html")>意向调查</dd>
                   <dd class="ddDiv" onclick=NewPage("kaohe.html")>技术考核</dd>
                   <dd class="ddDiv" onclick=NewPage("fenceng.html")>学员分层</dd> -->
                   <dd class="ddDiv" onclick=NewPage("xinxichakan")>信息查看</dd>
                   <dd class="ddDiv" onclick=NewPage("employment_department/huifang")>学员回访记录</dd>
                   <dd class="ddDiv" onclick=NewPage("employment_department/employment")>就业学生信息</dd>
                  <!--  <dd class="ddDiv" onclick=NewPage("tongji.html")>信息统计</dd> -->
                   

               </dl>
           </li>

           <li ><img src="statics/employment_department/images/tb3.png"  />
               <span><a href="" >活动</a></span>
               <dl class="sonUl">
                   <dt>活动</dt>
                   <dd class="ddDiv" onclick=NewPage("employment_department/huodong")>所有活动</dd>
                  


               </dl>
           </li>
           <li>    <img src="statics/employment_department/images/tb4.png"  />
               <span><a href="" >面试</a></span>
               <dl class="sonUl">
                   <dt>面试</dt>
                   <!-- <dd class="ddDiv" onclick=NewPage("qitianjixun.html")>七天集训</dd> -->
                   <dd class="ddDiv" onclick=NewPage("employment_department/mianshi")>模拟面试</dd>


               </dl></li>
           <li>    <img src="statics\employment_department\images\tb5.png"  />
               <span><a href="" >报表</a></span>
               <dl class="sonUl">
                   <dt>报表</dt>
                   <dd class="ddDiv" onclick=NewPage("employment_department/addtable")>添加报表</dd>
                   <dd class="ddDiv" onclick=NewPage("employment_department/chakanbaobiao")>查看报表</dd>
                  <dd class="ddDiv" onclick=NewPage("employment_department/chabaobiao")>主管页面</dd>

               </dl></li>
       


       </ul>


   </div>
   <div class="right">
      <iframe  id="frmright" name="frmright" src="welcome.jsp" frameborder="0"
                scrolling="yes" style="width:99%; height:99%;"></iframe>
   </div>
</div>
</body>
</html>

