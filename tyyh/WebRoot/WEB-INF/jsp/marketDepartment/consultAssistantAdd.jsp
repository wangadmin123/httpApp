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
    <title>新增咨询量</title>

    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
    
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/pinying.js"></script>
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
        
        
        
/* 为空验证 */
$(function(){
		
	$("#btn").attr("disabled", true); 
	
	$("#btn").css("background-color","#BEBEBE");
});

function judgeNull(){

	var name=$("#name").val();
	var age=$("#age").val();
	var telphone1=$("#telphone1").val()
	
	var consultWay=$("#consultWay").find("option:selected").val();
	var firstConsultTimes=$("#firstConsultTimes").val();
	
	if(name!=""&&age!=""&&telphone1!=""&&consultWay!=0&&firstConsultTimes!=""){
		
		var str=name.trim();
		var phoneticize = makePy(str);
		$("#phoneticize").val(phoneticize);
		
		$("#btn").attr("disabled", false); 
		$("#btn").css("background-color","#00BB00");
	}	
	if(name==""||age==""||age==0||telphone1==""||consultWay==0||firstConsultTimes==""){
	$("#btn").attr("disabled", true); 
	$("#btn").css("background-color","#BEBEBE");
	}
	if(firstConsultTimes==""){
		$("#firstConsultTimes").attr("style","border:red 1px solid;width:160px");
	}else{
		$("#firstConsultTimes").attr("style","border:#CCCCCC 1px solid;width:160px");
	}
	
	
	if(name==""){
		
		$("#name").attr("style","border:red 1px solid;width:160px");
	}else{
		$("#name").attr("style","border:#CCCCCC 1px solid;width:160px");
	}
	
	if(age==""){
		$("#age").attr("style","border:red 1px solid;width:160px");
	}else{
		$("#age").attr("style","border:#CCCCCC 1px solid;width:160px");
	}
	
	if(telphone1==""){
		$("#telphone1").attr("style","border:red 1px solid;width:160px");
	}else{
		$("#telphone1").attr("style","border:#CCCCCC 1px solid;width:160px");
	}
}

    </script>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <h1 class="tabTitle">新增</h1>
       <form action="Consultway/consultAssistantAdd?employee_id=${loginUser.emp_id}" onsubmit="return yanzheng()" method="post" enctype="multipart/form-data">
           <input type="hidden" name="phoneticize" id="phoneticize" >
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                <h5>个人基本信息</h5>
				<tr>
                    <td class="tdWidth" style="width:250px;text-align:left;"><span>*</span>姓名：<input type="text" class="textStyle" style="width:160px; " onblur="judgeNull()" id="name" placeholder="请输入姓名" name="name" /></td>
                    <td class="tdWidth" colspan="2" style="text-align:left;">
                    <span>*</span>咨询方式：<select class="selectStyle" name="consultWay" onblur="judgeNull()" id="consultWay" >
                     <option value="0">--请选择--</option>
                    <c:if test="${consultwayLsit!=null}">	
						<c:forEach var="OaScbConsultway" items="${consultwayLsit}">
							<option 
							 value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
							</option>
						</c:forEach>
				  </c:if>
                </select>
                   	性别：<input type="radio" value="1" name="sex"  class="radioStyle" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2"  name="sex" class="radioStyle"/>女</td>
                    <td style="text-align:left;width:50px;"><span>*</span>年龄：<input type="number" name="age" min="1" max="100" onblur="judgeNull()"  id="age" class="textStyle" style="width:160px;"/></td>
              		<td><span>*</span>首次咨询时间:<input type="date" class="dateStyle" onblur="judgeNull()" name="firstConsultTimes" id="firstConsultTimes" /></td>
                
                </tr>
                
                <tr>
                    <td class="tdWidth" colspan="2" style="text-align:left;"><span>*</span>联系方式1：<input type="text" class="textStyle" style="width:160px;" onblur="judgeNull()" id="telphone1" name="telphone1"/>&nbsp;&nbsp;
                    	&nbsp;&nbsp;&nbsp;联系方式2：<input type="text" class="textStyle" style="width:160px;" name="telphone2" id="telphone2"  onblur="judgeNull()"  /><span id="telspan"></span></td>
                    <td style="text-align: right;">紧急联系方式：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" name="ungenTelphone" /></td>
                    
					<td></td>
                </tr>
                <tr>
      		<td class="tdWidth" colspan="3" style="text-align:left;">籍贯：<input type="text" class="textStyle"  style="width:560px;height: 30px;"></td>
      	</tr>
      	<tr>
                    <td class="tdWidth" style="text-align:left;width:300px;" colspan="2"><div>
                    	<table border="0" style="text-align:left;width:590px;">
                    		<tr>
                    		<td>现住址：</td>
                    			<td> <select name="province" class="selectStyle" id="province" style="width: 100px;"></select></td>
                    			<td> <select name="city" class="selectStyle" id="city" style="width: 87px;"></select></td>
                    			<td><select name="district" class="selectStyle" id="county" style="width: 170px;"></select></td>
                    			<td><input type="text" name="street" class="textStyle" placeholder="请输入街道" style="height: 30px;width:150px;"></td>
                    		</tr>
                    	</table>
                    </div>
                    <script language="javascript">
                        setup(); 
                    </script></td>
      	</tr>
                
            </table>
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                <h5>信息量基本信息</h5>
                
                
                <tr>
                
                	<td class="tdWidth">状态：</td>
                    <td><select class="selectStyle" name="status" style="width:170px;">
                    <option value="0">--请选择--</option>
                    
                    <c:if test="${consultStatusList !=null}">
						
						<c:forEach var="consultStatus" items="${consultStatusList}">
							<option <c:if test="${consultStatus.id == status}">selected="selected"</c:if>
							 value="${consultStatus.id}">${consultStatus.status}
							</option>
						</c:forEach>
				  </c:if>
                    
                
                </select></td>
                    <td class="tdWidth">信息来源：</td>
                    
                    <td><input type="text" list="url_list"  name="infoSource"  class="textStyle" style="width:160px;"/>
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
                  <td class="tdWidth">学历：</td>
                    <td><select class="selectStyle" name="education" style="width:170px;">
                       <option value="0">--请选择--</option>
                       <c:if test="${EducationList !=null}">
						
						<c:forEach var="edu" items="${EducationList}">
							<option <c:if test="${edu.id == education}">selected="selected"</c:if>
							 value="${edu.id}">${edu.education}
							</option>
						</c:forEach>
				  </c:if>
                       
                        
                    </select></td>   
                    
                    
                    
                    
                    
                    
                </tr>
                 <tr>
                     <td class="tdWidth">媒体名称：</td>
                     <td><select class="selectStyle" name="mediaName" style="width:170px;">
                         <option value="0">--请选择--</option>
                        
                        
                        <c:if test="${mediaNameList !=null}">
						
						<c:forEach var="media" items="${mediaNameList}">
							<option <c:if test="${media.id == mediaName}">selected="selected"</c:if>
							 value="${media.id}">${media.mediaName}
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
                
                
                 <td class="tdWidth">毕业院校：</td>
                    <td><input type="search" name="schoolName" class="searchStyle" style="width:170px;"/></td>
                
                
                
                 </tr>
                <tr>
                    <td class="tdWidth">班级：</td>
                    <td><input type="search"  class="searchStyle" name="schoolClass" style="width:170px;"/></td>
					  <td class="tdWidth">计算机专业：</td>
                    <td><input type="radio" value="1" name="computer"  class="radioStyle"/>是&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2"  name="computer" class="radioStyle"/>否</td>
                    <td class="tdWidth">专业：</td>
                    <td><input type="search"  class="searchStyle" name="educationName" style="width:170px;"/></td>

                  
					 
                        </div>

                        <script language="javascript">
                            setup();
                        </script>

                    </td>
                </tr>
                <tr>
                   
                    
                    <td class="tdWidth">关键词：</td>
                    <td><input type="text" name="keywords" class="textStyle" style="width:170px;" /></td>
               		<td class="tdWidth">分发咨询师：</td>
               		<td>
                            <select class="selectStyle" style="width:130px;" id="consultTeacher"  name="consultTeacher">
                                <option value="0">请选择</option>
                                <c:if test="${ConsultTeacherList !=null}">
									<c:forEach var="teacher" items="${ConsultTeacherList}">
										<option <c:if test="${teacher.emp_id == consultTeacher}">selected="selected"</c:if>
										 value="${teacher.emp_id}">${teacher.emp_name}
										</option>
									</c:forEach>
				  				</c:if>
                            </select>
            		  </td> 
                </tr>
                <table>
                    <td class="tdWidth">备注：</td>
                    <td><textarea name="comments"  cols="x"  rows="y"  style="width: 900px ;height: 150px; resize:none;"  ></textarea  ></td>
                </table>


            </table>
            <h2 class="tabTitle2">&nbsp;</h2>
            <div class="btposition1">
            	
                <input type="submit" value="提交" onclick="judgeNull()"   id="btn" class="saveBotton" style="float: right;"/>
            </div>
        </form>


    </div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>
