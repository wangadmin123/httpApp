<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查看调岗信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>

<style type="text/css">
  tr td span{
    color: red;
  }
</style>

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
		miao=1;
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
		location.href="post-sel.html";
	}		
}
/*保存读秒结束*/


/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="transfer_position_search.html";
    });  
});

</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">查看调岗信息</h1>
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">姓名：</td>
          <td>${oaRlzybTransferPosition1.emp_name }</td>
        </tr>
        <tr>
          <td class="tdWidth">原部门：</td>
          <td>${oaRlzybTransferPosition2.depart_name }</td>
        </tr>
        <tr>
          <td class="tdWidth">原岗位：</td>
          <td>${oaRlzybTransferPosition2.position_name }</td>
        </tr>
        <tr>
          <td class="tdWidth">调岗后部门：</td>
          <td>${oaRlzybTransferPosition1.depart_name }</td>
        </tr>
        <tr>
          <td class="tdWidth">调岗后岗位：</td>
          <td>${oaRlzybTransferPosition1.position_name }</td>
        </tr>
        <tr>
          <td class="tdWidth">调岗原因：</td>
          <td>${oaRlzybTransferPosition1.transfer_position_reason }
          </td>
        </tr>
        <tr>
          <td class="tdWidth">详情说明：</td>
          <td>${oaRlzybTransferPosition1.transfer_position_details }
          </td>
        </tr>
        <tr>
          <td class="tdWidth">调岗时间：</td>
          <td>${oaRlzybTransferPosition1.transfer_position_time }</td>
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
