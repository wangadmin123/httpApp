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
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/popup.css"/>

<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/index.js"></script>

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
       $(".delete").click(function(){
	        confirm("确定要删除吗?");
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
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
		      <td width="60">学员姓名：</td> <td width="150"><input type="search"  class="searchStyle" style="width:160px;"/></td>
          <td width="40">性别：</td> <td width="150"><select class="ZY_tj" style=" width: 100%; height: 30px;">
		      <option>-请选择-</option>
              <option>男</option>
              <option>女</option>
            </select></td>
          <td width="90">班主任名称：</td> <td width="140"><select class="ZY_tj" style=" width: 100%; height: 30px;">
		      <option>-请选择-</option>
              <option>Lisa</option>
              <option>张曼</option>
            </select></td>
          <td><input type="button"  value="搜索" class="searchBotton" /></td>
        </tr>
       </table>
    </div>
    <h1 class="tabTitle">基本信息<span style="float: right;padding-right: 50px;"><input type="button"  value="添加" class="searchBotton" onclick="NewPage('addstudent.html')" /></span></h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr>
		  <th><input type="checkbox" id="all"/></th>
					
						<th>学员姓名</th>
						<th>性别</th>
					
						<th>班主任姓名</th>
						<th>专业</th>
						<th>毕业院校</th>
						
					
						<th>手机号码</th>
						<th>通信地址</th>
						
						<th>邮政编码</th>
						
						<th>学历毕业时间</th>
						

					</tr>
        <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          
         
         
            
           <td>张鹏</td>
             <td>男</td>
          <td>高春艳</td>
          <td>计算机应用</td>
          <td>山西省贸易学校</td>
          <td>13133311232</td>
          <td>山西省太原市</td>
          <td>030222</td>
           
           <td>2017-07-06</td>
           
           
         
          <td><a href="studentedit.html" class="edit">编辑</a> <a href="examinestudent.html" class="link">查看</a> <a href="#" class="delete">删除</a></td> 
        </tr>
        
         
 
       
      </table>
	  <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
 		<div class="btposition2">
	       <div><input type="button" class="deleteBotton" value="删除"/></div>
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

