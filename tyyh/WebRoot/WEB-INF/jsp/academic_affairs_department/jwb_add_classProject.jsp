<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>新增班级</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/switch.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
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
	    var from=$("#women");
	    var flag1=false;
	    var flag2=false;
	    var flag3=false;
	    var flag4=false;
	    var flag5=false;
	    var flag6=false;
	    var flag7=false;
	    if(from.name.html() != null){
	     flag1=true;
	    }
	    if(from.specialtyID.html() != null){
	     flag2=true;
	    }
	    if(from.classTeacherID.html() != null){
	     flag3=true;
	    }
	    if(from.teacherID.html() != null){
	     flag4=true;
	    }
	    if(from.obtainID.html() != null){
	     flag5=true;
	    }
	    if(from.motorid.html() != null){
	     flag6=true;
	    }
	    if(from.createTime.html() != null){
	     flag7=true;
	    }
	    if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6&&flag7){
	     
		miao=2;
		$(".setTime").text(miao);
		$(".saveStyle").css("display","block");
		myTime=setInterval("divHide()",1000);}
    });  
});

function divHide(){
	miao--;
	$(".setTime").text(miao);
	if(miao==0){
		clearInterval(myTime);
		$(".saveStyle").hide();
		location.href="class_info1.html";
	}		
}
/*保存读秒结束*/


	
	function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	    if(emp_name_in!=""){$(ww).attr("style","width:160px");};
	
	}
	
	
	
	function www(from){
      showw(from.name);
      showw(from.specialtyID);
      showw(from.classTeacherID);
      showw(from.teacherID);
      showw(from.obtainID);
      showw(from.motorid);
      showw(from.createTime);
      
   
      if( from.name.value=="" || from.name.value==null){
           return false;
      }
      if( from.specialtyID.value=="" || from.specialtyID.value==null){
           return false;
      }
      if( from.classTeacherID.value=="" || from.classTeacherID.value==null){
           return false;
      }
      if( from.teacherID.value=="" || from.teacherID.value==null){
           return false;
      }
      if( from.obtainID.value=="" || from.obtainID.value==null){
           return false;
      }
       if( from.motorid.value=="" || from.motorid.value==null){
           return false;
      }
       if( from.createTime.value=="" || from.createTime.value==null){
           return false;
      }
       return true;
    
    }
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">新增班级</h1>
      <form action="jwb/addProject" onsubmit="return www(this)" method="post" enctype="multipart/form-data" id="women">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">班级名称：</td>
          <td><input type="text" class="textStyle" style="width:160px;" name="name" placeholder="请输入班级名称"  /><span>*班级名称不能为空</span></td>
        </tr>
        <tr>
          <td class="tdWidth">选择产品：</td>
        <td>
         	 <select name="specialtyID" class="form-control" style="width: 115px; ">
									<c:if test="${specialtyList != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="dataDictionary" items="${specialtyList}">
									   		<option <c:if test="${dataDictionary.specialty_Id == querySpecialty }">selected="selected"</c:if>
									   		value="${dataDictionary.specialty_Id}">${dataDictionary.specialty_name}</option>
									   </c:forEach>
									</c:if>
        						</select>
			</td>
        <tr>
          <td class="tdWidth">班主任：</td>
        	<td>
         	 	<select name="classTeacherID" class="form-control" style="width: 115px; ">
									<c:if test="${classTeacherList != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="dataDictionary" items="${classTeacherList}">
									   		<option <c:if test="${dataDictionary.emp_id == querySpecialty }">selected="selected"</c:if>
									   		value="${dataDictionary.emp_id}">${dataDictionary.emp_name}</option>
									   </c:forEach>
									</c:if>
        						</select>
			</td>
        </tr>
        <tr>
          <td class="tdWidth">教员：</td>
          <td>
         	 	<select name="teacherID" class="form-control" style="width: 115px; ">
									<c:if test="${teacherList != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="dataDictionary" items="${teacherList}">
									   		<option <c:if test="${dataDictionary.emp_id == querySpecialty }">selected="selected"</c:if>
									   		value="${dataDictionary.emp_id}">${dataDictionary.emp_name}</option>
									   </c:forEach>
									</c:if>
        						</select>
			</td>
        </tr>
        <tr>
          <td class="tdWidth">就业专员：</td>
          <td>
         	 	<select name="obtainID" class="form-control" style="width: 115px; ">
									<c:if test="${obtainList != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="dataDictionary" items="${obtainList}">
									   		<option <c:if test="${dataDictionary.emp_id == querySpecialty }">selected="selected"</c:if>
									   		value="${dataDictionary.emp_id}">${dataDictionary.emp_name}</option>
									   </c:forEach>
									</c:if>
        						</select>
			</td>
        </tr>
        <tr>
          <td class="tdWidth">机房：</td>
          <td>
         	 	<select name="motorid" class="form-control" style="width: 115px; ">
									<c:if test="${motorList != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="dataDictionary" items="${motorList}">
									   		<option <c:if test="${dataDictionary.id == querySpecialty }">selected="selected"</c:if>
									   		value="${dataDictionary.id}">${dataDictionary.name}</option>
									   </c:forEach>
									</c:if>
        						</select>
				
			</td>
        </tr>
        <tr>
        	<td class="tdWidth">开班时间：</td><td><input type="date" class="dateStyle" style="width:160px;" name="createTime" /></td>

        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="保存" class="saveBotton" />
	  </div>
     </form> 

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
  </body>
</html>
