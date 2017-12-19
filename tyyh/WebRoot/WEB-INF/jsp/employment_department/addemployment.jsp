<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">
  <base href="<%=basePath%>">
<head>
    <meta charset="UTF-8">
<title>新增，修改模板</title>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css"/>
<script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
<script type="text/javascript" src="statics/employment_department/js/back.js"></script>
<script type="text/javascript" src="statics/employment_department/js/tab.js"></script>
<script src="statics/employment_department/js/addemp.js"></script>
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
	
	    var from=$("#women");
	    var flag1=false;
	    var flag2=false;
	    var flag3=false;
	    var flag4=false;
	    var flag5=false;
	    var flag6=false;
	    var flag7=false;
	    var flag8=false;
	    var flag9=false;
	    var flag10=false;
	     var flag11=false;
	        var flag12=false;
	    
	    if(from.employment_status.value == "未就业"){
	       if(from.employment_status.value == "未就业"){
	       flag10=true;
	       }
	       
	       if(from.city1.html() != null){
	     flag12=true;
	       }
	       if(from.employment_city.html() != null){
	       flag11=true;
	       }
	    
	    }else{
	    
	    if(from.employment_status.html() != null){
	     flag1=true;
	    }
	    if(from.empDate.html() != null){
	     flag2=true;
	    }
	    if(from.city1.html() != null){
	     flag3=true;
	    }
	    if(from.employment_city.html() != null){
	     flag4=true;
	    }
	    if(from.employment_unit1.html() != null){
	     flag5=true;
	    }
	    
	    if(from.employment_engaged.html() != null){
	     flag6=true;
	    }

	    if(from.employment_engaged_type.html() != null){
	     flag7=true;
	    }

	    if(from.employment_Salary_probation.html() != null){
	     flag8=true;
	    }
	     if(from.employment_Salary_worker.html() != null){
	     flag9=true;
	    }
	
	}
	if(flag1&&flag2&&flag3&&flag4&&flag5&&flag6&&flag7&&flag8&&flag9 || flag10&&flag11&&flag12 ){
	
		miao=2;
		$(".setTime").text(miao);
		$(".saveStyle").css("display","block");
		myTime=setInterval("divHide()",1000);}
	   
    });  
});


	function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid;width:160px");};
	    if(emp_name_in!=""){$(ww).attr("style","width:160px");};
	
	}

	function www(from){
/*       showw(from.employment_status);
      showw(from.empDate);
      showw(from.city1);
      showw(from.employment_city);
      showw(from.employment_unit1);
      showw(from.employment_engaged);
      showw(from.employment_engaged_type);
      showw(from.employment_Salary_probation);
      showw(from.employment_Salary_worker);
 */
      if(from.employment_status.value=="未就业"){
        
        if( from.city1.value=="" || from.city1.value==null){
          showw(from.city1);
           return false;
        }
      
        if( from.employment_city.value=="" || from.employment_city.value==null){
          showw(from.employment_city);
           return false;
        }
       return true;
      }else{
      
      if( from.employment_status.value=="" || from.employment_status.value==null){
           showw(from.employment_status);
           return false;
      }
      if( from.empDate.value=="" || from.empDate.value==null){
        showw(from.empDate);
           return false;
      }
      if( from.city1.value=="" || from.city1.value==null){
       showw(from.city1);
           return false;
      }
      if( from.employment_city.value=="" || from.employment_city.value==null){
          showw(from.employment_city);
           return false;
      }
      if( from.employment_unit1.value=="" || from.employment_unit1.value==null){
          showw(from.employment_unit1);
           return false;
      }
      
      if( from.employment_engaged.value=="" || from.employment_engaged.value==null){
           showw(from.employment_engaged);
           return false;
      }
       if( from.employment_engaged_type.value=="" || from.employment_engaged_type.value==null){
           showw(from.employment_engaged_type);
           return false;
      }
       if( from.employment_Salary_probation.value=="" || from.employment_Salary_probation.value==null){
        showw(from.employment_Salary_probation);
           return false;
      }
      
       if( from.employment_Salary_worker.value=="" || from.employment_Salary_worker.value==null){
         showw(from.employment_Salary_worker);
           return false;
      }
       return true;
       
       }
    
    }
	


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
    <h1 class="tabTitle">新增就业信息</h1>
    <form action="employment_department/addemployment" id="women" method="post" onsubmit="return www(this)">
     <table cellpadding="0" cellspacing="0" border="0" class="addTable">
              
                <tr>
                     <td class="tdWidth">姓名：</td>
                     <input  hidden="hidden" name ="employment_id" value="${empNo }" />
                      <input  hidden="hidden" name ="stu_Id" value="${stuid }" />
                  
                     
                    <%-- <td><input type="text"  min="1"  name="stuName" value="${stuName }" max="100"  class="textStyle" style="width:160px;"/></td> --%>
                <td><label name="stuName" value="${stuName }">${stuName }</label></td>
                </tr>
                
                 <tr>
                    <td class="tdWidth">就业状态：</td>                  
                    <td><select  name="employment_status"  class="selectStyle" style="width:120px;">
						<option selected="selected" value="未就业">未就业</option>
						<option value="已就业">已就业</option>
						<option value="自主">自主</option>						
                    </select></td>
                </tr>  

                <tr>
                    <td class="tdWidth">就业时间：</td>
                    <td><input type="date" name="empDate" class="dateStyle"  style="width:160px;"/></td>
                </tr>
               
                <tr> <td class="tdWidth"><span>*</span>就业省份：</td>
                    <td>          
                    <input type="text" hidden="hidden" id="ctext" name="citt" value="">            
                    <select onchange="this.form.citt.value=this.options[this.selectedIndex].text;" name="city1" id="city1" class="selectStyle" style="width:120px;">
        							<c:if test="${city1list != null }">      								
									   <option value="">--请选择--</option>
									   <c:forEach var="city1" items="${city1list}">								
								       <option 
									   		value="${city1.provinceID}">${city1.province}</option>
									   </c:forEach>
									</c:if>
        		  	</select>       		  	
        		就业城市:  <select name="employment_city" id="city2" class="selectStyle" style="width:120px;">        			
        		  	</select>
    
                    </td>
                     <tr> <td class="tdWidth">就业单位：</td>
                    <td>
					 
                     <input type="text" hidden="hidden"  name="employment_unit" value="">                 
                     <select onchange="this.form.employment_unit.value=this.options[this.selectedIndex].text;" name="employment_unit1" id="unit" class="selectStyle" style="width:120px;">
        							<c:if test="${comlist != null }">        							
									   <option value="">--请选择--</option>
									   <c:forEach var="com1" items="${comlist}">
									   		<option 
									   		value="${com1.company_id}">${com1.company_name}</option>
									   </c:forEach>
									</c:if>
        		  	</select>
        		  	 
        		  	
        		<%--   	<input type="text"  name="employment_unit" list="unit" id="unit1"/>
    				<datalist  id="unit" class="selectStyle" style="width:120px;">
    			  	  	<c:if test="${comlist != null }">        							
									   <option value="">--请选择--</option>
									   <c:forEach var="com1" items="${comlist}">
									   		<option 
									   		>${com1.company_name}</option>
									   </c:forEach>
									</c:if>
   					 </datalist>    --%>        
                    </td>
                    
                    </tr>
                <tr>  <td class="tdWidth">从事岗位：</td>
                    <td>  
                     <select name="employment_engaged" id="eng" class="selectStyle" style="width:120px;">
        						
        		  	</select> 
                    
                    </td></tr>

                    <tr>  <td class="tdWidth">岗位类型：</td>
                    <td>  
                     <select name="employment_engaged_type" id="eng" class="selectStyle" style="width:120px;">
                        <option value="">--请选择--</option>
					 	<option value="开发">开发</option>
						<option value="实施">实施</option>
						<option value="运维">运维</option>
						<option value="其他">其他</option>
        						
        		  	</select> 
                    
                    </td></tr>
                    
                    
                <tr>
                    <td class="tdWidth">试用期薪资：</td>
                    <td><input type="text"  min="1" max="100" name="employment_Salary_probation" class="textStyle" style="width:160px;"/></td></tr>
                <tr>
                    <td class="tdWidth">转正薪资：</td>
                    <td><input type="text"  min="1" max="100" name="employment_Salary_worker" class="textStyle" style="width:160px;"/></td></tr>
					<tr>
                    <td class="tdWidth">福利待遇：</td>
                  <td><input type="text"  min="1" max="100" name="employment_welfare"  class="textStyle" style="width:160px;"/></td></tr>
                <tr>
                    <td class="tdWidth">备注：</td>
                    <td><textarea  class="areaStyle" name="employment_remarks" style="width:360px;"></textarea>
                </tr>
            </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	   <input type="button" class="BackBotton" value="返回"  />
	    <input type="submit" value="保存" id="empadd"  class="saveBotton" />
	  </div>
       </form>

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>

</body>
</html>

