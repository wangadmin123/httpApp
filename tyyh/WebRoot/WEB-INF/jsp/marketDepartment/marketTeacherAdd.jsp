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
        
     
		
		/* function getMajor(data){
			
			
			
			var str = "<td class='tdWidth'><span>*</span>选择专业</td><td><select class='selectStyle' style='width:130px;' name='specialtId'>"
									+"<option value='0'>请选择</option>";
			
			if(data.length!=0){
				for(var i =0;i<data.length;i++){
					str+=("<option value='"+data[i].id+"'>"+data[i].specialtyName+"</option>");
				} 
				
			}
			str+=("</select></td>");
			$("#majorList").html(str);
		}
		
		function addMajorPerson() {
			 var temp = $("#MajorPerson").serialize();
           	 $.post("market/remarketPersonAdd",temp,MajorPerson,"text");
		}
		function MajorPerson() {
			 window.location.href=""; 
		}
		
		
         $(function(){
         	
         		
         }); */
       
       
       function check(form){  
	
	        var teacher=window.document.getElementById("teacher").value; 
     	  	var classs=window.document.getElementById("class").value;
       		 
          	
            if (teacher =="" || classs=="" )   
            {  
            
             document.getElementById("btn").disabled=true;
            
                return false;  
            }else{
             
             document.getElementById("btn").disabled=false;
             
             
             return true;
            }
            
            
              
        }  
        
        /* 验证是否为空 */
	function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	if(emp_name_in!=""){$(ww).attr("style","width:160px");};
	}
	
        
      
var str=name.trim();
		var phoneticize = makePy(str);
		$("#phoneticize").val(phoneticize);
	
	function yanzheng() {
			var specialtId = $("#specialtId").val();
			var teacher = $("#teacher").val();
			var teaclass = $("#teaclass").val();
			if(specialtId ==0){
				alert("请选择专业");
				return false;
			}else if(teacher ==null || teacher==""){
				alert("请输入班主任名称");
				return false;
			}else if(teaclass ==null || teaclass==""){
				alert("请输入班级数量");
				return false;
			}else{
				return true;
			}
		}
	
	
       
    </script> 
</head>
<body>
<div class="rightContent">

   
    	
    	<div class="school">
        	  <h1 class="tabTitle"></h1>
        	  <form action="market/remarketTeacherAdd"  onsubmit="return yanzheng()" id="form" method="post" enctype="multipart/form-data">
              <table class="addTable">
                <tr>
                    <td>
                        <h3>新增班主任</h3>
                    </td>
                    <td>
                  
                </tr>
                <tr id="majorList">
                 	<td class="tdWidth">选择专业：</td>
                            <td><select class="selectStyle" style="width:130px;" name="specialtId" id="specialtId">
                                <option value="0">请选择</option>
                                <c:if test="${specialtyList !=null}">
						
									<c:forEach var="spe" items="${specialtyList}">
										<option <c:if test="${spe.id == specialtyName}">selected="selected"</c:if>
										 value="${spe.id}">${spe.specialtyName}
										</option>
									</c:forEach>
				  				</c:if>
                                
                            	</select>
                        	</td>
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
	                    <td><textarea  name="comments"  cols="x"  rows="y"  style="width: 275px ; height: 80px; resize:none;"></textarea></td>
	                </tr>
                </table>
		 <input type="hidden" name="phoneticize" id="phoneticize" >
		 <div class="btposition1" align="center" >
		 			<input type="submit" value="保存" class="searchBotton" id="btn"  />
                    
                </div>
     </form>
		</div>
		
		
		
      
     
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>

</body>
</html>
