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
    <title>添加</title>
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
    <script type="text/javascript">

        /*确定保存弹出框的位置*/
        /* $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".saveStyle").css("left",saveWidth/2-130);
            $(".saveStyle").css("top",saveHeight/2-40);

        });

        /*保存读秒*/
       /*  var miao;
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
                location.href="market/market";
            }
        }  */
        /*保存读秒结束*/
        
       /*  新增院校 */
       
       function addSchool(){
       

						var schoolName = $("#reschoolName").val();
						var schoolAddress = $("#reschoolAddress").val();

						if(schoolName ==null  || schoolName == ""){
							
					    alert("院校名称不可为空！");
						}else if(schoolAddress ==null  || schoolAddress == ""){
							
							alert("院校地址不可为空!");
						}else{
				      
					var temp = $("#school").serialize();
         				$.post("market/marketSchoolInfoAdd",temp,showInfo,"text");
						  if(confirm('您好,保存成功!点击确定继续完善信息,点击取消返回上一级菜单')==true){
                               return false;
                            }
                          location.href='market/marketWelcome';
						}	
             	}
       	function showInfo(data){
            	 $("#conserve-school").css("display","none");
                 $(".searchBotton-school").css("display","block");       
        } 
       	function schoolNextStep() {
			 $(".school").css("display","none");
             $(".specialty").css("display","block");
             $("#conserve-specialty").css("display","block");
             $("#reconserve-specialty").css("display","none");
             /* $("#searchBotton-specialty").css("display","none");
             $("#add-specialty").css("display","none");  */
             $("#aaa").css("display","none");
		}
		function addMajor() {
				var specialtyName = $("#specialtyName").val();
				var classes = $("#classes").val();

				if(specialtyName ==null  || specialtyName == ""){
							
					alert("专业名称不可为空！");
				}else if(classes ==null  || classes == ""){
							
					alert("班级数量不可为空!");
				}else{
				
					var temp = $("#MajorInfo").serialize();
            		$.post("market/marketMajorInfoAdd",temp,specialty,"text");
				} 
		
		}
        function specialty() {
			 $("#conserve-specialty").css("display","none");
             $("#reconserve-specialty").css("display","none");
            /*  $("#searchBotton-specialty").css("display","block");
             $("#add-specialty").css("display","block");  */
             $("#aaa").css("display","block");
		}
		
		function continueAddMajor(){
			document.getElementById("specialtyName").value="";
            document.getElementById("peoples").value="";
            document.getElementById("classes").value="";
            document.getElementById("developDirection").value="";
            document.getElementById("specialtyComments").value="";
            document.getElementById("specialtyinfo").value="";
            document.getElementById("nowstudy").value="";
            
			$("#reconserve-specialty").css("display","block");
            /* $("#searchBotton-specialty").css("display","none");
            $("#add-specialty").css("display","none");  */
            $("#aaa").css("display","none");
     
		}
		
		
        function reAddMajor() {
        		var specialtyName = $("#specialtyName").val();
				var classes = $("#classes").val();

				if(specialtyName ==null  || specialtyName == ""){
							
					alert("专业名称不可为空！");
				}else if(classes ==null  || classes == ""){
							
					alert("班级数量不可为空!");
				}else{
					var temp = $("#MajorInfo").serialize();
			 		$.post("market/remarketMajorInfoAdd",temp,specialty,"text");
				}

		}
          	
        function nextAddPerson() {
			 $.post("market/getMajor",getMajor,"json"); 
			 $(".specialty").css("display","none");
             $(".responsible").css("display","block");
             $("#conserve-responsible").css("display","block");
             $("#reconserve-responsible").css("display","none");
            /*  $("#add-responsible").css("display","none");
             $(".searchBotton-responsible").css("display","none"); */
             $("#bbb").css("display","none");
		}
		
		function getMajor(data){
			
			
			
			var str = "<td class='tdWidth'><span>*</span>选择专业</td><td><select class='selectStyle' style='width:130px;' name='specialtId' id='abc'>"
									+"<option value='0' >请选择</option>";
			
			if(data.length!=0){
				for(var i =0;i<data.length;i++){
					str+=("<option value='"+data[i].id+"'>"+data[i].specialtyName+"</option>");
				} 
				
			}
			str+=("</select></td>");
			$("#majorList").html(str);
		}
		
		function addMajorPerson() {
		
			var abc = $("#abc").val();
			var responsibleName = $("#responsibleName").val();
			if(abc==0){
				alert("请选择专业");
			}else if(responsibleName ==null || responsibleName ==""){
				alert("请输入负责人名称");
			}else{
				var temp = $("#MajorPerson").serialize();
           	 	$.post("market/marketMajorPersonInfoAdd",temp,MajorPerson,"text"); 
			}
		
			
		}
		function MajorPerson() {
			 $("#conserve-responsible").css("display","none");
             $("#reconserve-responsible").css("display","none");
            /*  $("#add-responsible").css("display","block");
             $(".searchBotton-responsible").css("display","block");  */
              $("#bbb").css("display","block");
		}
		
		function continueAddPerson(){
				
			document.getElementById("responsibleName").value="";
            document.getElementById("responsibleClass").value="";
            document.getElementById("responsibleComments").value="";
            document.getElementById("abc")[0].selected=true;
            
			$("#conserve-responsible").css("display","none");
            $("#reconserve-responsible").css("display","block");
           /*  $("#add-responsible").css("display","none");
            $(".searchBotton-responsible").css("display","none");  */
            $("#bbb").css("display","none");
		
		}
		
		
		function reAddPerson() {
			var abc = $("#abc").val();
			var responsibleName = $("#responsibleName").val();
			if(abc==0){
				alert("请选择专业");
			}else if(responsibleName ==null || responsibleName ==""){
				alert("请输入负责人名称");
			}else{
				var temp = $("#MajorPerson").serialize();
				$.post("market/marketMajorPersonInfoAdd",temp,MajorPerson,"text");
			}
			
		}
         
        function nextStepPerson() {
        	$.post("market/getMajor",getMajorTeacher,"json"); 
            $(".responsible").css("display","none");
            $(".teacher").css("display","block");
            $("#conserve-teacher").css("display","block");
            $("#reconserve-teacher").css("display","none");
            /* $("#add-teacher").css("display","none");
            $(".searchBotton-time").css("display","none"); */  
            $("#ccc").css("display","none");
         }
         function getMajorTeacher(data){
         	var str = "<td class='tdWidth'><span>*</span>选择专业</td><td><select class='selectStyle' style='width:130px;' name='specialtId' id='efg'>"
									+"<option value='0' id='efg'>请选择</option>";
			
			if(data.length!=0){
				for(var i =0;i<data.length;i++){
					str+=("<option value='"+data[i].id+"'>"+data[i].specialtyName+"</option>");
				} 
				
			}
			str+=("</select></td>");
			$("#majorListTeacher").html(str);
         }
         
         function addMajorTeacher(){
         	var efg = $("#efg").val();
			var teacher = $("#teacher").val();
			var teaclass = $("#teaclass").val();
			if(efg==0){
				alert("请选择专业");
			}else if(teacher ==null || teacher ==""){
				alert("请输入负责人名称");
			}else if(teaclass ==null || teaclass==""){
				alert("请输入负责班级");
			}else{
				var temp = $("#MajorTeacher").serialize();
            	$.post("market/marketMajorTeacherInfoAdd",temp,majorteacher,"text");
			
         }
         }
         function majorteacher(){
         	$("#conserve-teacher").css("display","none");
            $("#reconserve-teacher").css("display","none");
           /*  $("#add-teacher").css("display","block");
            $(".searchBotton-time").css("display","block");  */
             $("#ccc").css("display","block");
         }
         
         function continueAddTeacher(){
         	document.getElementById("teacher").value="";
            document.getElementById("teaclass").value="";
            document.getElementById("teachercomments").value=""; 
            document.getElementById("efg")[0].selected=true;
            $("#conserve-teacher").css("display","none");
            $("#reconserve-teacher").css("display","block");
           /*  $("#add-teacher").css("display","none");
            $(".searchBotton-time").css("display","none");  */
            $("#ccc").css("display","none");
         }
         
         function reAddTeacher(){
         	var efg = $("#efg").val();
			var teacher = $("#teacher").val();
			var teaclass = $("#teaclass").val();
			if(efg==0){
				alert("请选择专业");
			}else if(teacher ==null || teacher ==""){
				alert("请输入负责人名称");
			}else if(teaclass ==null || teaclass==""){
				alert("请输入负责班级");
			}else{
				var temp = $("#MajorTeacher").serialize();
            	$.post("market/marketMajorTeacherInfoAdd",temp,majorteacher,"text");
			}
         }
         
         function nextStepTeacher(){
            $(".teacher").css("display","none");
            $(".timeplan").css("display","block");  
         }
         
         function cancel() {
			 $.post("market/cancelOperate",cancelReturn,"text");
		}
		
		function cancelReturn(data) {
		
			$(".timeplan").css("display","none"); 
			$(".school").css("display","block");
			document.getElementById("reschoolName").value="";
			document.getElementById("reschoolAddress").value="";
			
		}
 
        /* 验证是否为空 */
	function showw(ww){
	var emp_name_in = $(ww).val();
	
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	if(emp_name_in!=""){$(ww).attr("style","width:160px");};
	}
	
	function showw1(ww){
	var emp_name_in = $(ww).val();
	
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:560px");};
	if(emp_name_in!=""){$(ww).attr("style","width:560px");};
	}
        
       
       	 
