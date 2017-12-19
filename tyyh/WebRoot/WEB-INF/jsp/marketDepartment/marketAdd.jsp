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


        /*保存读秒*/
        var miao;
        var myTime;
        $(function(){
        	$.ajax({
        		url:"market/getall",
					dataType:"json",
					success:function(data){
						$(data).each(function(){
							$("#school").append("<option value='"+this.schoolName+"'>"+this.schoolName+"</option>");
						});
					}
        	});
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
    <script type="text/javascript">
    
    
  /*   $(function(){
       	 	
            $("#btn").click(function(){
            var temp = $("#form").serialize();
			$.post("market/marketAdd2",temp,showInfo,"json");
                
            });
            
            
      });  */
      
      
      function saveinfo(){
      
      	 var temp = $("#form").serialize();
		$.post("market/marketAdd2",temp,showInfo,"text");
      
      }
      
      function showInfo(data){
           
             window.location.href="market/getquery"; 
   	}
    	
    
    
   /*  function check(form){  
			$("#nameid")
	        var nameValue=window.document.getElementById("nameid").value; 
     	  	var ageValue=window.document.getElementById("ageid").value;
       		var telValue=window.document.getElementById("telid").value; 
          	
            if (nameValue =="" || ageValue=="" || telValue=="")   
            {  
            
             document.getElementById("btn").disabled=true;
             document.getElementById("tbn").disabled=true; 
                return false;  
            }else{
             
             document.getElementById("btn").disabled=false;
             document.getElementById("tbn").disabled=false; 
             
             return true;
            }
            
            
              
        }   */
        
        /* 验证是否为空 */
	/* function showw(ww){
	
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	if(emp_name_in!=""){$(ww).attr("style","width:160px");};
	}
	
        
       $(function(){
       
       var nameValue=window.document.getElementById("nameid").value; 
       var ageValue=window.document.getElementById("ageid").value;
       var telValue=window.document.getElementById("telid").value; 
            if (nameValue == "" || ageValue == "" || telValue == "" )   
            {             
             document.getElementById("btn").disabled=true;
             document.getElementById("tbn").disabled=true; 
                return false;  
            }

            
       });
       
       
       var str=name.trim()
		var phoneticize = makePy(str);
		$("#phoneticize").val(phoneticize);
		
		
		
		
	function showwcontactway(ww){
	var sfzz=/^1[34578]\d{9}$/;
	var emp_name_in = $(ww).val();	
	if(emp_name_in==null||emp_name_in==""||sfzz.test(emp_name_in.trim())){
		$(ww).attr("style","width:160px");
	}else{
		$(ww).attr("style","border:red 1px solid;width:160px");
	}
	}; */
				
				
				
				
	$(function(){
		
		$("#btn").attr("disabled", true); 
		$("#tbn").attr("disabled", true);
		
		$("#btn").css("background-color","#BEBEBE");
		$("#tbn").css("background-color","#BEBEBE");
	});

function judgeNull(){

	var name=$("#name").val();
	var age=$("#age").val();
	var telphone1=$("#telphone1").val();
	
	var consultWay=$("#consultWay").find("option:selected").val();
	
	
	if(name!=""&&age!=""&&telphone1!=""&&consultWay!=0){
		
		var str=name.trim();
		var phoneticize = makePy(str);
		$("#phoneticize").val(phoneticize);
		
		$("#btn").attr("disabled", false); 
		$("#btn").css("background-color","#00BB00");
		$("#tbn").attr("disabled", false); 
		$("#tbn").css("background-color","#00BB00");
	}	
	if(name==""||age==""||telphone1==""||consultWay==0){
	$("#btn").attr("disabled", true); 
	$("#btn").css("background-color","#BEBEBE");
	$("#tbn").attr("disabled", true); 
	$("#tbn").css("background-color","#BEBEBE");
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
        &nbsp;
        <form action="market/marketAdd" id="form" method="post"  enctype="multipart/form-data">
        	 <input type="hidden" name="phoneticize" id="phoneticize" >
            <table cellpadding="0" cellspacing="0" border="0"  class="addTable" style="width:100%">
                <h5>在校基本信息</h5>
				&nbsp;
                <tr>
                	 <td class="tdWidth">毕业院校：</td>
                    <td>
                    	<select class="searchStyle" name="schoolName" id="school">
                    		<option>请选择</option>
                    	</select>
                    </td>
                	<td class="tdWidth">班级：</td>
                    <td><input type="search"  class="searchStyle" name="schoolClass" style="width:160px;"/></td>
                    <td class="tdWidth">宿舍：</td>
                    <td><input type="search"  class="searchStyle" name="schoolDorm" style="width:160px;"/></td>
                	<td class="tdWidth">相关专业：</td>
                    <td><input type="radio" value="1" name="computer"  class="radioStyle" checked="checked"/>是&nbsp;&nbsp;&nbsp;<input type="radio" value="2"  name="computer" class="radioStyle"/>否</td>
                	<td class="tdWidth">专业：</td>
                    <td><input type="search"  class="searchStyle" name="specialty" style="width:160px;"/></td>
                </tr>
               
             </table>
            &nbsp;
            <table cellpadding="0" cellspacing="0" border="0" class="addTable"> 
                <h5>个人基本信息</h5>
             &nbsp;
             <tr>
  				<td class="tdWidth"><span>*</span>姓名：</td>
                    <td><input type="text" class="searchStyle" name="name"  id="name" onblur="judgeNull()" style="width:160px;" placeholder="请输入姓名"  /></td>
                <td class="tdWidth"><span>*</span>联系方式：</td>
                    <td><input type="text" class="searchStyle" name="telphone1"  onblur="judgeNull()" id="telphone1" style="width:160px;" placeholder="请输入联系方式"/></td>
                    
                        
                   
                    <td style="text-align: right;"><span>*</span>年龄：</td>                    
                    <td><input type="number"  min="1" max="100" id="age" onblur="judgeNull()"  name="age" class="searchStyle" style="width:160px;" placeholder="请输入年龄"/></td>
                
                	<td class="tdWidth">性别：</td>
                    <td><input type="radio" value="1" name="sex"  class="radioStyle" checked="checked"/>男&nbsp;&nbsp;&nbsp;&nbsp;
                	 	 <input type="radio" value="2"  name="sex" class="radioStyle"/>女</td>
                	 	 </tr>
             <tr>
             <td class="tdWidth"><span>*</span>咨询方式：</td>
			         <td><select class="selectStyle" style="width:160px;" name="consultWay" onblur="judgeNull()" id="consultWay">
			             	<option value="0">--请选择--</option>
			                 
			                 <c:if test="${consultWayList !=null}">
								
								<c:forEach var="OaScbConsultway" items="${consultWayList}">
									<option <c:if test="${OaScbConsultway.id == consultWay}">selected="selected"</c:if>
										value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
									</option>
								</c:forEach>
							  
							  </c:if>
			              
			              </select>
			          </td>
             
              <td class="tdWidth">咨询量等级：</td>
              	   <td><select class="selectStyle" name="rank" style="width:170px;">
                     <option value="0">请选择</option>
                    <c:if test="${rankList !=null}">	
						<c:forEach var="OaScbrankName" items="${rankList}">
							<option <c:if test="${OaScbrankName.id == rank}">selected="selected"</c:if>
							 value="${OaScbrankName.id}">${OaScbrankName.rank}
							</option>
						</c:forEach>
				  </c:if>
                </select>
          </td>
             
                	
             	
              	 	<td class="tdWidth">状态：</td>
                    <td><select class="selectStyle" name="status" style="width:160px;">
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

                    
                
                    
                    
                    <td style="text-align: right;">紧急联系方式：</td>
                    <td><input type="text" class="searchStyle" name="ungenTelphone" style="width:160px;" /></td>
                    
                    <td class="tdWidth">学历：</td>
                    <td><select class="selectStyle" name="education" style="width:160px;" >
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
             </tr>
              <tr>  
                    <td class="tdWidth">家庭情况：</td>
                    <td><input type="search"  class="searchStyle" name="familyCondition" style="width:160px;"/></td>
              
              			 
                    <td class="tdWidth">信息来源：</td>
	              	<td><input type="text" list="url_list"  class="searchStyle" style="width:160px;" name="infoSource"/>
	                    <datalist id="url_list">
					    
					    <c:if test="${InfosourceList !=null}">
						
							<c:forEach var="info" items="${InfosourceList}">
								<option <c:if test="${info.id == infoSource}">selected="selected"</c:if>value="${info.infoSource}">
									${info.infoSource}
								</option>
							</c:forEach>
					    
					    </c:if>
                  		
                  		</datalist>
              	 	</td>
                         		
              		
              		
                           	   
              	   
	               <td class="tdWidth">咨询课程：</td>
	               <td><select class="selectStyle" name="consultLesson" style="width:160px;">
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
	                <td class="tdWidth">咨询师：</td>
	               <td><select class="selectStyle" name="consultTeacher" style="width:160px;">
	                    	<option value="0">--请选择--</option>
	                  			
	                  			<c:if test="${employeesList !=null}">
										
									<c:forEach var="lesson" items="${employeesList}">
										
										<option 
											value="${lesson.emp_id}">${lesson.emp_name}										
										</option>
									</c:forEach>
					  			 
					  			</c:if>
	                	</select>
	                </td>
                    
                </tr>    
    	</table>
    			
    	<table class="addTable">
    				<td class="tdWidth" >现住址：</td>
                     <td class="tdWidth" colspan="3">
                        <div>

                            <table border="0">
                                <tr>
                                    <td> <select name="province" class="selectStyle" id="province">
                                    </select></td>
                                    <td> <select name="city" class="selectStyle" id="city">
                                    </select></td>
                                    <td><select name="county" class="selectStyle" id="county">
                                    </select></td>
                                    
                    				<td><input type="text" class="selectStyle" name="street" style="width:160px;" placeholder="请输入街道"  /></td>                 
                                </tr>
                            </table>

                        </div>

                        <script language="javascript">
                            setup();
                        </script>
                    </td>
                    
              </tr>
              <tr>
              		<td class="tdWidth">籍贯：</td>
                    <td><input type="text" class="selectStyle" name="place" style="width:460px;" placeholder="请输入：省/市/区(县、镇)"  /></td>
              </tr>
    			</table>
    			
                <table>
                    <td class="tdWidth">备注：</td>
                    <td><textarea name="comments"  cols="x"  rows="y"  style="width: 950px ;height: 150px; resize:none;"  ></textarea  ></td>
                </table>

<input type="hidden" name="phoneticize" id="phoneticize" >
            
            <h2 class="tabTitle2">&nbsp;</h2>
           <!--  disabled="disabled" -->
            <div class="btposition1" style="float: right;">
                <input type="submit" value="提交" id="tbn" class="saveBotton" onclick="judgeNull()" />
                <input type="button" value="保存" id="btn" class="saveBotton"   onclick="judgeNull(),saveinfo()" />
            </div>
        </form>
        
		
    </div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>
