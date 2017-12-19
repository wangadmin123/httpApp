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
    <meta charset="UTF-8">
<title>修改</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/sanji.js"></script>
<script type="text/javascript" src="statics/common/js/pinying.js"></script>

<script type="text/javascript">


/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});
		var str=name.trim();
		var phoneticize = makePy(str);
		$("#phoneticize").val(phoneticize);
	var miao;
var myTime;
$(function(){
	$(".saveBotton").click(function(){
	    var from=$("#women");
	    var flag1=false;
	    var flag2=false;
	    var flag3=false;

	    if(from.name.html() != null){
	     flag1=true;
	    }
	    if(from.age.html() != null){
	     flag2=true;
	    }
	     if(from.telphone1.html() != null){
	     flag3=true;
	    }
	 
	    if(flag1&&flag2&&flag3){
	    
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
		location.href="welcome.html";
	}		
}

	function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){
		$(ww).attr("style","border:red 1px solid;width:160px");
	};
	if(emp_name_in!=""){
		$(ww).attr("style","width:160px");
	};
}
/* 验证手机号格式 */
/* 	function showwcontactway(ww){
	var sfzz=/^1[34578]\d{9}$/;
	var emp_name_in = $(ww).val();	
	if(emp_name_in==null||emp_name_in==""||sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","width:160px");
	}else{
		$(ww).attr("style","border:red 1px solid;width:160px");
	}
	}; */
	
	function www(from){
      showw(from.name);
      showw(from.age);
      showw(from.telphone1);

      if( from.name.value=="" || from.name.value==null){
           return false;
      }
      if( from.age.value=="" || from.age.value==null){
           return false;
      }
       if( from.telphone1.value=="" || from.telphone1.value==null){
           return false;
      }
   
       return true;
    
    }




</script>
<script type="text/javascript">
	$(function() {
		$(".line").click();
	});
</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">修改补充咨询量</h1>
      <form action="teacher/consultTeacherAdda?employee_id=${loginUser.emp_id}&stutas=0"  method="post" onsubmit="return www(this)" enctype="multipart/form-data" id="women">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      <h5>咨询量跟踪进度</h5>
      
      <tr> 
      <td class="tdWidth">信息来源：</td>
      <td><select name="infoSourceName"  class="selectStyle" style="width:170px;"/>
                    
                  	<option value="${oaScbConsulter.infoSourceName }">${oaScbConsulter.infoSourceName }</option>
				  	 <c:if test="${InfosourceList !=null}">
						
						<c:forEach var="info" items="${InfosourceList}">
							<option <c:if test="${info.id == infoSource}">selected="selected"</c:if>value="${info.infoSource}">
								${info.infoSource}
							</option>
						</c:forEach>
				  </c:if>
                  </select>
               </td>
         <td style="text-align: right;">咨询方式：</td>
         <td> <select class="selectStyle" name="consultwayName" style="width:170px;">
                                <option value="${oaScbConsulter.consultwayName }">${oaScbConsulter.consultwayName }</option>
                                
                                <c:if test="${consultWayList !=null}">
						
						<c:forEach var="OaScbConsultway" items="${consultWayList}">
							<option <c:if test="${OaScbConsultway.id == consultWay}">selected="selected"</c:if>
							 value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
							</option>
						</c:forEach>
				  </c:if>
				  </select>
                   </td>
         <td style="text-align: right;">首次咨询日期：</td>
          <td><input type="date" class="dateStyle"  style="width:170px;"  value=${oaScbConsulter.firstConsultTimes }  /></td>
       </tr>
      <tr>
      	<td class="tdWidth">是否上门：</td>
      	<td><input type="radio"  value=1 name="come"  <c:if test="${oaScbConsulter.come==1 }"> checked="checked"</c:if>  class="radioStyle" />是&nbsp;&nbsp;&nbsp;&nbsp;
          	  <input type="radio"  value=2 name="come" <c:if test="${oaScbConsulter.come==2 }"> checked="checked"</c:if> class="radioStyle"/>否</td> 
       		
       	<td style="text-align: right;">首次上门日期：</td>
         <td><input type="date" class="dateStyle"  style="width:170px;" value=${oaScbConsulter.firstComeTimes } />
        
         </td>
        <td style="text-align: right;">全款日期：</td>
         <td><input type="date" class="dateStyle"  style="width:170px;" value=${oaScbConsulter.allMoneyTimes } /></td> 
       	 
      </tr>
      <tr>
       <td class="tdWidth">咨询量等级：</td>
       <td>
        <select class="selectStyle" name="rankName" style="width:170px;">
                                <option value="${oaScbConsulter.rankName }">${oaScbConsulter.rankName }</option>
                                <c:if test="${rankList !=null}">						
						<c:forEach var="ranktype" items="${rankList}">
							<option <c:if test="${ranktype.id == rank}">selected="selected"</c:if>
							 value="${ranktype.id}">${ranktype.rank}
							</option>
						</c:forEach>
				  		</c:if>
                      </select>
       
              </td>
       
        <td class="tdWidth">咨询量分类：</td>
        <td><%-- <select class="selectStyle" name="type" style="width:170px;">
              	  <option value="${oaScbConsulter.type }">${oaScbConsulter.type }</option>
                  <option value="1">常规</option>
                  <option value="2">市场</option>
                  
              </select> --%>
              ${oaScbConsulter.type==1?"常规":"市场" }</td>
      
      </tr>
      </table>
       <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      <h5>咨询量基本信息</h5>
        <tr>
          <td class="tdWidth"><span>*</span>姓名：</td>
          <td><input type="text" class="textStyle"  name="name" onblur="showw(this)"  style="width:170px;" value=${oaScbConsulter.name }  /></td>
          <td style="text-align: right;">性别：</td>
          <td><input type="radio"  value='1' name="sex"  <c:if test="${oaScbConsulter.sex==1}"> checked="checked" </c:if>  class="radioStyle"  />男&nbsp;&nbsp;&nbsp;&nbsp;
          	  <input type="radio"  value='2'  name="sex" <c:if test="${oaScbConsulter.sex==2}"> checked="checked" </c:if>  class="radioStyle" />女</td> 
          <td class="tdWidth">年龄：</td>
          <td><input type="number"  min="1" max="100"  name="age" class="textStyle" onblur="showw(this)" style="width:170px;"  value=${oaScbConsulter.age } /></td> 
        </tr>
        <tr>
           <td class="tdWidth"><span>*</span>联系方式：</td>
          	<td><input type="text" name="telphone1" onblur="showw(this)" class="textStyle" style="width:170px;" value=${oaScbConsulter.telphone1 } /></td>
            <td style="text-align: right;">紧急联系方式：</td>
            <td><input type="text" name="ungenTelphone" class="textStyle" style="width:170px;" value=${oaScbConsulter.ungenTelphone } /></td>
          <td class="tdWidth">学历：</td>
              <td> <select class="selectStyle" name="educationName" style="width:170px;">
                                <option value="${oaScbConsulter.educationName }">${oaScbConsulter.educationName }</option>
                                <c:if test="${EducationList !=null}">
						
							<c:forEach var="edu" items="${EducationList}">
							<option <c:if test="${edu.id == education}">selected="selected"</c:if>
							 value="${edu.id}">${edu.education}
							</option>
						</c:forEach>
				  </c:if>
                 </select>
              </td>

        </tr>

          <tr>
          <!-- colspan="3" -->
               <td class="tdWidth">QQ/微信：</td> 
               <td><input type="test" name="wechat"  class="textStyle" style="width:170px;" value=${oaScbConsulter.wechat } /></td>
                <td class="tdWidth">专业：</td> 
                  <td><input type="text" name="specialty" class="textStyle" style="width:170px;" value=${oaScbConsulter.specialty }  /></td>
               <td class="tdWidth" >地区：</td>
                <td>${oaScbConsulter.city }
                  

                </td>
          </tr>
          <tr>
          <td class="tdWidth">毕业院校：</td> 
          <td><input type="search"  class="searchStyle" name="schoolName" style="width:170px;" value=${oaScbConsulter.schoolName } /></td>
          	   <td class="tdWidth">状态：</td>
          	   <td>
          	   <select class="selectStyle" name="status" style="width:170px;">
                                <option value="${oaScbConsulter.status }">${oaScbConsulter.statusName }</option>
                               
                                <c:if test="${consultStatusList !=null}">
						
							<c:forEach var="consultStatus" items="${consultStatusList}">
							<option <c:if test="${consultStatus.id == status}">selected="selected"</c:if>
							 value="${consultStatus.id}">${consultStatus.status}
							</option>
							</c:forEach>
				 		 </c:if>
                                
                            </select>
          	   </td>
           	  <td class="tdWidth">关键词：</td>
          	  <td><input type="text" name="keywords" class="textStyle" style="width:170px;" value=${oaScbConsulter.keywords } /></td>
           </tr>        
        <tr>
           <td class="tdWidth">咨询课程：</td>
           <td><select class="selectStyle" name="consultLessonName" style="width:170px;">
                                <option value="${oaScbConsulter.consultLessonName }">${oaScbConsulter.consultLessonName }</option>
                                <c:if test="${consultLessonList !=null}">
						
						<c:forEach var="lesson" items="${consultLessonList}">
							<option <c:if test="${lesson.id == consultLesson}">selected="selected"</c:if>
							 value="${lesson.id}">${lesson.consultLesson}
							</option>
						</c:forEach>
				 	 </c:if>                                
                       </select></td>
           <td class="tdWidth">媒体名称：</td>
         	 <td><select class="selectStyle" name="mediaNames" style="width:170px;">
                <option value="${oaScbConsulter.mediaNames }">${oaScbConsulter.mediaNames }</option>
                       <c:if test="${mediaNameList !=null}">						
						<c:forEach var="media" items="${mediaNameList}">
							<option <c:if test="${media.id == mediaName}">selected="selected"</c:if>
							 value="${media.id}">${media.mediaName}
							</option>
						</c:forEach>
				 	 </c:if>   
             </select></td>      
        </tr>
          
        <table>
       		<tr>
         
 		  
		
       	</tr> 
      </table >
         

      </table>
      
      <input type="hidden" name="phoneticize" id="phoneticize" >
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="保存"  class="saveBotton" style="float: right;"/>
	  </div>
     </form> 

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>
