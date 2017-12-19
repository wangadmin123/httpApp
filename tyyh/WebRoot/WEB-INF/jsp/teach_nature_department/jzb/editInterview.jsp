<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>编辑班级管理信息</title>
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
		location.href="selectgrade.jsp";
	}		
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

   <div class="tabContent">
    <h1 class="tabTitle">修改班级学员个性访谈</h1>
      <form action="${pageContext.request.contextPath }/modifyInterview?id=${oaJzbIndividualinterview.id }" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">姓名：</td>
          <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名" value="${oaJzbIndividualinterview.stu_name }" name="stu_name" /><span>*姓名不能为空</span></td>
        </tr>
        <tr>
          <td class="tdWidth">学期：</td>
          <td>
           <select name="formal"><span>*请选择</span>
              <option value="0">--请选择--</option>
              <option value="S1">S1</option>
              <option value="S2">S2</option>
              <option value="Y2">Y2</option>
            </select>
         </td>
        </tr>
        <tr>
          <td class="tdWidth">访谈内容：</td>
          <td><textarea  id="areaStyle" class="areaStyle1" style="width:560px;" name="interviewContent">${oaJzbIndividualinterview.interviewContent }</textarea></td>
        </tr>
        <tr>
          <td class="tdWidth" rowspan="2">本月设立目标：</td>
          <td>笔试：<input type="text" name="writerTest" value="${oaJzbIndividualinterview.writerTest }"/></td>
        </tr>
        <tr>
          <td>机试：<input type="text" name="engineTest" value="${oaJzbIndividualinterview.engineTest }"/></td>
        </tr>
        <tr>
          <td class="tdWidth">访谈时间：</td>
          <td><input type="date" class="dateStyle" style="width:160px;" name="interviewTime"/></td>
        </tr>
        <tr>
          <td class="tdWidth">访谈人：</td>
          <td><input type="text" name="interviewName"  value="${oaJzbIndividualinterview.interviewName }"/></td>
        </tr>
        <tr>
          <td class="tdWidth">备注：</td>
          <td><textarea  id="areaStyle" class="areaStyle2" style="width:300px;height:25px;" name="remark">${oaJzbIndividualinterview.remark }</textarea></td>
        </tr>
        <tr>
          <td class="tdWidth">本月惩罚：</td>
          <td><textarea  id="areaStyle" class="areaStyle3" style="width:300px;height:25px;" name="monthPunish">${oaJzbIndividualinterview.monthPunish }</textarea></td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
      <div class="btposition1" id="btposition2">
        <input type="submit" value="保存" class="pooupBotton" />
      </div>
     </form> 
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>