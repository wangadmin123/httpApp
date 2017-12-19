<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>修改模板</title>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/switch.css">
<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});


/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">编辑项目任务</h1>
      <form action="develop/zz_updatejindu.html?id=${id}&&did=${did}" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      

        <tr>
          <td class="tdWidth"><span>*</span>名称：</td>
          <td>${list4.content}</td>
        </tr>
         <tr>
              <td class="tdWidth">开始时间：</td>
              <td><fmt:formatDate value="${list4.startime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
          </tr>
          <tr>
              <td class="tdWidth">结束时间：</td>
              <td><fmt:formatDate value="${list4.endtime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
          </tr>
        
          <tr>
          <td class="tdWidth"><span>*</span>负责人：</td>
          <td>${list4.username}</td>
        </tr>
            <tr>
              <td class="tdWidth">审核：</td>
              <td><select name="isfinish">
									<option value="1">待审核</option>
              						<option value="0">未完成</option>
									<option value="2">已完成</option>
						</select>
             </td>
          </tr>
        <tr>
          <td class="tdWidth">备注：</td>
          <td><textarea  class="areaStyle" name="remark" style="width:360px;"></textarea>
          </td> 
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="提交" class="saveBotton" />
	  </div>
     </form> 

   
</div>
</div>

</body>
</html>
