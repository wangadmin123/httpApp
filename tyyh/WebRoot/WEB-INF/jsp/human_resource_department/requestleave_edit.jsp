<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>编辑离岗信息</title>
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
		location.href="requestleave_search.html";
	}		
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">编辑离岗信息</h1>
      <form action="#" method="post" >
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      
        <tr>
        	<td class="tdWidth">部门：</td>
            <td><select class="selectStyle" style="width:120px;">
                  <option>人力资源部</option>
                  <option>咨询部</option>
                  <option>教质部</option>
                  <option>学术部</option>
                  <option selected="selected">市场部</option>
                  <option>就业部</option>
                  <option>网络部</option>
                  <option>教务部</option>
                  <option>开发部</option>
                  <option>校长办公室</option>
             </select></td>
         </tr>
           <tr>
          <td class="tdWidth">姓名：</td>
            <td><select class="selectStyle" style="width:120px;">
                  <option>张三</option>
             </select></td>
        </tr>
          <tr>
              <td class="tdWidth"><span></span>岗位：</td>
              <td><input type="text" class="textStyle" style="width:160px;border-style: none" readonly   />
          </tr>
        <tr>
            <td class="tdWidth">起始日期：</td>
            <td><input type="date" class="dateStyle"  style="width:160px;" value="2017年06月05日"/></td>
        </tr>
        <tr>
            <td class="tdWidth">截止日期：</td>
            <td><input type="date" class="dateStyle"  style="width:160px;" value="2017年06月07日"/></td>
        </tr>
          <tr>
              <td class="tdWidth"><span></span>合计天数：</td>
              <td><input type="text" class="textStyle" style="width:160px;border-style: none" readonly   />天</td>
          </tr>
        <tr>
          <td class="tdWidth">离岗原因：</td>
          <td><textarea  class="areaStyle" style="width:360px;" >朋友结婚，去参加婚礼</textarea>
          </td> 
        </tr>
        <tr>
        	<td class="tdWidth">类型：</td>
            <td><select class="selectStyle" style="width:120px;">
                <option>病假</option>
                <option>事假</option>
                <option>年假</option>
                <option>调休</option>
                <option>婚假</option>
                <option>丧假</option>
                <option>产假</option>
                <option>外出</option>
             </select></td>
         </tr>
        <tr>
          <td class="tdWidth">批准人：</td>
          <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入批准人姓名" value="李华" /><span></span></td>
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
