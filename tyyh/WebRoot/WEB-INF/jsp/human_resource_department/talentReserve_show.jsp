<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查看人才储备信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>


<script type="text/javascript">

/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="talentReserve_search.html";
    });  
});

/* function dateFmt(time){
		var t = new Date(time);
		var year = t.getFullYear(); //年
		var month = t.getMonth() + 1; //月
		var day = t.getDate(); //日
		if(month < 10){
			month = "0" + month;
		}
		if(day < 10){
			day = "0" + day;
		}
		var dateTimeStr= year + "-" + month + "-"+day;
		return dateTimeStr;
	}  */
</script>
    <style type="text/css">
    td{
text-align: left;
}
    
    </style>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">查看人才储备信息</h1>

      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">姓名：</td>
          <td>${oaRlzybTalentPool.talent_pool_name }</td>
        </tr>
        <tr>
          <td class="tdWidth">性别：</td>
          <td>${oaRlzybTalentPool.talent_pool_sex }</td>
        </tr>
        <tr>
          <td class="tdWidth">出生日期：</td>
          <td>${birthday }</td>
        </tr>
        <tr>
          <td class="tdWidth"><span></span>年龄：</td>
          <td>${oaRlzybTalentPool.talent_pool_age }</td>
        </tr>
        <tr>
          <td class="tdWidth">应聘日期：</td>
          <td>${addtime }</td>
        </tr>
        <tr>
          <td class="tdWidth">应聘职位：</td>
          <td>
      			<c:if test="${oaRlzybPositions != null}">
	    			<c:forEach var="oaRlzybPosition" items="${oaRlzybPositions }" >
	    				<c:if test="${oaRlzybTalentPool.position_id == oaRlzybPosition.position_id }">
	    					${oaRlzybPosition.position_name }
	    				</c:if>
					</c:forEach>
				</c:if>
          </td>
        </tr>
        <tr style="width: 400px">
          <td class="tdWidth">薪资期望：</td>
          <td>
            ${oaRlzybTalentPool.talent_pool_salaryExpect }
            </td>
        </tr>
        <tr>
          <td class="tdWidth">联系电话：</td>
          <td>${oaRlzybTalentPool.talent_pool_phone }</td>
        </tr>
        <tr>
          <td class="tdWidth">工作经验：</td>
          <td>
 				 ${oaRlzybTalentPool.talent_pool_work_experience }
          </td>
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
