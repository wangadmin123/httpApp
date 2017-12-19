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
<title>员工口碑信息列表</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/daily.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/laydate/laydate.js"></script>
<script type="text/javascript">

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
		location.href="${pageContext.request.contextPath }/jsp/teach_nature_department/welcome.jsp";
	}		
}
/*保存读秒结束*/
/* 分页显示数据 */
function showData(currentPage){
	var praiseInfo=$("#form").serialize()+"&currentPage="+currentPage;
	$.post("personal/ygkb",praiseInfo,showInfo,"json");
	
}
function showInfo(data){
		var index=data.currentPage;//当前页
		var pageCount=data.pageCount;//页面总数
		var praise=data.praiselist;//参数
		showList(praise);
		showPageInfo(index,pageCount);
}
function showList(praise){
	$("#KouBei").empty();
	for(var i=0;i<praise.length;i++){
	var payStatus=praise[i].payStatus==null?"暂无数据":praise[i].payStatus;
		$("#KouBei").append("<tr>"
								+"<td>"+praise[i].consultant_name+"</td><td>"+praise[i].consultant_age+"</td>"
								+"<td>"+praise[i].sex+"</td><td>"+praise[i].education+"</td>"
								+"<td>"+praise[i].contact_way+"</td><td>"+payStatus+"</td>"
								+"<td>"+praise[i].name+"</td>"
								+"<td><a href='${pageContext.request.contextPath }/personalinfo.html?id="+praise[i].id+"' class='paifa' style='margin-left:0px;'>查看</a></td>"
								+"</tr>");
	}
}


//页数回调
function showPageInfo(index,pageCount){
		$("#page").empty();
	  	var str="";
	 	str+="<a href='javascript:onclick=showData(1)'>首页</a>";
	 	if(index!=1){
	 		str+="<a href='javascript:onclick=showData("+(index-1)+")'>上一页</a>";
	 	}
	 	for(var i=1;i<=pageCount;i++){
	 		str+="<a href='javascript:onclick=showData("+i+")'>"+i+"</a>";
	 	}
	 	if(index!=pageCount){
	 		str+="<a href='javascript:onclick=showData("+(index+1)+")'>下一页</a>";
	 	}
	 	str+="<a href='javascript:onclick=showData("+pageCount+")'>末页</a>";
	 	$("#page").html(str);
}
$(function(){
	showData(1);
	$("#sousuo").click(function(){
		showData(1);
	});
});
</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <div class="serach">
         <form method="post" action="#" id="form">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
        <td>状态:<td/>
        <td>
			<c:forEach var='type' items="${typelist }">
				<input type="radio"  name="payStauts" class="checkedStyle" value="${type.id }"/>${type.payStatus }&nbsp;&nbsp;
			</c:forEach>
			<input type="radio"  name="payStauts" class="checkedStyle" value="0" checked="checked"/>全部&nbsp;&nbsp;
        </td>
		   <td>姓名：</td> <td><input type="text" name="consultant_name" class="dateStyle" style="width:160px;" /></td>
           <td><input id="sousuo" type="button"  value="搜索" class="searchBotton" /></td> 
        </tr>
       </table>
       </form>
    </div>

    <h1 class="tabTitle">员工口碑信息</h1>
	
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
      <thead>
        <tr>
       	  <th>咨询者</th>
          <th>年龄</th>
          <th>性别</th>
          <th>学历</th>
          <th>联系方式</th>
          <th>状态</th>
          <th>介绍人</th>
          <th>操作</th>
        </tr>
      </thead>
      <tbody id="KouBei">
      
      </tbody>
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
