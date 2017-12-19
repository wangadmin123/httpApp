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
<script type="text/javascript" src="statics/common/js/sanji.js"></script>
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/pinying.js"></script>
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

$(function(){
         		$(".popupStyle").css("display","none");
    		});
function addLesson(select){
	if($(select).val()==-1){
		
		var mbHeight= $(document).height();
         var mbWidth=$(window).width();
         var delHeight=$(window).height();

         $(".mbStyle").css("height",mbHeight);
         $(".mbStyle").css("display","block");
		
         $(".popupStyle").css("left",mbWidth/2-250);
         $(".popupStyle").css("top",delHeight/2-102);
		
         $(".popupStyle").css("display","block");
          

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });	
	}	
	 	 
}
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

$(function(){
		
	$("#btn").attr("disabled", true); 
	
	$("#btn").css("background-color","#BEBEBE");
	$("#consultWay").change(function(){
	var str=$(this).val();
	if(str=="7"){
	$(".kbjsr").html("口碑介绍人：<input type='text' name='kbjsr' class='kbjsr'>");
	}else{
	$(".kbjsr").html("");
	
	}
	
	});
});

/*保存读秒结束*/
</script>

</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">新增咨询量</h1>
      <form action="director/addConnsulter.html?employee_id=${loginUser.emp_id}"  onsubmit="return yanzheng()" method="post" enctype="multipart/form-data">
      <input type="hidden" name="phoneticize" id="phoneticize" >
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
      <h5>咨询量基本信息</h5>
      
      	<tr>
                    <td class="tdWidth" style="width:250px;text-align:left;"><span>*</span>姓名：<input type="text" class="textStyle" style="width:160px; " onblur="judgeNull()" id="name" placeholder="请输入姓名" name="name" /></td>
                    <td class="tdWidth" colspan="2" style="text-align:left;">
                    <span>*</span>咨询方式：<select class="selectStyle" name="consultWay" onblur="judgeNull()" id="consultWay" style="width:170px;">
                     <option value="0">--请选择--</option>
                    <c:if test="${consultWayList!=null}">	
						<c:forEach var="OaScbConsultway" items="${consultWayList}">
							<option 
							 value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
							</option>
						</c:forEach>
				  </c:if>
                </select>                   	性别：<input type="radio" value="1" name="sex"  class="radioStyle" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2"  name="sex" class="radioStyle"/>女</td>
                    <td style="text-align:left;width:50px;" colspan="2"><span>*</span>年龄：<input type="number" name="age" min="1" max="100" onblur="judgeNull()"  id="age" class="textStyle" style="width:160px;"/></td>
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
      	<%-- <tr>
      	<td class="tdWidth" colspan="3" style="text-align:left;" id="yxbox">
      	<span>*</span>质询等级：
      	 <select class="selectStyle" style="width:130px;" onblur="judgeNull()" name="rank" id="rank">
                                <option value="0">请选择</option>
                                <c:if test="${rankList !=null}">
									<c:forEach var="ranktype" items="${rankList}">
										<option <c:if test="${ranktype.id == rank}">selected="selected"</c:if>
										 value="${ranktype.id}">${ranktype.rank}
										</option>
									</c:forEach>
				  				</c:if>
      	</td></tr> --%>
      	
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
      	<h5>咨询量咨询信息</h5>
        <tr>
          	  <td class="tdWidth">状态：</td>
            	<td>
              	<select class="selectStyle" style="width:170px;" name="status">
               	  <option value="0">--请选择--</option>                  
                  <c:if test="${consultStatusList !=null}">
					<c:forEach var="consultStatus" items="${consultStatusList}">
						<option <c:if test="${consultStatus.id == status}">selected="selected"</c:if>
							 value="${consultStatus.id}">${consultStatus.status}
						</option>
					</c:forEach>
				  </c:if>
              	</select>
            </td>
            <td class="tdWidth">咨询量分类：</td>
            	<td>
                    <select class="selectStyle" style="width:130px;" name="type">
                        <option value="0">--请选择--</option>
                        <option value="1">常规</option>
                        <option value="2">市场</option>
                    </select>
             </td>
           
              <td class="tdWidth">QQ/微信：</td>
              <td><input type="test"  class="textStyle" style="width:160px;" name="wechat"/></td>
             
        </tr>
        <tr>
             <td class="tdWidth">毕业院校：</td>
              <td><input type="search" name="schoolName" class="searchStyle" style="width:170px;"/></td>
            <td class="tdWidth">相关专业：</td>
          	<td><input type="radio" value="1" name="computer"  class="radioStyle" checked="checked"/>是&nbsp;&nbsp;&nbsp;&nbsp;  
          	<input type="radio" value="2"  name="computer" class="radioStyle"/>否</td> 
            <td class="tdWidth">专业：</td> 
           	<td><input type="text" class="textStyle" style="width:160px;" name="specialty"/></td>
           	
        </tr>
        <tr>
        	<td class="tdWidth">咨询课程：</td>
           	<td>
           		<select class="selectStyle" style="width:170px;" name="consultLesson" onchange="addLesson(this)">
               	  <option value="0">--请选择--</option>
                  <c:if test="${consultLessonList !=null}">
						<c:forEach var="lesson" items="${consultLessonList}">
							<option <c:if test="${lesson.id == consultLesson}">selected="selected"</c:if>
							 	value="${lesson.id}">${lesson.consultLesson}
							</option>
						</c:forEach>
				  </c:if>
				  	
               </select>
             </td>  
           <td class="tdWidth">关键词：</td>
           <td><input type="text" class="textStyle" style="width:160px;" name="keywords"/></td>
           <td class="tdWidth">媒体名称：</td>
           <td><select class="selectStyle" style="width:170px;" name="mediaName">
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
           
        </tr>
        <tr>
        	<td class="tdWidth">信息来源：</td>
	              	<td><input type="text" list="url_list"  class="searchStyle" style="width:160px;" name="infoSource"/>
	                    <datalist id="url_list">
					    
					    <c:if test="${InfosourceList !=null}">
						
							<c:forEach var="info" items="${InfosourceList}">
								<option <c:if test="${info.infoSource == infoSource}">selected="selected"</c:if>value="${info.infoSource}">
									${info.infoSource}
								</option>
							</c:forEach>
					    
					    </c:if>
                  		
                  		</datalist>
              	 	</td>
        	<td class="tdWidth">学历：</td>
              <td><select class="selectStyle" style="width:170px;" name="education">
              	  <option value="0">--请选择--</option>
                  <c:if test="${EducationList !=null}">
						<c:forEach var="edu" items="${EducationList}">
							<option <c:if test="${edu.id == education}">selected="selected"</c:if>
							 value="${edu.id}">${edu.education}
							</option>
						</c:forEach>
				  </c:if>
              	</select>
            </td>
        		
        
        	<td class="tdWidth" >分配咨询师：</td>
           <td>
          		<select  class="selectStyle" style="width:170px;" name="consultTeacher">
		          <option value="0">--请选择--</option>
		             <c:if test="${empList !=null}">
						<c:forEach var="teacher" items="${empList}">
							<option <c:if test="${teacher.emp_id == consultTeacher}">selected="selected"</c:if>
							 value="${teacher.emp_id}">${teacher.emp_name}
							</option>
						</c:forEach>
				  	 </c:if>
		         </select>	
           </td>  
        
        </tr>
         <tr>
  			<table>
  				<tr>
  					<td class="tdWidth">备注：</td>
          			<td class="tdWidth">
          				<textarea name="comments"  cols="x"  rows="y"  style="width: 900px ;height: 150px;margin-left: -15px; resize:none; " ></textarea  >
          			</td>
  				</tr>
       		</table>
        </tr>  
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1" style="float:right;">
	    <input type="submit" id="btn"  value="保存" onclick="judgeNull()" class="saveBotton" />
	  </div>
      </form> 

   
</div>
</div>


<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>
