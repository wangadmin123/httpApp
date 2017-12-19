<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>班级信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/formStyle.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/laydate/laydate.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/popup.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/add.css"/>
<script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/DatePicker.js"></script>
    <script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/SimpleCanleder.js"></script>
    <link href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/SimpleCanleder.css" rel="stylesheet">
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
xlk();
  $(".saveBotton").click(function(){
    miao=1;
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
    location.href="SubjectTimetable.html";
  }   
}
/*保存读秒结束*/

$(function(){
            /*点击显示弹出框*/
            $(".edit").click(function(){
            	var id =$(this).attr("value");
            	 $.ajax({
                    type: "get", //要用post方式                 
                    url: "<%=request.getContextPath()%>/jwb/updateProject.do",//方法所在页面和方法名
                    contentType: "application/json; charset=utf-8",
                    data: {gid:id},
                    dataType: "json",
                    success: function (data) {
                    //班级Id
                    	$(".id").val(data.id);
                       $(".textStyle").val(data.name);
                       //$(".stage").empty();
                       //阶段
                        var optsS=document.getElementById("stage");
                       var stage=data.stage;   
                       for(var i=0;i<optsS.options.length;i++){                      
                       		if(stage==optsS.options[i].value){                       		
                       			optsS.options[i].selected="true";
                       		}
                       }   
                       //产品
                       var optsSP=document.getElementById("specialty");
                       var specialty=data.specialtyID;
                       for(var i=0;i<optsSP.options.length;i++){
                       		if(specialty==optsSP.options[i].value){                       		
                       			optsSP.options[i].selected="true";
                       		}
                       }
                       //班主任                       
                        var optsT=document.getElementById("teacher");
                       var teacher=data.teacher; 
                       for(var i=0;i<optsT.options.length;i++){                    
                       		if(teacher==optsT.options[i].value){
                       			optsT.options[i].selected="true";
                       		}
                       } 
                       
                       var statusO=document.getElementById("status");
                       var struts=data.struts;
                        for(var i=0;i<statusO.options.length;i++){                      
                       		if(struts==statusO.options[i].value){
                       			statusO.options[i].selected="true";
                       		}
                       }    
                      
                       	 var optsCT=document.getElementById("classTeacher");
                       var classTeacher=data.classTeacher; 
                       for(var i=0;i<optsCT.options.length;i++){                     
                       		if(classTeacher==optsCT.options[i].value){
                       			optsCT.options[i].selected="true";
                       		}
                       }   
                      
                        var optsO=document.getElementById("obtain");
                       var obtain=data.obtain;
                          
                       for(var i=0;i<optsO.options.length;i++){                      
                       		if(obtain==optsO.options[i].value){
                       			optsO.options[i].selected="true";
                       		}
                       }                        
                       
                       var optsM=document.getElementById("motor");
                       var motorid=data.motorid; 
                       $("#motorHidden").val(motorid);   
                       for(var i=0;i<optsM.options.length;i++){                      
                       		if(motorid==optsM.options[i].value){
                       			optsM.options[i].selected="true";
                       		}
                       }
                       $(".dateStyle").val(data.createTime);   
                    },
                    error: function (err) {
                        alert("错误");
                    }
                });
            	
            	//alert(id);
            	$(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");
            	
                

            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });
        });
        /*确定保存弹出框的位置*/
        $(function(){
            var mbHeight= $(document).height();
            var delHeight=$(window).height();
            var saveWidth=$(window).width();

            $(".mbStyle").css("height",mbHeight);


            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",delHeight/2-250);


        });
/*绑定下拉框*/
function xlk(){
  $.ajax({
   url:"oajzb/gradeId",
   type:"post",
   datatype:"json",
   success:function(result){
     $(result).each(function(){
      $("#sel").append("<option value="+this.name+">"+this.name+"</option>");
     });  
   },error:function(){
   alert("报错!");
   }
  });
}
    </script>

</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <div class="serach">
    <form action="jwb/class_info1.html" method="get" accept-charset="UTF-8">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
      <td>班级：</td>  <td>
       <select name="sname" id="sel">
       
       </select>
      </td>
      <td>教员：</td> <td><input type="search" name="steacher" value="${steacher }" class="searchStyle" style="width:160px;"/></td>
      <td>班主任：</td> <td><input type="search" name="sclassTeacher" value="${sclassTeacher }" class="searchStyle" style="width:160px;"/></td>
          
           <td><input type="submit"  value="搜索" class="searchBotton" /></td>
        </tr>
<script type="text/javascript">
        $(function (){
            $("#search_begindate").simpleCanleder();
            });     
</script>     
      
       </table>
       </form>
    </div>

    <h1 class="tabTitle">班级基本信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr>          
          <th>班级</th>
          <th>阶段</th>
          <th>班主任</th>
          <th>教员</th>
          <th>就业专员</th>
          <th>机房</th>
          <th>开班时间</th>
          <th>班级状态</th>
          <th>操作</th>
        </tr>
		<c:if test="${gradeList != null }">
			<c:forEach var="grade" items="${gradeList }" varStatus="status">
      		 	<tr>
      		 	  
		          <td>${grade.name}</td>
		          <td>${grade.stages}</td>
		          <td>${grade.classTeacher}</td>
		          <td>${grade.teacher}</td>
		          <td>${grade.obtain}</td>
		          <td>${grade.motor}</td>
		          <td>${grade.createTime}</td>
		          <td>${grade.strutsName}</td>
		          
		          <td>
		          <c:if test="${loginUser.position.position_name eq '教  务'}">
		          <a class="edit" value="${grade.id }" style="cursor:pointer;">编辑</a>
		          </c:if>
		          <c:if test="${loginUser.position.position_name ne '教  务'}">
		          	<span style="font-size:8px;color:#666;">（当前用户不支持操作）</span>
		          </c:if>
		          </td>		         
		        </tr>
      		 </c:forEach>      	
      	</c:if>        
      </table>
    

       <div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 500px; height: 600px;">
    <h1>编辑班级基本信息<span class="closeX">X</span></h1>
    <form action="jwb/updateGrade.html" method="post">
    <input type="hidden" class="id" name="id">
    <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
            <td class="tdWidth">班级名称：</td>
          <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名" name="name"  /><span>*班级名称不能为空</span></td>
        </tr>

        <tr>
           <td class="tdWidth">选择阶段：</td>
        <td>
            <select id="stage" name="semestersID" class="stage">
        		<c:if test="${semestersList != null }">
					<c:forEach var="dataDictionary" items="${semestersList}">
						<option value="${dataDictionary.id}">${dataDictionary.stage}</option>
						</c:forEach>
				</c:if>
        
        </select>
      </td>
        </tr>
 <tr>
           <td class="tdWidth">选择产品：</td>
        <td>
            <select id="specialty" name="specialtyID" class="stage">
        		<c:if test="${specialtyList != null }">
					<c:forEach var="dataDictionary" items="${specialtyList}">
						<option value="${dataDictionary.specialty_Id}">
						${dataDictionary.specialty_name}</option>
						</c:forEach>
				</c:if>
        
        </select>
      </td>
        </tr>
        <tr>
            <td class="tdWidth">班主任：</td>
          <td>
            <select id="classTeacher" name="classTeacher"  class="classTeacher">
       			<c:if test="${classTeacherList != null }">
					<c:forEach var="dataDictionary" items="${classTeacherList}">
						<option <c:if test="${dataDictionary.emp_id == querySpecialty }">selected="selected"</c:if>
							value="${dataDictionary.emp_name}">${dataDictionary.emp_name}</option>
				    </c:forEach>
				</c:if>
        </select>
      </td>
        </tr>  
        <tr>
            <td class="tdWidth">教员：</td>
          <td>
            <select id="teacher"  name="teacher" class="teacher">
        		<c:if test="${teacherList != null }">
					<c:forEach var="dataDictionary" items="${teacherList}">
						<option  <c:if test="${dataDictionary.emp_id == querySpecialty }">selected="selected"</c:if>
								value="${dataDictionary.emp_name}">${dataDictionary.emp_name}</option>
					</c:forEach>
				</c:if>
        </select>
      </td>
        </tr> 
        <tr>
          <td class="tdWidth">就业专员：</td>
          <td>
            <select id="obtain" name="obtain" class="obtain">
       			<c:if test="${obtainList != null }">
       				<c:forEach var="dataDictionary" items="${obtainList}">
						<option <c:if test="${dataDictionary.emp_id == querySpecialty }">selected="selected"</c:if>
							value="${dataDictionary.emp_name}">${dataDictionary.emp_name}</option>
					</c:forEach>
				</c:if>
        </select>
      </td>

        </tr>
		
		<tr>
           <td class="tdWidth">班级状态：</td>
          <td>          
            <select id="status" name="status" class="status">
        		<c:if test="${statusList != null }">
						<c:forEach var="dataDictionary" items="${statusList}">
							<option  <c:if test="${dataDictionary.strutsId == querySpecialty }">selected="selected"</c:if>
								value="${dataDictionary.strutsId}">${dataDictionary.strutsName}</option>
						</c:forEach>
				</c:if>
        </select>
      </td>
        </tr>

        <tr>
           <td class="tdWidth">机房：</td>
          <td>
          	<input type="hidden" name="motorHidden" id="motorHidden">
            <select id="motor" name="motor" class="motor">
        		<c:if test="${motorList != null }">
						<c:forEach var="dataDictionary" items="${motorList}">
							<option  <c:if test="${dataDictionary.id == querySpecialty }">selected="selected"</c:if>
							<c:if test="${dataDictionary.status == 1 }">disabled="disabled"</c:if>
								value="${dataDictionary.id}">${dataDictionary.name}</option>
						</c:forEach>
				</c:if>
        </select>
      </td>
        </tr>
        <tr>
        	<td class="tdWidth">开班时间：</td>
        	<td>
        	<input type="date" class="dateStyle" style="width:160px;" name="createTime">
        	</td>
        </tr>
        
    </table>
    <div class="btposition1">
      <input type="submit" value="保存" class="saveBotton" style="position: absolute;left: 220px; " />
    </div>
    </form>
</div>

  </body>
</html>
