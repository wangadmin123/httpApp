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
<title>列表模板</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/public.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/info.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/laydate/laydate.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/stu_info.js"></script>
<style type="text/css">
    	*{
    		font-size: small;
    		margin: 0px;
    		padding: 0px;
    	}
    
    	#td_left{
    		height: 150px;
    	}
    	
    	#pageList a{
	  		display:inline-block;
	  		widht:20px;
	  		height:20px;
	  		text-align: center;
	  		margin:1px;
	  		padding: 2px 0px 0px 0px;
	  		text-decoration:none;
	  	}
	  	
	  	#searchStudent{
	  		margin-top: 10px;
	  		margin-bottom: 50px;
	  	}
	  	
	  	#tianjia{
	  		margin-left: 1170px;
	  	}
	  	
	  	#stuList table{
	  		
	  	}
	  	
    </style>

<script type="text/javascript">
$(function(){
	   	showDate(1);
	   	$("#searchStudent").click(function(){
	   		showDate(1);
	   	});
	  });
	  function showDate(index){
	  	var query = $("#searchStudent").serialize() + "&index=" + index;
	  	$.post("oaJzbStudentlist",query,show,"json");
	  }
	  function show(data){
	  var fals1 = data.fals;
	  	var pageCount = data.pageCount;
	  	var index = data.index;
	  	var stuList = data.stuList;
	  	showPer(stuList,fals1);
	  	showPage(pageCount,index);
	  }
	  function showPer(stuList,fals1){
	  	$("#stuList table").empty();
	  	$("#stuList table").append("<tr><th>序号</th><th>学生学号</th><th>学生姓名</th><th>性别</th><th>年龄</th><th>所学专业</th><th>班级名称</th><th>状态</th><th>联系电话</th><th>家长姓名</th><th>紧急联系人电话</th><th>学历</th><th>家庭住址</th><th>操作</th></tr>");
	  	for(var i = 0; i < stuList.length;i++ ){
	  		if(fals1[i]){
	  		$("#stuList table").append("<tr><td>"+(i+1)+
	  		"</td><td>" + (stuList[i].stu_number==undefined?"":stuList[i].stu_number) + 
	  		"</td><td>" + (stuList[i].stu_name==undefined?"":stuList[i].stu_name) + 
	  		"</td><td>" + (stuList[i].stu_sex==undefined?"":stuList[i].stu_sex) +
	  		"</td><td>" + (stuList[i].stu_age==undefined?"":stuList[i].stu_age) + 
	  		"</td><td>" + (stuList[i].specialty==undefined?"":stuList[i].specialty) + 
	  		"</td><td>" + (stuList[i].grade_name==undefined?"":stuList[i].grade_name) + 
	  		"</td><td>" + (stuList[i].stu_status==undefined?"":stuList[i].stu_status) + 
	  		"</td><td>" + (stuList[i].contact_way==undefined?"":stuList[i].contact_way) + 
	  		"</td><td>" + (stuList[i].memberName==undefined?"":stuList[i].memberName) + 
	  		"</td><td>" + (stuList[i].memberContact_way==undefined?"":stuList[i].memberContact_way) + 
	  		"</td><td>" + (stuList[i].education_name==undefined?"":stuList[i].education_name) + 
	  		"</td><td>" + (stuList[i].address==undefined?"":stuList[i].address) + 
	  		
	  		"</td><td><a href=\"${pageContext.request.contextPath }/oaJzbStudentInfo/" + stuList[i].stu_Id + "\" style='width:40px;'   class='link'>查看</a>" + 
	  		"<a href=\"${pageContext.request.contextPath }/editStuInfo/" + stuList[i].stu_Id + "\" style='width:40px;'   class='edit'>完善</a>" + 	
	  		/* "<a href=\"${pageContext.request.contextPath }/addtiaozhuan/" + stuList[i].stu_Id + "\" style='width:40px;'   class='edit'>分析</a>"+ */
	  		"</td></tr>");
	  		//${pageContext.request.contextPath }/addtiaozhuan.html
	  		}else{
	  		$("#stuList table").append("<tr><td>"+(i+1)+
	  		"</td><td>" + (stuList[i].stu_number==undefined?"":stuList[i].stu_number) + 
	  		"</td><td>" + (stuList[i].stu_name==undefined?"":stuList[i].stu_name) + 
	  		"</td><td>" + (stuList[i].stu_sex==undefined?"":stuList[i].stu_sex) +
	  		"</td><td>" + (stuList[i].stu_age==undefined?"":stuList[i].stu_age) + 
	  		"</td><td>" + (stuList[i].specialty==undefined?"":stuList[i].specialty) + 
	  		"</td><td>" + (stuList[i].grade_name==undefined?"":stuList[i].grade_name) + 
	  		"</td><td>" + (stuList[i].stu_status==undefined?"":stuList[i].stu_status) + 
	  		"</td><td>" + (stuList[i].contact_way==undefined?"":stuList[i].contact_way) + 
	  		"</td><td>" + (stuList[i].memberName==undefined?"":stuList[i].memberName) + 
	  		"</td><td>" + (stuList[i].memberContact_way==undefined?"":stuList[i].memberContact_way) + 
	  		"</td><td>" + (stuList[i].education_name==undefined?"":stuList[i].education_name) + 
	  		"</td><td>" + (stuList[i].address==undefined?"":stuList[i].address) + 
	  		
	  		"</td><td><a href=\"${pageContext.request.contextPath }/oaJzbStudentInfo/" + stuList[i].stu_Id + "\" style='width:40px;'   class='link'>查看</a>" + 
	  		"<a href=\"${pageContext.request.contextPath }/editStuInfo/" + stuList[i].stu_Id + "\" style='width:40px;'   class='edit'>完善</a>" + 
	  		"<a href=\"${pageContext.request.contextPath }/deleteStuInfo/" + stuList[i].stu_Id + "\" style='width:40px;'   class='delete'>删除</a>" + 	
	  		"</td></tr>");
	  		}
	  		
	  	}
	  }

	function showPage(pageCount,index){
	 	$("#pageList").empty();
	 	$("#pageList").append("<a href='javascript:onclick=showDate(1)' >首页</a>&nbsp;");
	 	if(index != 1){
	 		$("#pageList").append("<a href='javascript:onclick=showDate("+(index-1)+")' >上一页</a>&nbsp;");
	 	}
	 	var iqishi=1;
	 	if(pageCount>=8){
	 		if((index+4)>=pageCount){
	 		iqishi=pageCount-8;
	 	}else if(index>=5){
	 		iqishi=index-4;
	 	}
	 	}
	 	for(var i = iqishi;i <= iqishi+8;i++){
	 	if(i==index){
	 	$("#pageList").append("<a href='javascript:onclick=showDate("+i+")' style='color:red;'>"+i+"</a>&nbsp;");
	 	}else{
	 	$("#pageList").append("<a href='javascript:onclick=showDate("+i+")' >"+i+"</a>&nbsp;");
	 	}
	 	if(i==pageCount){
	 			break;
	 		}
	 	}
	 	if(index != pageCount){
	 		$("#pageList").append("<a href='javascript:onclick=showDate("+(index+1)+")' >下一页</a>&nbsp;");
	 	}
	 	$("#pageList").append("<a href='javascript:onclick=showDate("+pageCount+")' >末页</a>&nbsp;&nbsp;当前第"+index+"页，共"+pageCount+"页");
	 }
	function addStuInfo() {
		window.location.href="toAddStuInfo.html";
	}
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <div class="search">
    <form id="searchStudent" method="post">
        <table> 
        <tr>
		  <td>班级:</td> 
		  <td><select class="ZY_tj" style=" width: 100%; height: 30px;" name="queryGrade">
		  			<option value="">--请选择--</option>
								<c:if test="${grades != null }">
									<c:forEach var="grade" items="${grades}">
										<option
											<c:if test="${grade.id == queryGrade }">selected="selected"</c:if>
											value="${grade.id}">${grade.name}</option>
									</c:forEach>
								</c:if>
            </select>
            </td>
          <td>姓名：</td> <td><input type="search" class="searchStyle" style="width:160px;" name="searchName" value="${searchName }"/></td>
          <td>状态:<select class="searchStyle" style="width:160px;" name="queryStatus">
          	<option value="">--请选择--</option>
          				<c:if test="${status != null }">
									<c:forEach var="status" items="${status}">
										<option
											<c:if test="${status.id == queryStatus }">selected="selected"</c:if>
											value="${status.id}">${status.stu_status}</option>
									</c:forEach>
								</c:if>
          		  </select>
          </td>
          <td><input type="submit"  value="搜索" class="searchBotton" /></td>
          
        </tr>
		</table>
		</form>
    </div>

   
  <!--   <p class="info_p">
   		<span class="info_button" id="tianjia" onclick="addStuInfo()">添加</span>
    </p> -->
    <div class="divTable" id="stuList">
      <table  class="selectTable" cellspacing="0" border="1" >
      </table>
       
       
	  
    </div>
      <!-- 显示分页页码 -->
    <div id="pageList" style="text-align: right;margin-right:30px;">
    </div>
  </div>
</div>
</body>
</html>
