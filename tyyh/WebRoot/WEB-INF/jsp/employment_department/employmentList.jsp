<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>选项卡模板</title>
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
<script src="statics/employment_department/js/emplist.js"></script>
<script type="text/javascript">
/*确定保存弹出框的位置*/
$(function(){
	
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});


$(function(){
	/*点击删除*/
	 $(".deleteBotton").click(function(){
		$(".mbStyle").css("display","block");
		$(".deleteStyle").css("display","block");
	 }); 
	 /*确定删除*/
	 $(".bottomStyle1").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了确定')
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消')
	 });
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

/*表格全选*/
$(function(){
	   $("#all").click(function(){
        var checked=$(this).is(":checked");
        
        $(".selectTable tr td").children().attr("checked",checked);
      });
    //判断是否全选
		function ifAllChecked(){
			var checkedBoxs=$(".selectTable tr td").children();
		
			var sum=checkedBoxs.size();
			
			var k=0;
			
			checkedBoxs.each(function(index,dom){
				if($(dom).is(":checked")) k++;
			
			});
			if(k==sum){
				$("#all").attr("checked",true);
			}else{
				$("#all").attr("checked",false);
			}
		}
        ifAllChecked();//页面加载完后运行 
	
});
</script>
</head>
<body>
<div class="rightContent">
  <div class="tabs">
      <span class="spanHover">待就业</span>
      <span class="spanOut">已就业</span>   
  </div>
  <div class="tabContent">
    <div class="divTable" >
           <div class="serach">
           <form id="queryshowemp">
        							
            <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
                <tr>
                    <td class="tdWidth">学员姓名：</td> <td><input type="search"  class="searchStyle" id="sname1" name="sname1" style="width:120px;" /></td>               
                    <td class="tdWidth">班级：</td> <td>
       <select name="className" id="sel" class="selectStyle" style="width:120px;">
                          <option value="" selected="selected">请选择</option>
                  <c:if test="${grades != null }">
                  <c:forEach items="${grades }" var="grade">
                   <option value="${grade.gradename }">${grade.gradename }</option>
                  </c:forEach>
                  </c:if>
       </select>
      </td>
                    <td>
                    
                     <td class="tdWidth">年龄：</td>
                    <td><select class="selectStyle" name="agePd" style="width:120px;"> 
                        <option value="0">--请选择--</option>             
                        <option value="1">18岁以下</option>
                        <option value="2">18到20</option>
                        <option value="3">20到24</option>
                        <option value="4">24岁以上</option>
                    </select></td>
                    <td><input type="button"  value="搜索" class="searchBotton" id="queryclickemp"/></td>
                    </tr>
                      
                <!--     <tr>
                     -->
                    
                <%--     <td class="tdWidth">学历：</td>
                    <td><select class="selectStyle" name="record" style="width:120px;">                       
                        <c:if test="${daixueli != null }">		
                          <option value="">--请选择--</option>  				   
									   <c:forEach var="xue" items="${daixueli}">
									   		<option <c:if test="">selected="selected"</c:if>
									   		value="${xue.xueli}">${xue.xueli}</option>
									   </c:forEach>
									</c:if> 
                    </select></td>
                    <td class="tdWidth">意向城市：</td>
                     <td><select class="selectStyle" id="selectCity" name="intentional_City" style="width:120px;">
                     <option value="">--请选择--</option>
                     <c:if test="${daicity != null }">						   
									   <c:forEach var="dcity" items="${daicity}">
									   		<option <c:if test="">selected="selected"</c:if>
									   		value="${dcity.intentional_City}">${dcity.intentional_City}</option>
									   </c:forEach>
									</c:if>                
                    </select></td>
                    <td></td> --%>
              <!--    
                </tr> -->
            </table>
           
           </form>
           
        </div>  
      <!--  待就业信息的显示-->  
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable" id="empList">
      </table>
	  <div id="page"></div>
    </div>
    
    
 <!--  *************************************************************************-->   
     <div class="divTable" style="display:none;">    
       <div class="serach">
           <form id="queryshowyiemp">
        	    <input hidden="hidden" id="indexShow" value="${index }"/>				
                <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
                <tr>
                    <td class="tdWidth">学员姓名：</td> <td><input type="search"  class="searchStyle" id="sname2" name="sname2" style="width:120px;" /></td>
                    
                   
                    <td class="tdWidth">班级：</td>
                     <td>
       <select name="className" id="sel1" class="selectStyle" style="width:120px;">
                                 <option value="">请选择</option>
                  <c:if test="${grades != null }">
                  <c:forEach items="${grades }" var="grade">
                   <option value="${grade.gradename }">${grade.gradename }</option>
                  </c:forEach>
                  </c:if>
       </select>
      </td>
                    
                     <td class="tdWidth">年龄：</td>
                    <td><select class="selectStyle" name="agePd" style="width:120px;"> 
                        <option value="0">--请选择--</option>             
                        <option value="1">18岁以下</option>
                        <option value="2">18到20</option>
                        <option value="3">20到24</option>
                        <option value="4">24岁以上</option>
                    </select></td>
                    
                    <td class="tdWidth">学历：</td>
                    <td><select class="selectStyle" name="record" style="width:120px;">
                         <c:if test="${record != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="rec" items="${record}">
									   		<option <c:if test="">selected="selected"</c:if>
									   		value="${rec.record}">${rec.record}</option>
									   </c:forEach>
									</c:if>

                      </select></td>
                   
                   
                </tr>
                
                <tr>
                
                  <td class="tdWidth">就业城市：</td>
                     <td><select class="selectStyle" id="selectCity" name="employment_city" style="width:120px;">
                     <c:if test="${citys != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="city" items="${citys}">
									   		<option <c:if test="">selected="selected"</c:if>
									   		value="${city.employment_city}">${city.employment_city}</option>
									   </c:forEach>
									</c:if>
                
                    </select></td>
                    
                    
                     <td class="tdWidth">岗位类型：</td>
                     <td><select class="selectStyle" id="selectengType" name="employment_engaged_type" style="width:120px;">
                     <%--  <c:if test="${citys != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="city" items="${citys}">
									   		<option <c:if test="">selected="selected"</c:if>
									   		value="${city.employment_city}">${city.employment_city}</option>
									    </c:forEach>
									</c:if> --%>
									<option value="">--请选择--</option>
									<option value="开发">开发</option>
									<option value="实施">实施</option>
									<option value="运维">运维</option>							
									<option value="其他">其他</option>
                
                    </select></td>
                    
                    
                     <td class="tdWidth">月薪：</td>
                     <td><select class="selectStyle" id="selectsal" name="empsal" style="width:120px;">
                   <%--   <c:if test="${citys != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="city" items="${citys}">
									   		<option <c:if test="">selected="selected"</c:if>
									   		value="${city.employment_city}">${city.employment_city}</option>
									   </c:forEach>
									</c:if> --%>
									<option value="0">--请选择--</option>
									<option value="1">2000-4000元</option>
									<option value="2">4000-6000元</option>
									<option value="3">6000-8000元</option>
									<option value="4">8000元以上</option>               
                    </select></td>
                    
                    <td class="tdWidth">就业状态：</td>
                      <td><select class="selectStyle"  name="employment_status" style="width:120px;">
									<option selected="selected" value="已就业">已就业</option>	
									<option value="未就业">未就业</option>								
									<option value="自主">自主</option>
							            
                    </select></td>
                <td></td>
                 <td><input type="button"  value="搜索" class="searchBotton" id="queryyiemp"/></td>
                </tr>
            </table>
           
           </form>
           
        </div>  
      <!--  就业信息的显示-->  
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable" id="empyiList">
      </table>
	  <div id="page1"></div>
    </div>
  </div>
</div>

<!--保存-->
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
<!--结束-->
<input type="hidden" value="${loginUser.position.position_name}" id="xiaozhang"/>
<!--删除开始-->
<div class="mbStyle">&nbsp;</div>
<!--<div class="deleteStyle">
	<h3>操作提示</h3>
	<h2>确定要删除吗？</h2>
	<div class="btn">
	   <div class="bottomStyle1">确定</div>
	   <div class="bottomStyle2">取消</div>
	</div>
</div>-->
<!--删除结束-->
</body>
</html>
