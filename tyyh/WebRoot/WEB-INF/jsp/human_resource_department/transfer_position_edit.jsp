<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>编辑调岗信息</title>
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
    location.href="transfer_position_search.html";
  }   
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">编辑调岗信息</h1>
      <form action="#" method="post" >
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">原部门：</td>
          <td>
              <select class="selectStyle" style="width:80px;">
                <option>--请选择--</option>
                <option selected>部门1</option>
                <option>部门2</option>
                <option>部门3</option>
                <option>部门4</option>
                <option>部门5</option>
              </select>
          </td>
        </tr>
        <tr>
          <td class="tdWidth">姓名：</td>
          <td>
            <select class="selectStyle" style="width:80px;">
              <option>--请选择--</option>
              <option selected>张三</option>
              <option>李四</option>
              <option>王五</option>
              <option>刘六</option>
              <option>马七</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="tdWidth"><span></span>原岗位：</td>
          <td><input type="text" class="textStyle" style="width:160px;border-style: none" readonly   />
        </tr>
        <tr>
          <td class="tdWidth">目标部门：</td>
          <td>
              <select class="selectStyle" style="width:80px;">
                <option>--请选择--</option>
                <option>部门1</option>
                <option selected>部门2</option>
                <option>部门3</option>
                <option>部门4</option>
                <option>部门5</option>
              </select>
          </td>
        </tr>
        <tr>
          <td class="tdWidth">目标岗位：</td>
          <td>
            <select class="selectStyle" style="width:80px;">
              <option>--请选择--</option>
              <option>岗位1</option>
              <option selected>岗位2</option>
              <option>岗位3</option>
              <option>岗位4</option>
              <option>岗位5</option>
            </select>
          </td>
        </tr>
        <tr>
          <td class="tdWidth">调岗原因：</td>
          <td><input type="text" class="textStyle" style="width:160px;"/></td>
        </tr>
        <tr>
          <td class="tdWidth">详细说明：</td>
          <td>
            <textarea rows="5" cols="50"> 薪资比较低！</textarea>
          </td>
        </tr>
        <tr>
          <td class="tdWidth">调岗时间：</td>
          <td>
            <input type="date" class="dateStyle"  style="width:160px;" />
          </td>
        </tr>
      </table>
     <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="保存" class="saveBotton" />
	  </div>
     </form> 
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>
