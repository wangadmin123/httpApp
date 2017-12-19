<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查看离岗记录</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>

<script type="text/javascript">

/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="skiptopage/topage/requestleave_search";
    });  
});

</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">查看离岗记录</h1>
      <table id="showAllInfoByLeave_id" cellpadding="0" cellspacing="0" border="0" class="addTable">
          <tr>
        	<td class="tdWidth">部门：</td>
            <td>${oaRlzybLeave.depart_name}</td>
         </tr>
        <tr>
          <td class="tdWidth"><span></span>姓名：</td>
          <td>${oaRlzybLeave.emp_name}</td> 
        </tr>
          <tr>
              <td class="tdWidth"><span></span>岗位：</td>
              <td>${oaRlzybLeave.position_name}</td>
          </tr>
        <tr>
            <td class="tdWidth">起始日期：</td>
            <td>${oaRlzybLeave.leave_startDate_str}</td>
        </tr>
        <tr>
            <td class="tdWidth">截止日期：</td>
            <td>${oaRlzybLeave.leave_endDate_str}</td>
        </tr>
        <tr>
          <td class="tdWidth">离岗原因：</td>
          <td>${oaRlzybLeave.leave_reason}</td> 
        </tr>
        <tr>
        	<td class="tdWidth">类型：</td>
            <td>${oaRlzybLeave.leave_type}</td>
         </tr>
        <tr>
          <td class="tdWidth"><span></span>批准人：</td>
          <td>${oaRlzybLeave.leave_approver}</td>
        </tr>
     
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="返回" class="saveBotton" />
	  </div>

  
</div>
</div>


</body>
</html>