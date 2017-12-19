<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>编辑开班情况分析</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/insert.css">
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
		location.href="selectgrade.html";
	}		
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">编辑开班情况分析</h1>
      <form action="${pageContext.request.contextPath }/editkbqk?id=${openclass.id}" method="post" enctype="multipart/form-data">
      <input type="hidden" name="id" value="${openclass.id}">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">姓名：</td>
          <td><input name="name" type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名" value="${openclass.name }" /></td>
        </tr>
        <tr>
          <td class="tdWidth">性别：</td>
          <td>
           <select name="sex"><span>*请选择</span>
              <option value="1">男</option>
              <option value="2">女</option>
            </select>
         </td>
        </tr>
        <tr>
        <td class="tdWidth">年龄：</td>
          <td><input name="age" type="text" class="textStyle" style="width:160px;" placeholder="请输入年龄" value="${openclass.age }" /></td>
        </tr>
        <tr>
          <td class="tdWidth">学历：</td>
          <td>
           <select name="study_experience">
           <option value="0">---请选择---</option>
           <c:forEach items="${educationlist }" var="edulist">
              <option value="${edulist.id }">${edulist.education }</option>
           </c:forEach>
            </select>
         </td>
        </tr>
        <tr>
          <td class="tdWidth">计算机水平：</td>
          <td>
           <select name="computer_horizontal"><span>*请选择</span>
              <option value="优">优</option>
              <option value="一般">一般</option>
              <option value="差">差</option>
            </select>
         </td>
        </tr>
       
        <tr>
          <td class="tdWidth">备注：</td>
          <td><textarea name="remarks" id="areaStyle" class="areaStyle2" style="width:300px;height:25px;">${openclass.remarks }</textarea></td>
        </tr>
        <tr>
          <td class="tdWidth">就业城市：</td>
          <td><input name="city" type="text" class="textStyle" style="width:160px;" placeholder="请输入就业城市" value="${openclass.city }" /></td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
      <div class="btposition1" id="btposition2">
        <input type="submit" value="保存" class="saveBotton" />
      </div>
     </form> 
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>