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
       
       
       
       /* function check(form){  
	
	        var specialtyName=window.document.getElementById("specialtyName").value; 
     	  	
       		var classes=window.document.getElementById("classes").value; 
       		var developDirection=window.document.getElementById("developDirection").value;
       		var specialtyinfo=window.document.getElementById("specialtyinfo").value;
       		var nowstudy=window.document.getElementById("nowstudy").value;
       		
          	
            if (specialtyName =="" ||  classes=="" || developDirection=="" || specialtyinfo=="" || nowstudy=="")   
            {  
            
             document.getElementById("btn").disabled=true;
             
                return false;  
            }else{
             
             document.getElementById("btn").disabled=false;
            
             
             return true;
            }
            
            
              
        }   */
        
        /* 验证是否为空 */
	function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	if(emp_name_in!=""){$(ww).attr("style","width:160px");};
	}
	
        
       /* $(function(){
       
       		var specialtyName=window.document.getElementById("specialtyName").value; 
     	  	
       		var classes=window.document.getElementById("classes").value; 
       		var developDirection=window.document.getElementById("developDirection").value;
       		var specialtyinfo=window.document.getElementById("specialtyinfo").value;
       		var nowstudy=window.document.getElementById("nowstudy").value; 
            if (specialtyName =="" ||  classes=="" || developDirection=="" || specialtyinfo=="" || nowstudy=="")   
            {             
             document.getElementById("btn").disabled=true;
             
                return false;  
            }

            
       }); */
       
       
       
       var str=name.trim();
		var phoneticize = makePy(str);
		$("#phoneticize").val(phoneticize);
       
       function yanzheng() {
			var specialtyName = $("#specialtyName").val();
			var classes = $("#classes").val();
			if(specialtyName ==null || specialtyName==""){
				alert("请输入专业名称");
				return false;
			}else if(classes ==null || classes==""){
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
        	  <form action="market/remarketMajorAdd"   onsubmit=" return yanzheng()"     id="form" method="post" enctype="multipart/form-data">
              
              <input type="hidden" name="schoolId" id="id" value="${id}">
              <table class="addTable">
                <tr>
                    <td><h3>新增专业</h3></td>
                </tr>
                <tr>
                	
                	
                    <td class="tdWidth">专业名称：</td>
                    <td><input type="text" name="specialtyName"  onblur="showw(this)" class="searchStyle" id="specialtyName" style="width:160px;" /></td>
                    <td class="tdWidth">男女比例：</td>
                    <td><input type="text" name="specialtyPeoplenNumber"   class="searchStyle" id="peoples" style="width:160px;" /></td>
                    </tr>
                <tr>
                    <td class="tdWidth">班级数量：</td>
                    <td><input type="text" name="classNumber"  onblur="showw(this)" class="searchStyle" id="classes" style="width:160px;" /></td>
                
                    <td class="tdWidth">发展方向：</td>
                    <td><input type="text" name="developDirection"   class="searchStyle" id="developDirection" style="width:160px;" /></td>

                    <td class="tdWidth">备注：</td>
                    <td><input type="text" name="specialtyComments" class="searchStyle" id="specialtyComments" style="width:160px;" /></td>
                </tr>
                <tr>
                    <td class="tdWidth">专业情况：</td>
                    <td colspan="2"><textarea name="specialtySituation"   id="specialtyinfo"  cols="x"  rows="y"  style="width: 275px ; height: 80px;"  ></textarea  ></td>
                    <td class="tdWidth">现阶段学习情况：</td>
                    <td colspan="2"><textarea name="studySituation"   id="nowstudy" cols="x"  rows="y"  style="width: 275px ; height: 80px;"  ></textarea  ></td>
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
