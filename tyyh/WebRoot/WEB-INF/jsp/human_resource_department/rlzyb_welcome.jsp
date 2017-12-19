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
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/index.js"></script>
	
</head>
<body>

<div class="contentConfig">
    <div class="qxfp">我的桌面 </div>
<!-- 添加部分 -->
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('skiptopage/topage/employee_info_add')" style="width:130px;">
           添加员工基本信息
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('skiptopage/topage/employee_info_search')" style="width:130px;">
            员工基本信息管理
    	</div>    	
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('talentReserve-add.html')" style="width:130px;">
            添加人才储备信息
    </div>
    </div>
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('talentReserve_search.html')" style="width:130px;">
            人才储备信息查询
    	</div>
    </div>	
   <!-- <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('interview_add.html')" style="width:130px;">
            添加访谈信息
    </div>
    </div> -->
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('interview_search.html')" style="width:130px;">
            访谈信息查询
   		</div>
    </div>
    <!-- <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('Randp_add.html')" style="width:130px;">
            添加奖惩信息
          </div>
    </div> -->
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('Randp_search.html')" style="width:130px;">
            奖惩信息查询
        </div>
    </div>
    <!-- <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('managesalary_add.html')" style="width:130px;">
            添加调薪信息
    </div> -->
     <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('managesalary_search.html')" style="width:130px;">
            调薪信息查询
        </div>
    </div>
    <!-- <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('transfer_position_add.html')" style="width:130px;">
            添加调岗信息
        </div>
    </div> -->
     <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('transfer_position_search.html')" style="width:130px;">
            调岗信息查询
    </div>
    </div>
    <!-- <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('skiptopage/topage/requestleave_add')" style="width:130px;">
            添加离岗信息
    </div>
    </div> -->
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('skiptopage/topage/requestleave_search')" style="width:130px;">
            离岗信息查询
   	    </div>
    </div>
    <!-- <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('dimission_add.html')" style="width:130px;">
            添加离职信息
    </div>
    </div> -->
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('dimission_search.html')" style="width:130px;">
            离职信息查询
    </div>
    </div>
<!-- 主部分，搜索页面 -->
    <div class="gn_nav">
        <div class="gnmk"  onclick="NewPage('skiptopage/topage/employee_contract_search')" style="width:130px;">
            合同信息管理
    </div>
    </div>
</div>
</body>
</html>
