<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>考勤管理</title>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css"/>
<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/develop_department/js/globle.js"></script>
<script type="text/javascript" src="statics/develop_department/laydate/laydate.js"></script>
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
<br/>
<h2>各小组成员考勤管理</h2>
<br/>
<hr/>
<br />
  <div class="tabContent">
<div class="serach">
				<form action="develop/jl_kq.html" method="post">
					<table cellpadding="0" cellspacing="0" class="searchTable"
						border="0" style="width:40%;">
						<tr>
							<td><h3>姓名：</h3></td>
							<td><input type="search" name="stu_name" class="searchStyle"
								style="width:110px;" /></td>
							<td><input type="submit" value="搜索" class="searchBotton" /></td>
						</tr>
					</table>
				</form>
			</div>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="1" style="width:70%;" class="selectTable">
        <tr>
          <th>编号</th>
          <th>学号</th>
          <th>姓名</th>
          <th>总分</th>
		  <th>详情</th> 
        </tr>
        	<c:forEach items="${jlkqlist}" var="s">
        <tr>

		  <td>${s.id}</td>
          <td>${s.stu_id }</td>
          <td>${s.stu_name }</td>
          <td>${s.sumscore}</td>
           <td><a href="develop/jl_kqxiang.html?userid=${s.id}">查看</td>
        </tr>
        </c:forEach>
         <tr>
      </table>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
</body>
</html>
