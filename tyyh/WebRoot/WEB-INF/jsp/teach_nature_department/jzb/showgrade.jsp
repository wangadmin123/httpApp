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
<title>列表模板</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/laydate/laydate.js"></script>
<script type="text/javascript">
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

  <div class="tabContent">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;">
        <tr>
		  <td>编号：</td> <td><input type="search"  class="searchStyle" style="width:160px;"/></td>
          <td>姓名：</td> <td><input type="search" class="searchStyle" style="width:160px;"/></td>
          <td>入学时间：</td> <td><input type="date" class="dateStyle" style="width:160px;" /></td>
           <td><input type="button"  value="搜索" class="searchBotton" /></td>
        </tr>
       </table>
    </div>

    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr>
		      <th></th>
          <th>学号</th>
          <th>姓名</th>
          <th>年龄</th>
          <th>性别</th>
          <th>学历</th>
          <th>学生状态</th>
          <th>所属班级</th>
          <th>籍贯</th>
          <th>毕业学校</th>
          <th>专业</th>
          <th>身份证号</th>
          <th>联系方式</th>
          <th>邮箱</th>
          <th>入学时间</th>
          <th>操作</th>
        </tr>
        <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="studentShow.jsp" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
           <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
           <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
           <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
           <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
           <td>1001</td>
          <td>张三</td>
          <td>22</td>
          <td>男</td>
          <td>大专</td>
          <td>在读</td>
          <td>C12</td>
          <td>晋城市</td>
          <td>山西青年职业学院</td>
          <td>软件技术</td>
          <td>140***********2012</td>
          <td>13100000000</td>
          <td>596822222@qq.com</td>
          <td>2016-5-3</td>
          <td><a href="#" class="show">详情</a></td>
        </tr>
 
       
      </table>
	  <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
        <div class="btposition2">
	  </div>
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
<div class="deleteStyle">
	<h3>操作提示</h3>
	<h2>确定要删除吗？</h2>
	<div class="btn">
	   <div class="bottomStyle1">确定</div>
	   <div class="bottomStyle2">取消</div>
	</div>
</div>
</body>
</html>
