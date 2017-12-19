<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>新增，修改模板</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
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
		location.href="welcome.jsp";
	}		
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">新增员工</h1>
      <form action="#" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth"><span>*</span>姓名：</td>
          <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名"  /><span>*姓名不能为空</span></td>
        </tr>
        <tr>
          <td class="tdWidth">年龄：</td>
          <td><input type="number"  min="1" max="100"  class="textStyle" style="width:160px;"/></td> 
        </tr>
        <tr>
          <td class="tdWidth">性别：</td>
          <td><input type="radio" value="man" name="sex"  class="radioStyle" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;  <input type="radio" value="woman"  name="sex" class="radioStyle"/>女</td> 
        </tr>
           <tr>
          <td class="tdWidth">爱好：</td>
          <td><input type="checkbox"  name="hobby"  class="checkedStyle" checked="checked"/>上网&nbsp;&nbsp;&nbsp;&nbsp;  <input type="checkbox" name="hobby" class="checkedStyle"/>游泳&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="hobby" class="checkedStyle"/>旅游</td> 
        </tr>
        <tr>
          <td class="tdWidth">拼音码：</td>
          <td><input type="search" class="searchStyle" style="width:160px;" /></td>
        </tr>
          <tr>
              <td class="tdWidth">邮箱：</td>
              <td><input type="email" class="textStyle" style="width:160px;" /></td>
          </tr>
          <tr>
              <td class="tdWidth">出生日期：</td>
              <td><input type="date" class="dateStyle"  style="width:160px;"/></td>
          </tr>
          <tr>
              <td class="tdWidth">学历：</td>
              <td><select class="selectStyle" style="width:120px;">
                  <option>本科</option>
                  <option>专科</option>
                  <option>高中</option>
                  <option>初中及以下</option>
              </select></td>
          </tr>
          <tr>
              <td class="tdWidth">启用：</td>
              <td>
                  <input type="checkbox" id="radio" name="switch" class="text">
                   <label for="radio" class="radio">
                        <span class="circle"></span>
                        <span class="text on"></span>
                        <span class="text off"></span>
                   </label>
             </td>
          </tr>
          <tr>
              <td class="tdWidth">城市：</td>
              <td><input type="text" list="url_list"  class="textStyle" style="width:160px;"/>
                  <datalist id="url_list">
                      <option label="北京" value="北京" />
                      <option label="上海" value="上海" />
                      <option label="太原" value="太原" />
                  </datalist>
              </td>

          </tr>
        <tr>
          <td class="tdWidth">身份证：</td>
          <td><input type="text" class="textStyle" style="width:200px;" /></td> 
        </tr>
         <tr>
          <td class="tdWidth">照片：</td>
          <td>
          <a href="#" class="fileStyle"><input type="file" class="file" size=1 onchange="document.getElementById('imgUrl').value=this.value"/></a>     
          </td> 
        </tr>
         <tr>
          <td class="tdWidth"></td>
          <td>   <input type="text" class="textStyle" id="imgUrl" style="width:200px;"/>
                  <input type="button" class="bottomStyle" value="上传"/> 
          </td> 
        </tr>
        <tr>
          <td class="tdWidth">个人简介：</td>
          <td><textarea  class="areaStyle" style="width:360px;"></textarea>
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
