<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>编辑奖惩信息</title>
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
		location.href="Randp_search.html";
	}		
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">编辑奖惩信息</h1>
      <form action="#" method="post" >
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
          <tr>
              <td class="tdWidth">部   门：</td>
              <td><select class="selectStyle" style="width:120px;">
                  <option>教务部</option>
                  <option>市场部</option>
                  <option>教质部</option>
                  <option>人力资源行政部</option>
              </select></td>
          </tr>
          <tr>
              <td class="tdWidth">姓   名：</td>
              <td><select class="selectStyle" style="width:120px;">
                  <option>李世民</option>
                  <option>康熙</option>
                  <option>乾隆</option>
                  <option>雍正</option>
              </select></td>
          </tr>
          <tr>
              <td class="tdWidth"><span></span>岗位：</td>
              <td><input type="text" class="textStyle" style="width:160px;border-style: none" readonly   />
          </tr>
          <tr>
              <td class="tdWidth">奖惩类型：</td>
              <td><select class="selectStyle" style="width:120px;" >
                  <option>奖励</option>
                  <option>处分</option>
              </select></td>
          </tr>
          <tr>
              <td class="tdWidth">奖惩时间：</td>
              <td><input type="date" class="dateStyle"  style="width:160px;"/></td>
          </tr>

          <tr>
              <td class="tdWidth">奖惩原因：</td>
              <td><input type="text" list="url_list"  class="textStyle" style="width:160px;"/>
                  <!-- <datalist id="url_list">
                      <option label="北京" value="北京" />
                      <option label="上海" value="上海" />
                      <option label="太原" value="太原" />
                  </datalist> -->
              </td>
          </tr>
        <tr>
          <td class="tdWidth">详细说明：</td>
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
