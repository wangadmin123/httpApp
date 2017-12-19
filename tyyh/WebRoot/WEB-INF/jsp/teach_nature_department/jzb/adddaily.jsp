<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <meta charset="UTF-8">
  <base href="<%=basePath%>">
    <title>添加日报表</title>

<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">

	<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
	<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
	<script type="text/javascript" src="statics/teach_nature_department/jzb.js/jquery.js"></script>
	<meta charset="UTF-8">
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
      <script type="text/javascript">
	$(function(){
	$(".saveOut").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		window.location.href="${pageContext.request.contextPath }/Dailygeren";
	});
});
function showww(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==0){$(ww).attr("style","border:red 1px solid;width:800px");};
	if(emp_name_in!=0){$(ww).attr("style","border:#A9A9A9 1px solid;width:800px");};
	}
	
function check(form) {

		var nameValue = window.document.getElementById("a").value;
		var ageValue = window.document.getElementById("b").value;
		var ageValue1 = window.document.getElementById("c").value;
		if (nameValue == "" || ageValue == ""||ageValue1=="" ) {
			document.getElementById("d").disabled = true;
			return false;
		} else {

			document.getElementById("d").disabled = false;
		}

		return true;
	}
	$(function() {

		var nameValue = window.document.getElementById("a").value;
		var ageValue = window.document.getElementById("b").value;
		var ageValue1 = window.document.getElementById("c").value;
		if (nameValue == "" || ageValue == "" ||ageValue1=="") {

			document.getElementById("d").disabled = true;
			return false;
		}
	});
    
$(function(){
		$(".chekessf").focus();
		addTr(1);  // 初始化为页面追加第一条记录
		$("#appendTable").on("blur",".ipts",function(){      // 由于要给动态追加的元素添加事件，必须用到事件托管
			var nextIndex = parseInt($(this).attr("id").split("ipt")[1])+1;    // 获取下一个文本框的索引值
			var nextId = 'ipt'+nextIndex;                // 拼接得到下一个文本框的id值
			if($("#"+nextId).length>0){                  // 判断页面中是否存在下一个文本框
				return false;							 // 若存在则不执行任何操作
			}else {
				addTr(nextIndex);						 // 若不存在则追加一条记录
			}
		});
	
});
/**
 * 追加一条记录
 * @param i   int    追加记录的索引值
**/
 function addTr(i){
	var htmlstr = '<tr><td><input type="time" name="Starttime" class="dateStyle"  value="08:15"/><input type="time" name="Outtime" class="dateStyle"  value="08:30"/></td><td><input id="ipt'+i+'" class="ipts" type="text" name="Contentsoftheclass" value="" /></td></tr>' ;  // 利用好单引号和双引号，就可以少写很多转义符号
	$("#appendTable").append(htmlstr);
} 
  </script>
  </head>
  
  <body> 
  <form action="${pageContext.request.contextPath }/adddaily" method="post" > 
  <div class="tabContent" style="padding-left:15px;">
    <h1 class="tabTitle">教质部日报工作</h1>
    <div >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable" style="width:80%;">
        <tr>
  		   <th style="width:100px;">姓名:${loginUser.name }</th> 
  		   <th style="text-align:left;">日期:${data }</th> 
  		 
  		</tr>
  		<tr>
  		   <td style="width:100px;">日报内容:</td> 
  		  
  		   <td><textarea  style="width:95%; height:350px;  line-height:30px; font-size:16px; padding:0px 3px;" name="remarks"></textarea></td>
  		</tr>
  		</table>
  		</div>
  		</div>

 		  <div class="btposition1">
		    <input type="submit" id="d" value="保存" class="saveBotton" />
		    <input type="button" value="返回" class="saveOut saveBotton" />
		  </div>
		  <div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
		  
		  
		  <table class="tableOne" style="display:none;">
				<tr>
					<td colspan="2" style="text-align: left;"><span
						style="color: red;">*</span>当日主要工作:<input type="text" id="a"
						oninput="check(this)" onblur="showww(this)" class="chekessf"
						name="theContentOfThework" value="1"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left;"><span
						style="color: red;">*</span>上午主要工作:<input type="text" id="b"
						oninput="check(this)" onblur="showww(this)" name="morningwork"
						value="1"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: left;"><span
						style="color: red;">*</span>下午主要工作:<input type="text" id="c"
						oninput="check(this)" onblur="showww(this)"
						name="afternoonjobcontent" value="1"></td>
				</tr>
				<!-- <tr>
 					<td><input type="time"  name="" value="8:30" /><input class="wbk2" type="time" name="" value="9:20"/></td>
 					<td><input id="wenben" type="text" class="wbk" name="" value="查勤、单词领读及听写" /></td>
 				</tr> -->
				<tbody id="appendTable">

				</tbody>



			</table>
 		</form>
  </body>
</html>
