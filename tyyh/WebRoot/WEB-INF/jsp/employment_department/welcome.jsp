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
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/index.js"></script>

</head>
<body>

<div class="contentConfig">
    <div class="qxfp">我的桌面 </div>
    <div class="qxfp" style="width: 80px ;background: sandybrown">企业</div>
    <div class="gn_nav">
        <div class="gnmk"  onclick=NewPage("showlist.html")>
            查看企业信息
        </div>
        <div class="gnmk" onclick=NewPage("add.html")>
            新增企业信息
        </div>

    </div>

    <br><br><br><br><br>
    <div class="qxfp" style="width: 80px ;background: sandybrown ">学生</div>
    <div class="gn_nav">
        <div class="gnmk"  onclick=NewPage("zaixiao.html")>
            查看在校学员
        </div>
        <div class="gnmk" onclick=NewPage("kaohe.html")>
            查看技术考核
        </div>
        <div class="gnmk" onclick=NewPage("fangtan.html") style="width: 230px">
            查看学员意向、访谈、回访记录
        </div>
        <div class="gnmk" onclick=NewPage("kaohe.html")>
            查看学员分层
        </div>
        <div class="gnmk" onclick=NewPage("mianshi.html") style="width: 160px">
            查看学员模拟面试成绩
        </div>
        <div class="gnmk" onclick=NewPage("jiuye.html")>
            查看就业信息
        </div>
        <div class="gnmk" onclick=NewPage("addyixiang.html") style="width: 130px">
            新增学员意向调查
        </div>
        <div class="gnmk" onclick=NewPage("addmoni.html") style="width: 130px">
            新增学员模拟成绩
        </div>
        <div class="gnmk" onclick=NewPage("kaohe.html")>
            新增学员分层
        </div>
        <div class="gnmk" onclick=NewPage("kaohe.html") style="width: 130px">
            更新学员模拟成绩
        </div> <div class="gnmk" onclick=NewPage("kaohe.html")  style="width: 130px">
        更新学员意向调查
    </div>


    </div>
    <br><br><br><br><br>   <br><br><br><br><br> <br><br><br><br>
    <div class="qxfp" style="width: 80px ;background: sandybrown">报表</div>
    <div class="gn_nav">
        <div class="gnmk"  onclick=NewPage("showlist.html") style="width: 130px">
            新增日报、周报
        </div>
        <div class="gnmk" onclick=NewPage("add.html") style="width: 130px">
           查看日报、周报
        </div>

    </div>
</div>
</body>
</html>

