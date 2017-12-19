<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>接收咨询报名量</title>
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

/*表格全选*/
$(function(){
	  $("#all").click(function(){
        var checked=$(this).is(":checked");
        $(".selectTable tr th").children().attr("checked",checked);
      });
    //判断是否全选
		function ifAllChecked(){
			var checkedBoxs=$(".selectTable tr th").children();
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

function selectAll(){
 	var obj = document.getElementsByName("id");
 	var cks = document.getElementsByTagName("input");
 	var ckslen = cks.length;
 	for(var i=0;i<ckslen-1;i++) {
  		if(cks[i].type == 'checkbox') {
  		 cks[i].checked = obj[0].checked;
 	 }
   }
}


/* Ajax查询列表、根据条件查询 */
function show(currentPage){
	var temp=$("#form").serialize()+"&currentPage="+currentPage;
	$.ajax({
		url:"oaJzb/ReceiveConsultlist",
		data:temp,
		datatype:"json",
		success:showDate
	});
}
function showDate(data){
	var receivelist=data.receivelist;
	var pageCount=data.pageCount;
	var index=data.currentPage;
	showInfo(receivelist);
	showPage(pageCount,index);
}
/* 接收返回数据 */
function showInfo(receivelist){
	$("#student_info").empty();
	if(receivelist.length==0){
    	$("#student_info").html(" ");
    }else{
    	for ( var i = 0; i < receivelist.length; i++) {
			var sex = receivelist[i].sex==1?"男":"女";
			var educat=receivelist[i].educat==null?"无":receivelist[i].educat;
			var receive=receivelist[i].specialty==null?"无":receivelist[i].specialty;
			var sta=receivelist[i].sta==null?"无":receivelist[i].sta;
			$("#student_info").append("<tr><td><input type=\"hidden\" name=\"consultTeacher\" value=\""+receivelist[i].consultTeacher+"\"/>"
									+"<input type=\"hidden\" name=\"educationId\" value=\""+receivelist[i].educationId+"\"/>"
									+"</td>"
									+"<td><input type=\"checkbox\" name=\"id\" class='checkId' value=\""+receivelist[i].id+"\"/></td>"
									+"<td><input name=\"name\" value=\""+receivelist[i].name+"\" readonly style='width:70px;line-height:20px;text-align:center;border:1px solid white'/></td>"
									+"<td>"+sex+"</td>"
									+"<td><input name=\"age\" value=\""+receivelist[i].age+"\" readonly style='width:50px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"<td>"+educat+"</td>"
									+"<td>"+receive+"</td>"
									+"<td>"+sta+"</td>"
									+"<td><input name=\"telphone1\" value=\""+receivelist[i].telphone1+"\" readonly style='width:130px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"<td><input name=\"ungenTelphone\" value=\""+receivelist[i].ungenTelphone+"\" readonly style='width:130px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"</tr>");
		}
	}
}
 /* oninput=\"check(this)\" */
function showPage(pageCount,index){
	$("#page").empty();
	  	var str="";
	 	str+="<a href='javascript:onclick=show(1)'>首页</a>";
	 	if(index!=1){
	 		str+="<a href='javascript:onclick=show("+(index-1)+")'>上一页</a>";
	 	}
	 	for(var i=1;i<=pageCount;i++){
	 		str+="<a href='javascript:onclick=show("+i+")'>"+i+"</a>";
	 	}
	 	if(index!=pageCount){
	 		str+="<a href='javascript:onclick=show("+(index+1)+")'>下一页</a>";
	 	}
	 	str+="<a href='javascript:onclick=show("+pageCount+")'>末页</a>";
	 	$("#page").html(str);
}
/* 窗体加载 */
$(function(){
	show(1);
	$("#sousuo").click(function(){
		show(1);
	});
});
//为分配班级添加事件
function clicks(){
	var gradeId=$("#fenpei").prev().val();//得到下拉框的id
	var check = $("input:checkbox[name='id']:checked");
	if (gradeId == 0 || check.length==0) {
			return false;
		}else{
			return true;
		}
}
/* $(function(){
	$("#fenpei").click(function(){
	var gradeId=$("#fenpei").prev().val();//得到下拉框的id
	var check = $("input:checkbox[name='id']:checked");
	if (gradeId == 0 || check.length==0) {
			document.getElementById("fenpei").disabled = true;
			 confirm("分配不成功，刷新页面后，请重新分配！");
			return false;
		}
	});
}); */
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <div class="serach">
    	<form action="#" method="post" enctype="multipart/form-data" id="form">
        <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
		  <td>学员姓名：</td> <td><input name="name" type="text" id="receiveName" class="searchStyle" value="" style="width:160px;"/></td>
          <td>性别：</td> 
          <td><select name="sex" id="receiveSex" class="searchStyle" style="width:160px;">
          		<option value="0">--请选择--</option>
          		<option value="1">男</option>
          		<option value="2">女</option>
          	</select></td>
          <td><input type="button" id="sousuo"  value="搜索" class="searchBotton"/></td>
        </tr>
       </table>
       </form>
    </div>
    <h1 class="tabTitle">接收咨询报名量</h1>
    <div class="divTable" >
    <form action="${pageContext.request.contextPath }/consultgrade.html" name="form1" method="post" enctype="multipart/form-data" class="form" onsubmit="return clicks()">
    <span style="font-size: 15px;">班级：
      <select name="gradeId" style="width: 100px;height: 25px;">
     			<option value="0">---请选择---</option>
      <c:forEach items="${gradelist }" var="gradelist">
      			<option value="${gradelist.id }">${gradelist.name }</option>
      </c:forEach>
      </select>
      <input type="submit" value="分配班级" id="fenpei"/></span>
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
       	<thead>
        	<tr>
        	<!--  <th><input type="checkbox" id="all"/></th> -->
        	 <th></th>
        	 <th></th>
         	 <th>学生姓名</th>
          	 <th>性别</th>
          	 <th>年龄</th>
         	 <th>学历</th>
         	 <th>专业</th>
         	 <th>学生状态</th>
         	 <th>联系电话</th>
         	 <th>紧急联系人电话</th>
        	</tr>
        </thead>
      	<tbody id="student_info">
      		
      	</tbody>
      </table>
      </form>
	  <div id="page"></div>
    </div>

  </div>
</div>
<!-- <div class="mbStyle">&nbsp;</div>
<div class="deleteStyle">
	<h3>操作提示</h3>
	<h2>确定要删除吗？</h2>
	<div class="btn">
	   <div class="bottomStyle1">确定</div>
	   <div class="bottomStyle2">取消</div>
	</div>
</div> -->
</body>
</html>