/* 查询新增院校信息量 */
function showyuanadd(index){

	if(index==1){
	window.location.href="market/amarketSchoolAdd";
	}else{
	window.location.href="market/amarketSchoolShow";
	}
}
 
 
 var str=name.trim();
		var phoneticize = makePy(str);
		$("#phoneticize").val(phoneticize);
       	 
    </script>
</head>
<body>
<div class="rightContent">
	<div class="tabs" id="tabs"  >
	<span class="spanHover"  onclick="showyuanadd(1)">添加院校信息</span>
      <span class="spanOut" id="spanLast"  onclick="showyuanadd(2)">查询院校信息量</span>
      
      
  	</div>
    <!-- <div class="tabContent"> -->
    
    <!-- <form action="market/marketSchoolAdd.html" method="post" enctype="multipart/form-data"> -->
    
    	<!-- 新增院校 -->
    	<div class="school">
        	  <h1 class="tabTitle">新增院校</h1>
        	  <form action="market/marketSchoolInfoAdd.html" id="school" method="post" enctype="multipart/form-data">
              <table class="addTable">
                <tr>
                    <td class="tdWidth">学校名称：</td>
                    <td><input type="text" name="schoolName" onblur="showw(this)"  class="textStyle" style="width:160px;"  id="reschoolName" /></td>
                 </tr>
                  <tr>
                    <td class="tdWidth">地址：</td>
                    <td><input type="text" name="schoolAddress"  onblur="showw1(this)" class="searchStyle" style="width:560px;" id="reschoolAddress" /></td>
                </tr>
		 </table>
		 </form>
		 <div class="btposition1" align="center" >
		 			<input type="button" value="保存" class="searchBotton" id="conserve-school"  onclick="addSchool()" />
                    <input type="button" value="下一步" class="searchBotton-school" id="xia-school"  style="display: none" onclick="schoolNextStep()" />
                </div>
		</div>
		
		
		<!-- 新增专业 -->
		<div class="specialty">
		<form action="market/marketMajorInfoAdd.html" id="MajorInfo" method="post" enctype="multipart/form-data">
			<table class="addTable">
                <tr>
                    <td><h3>新增专业</h3></td>
                </tr>
                <tr>
                    <td class="tdWidth">专业名称：</td>
                    <td><input type="text" name="specialtyName"  onblur="showw(this)" class="searchStyle" id="specialtyName" style="width:160px;" /></td>
                    <td class="tdWidth">男女比例：</td>
                    <td><input type="text" name="specialtyPeoplenNumber"  class="searchStyle" id="peoples" style="width:160px;" /></td>
                    <td class="tdWidth">班级数量：</td>
                    <td><input type="text" name="classNumber"  onblur="showw(this)" class="searchStyle" id="classes" style="width:160px;" /></td>
                </tr>
                <tr>
                    <td class="tdWidth">发展方向：</td>
                    <td><input type="text" name="developDirection"   class="searchStyle" id="developDirection" style="width:160px;" /></td>

                    <td class="tdWidth">备注：</td>
                    <td><input type="text" name="specialtyComments" class="searchStyle" id="specialtyComments" style="width:160px;" /></td>
                </tr>
                <tr>
                    <td class="tdWidth">专业情况：</td>
                    <td colspan="2"><textarea name="specialtySituation"   id="specialtyinfo"  cols="x"  rows="y"  style="width: 275px ; height: 80px;resize:none;"  ></textarea  ></td>
                    <td class="tdWidth">现阶段学习情况：</td>
                    <td colspan="2"><textarea name="studySituation"   id="nowstudy" cols="x"  rows="y"  style="width: 275px ; height: 80px; resize:none;"  ></textarea  ></td>
                </tr>
              </table>
              </form>

                <div class="btposition1" align="center">
                	<input type="button" value="保存" class="searchBotton" id="conserve-specialty" onclick="addMajor()"  />
                	<input type="button" value="保存" class="searchBotton" id="reconserve-specialty" onclick="reAddMajor()" />
                	<div id="aaa">
                		<input type="button" value="继续添加" class="searchBotton" id="add-specialty" onclick="continueAddMajor()" />
                    	<input type="button" value="下一步" class="searchBotton-specialty" id="searchBotton-specialty" onclick="nextAddPerson()" />
                	</div>
                	
                </div>
                
        </div>
      
      
      
      <!-- 新增院校负责人 -->
      	<div class="responsible">
      	<form action="market/marketMajorPersonInfoAdd" id="MajorPerson" method="post" enctype="multipart/form-data">
                <table class="addTable" >
                <tr>
                    <td>
                        <h3>院系主要负责人</h3>
                    </td>
                    <td>
                  
                </tr>
                <tr id="majorList">
                 	
                </tr>
                <tr>
                    <td class="tdWidth">系主任/书记：</td>
                    <td><input type="text" name="Name"  onblur="showw(this)" id="responsibleName" class="searchStyle" style="width:160px;" /></td>
                    <td class="tdWidth">负责班级：</td>
                    <td><input type="text" name="directorClass"  id="responsibleClass" class="searchStyle" style="width:160px;" /></td>
                    <td class="tdWidth">性别：</td>
                    <td><input type="radio"  value="1" name="Sex"  class="radioStyle" checked="checked"/>男
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" value="2"  name="Sex"  class="radioStyle"/>女</td>
                </tr>
                <tr>
                    
                    <td class="tdWidth">备注：</td>
                    <td><textarea  name="comments"  cols="x"  rows="y"  style="width: 275px ; height: 80px; resize:none;" id="responsibleComments"  ></textarea></td>
                </tr>
                </table>
                </form>
                <div class="btposition1" align="center">
                	<input type="button" value="保存" class="searchBotton"  id="conserve-responsible" onclick="addMajorPerson()"/>
                	<input type="button" value="保存" class="searchBotton"  id="reconserve-responsible" onclick="reAddPerson()"/>
                	<div id="bbb">
                		<input type="button" value="继续添加" class="searchBotton"  id="add-responsible" onclick="continueAddPerson()"/>
                    	<input type="button" value="下一步" class="searchBotton-responsible" onclick="nextStepPerson()" />
                	
                	</div>
                	
                    
                </div>
         </div>    
                
               
               
          <!-- 新增班主任 --> 
         <div  class="teacher"> 
        	<form action="market/marketMajorTeacherInfoAdd" id="MajorTeacher" method="post" enctype="multipart/form-data">
               <table class="addTable">
               <tr>
                    <td>
                        <h3>新增班主任</h3>
                    </td>
                </tr>
                 <tr id="majorListTeacher">
                 	
                </tr>
	                <tr>
	                    <td class="tdWidth">班主任：</td>
	                    <td><input type="text" name="Name"  onblur="showw(this)" class="searchStyle" id="teacher" style="width:160px;" /></td>
	                    <td class="tdWidth">负责班级：</td>
	                    <td><input type="text" name="teacherClass"  onblur="showw(this)" class="searchStyle" id="teaclass" style="width:160px;" /></td>
	                    <td class="tdWidth">性别：</td>
	                    <td><input type="radio" value="1" name="Sex"   class="radioStyle" checked="checked"/>男
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	                        <input type="radio" value="2"  name="Sex" class="radioStyle"/>女
	                    </td>
	                </tr>
	                <tr>
	                    <td class="tdWidth">备注：</td>
	                    <td><textarea  name="comments"  cols="x"  rows="y"  style="width: 275px ; height: 80px; resize:none;" id="teachercomments" ></textarea></td>
	                </tr>
                </table>
                </form>
	            <div class="btposition1" align="center">
	           		
	                <input type="button" value="保存" class="searchBotton"  id="conserve-teacher" onclick="addMajorTeacher()"/>
	                <input type="button"  value="保存" class="searchBotton" id="reconserve-teacher" onclick="reAddTeacher()"/>
	                <div id="ccc">
	                	<input type="button" value="继续添加" class="searchBottons" id="add-teacher" onclick="continueAddTeacher()"/>
	                	<input type="button" value="下一步" class="searchBotton-time" onclick="nextStepTeacher()" />
	                </div>
	                
	                 
	            </div>
            </div>
            
            
            
           		 <!-- 院校时间安排 -->
            <div class="timeplan">
				<div align="center">
		            <form action="market/marketSchoolInfoUpdate" id="Update" method="post" enctype="multipart/form-data">
			            <table>
			                <h4 align="center">院校时间安排</h4>
			                <td align="center"><textarea name="schoolTimePlan"  cols="x"  rows="y"  style="width: 1000px ;height: 150px;"  ></textarea  ></td>
			            </table>
			            <table>
			                <h4 align="center">竞争对手情况</h4>
			                <td align="center"><textarea name="opptSituation"  cols="x"  rows="y"  style="width: 1000px ;height: 150px;"  ></textarea  ></td>			
			            </table>
		            	<table>
		                	<h4 align="center">院校合作进度</h4>
		                	<td align="center"><textarea name="schoolsSchedule"  cols="x"  rows="y"  style="width: 1000px ;height: 150px;"  ></textarea  ></td>
		            	</table>
		            	<table>
		                	<h4 align="center">地推合作进度</h4>
		                	<td align="center"><textarea name="pushingSchedule"  cols="x"  rows="y"  style="width: 1000px ;height: 150px;"  ></textarea  ></td>
		            	</table>
			            <table>
			                <h4 align="center">学生会情况</h4>
			                <td align="center"><textarea name="studentsSituation"  cols="x"  rows="y"  style="width: 1000px ;height: 150px;"  ></textarea  ></td>
			            </table>
		            
		            <input type="hidden" name="phoneticize" id="phoneticize" >
		            <h2 class="tabTitle2" >&nbsp;</h2>
		            <div class="btposition1" align="center">
		                <input type="submit" value="保存" class="saveBotton"/>
		                <input type="button" value="取消" class="saveBotton-cancel" onclick="cancel()" />
		            </div>
		            </form> 
		         </div>
       		</div>
    
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>

</body>
</html>
