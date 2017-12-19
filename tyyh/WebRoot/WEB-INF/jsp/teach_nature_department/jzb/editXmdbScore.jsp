
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>"/>
 <meta charset="UTF-8"/>
<title>修改项目成绩答辩表</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb_css/insert.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
  $(".saveStyle").css("left",saveWidth/2-130);
  $(".saveStyle").css("top",saveHeight/2-40);

});


/*保存读秒*/
var miao;
var myTime;
$(function(){
  $(".saveBotton").click(function(){
    miao=2;
    $(".setTime").text(miao);
    $(".saveStyle").css("display","block");
    myTime=setInterval("divHide()",1000);
     
    });  
});
function divHide(){
  miao--;
  $(".setTime").text(miao);
  if(miao==0){
    clearInterval(myTime);
    $(".saveStyle").hide();
    location.href="selectgrade.jsp";
  }   
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">修改项目成绩答辩表</h1>
      <form action="${pageContext.request.contextPath }/updateOaJzbProject/${oaJzbProject.id }" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="1" class="addTable" style="width:100%;">
        <tr><th colspan="6" style="text-align: center;font-size:15px;">${oaJwbGrade.name }班-- 编辑项目答辩成绩表</th></tr>
        <tr>
          <th style="width:100px;">组别</th>
          <th>姓名</th>
          <th>个人得分</th> 
          <th>小组得分</th> 
          <th style="width:300px;">小组表现</th>
          <th style="width:300px;">备注</th>
        </tr>
        <tr>
            <td  rowspan="5">${oaJzbProject.group_name }</td>  
            <td>${oaJzbProject.stu_name }</td>
          	<c:choose>
          	<c:when test="${oaJzbProject.score!=null and oaJzbProject.score!='' }">
          	<td><input type="text" class="textStyle" style="width:100px;" placeholder=""  name="score"  value="${oaJzbProject.score }" /></td> 
          	</c:when>
          	<c:otherwise>
          	 <td><input type="text" class="textStyle" style="width:100px;" placeholder="请输入个人得分"  name="score"  value="" /></td> 
          	</c:otherwise>
          	</c:choose>
          	
          	<c:choose>
          	<c:when test="${oaJzbProject.group_score!=null and oaJzbProject.group_score!='' }">
          	<td rowspan="5"><input type="text" class="textStyle" style="width:100px;" placeholder="" name="group_score"  value="${oaJzbProject.group_score }" /></td>
          	</c:when>
          	<c:otherwise>
          	 <td rowspan="5"><input type="text" class="textStyle" style="width:100px;" placeholder="请输入小组得分" name="group_score"  value="" /></td>
          	</c:otherwise>
          	</c:choose>
          	
          	<c:choose>
          	<c:when test="${oaJzbProject.group_expression!=null and oaJzbProject.group_expression!='' }">
          	<td rowspan="5" style="width:300px;"><textarea  id="areaStyle" class="areaStyle1" placeholder="" style="width:300px; height:200px;" name="group_expression">${oaJzbProject.group_expression }</textarea></td> 
          	</c:when>
          	<c:otherwise>
          	 <td rowspan="5" style="width:300px;"><textarea  id="areaStyle" class="areaStyle1" placeholder="请输入小组表现" style="width:300px; height:200px;" name="group_expression"></textarea></td> 
          	</c:otherwise>
          	</c:choose>
          	
          	<c:choose>
          	<c:when test="${oaJzbProject.remarks!=null and oaJzbProject.remarks!='' }">
          	<td><textarea  id="areaStyle" class="areaStyle2" placeholder="请输入备注" style="width:300px;height:30px;" name="remarks">${oaJzbProject.remarks }</textarea></td> 
          	</c:when>
          	<c:otherwise>
          	<td><textarea  id="areaStyle" class="areaStyle2" placeholder="请输入备注" style="width:300px;height:30px;" name="remarks"></textarea></td> 
          	</c:otherwise>
          	</c:choose>
           
            
            
            
        </tr>  
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
    <div class="btposition1">
      <input type="submit" value="保存" class="saveBotton" />
    </div>
     </form> 
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>