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
<title>选项卡模板</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
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
		alert('你点击了确定');
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
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
		location.href="welcome.jsp";
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
      <span class="spanHover">基本信息</span>
      <span class="spanOut">证件信息</span>
      <span class="spanOut">学习/工作经历</span>
      <span class="spanOut">考评奖惩</span>
      <span class="spanOut">扩展选项卡</span>
      <span class="spanOut" id="spanLast">访谈记录</span>
  </div>
  <div class="tabContent">
    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">姓名：</td>
          <td><input type="text" class="textStyle" style="width:160px;"/>
           </td>
        </tr>
        <tr>
          <td class="tdWidth">性别：</td>
          <td><input type="text" class="textStyle" style="width:160px;"/></td>
        </tr>
        <tr>
          <td class="tdWidth">身份证：</td>
          <td><input type="text" class="textStyle" style="width:200px;"/></td>
        </tr>
        <tr>
          <td class="tdWidth">个人简介：</td>
          <td><textarea  class="areaStyle" style="width:560px;"></textarea>
          </td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="保存" class="saveBotton" />
	  </div>
      
    </div>
    <div class="divTable" style="display:none;">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr>
		  <th><input type="checkbox" id="all"/></th>
          <th>编号</th>
          <th>姓名</th>
          <th>所属部门</th>
          <th>年龄</th>
          <th>性别</th>
          <th>学历</th>
          <th>技术职称</th>
          <th>入职时间</th>
          <th>联系方式</th>
          <th>邮箱</th>
          <th>职位</th>
          <th>紧急联系人(电话)</th>
          <th>管理</th>
        </tr>
        <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td>本科</td>
          <td>工程师</td>
           <td>15386880458</td>
          <td>2017年06月05日</td>
          <td>877218421@qq.com</td>
            <td>市场活动专员</td>
              <td>父亲：13100000000</td>
          <td><a href="#" class="edit">编辑</a> <a href="#" class="delete">删除</a></td>
        </tr>
 
       
      </table>
	  <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
        <div class="btposition2">
	        <div><input type="button" class="deleteBotton" value="删除"/></div>
	  </div>
    </div>
    <div class="divTable" style="display:none;"> 333333 </div>
    <div class="divTable" style="display:none;"> 444444 </div><div class="divTable" style="display:none;">xxxxxxxxxxxxxxxxxx</div>
    <div class="divTable" style="display:none;"> 55555 </div>
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
