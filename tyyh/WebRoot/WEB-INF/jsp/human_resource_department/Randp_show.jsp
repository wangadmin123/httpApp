<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查看奖惩信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/js/index.js"></script>
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
		location.href="Randplist.html";
	}		
}
/*保存读秒结束*/


/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="Randp_search.html";
    });  
});

</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">查看奖惩信息</h1>
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      	<tr>
          <td class="tdWidth">部   门：</td>
          <td>${oaRlzybReward.depart_name }</td>
        </tr>
        <tr>
          <td class="tdWidth">姓   名：</td>
          <td>${oaRlzybReward.emp_name }</td>
        </tr>
          <tr>
              <td class="tdWidth"><span></span>岗位：</td>
              <td>${oaRlzybReward.position_name }</td>
          </tr>
          <tr>
              <td class="tdWidth">奖惩类型：</td>
              <td>${oaRlzybReward.rewards_type }</td>
          </tr>
          <tr>
              <td class="tdWidth">奖惩时间：</td>
              <td>${rewards_date }</td>
          </tr>
          <tr>
              <td class="tdWidth">奖惩原因：</td>
              <td>${oaRlzybReward.rewards_reason }</td>
          </tr>
        <tr>
          <td class="tdWidth">详细说明：</td>
          <td>${oaRlzybReward.rewards_content }
          </td> 
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
		<div><input type="button" class="saveBotton" value="返回" onclick="openPage('Randp_search.html')"/></div>
   
</div>
</div>


</body>
</html>
