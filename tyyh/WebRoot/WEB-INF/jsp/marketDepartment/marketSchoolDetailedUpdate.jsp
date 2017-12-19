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
    <title>详细信息</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
    
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/noe-show.css">
    
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/js/pinying.js"></script>
    <style type="text/css">
    	.gnmk1{  margin: 15px 15px; cursor: pointer; text-align:center;
	display: block; width: auto; height:40px; line-height:40px; color:#606060;
	border-radius: 2px; border:1px solid #CCCCCC; padding:5px 35px; position: relative;
background-image: url("statics/common/images/nav.png"); background-position: 10px 15px; background-repeat: no-repeat;}

.gnmk1:hover{background: #f9f9f9;background-image: url("statics/common/images/nav.png"); background-position: 10px 15px; background-repeat: no-repeat;}
    	
    </style>
    <script type="text/javascript">

       function showAllInfo(id) {
       		
       		var temp = "id="+id;
       		
       		$.post("market/showspeciaInfo",temp,showMajorPeopele,"json");
		}
     
     	function showMajorPeopele(data) {
			var oaScbMajorinfo = data.oaScbMajorinfo;
			var personInfo = data.personList;
			var teacherInfo = data.teacherList;
			
			showInfo(oaScbMajorinfo,personInfo,teacherInfo);
		}
     
     	function showInfo(oaScbMajorinfo,personInfo,teacherInfo){
     		$("#schoolinfoAll").css("display","none");
     		$("#abc").css("display","block");
     		$("#majorName").empty();
     		$("#majorThing").empty();
			$("#majorName").html("<h2 style='display:inline;'>专业名称："+oaScbMajorinfo.specialtyName+"</h2>	<input type='button' value='修改' class='saveBotton' > ");
			var specialtySituation =oaScbMajorinfo.specialtySituation==null || oaScbMajorinfo.specialtySituation=='' ?"未知":oaScbMajorinfo.specialtySituation;
    		var specialtyPeoplenNumber =oaScbMajorinfo.specialtyPeoplenNumber==null || oaScbMajorinfo.specialtyPeoplenNumber==''?"暂无":oaScbMajorinfo.specialtyPeoplenNumber;
    		var classNumber =oaScbMajorinfo.classNumber==null || oaScbMajorinfo.classNumber=='' ?"暂无":oaScbMajorinfo.classNumber;
    		var developDirection =oaScbMajorinfo.developDirection==null || oaScbMajorinfo.developDirection=='' ?"未知":oaScbMajorinfo.developDirection;
    		var studySituation =oaScbMajorinfo.studySituation==null || oaScbMajorinfo.studySituation== '' ?"未知":oaScbMajorinfo.studySituation;
    		var specialtyComments =oaScbMajorinfo.specialtyComments==null || oaScbMajorinfo.specialtyComments=='' ?"未知":oaScbMajorinfo.specialtyComments; 
			$("#majorThing").append("<tr><td class='tdWidth'>专业情况：</td><td>"+specialtySituation+"</td>"
    								+"<td class='tdWidth'>人数：</td><td>"+specialtyPeoplenNumber+"</td>"
    								+"<td class='tdWidth'>班级数量：</td><td>"+classNumber+"</td>"
    								+"</tr><tr><td class='tdWidth'>发展方向：</td><td>"+developDirection+"</td>"
    								+"<td class='tdWidth'>现阶段学习情况：</td><td>"+studySituation+"</td>"
    								+"<td class='tdWidth'>备注：</td><td>"+specialtyComments+"</td>"
    								+"</tr>");
			
			$("#majortitle").empty();
    		$("#majortitle").append("<tr><td colspan='6'><h3>院系主要负责人</h3></td></tr>");
			
			
			$("#majorPersonInfo").empty();
			
			if(personInfo.length==0){
    			$("#majorPersonInfo").html("<tr><td colspan='6'>暂无系主任</td></tr>");
    		
    		}else{
    		
    			for( var i = 0; i < personInfo.length; i++){
    			
    		 		var sex = personInfo[i].sex ==1?"男":"女";
    		 		var Name =personInfo[i].name==null?"未知":personInfo[i].name;     		 		
    		 		var directorClass =personInfo[i].directorClass==null || personInfo[i].directorClass ==''? "未知":personInfo[i].directorClass;
    		 		var comments =personInfo[i].comments==null ?"":personInfo[i].comments;
    		 		$("#majorPersonInfo").append("<tr><td class='tdWidth'>系主任/书记：</td><td>"+Name+"</td>"
    		 		+"<td class='tdWidth'>负责班级：</td><td>"+directorClass+"</td><td class='tdWidth'>性别：</td>"
    		 		+"<td>"+sex+"</td></tr><tr>"
    		 		+"<td class='tdWidth'>备注：</td>"
    		 		+"<td colspan='5'>"+comments+"</td></tr>");
    		 	
    		 	}
    		}						
    			
    		$("#majorteacherInfo").empty();
    		if(teacherInfo.length==0){
    			$("#majorteacherInfo").html("<tr><td colspan='6'>暂无班主任</td></tr>");
    		}else{
    		
    			for( var i = 0; i < teacherInfo.length; i++){
    			
    		 		 var sex = teacherInfo[i].Sex ==1?"男":"女";
    		 		var Name =teacherInfo[i].name==null?"未知":teacherInfo[i].name;
    		 		
    		 		var teacherClass =teacherInfo[i].teacherClass==null ||teacherInfo[i].teacherClass==''?  "未知":teacherInfo[i].teacherClass;

    		 		var comments =teacherInfo[i].comments==null?"未知":teacherInfo[i].comments;
    		 		$("#majorteacherInfo").append(
    		 				"<tr><td class='tdWidth'>班主任：</td><td>"+Name+"</td>"
    		 				+"<td class='tdWidth'>负责班级：</td><td>"+teacherClass+"</td><td class='tdWidth'>性别：</td>"
    		 				+"<td>"+sex+"</td></tr><tr>"
    		 				+"<td class='tdWidth'>备注：</td>"
    		 				+"<td colspan='5'>"+comments+"</td></tr>"); 
					
    		 	}
    		} 
    		
    		
    		
    	}					

		function showschoolHezuo(){
			$("#abc").css("display","none");
			$("#schoolinfoAll").css("display","block");
		}


		function goback(){
			window.location.href="market/amarketSchoolShow";
		}

		$(function(){
			$("#abc").css("display","none");
			$("#schoolinfoAll").css("display","none");
		
		});
       
    </script> 
</head>
<body>
<div class="rightContent">
	<h3 style="text-align: center;">${oaSchoolinfo.schoolName }</h3>
   	<div class="contentConfig"  style="width:80%;margin: auto; ">
   		<div class="gn_nav">
   		<div class="gnmk1" onclick="showschoolHezuo()">
						院校合作
			</div>
	   		<c:forEach var="majors" items="${majorList}">
							<div value=${majors.id } class="gnmk1" onclick="showAllInfo(${majors.id})">
								 ${majors.specialtyName}
							</div>
			</c:forEach>
			
			
   		</div>
   	</div>
   	
   <div id="abc">
   		<table cellpadding="0" cellspacing="0" border="1" class="addTable">
   			<tr>
   				<td id="majorName" colspan="6"></td>	
   			</tr>
   			<tbody id="majorThing">
   			
   			
   			</tbody>
   			<tbody id="majortitle">
              		
              	
             </tbody>
   			<tbody id="majorPersonInfo">
                	
                
            </tbody>

            <tbody id="majorteacherInfo">
                	
                
            </tbody>
   		</table>
   
   
   
   </div>

	<div align="center" id="schoolinfoAll">
                <div id="timePlan">
                    <h4 align="center">院校时间安排</h4>
                    <textarea name="showText"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none; "  disabled="disabled"  >${oaSchoolinfo.schoolTimePlan }</textarea  >
                </div>
                <div id="opptSituation">

                    <h4 align="center">竞争对手情况</h4>
                    <textarea name="showText"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none;"  disabled="disabled">${oaSchoolinfo.opptSituation }</textarea  >

                </div>
                <div id="schoolsSchedule">
                    <h4 align="center">院校合作进度</h4>
                    <textarea name="showText"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none;" disabled="disabled"  >${oaSchoolinfo.schoolsSchedule }</textarea  >
                </div>
                <div id="pushingSchedule">
                    <h4 align="center">地推合作进度</h4>
                    <textarea name="showText"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none;" disabled="disabled"  >${oaSchoolinfo.pushingSchedule }</textarea  ></td>
                </div>
                <div id="studentsSituation">
                    <h4 align="center">学生会情况</h4>
                    <textarea name="showText"  cols="x"  rows="y"  style="width: 1000px ;height: 150px; resize:none;"  disabled="disabled">${oaSchoolinfo.studentsSituation }</textarea  ></td>
                </div>
            </div>
	</div>




	<div>
		<input type="button" value="返回" class="saveBotton" style="float: right;" onclick="goback()">
	</div>
      	
    

</body>
</html>
