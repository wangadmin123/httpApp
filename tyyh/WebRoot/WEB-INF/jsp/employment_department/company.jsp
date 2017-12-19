<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>企业</title>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css"/>
<script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
<script type="text/javascript" src="statics/employment_department/js/back.js"></script>
<script type="text/javascript" src="statics/employment_department/js/tab.js"></script>
<script type="text/javascript">
/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});
$(function(){
	/*点击删除*/
	 $(".deleteBotton").click(function(){
		$(".mbStyle").css("display","block");
		$(".deleteStyle").css("display","block");
	 }); 
	 /*确定删除*/
	 $(".bottomStyle1").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了确定')
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消')
	 });
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
		location.href="welcome.html";
	}		
}
/*保存读秒结束*/

/*表格全选*/
$(function(){
	  $("#all").click(function(){
        var checked=$(this).is(":checked");
        $(".selectTable tr td").children().attr("checked",checked);
      });
    //判断是否全选
		function ifAllChecked(){
			var checkedBoxs=$(".selectTable tr td").children();
			var sum=checkedBoxs.size();
			var k=0;
			checkedBoxs.each(function(index,dom){
				if($(dom).is(":checked")) k++;
			});
			if(k==sum){
				$("#all").attr("checked",true);
			}else{
				$("#all").attr("checked",false);
			}
		}
        ifAllChecked();//页面加载完后运行
	
});
/*表格全选结束*/

</script>
</head>
<body>
<div class="rightContent">
  <div class="tabs">
      <span class="spanHover">企业基本信息</span>

  </div>
  <div class="tabContent">
    <h1 class="tabTitle">企业基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">企业名称：</td>
          <td><%-- <input type="text" class="textStyle" value="${company.company_name} " style="width:160px;"/> --%>
           <label  style="width:160px;">${company.company_name}</label>
           
           </td>
        </tr>
          <tr>
              <%-- <td class="tdWidth">联系电话：</td>
              <td><input type="text" class="textStyle" value="${company.company_phone}" style="width:160px;"/>
              </td> --%>
              <td class="tdWidth">公司座机：</td>
              <td><label  style="width:160px;">${company.company_zuoji}</label></td>
          </tr>
        <tr>
          <td class="tdWidth">企业性质：</td>
         <%--  <td><input type="text" class="textStyle" value="${company.company_city}" style="width:160px;"/></td> --%>
        <td><label  style="width:160px;">${company.company_property}</label></td>
        </tr>
       
             <tr>
          <td class="tdWidth">企业邮箱：</td>
         <%--  <td><textarea  class="areaStyle" style="width:560px;">${company.company_remarks } --%>
          
          <!-- </textarea>
          </td> -->
           <td><label  style="width:160px;">${company.company_Email}</label></td>
        </tr>
        <tr>
          <td class="tdWidth">企业网站：</td>
           <td><label  style="width:160px;">${company.company_web}</label></td>
          </tr>
          
          <tr>
          <td class="tdWidth">备注：</td>
           <td><label  style="width:160px;">${company.company_remarks}</label></td>
          </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" class="BackBotton" value="返回"/>
	  </div>
      
    </div>

  </div>
</div>

<!--保存-->
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
<!--结束-->

<!--删除开始-->
<div class="mbStyle">&nbsp;</div>
<div class="deleteStyle">
	<h3>操作提示</h3>
	<h2>确定要删除吗？</h2>
	<div class="btn">
	   <div class="bottomStyle1">确定</div>
	   <div class="bottomStyle2">取消</div>
	</div>
</div>
<!--删除结束-->
</body>
</html>
