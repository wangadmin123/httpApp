<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>新增，修改模板</title>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/switch.css">
<script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/employment_department/js/back.js"></script>
<script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});




    function www(from){
      showw(from.time);
   
      if( from.time.value=="" || from.time.value==null){
           return false;
      }
       return true;
    
    }
 
 function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	    if(emp_name_in!=""){$(ww).attr("style","width:160px");};
	
	}
	










/*保存读秒*/
var miao;
var myTime;
$(function(){

    


	$(".saveBotton").click(function(){
	 if($("#lv").html() != "" ){
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
		/* location.href="ceshi.jsp"; */
	}		
}
/*保存读秒结束*/




 i = 1;  
    j = 1;  
    $(document).ready(function(){  
          
       
          
        $("#btn_add2").click(function(){  
            document.getElementById("newUpload2").innerHTML+='<div id="div_'+j+'"><input  name="file_'+j+'" type="file"  /><input type="button" value="删除"  onclick="del_2('+j+')"/></div>';  
              j = j + 1;  
        });  
    });  
  
   
      
    function del_2(o){  
         document.getElementById("newUpload2").removeChild(document.getElementById("div_"+o));  
    }  
   
</script>
</head>
<body>
<div class="rightContent">

  
    <h1 class="tabTitle">新增活动</h1>
     
      <div class="divTable" >
       <form name="userForm2" action="${pageContext.request.contextPath }/employment_department/upload2" enctype="multipart/form-data" method="post" id="fo" onsubmit="return www(this)">
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                 <tr>
                    <td class="tdWidth"><span>*</span>活动日期：</td>
                    <td><input type="date" class="dateStyle"  style="width:160px;" name="time" id="lv" onblur="showw(this)"/></td>
                </tr>
                <tr>
                    <td class="tdWidth">班级：</td>
                    <td><select class="selectStyle" style="width:120px;" name="activity_class">
                        <option>c11</option>
                        <option>c12</option>
                        <option>c13</option>


                    </select></td>
                </tr>
                    <tr>
                    <td class="tdWidth">类型：</td>
                    <td><select class="selectStyle" style="width:120px;" name="activity_type">
                        <option>在校活动</option>
                        <option>毕业典礼</option>
                        <option>离校活动</option>


                    </select></td>
                </tr>
                
                 <tr>
                    <td class="tdWidth">主题：</td>
                    <td><input type="text" class="textStyle" style="width:200px;" name="activity_theme"/></td>
                </tr>
                <tr>
                    <td class="tdWidth">地点：</td>
                    <td><input type="text" class="textStyle" style="width:200px;" name="activity_address"/></td>
                </tr>
                <tr>
                    <td class="tdWidth">教员：</td>
                    <td><select class="selectStyle" style="width:120px;" name="activity_figure">
                        <option>所有</option> 
                        <option>张鑫焱</option>
                        <option>张曼</option>


                    </select></td>
                </tr>

               

               <!--  <tr>
                    <td class="tdWidth">主题照片：</td>
                    <td>
                        <a href="#" class="fileStyle"><input type="file" class="file" size=1 onchange="document.getElementById('imgUrl').value=this.value"/></a>
                    </td>
                </tr>
                <tr>
                    <td class="tdWidth"></td>
                    <td>   <input type="text" class="textStyle" id="imgUrl" style="width:200px;"/>
                        <input type="button" class="bottomStyle" value="上传"/>
                    </td>
                </tr>
                  <tr>
                    <td class="tdWidth">活动照片：</td>
                    <td>
                        <a href="#" class="fileStyle"><input type="file" class="file" size=1 onchange="document.getElementById('imgUrl').value=this.value"/></a>
                    </td>
                </tr>
                <tr>
                    <td class="tdWidth"></td>
                    <td>   <input type="text" class="textStyle" id="imgUrl" style="width:200px;"/>
                        <input type="button" class="bottomStyle" value="上传"/>
                    </td>
                </tr> -->
                <tr><div id="newUpload2">  
                
            <input type="file" class="file" name="file">  
        </div>  
       
        <input type="button" id="btn_add2" value="添加图片" ></tr>
                <tr>
                    <td class="tdWidth">备注：</td>
                    <td><textarea  class="areaStyle" style="width:560px;" placeholder="限写100字" name="activity_remarks"></textarea>
                    </td>
                </tr>
            </table>
            
            <h2 class="tabTitle2">&nbsp;</h2>
            <div class="btposition1">
                <input type="submit" value="保存" class="saveBotton" />
                <input type="button" class="BackBotton" 
                
                value="返回"/>
            </div>
</form>
        </div>
       
   

</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>

</body>
</html>

