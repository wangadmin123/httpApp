<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="en">

<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>编辑咨询量</title>

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
		location.href="welcome.html";
	}		
}
/*保存读秒结束*/
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">编辑咨询量</h1>
      <form action="Consultway/ReviseQD?employee_id=${loginUser.emp_id}" method="post" >
       <input type="hidden" name="id" id="id" value="${consulter.id}">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      <h2>咨询量跟踪进度</h2>
      
      <tr>
      	 <td class="tdWidth">信息来源：</td>
                    <td><input type="text" list="url_list"  name="infoSource" value="${consulter.infoSource}" class="textStyle" style="width:160px;"/>
                    <datalist id="url_list" >
                  	<option >--请选择--</option>
				  	<c:if test="${InfosourceList !=null}">
						<c:forEach var="info" items="${InfosourceList}">
							<option value="${info.infoSource}">	
							</option>
						</c:forEach>
				  	</c:if>
                  </datalist >
           </td>
          <td class="tdWidth">咨询方式：</td>
             <td><select class="selectStyle" name="consultWay"  style="width:170px;">
                     <option value="0">--请选择--</option>
                    <c:if test="${consultwayLsit!=null}">	
						<c:forEach var="OaScbConsultway" items="${consultwayLsit}">
							<option <c:if test="${OaScbConsultway.id == consultWay}">selected="selected"</c:if>
							 value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
							</option>
						</c:forEach>
				  </c:if>
                </select>
          </td>
          <td class="tdWidth">咨询量分类：</td><td><select class="selectStyle" name="type" style="width:170px;">
              	  <option value="0">请选择</option>
                  <option <c:if test="${type==1}">selected="selected"</c:if> value="1">常规</option>
                  <option <c:if test="${type==2}">selected="selected"</c:if> value="2">市场</option>
              </select>
        </td>
      
         </tr>
      <tr>
       <td class="tdWidth">咨询量等级：</td>
              	   <td><select class="selectStyle" name="rank" style="width:170px;">
                     <option value="0">请选择</option>
                    <c:if test="${RanktypeList !=null}">	
						<c:forEach var="OaScbrankName" items="${RanktypeList}">
							<option <c:if test="${OaScbrankName.id == rank}">selected="selected"</c:if>
							 value="${OaScbrankName.id}">${OaScbrankName.rank}
							</option>
						</c:forEach>
				  </c:if>
                </select>
          </td>
      <td class="tdWidth">首次咨询日期：</td>
          <td><input type="date" class="dateStyle" value="${consulter.firstConsultTimes}" name="firstConsultTimes" style="width:160px;"/></td>
  
      	<td class="tdWidth">首次上门日期：</td>
         <td><input type="date" class="dateStyle" value="${consulter.firstComeTimes}" name="firstComeTimes" style="width:160px;"/></td>
               	
      </tr>
     
      </table>
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      <h2>咨询量基本信息</h2>
        <tr>
          <td class="tdWidth"><span>*</span>姓名：</td>
          <td ><input type="text" class="textStyle" name="name" style="width:160px;" value="${name}" placeholder="请输入姓名"  /></td>
          <td class="tdWidth"  >性别：</td>
          <td ><input type="radio"  value=1 name="sex"  <c:if test="${sex==1}">checked="checked"</c:if>  class="radioStyle" />男&nbsp;&nbsp;&nbsp;&nbsp;
          	  <input type="radio"  value=2  name="sex" <c:if test="${sex==2}">checked="checked"</c:if> class="radioStyle"/>女</td> 
          <td class="tdWidth">年龄：</td>
          <td ><input type="number"  min="1" max="100" name="age" value="${consulter.age}"  class="textStyle" style="width:160px;"/></td> 
        </tr>
        <tr>
           <td class="tdWidth"><span>*</span>联系方式：</td>
          	<td ><input type="text" name="telphone1" class="textStyle" value="${consulter.telphone1}" style="width:160px;" /></td>
           <td class="tdWidth"><span>*</span>紧急联系人：</td>
            <td><input type="text" name="urgentTelpeople" class="textStyle" value="${consulter.urgentTelpeople}" style="width:160px;" /></td>
            <td class="tdWidth"><span>*</span>紧急联系方式：</td>
            <td><input type="text" name="ungenTelphone" class="textStyle" value="${consulter.ungenTelphone}" style="width:160px;" /></td>
          
        </tr>

          <tr>
          		<!-- <td class="tdWidth">咨询者姓名：</td>
          		<td><input type="text" class="textStyle" style="width:160px;" /></td> -->
                 <td class="tdWidth">QQ/微信：</td>
                 <td><input type="test"  name="wechat" value="${consulter.wechat}" class="textStyle" style="width:160px;"/></td>
                 <td class="tdWidth">学历：</td>
             	 <td><select class="selectStyle"  name="education" style="width:170px;">
                     <option value="0">请选择</option>
                    <c:if test="${EducationList !=null}">	
						<c:forEach var="OaScbEducation" items="${EducationList}">
								<option <c:if test="${OaScbEducation.id == education}">selected="selected"</c:if>
									 value="${OaScbEducation.id}">${OaScbEducation.education}
								</option>
							</c:forEach>
				 		 </c:if>
                	</select>
        		</td>
                  
                  <td class="tdWidth">毕业院校：</td>
                  <td><input type="search"  name="schoolName" value="${consulter.schoolName}" class="searchStyle" style="width:170px;"/></td>
                  
             
          </tr>
          <tr>
      		<td class="tdWidth">籍贯：</td>
      		<td class="tdWidth" colspan="2"><input type="text" value="${consulter.place}" class="textStyle" name="place" style="width:560px;height: 30px;"></td>
      	</tr>
      	<tr>
      		<td class="tdWidth" >现住址：</td>
                <td class="tdWidth" colspan="3">
                    <div>
                    	<table border="0">
                    		<tr>
                    			<td> <select name="province" class="selectStyle" id="province" style="width: 100px;"></select></td>
                    			<td> <select name="city" class="selectStyle" id="city" style="width: 87px;"></select></td>
                    			<td><select name="district" class="selectStyle" id="county" style="width: 170px;"></select></td>
                    			<td><input type="text" name="street" class="textStyle" placeholder="请输入街道" style="height: 30px;" value="${consulter.street}" ></td>
                    		</tr>
                    		<tr>
                    			<%
                    			OaScbConsulter consulters=(OaScbConsulter)request.getAttribute("consulter");
                    			
                    		 %>
                      			
                    			<td> <input type="text" readonly="readonly"  class="selectStyle" style="width: 100px;" value="<%=consulters.getProvince()%>"/></td>
                    			<td> <input type="text"  readonly="readonly"  class="selectStyle" style="width: 87px;" value="<%=consulters.getCity()%>"></select></td>
                    			<td><input type="text"  readonly="readonly"  class="selectStyle" style="width: 170px;" value="<%=consulters.getDistrict()%>"></select></td>
                    			<td><input type="text"  readonly="readonly" placeholder="请输入街道"  class="textStyle" style="height: 30px;" value="<%=consulters.getStreet()%>" ></td>
                    		
                    		</tr>
                    	</table>
                    </div>
                    <script language="javascript">
                        setup(); 
                    </script>
                </td>
      	</tr>
          
          <tr>
            <td class="tdWidth">专业：</td> 
            <td><input type="text" name="specialty" value="${consulter.specialty}" class="textStyle" style="width:160px;" /></td>
          
            <td class="tdWidth">状态：</td>
            	<td><select class="selectStyle" name="status" style="width:170px;">
                    <option value="0">请选择</option>
                    
                    <c:if test="${consultStatusList !=null}">
						
						<c:forEach var="consultStatus" items="${consultStatusList}">
							<option <c:if test="${consultStatus.id == status}">selected="selected"</c:if>
							 value="${consultStatus.id}">${consultStatus.status}
							</option>
						</c:forEach>
				  </c:if>
                </select>
              </td>
                <td class="tdWidth">咨询课程：</td>
                      <td><select name="consultLesson" class="selectStyle" style="width:170px;">
                     <option value="0">--请选择--</option>
                 	  <c:if test="${SpecialtyList !=null}">
						
						<c:forEach var="lesson" items="${SpecialtyList}">
							<option <c:if test="${lesson.id == consultLesson}">selected="selected"</c:if>
							 value="${lesson.id}">${lesson.consultLesson}
							</option>
						</c:forEach>
					  </c:if>
	                </select>
	                </td>
         </tr>
        <tr>
               <td class="tdWidth">关键词：</td>
          	  <td><input type="text" class="textStyle" value="${consulter.keywords}" name="keywords" style="width:160px;" /></td>
              
             <td class="tdWidth">本次回访时间：</td> 
             <td><input type="date" class="dateStyle" name="returnvisitTimes"  style="width:160px;"/></td> 
          <td class="tdWidth">下次回访时间：</td> 
             <td><input type="date" class="dateStyle" name="nextvisitTimes" style="width:160px;"/></td> 
                
        </tr>
         <tr>
         <td class="tdWidth">媒体名称：</td>
          <td><select class="selectStyle" name="mediaName" style="width:170px;">
                         <option value="0">请选择</option>
                        <c:if test="${mediaNameList !=null}">
						<c:forEach var="media" items="${mediaNameList}">
							<option <c:if test="${media.id == mediaName}">selected="selected"</c:if>
							 value="${media.id}">${media.mediaName}
							</option>
					  </c:forEach>
				 	</c:if> 
                 </select>
             </td>
               <td class="tdWidth">咨询师：</td>
	               <td><select class="selectStyle" name="consultTeacher" style="width:160px;">
	                    	<option value="0">--请选择--</option>
	                  			
	                  			<c:if test="${employeesList !=null}">
										
									<c:forEach var="lesson" items="${employeesList}">
										
										<option 
											value="${lesson.emp_id}" <c:if test="${lesson.emp_name==consulter.consultTeacherName}">selected="selected"</c:if>>${lesson.emp_name}										
										</option>
									</c:forEach>
					  			 
					  			</c:if>
	                	</select>
	                </td>
                    
           
        	       	
        </tr>  
        <table>
      <!--  <tr>
         
  		<td class="tdWidth">回访记录：</td>
          <td><textarea name="comments"   cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none; " ></textarea  ></td>
		
       </tr>  -->
      </table >

      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="submit" value="保存" class="saveBotton"  style="float: right;"/>
	  </div>
     </form> 

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>
