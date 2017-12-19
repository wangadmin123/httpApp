<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<base href="<%=basePath%>">
<title>首页</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/index.js"></script>
</head>
<body> 
<div class="head">
  <div class="logo"><img src="./images/logo.png" /></div>
  <ul class="hav">
    <li class="line" onclick="NewPage('./welcome.jsp')">我的桌面</li>
    <li>教质部</li>
    <li onclick="NewPage('config.jsp')">权限分配</li>
  </ul>
  <div class="login" id="admin">
      <span >教质部--孟淑君</span>
      <div class="person">
           <span>个人中心</span>
           <span>修改密码</span>
           <span onclick="openPage('login/Logout')">退出</span>
      </div>
  </div>
</div>

<div class="content">
   <div class="left">
       <ul>
           <!--   <li class="liHover" ><img src="images/tb1.png" /><span>桌面</span>
                  <dl class="sonUl">
                     <dt >我的桌面</dt>
                     <dd class="ddDiv" onclick="NewPage('add.jsp')">新增模板</dd>
                     <dd class="ddDiv" onclick="NewPage('showlist.jsp')">查看信息模板</dd>
                     <dd class="ddDiv" onclick="NewPage('tab.jsp')">选项卡模板</dd>
                      <dd class="ddDiv" onclick="NewPage('popup.jsp')">弹出层模板</dd>
                      <dd class="ddDiv" onclick="NewPage('config.jsp')">权限分配</dd>
                  </dl>

           </li> -->
            <li ><img src="images/tb2.png"  />
               <span><a href="" >班级</a></span>
                 <dl class="sonUl">
                     <dt>班级管理</dt>
                     <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/oaJwbGradeslist.html')">班级信息</dd>
                      <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/addSpecialty.html')">新增特色课程</dd>
                      <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/addquestion.html)">新增巡班问题</dd>
                     <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/addpatrol.html')">巡班记录</dd>
                  </dl>
           </li>

           <li >
           		<img src="images/tb3.png"  />
           		<span>学员</span>
                <dl class="sonUl">
                  <dt>管理学员</dt>
                  <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/toJzbStudent')">学员信息</dd>
                  <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/toAddStuInfo.html')">新建学员档案</dd>
                  <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/toJzbAllStudent')">全部学员档案</dd>
                   <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/oaJzbReceiveConsultlist.html')">接收报名咨询量</dd>
                </dl>
           </li>
          	<%-- <li><img src="images/tb4.png" /><span>口碑</span>
           		<dl class="sonUl">
                    <dt>口碑管理</dt>
                    	<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/publicPraise.html')">查看个人口碑</dd>
                     	<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/personal')">查看员工口碑</dd>
                     	<dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/addTzPersonal.html')">添加口碑</dd>  
                </dl>
            </li> --%>
           <li><img src="images/tb5.png" /><span>日报表</span>
          		 <dl class="sonUl">
                     <dt>日报表管理</dt>
                     <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/Dailygeren')">个人日报表</dd>
                      <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/DailyStaffList')">员工日报表</dd>
                     <dd class="ddDiv" onclick="NewPage('${pageContext.request.contextPath }/addadilyview')">新增日报表</dd>            
                  </dl>
           </li>
            <li><img src="images/tb5.png" /><span>统计</span>
               <dl class="sonUl">
                     <dt>数据统计</dt>
                     <dd class="ddDiv" onclick="NewPage('jzb/class_info.jsp')">班级基本数据统计</dd>
                     <dd class="ddDiv" onclick="NewPage('jzb/class_stem.jsp')">本上作业完成率</dd>
                     <dd class="ddDiv" onclick="NewPage('jzb/shangji.jsp')">上机完成率</dd> 
                     <dd class="ddDiv" onclick="NewPage('jzb/dangtangSj.jsp')">当堂上机完成率</dd>
                     <dd class="ddDiv" onclick="NewPage('jzb/Z_score.jsp')">学生周考成绩及格率</dd>
                     <dd class="ddDiv" onclick="NewPage('jzb/Y_score.jsp')">学生月考成绩及格率</dd>
                  </dl>
           </li>
       </ul>


   </div>
   <div class="right">
      <iframe  id="frmright" name="frmright" src="welcome.jsp" frameborder="0"
                scrolling="yes" style="width:99%; height:99%;"></iframe>
   </div>
</div>
</body>
</html>
