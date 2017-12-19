<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>企业修改模板</title>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/switch.css">
   <script type="text/javascript" src="statics/employment_department/js/back.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
    <script type="text/javascript">

        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".saveStyle").css("left",saveWidth/2-130);
            $(".saveStyle").css("top",saveHeight/2-40);
            $(".BackBotton").click(function(){
		window.history.back();
	});
        showinfo();
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
        
        function showinfo(){
      
         
	     var query=$("#query").serialize();
	   
	    /* $.post("employment_department/showlist1.html",query,show,"json");  */
	 
	   $.ajax({
	    
		type:"post",//请求类型
		url:"employment_department/getstation?",//请求的url
		dataType:"html",//ajax接口（请求url）返回的数据类型
		data:query,
		success: show,
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载就业信息失败！");
		}
	});}
        function show(data){
       $("#lili").empty();
        $("#lili").html(data); 
        }
        
        
        /*保存读秒结束*/
    </script>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <h1 class="tabTitle">企业修改</h1>
        <form action="${pageContext.request.contextPath }/employment_department/qiyexiugai?id=${company.company_id}" method="post" id="query" enctype="multipart/form-data">
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                <tr>
                    <td class="tdWidth">企业名称：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" value="${company.company_name} "  name="company_name"/>
                </tr>
           <%--    <tr>  <td class="tdWidth">城市：</td>
                    <td><select class="selectStyle" style="width:120px;" name="company_city">
                        <option selected="selected" value="${company.company_city }">${company.company_city }</option>
                        <option >北京</option>
                        <option>上海</option>
                        <option>青岛</option>
                        <option>深圳</option>
                        <option>杭州</option>
                        <option>太原</option>

                    </select></td></tr> --%>
                <tr>
                    <td class="tdWidth">联系人：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入联系人姓名" value="${company.company_person}" name="company_person" />
                </tr>
                <tr>
                    <td class="tdWidth">职务：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入职务名称" value="${company.company_job }" name="company_job" />
                </tr>
                <tr>
                    <td class="tdWidth">联系电话：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入联系电话"  value="${company.company_phone }" name="company_phone"/></td>
                </tr>


            <%--     <tr>  <td class="tdWidth">招聘岗位：</td>
                    <td><select class="selectStyle" style="width:120px;" name="company_station">
                        <option selected="selected" value="${company.company_station }">${company.company_station }</option>
                        <option >java开发工程师</option>
                        <option>ios开发工程师</option>
                        <option>android开发工程师</option>
                        <option>实施工程师</option>
                        <option>游戏策划</option>
                        <option>游戏设计开发</option>

                    </select></td></tr> --%>
                    
                    <tr>
          <td class="tdWidth">招聘岗位：</td>
          <td id="lili">
          <c:forEach items="${stations }" var="sta" varStatus="statu">
          <input  type="checkbox"  name="station"  class="checkedStyle" checked="checked" value="${sta }"/>
          
          
             </c:forEach> 
            
             <%-- <c:forEach items="${stations }" var="sta">
             <c:if test="${sta!='java开发工程师' }"><input type="checkbox"  name="station"  class="checkedStyle" value="java开发工程师"/>java开发工程师</c:if>
             </c:forEach> --%>
             
             
             
             <!-- 
               <input type="checkbox"  name="station"  class="checkedStyle" value="java开发工程师"/>java开发工程师
             &nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox" name="station" class="checkedStyle" value="android开发工程师"/>android开发工程师
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="station" class="checkedStyle" value="实施工程师"/>实施工程师
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="station" class="checkedStyle" value="软件测试"/>软件测试
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="station" class="checkedStyle" value="需求工程师"/>需求工程师
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="station" class="checkedStyle" value="系统架构设计师"/>系统架构设计师
             <br>
             <input type="checkbox" name="station" class="checkedStyle" value="网页设计制作"/>网页设计制作
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="station" class="checkedStyle" value="用户界面UI设计"/>用户界面UI设计
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="station" class="checkedStyle" value="游戏设计开发"/>游戏设计开发
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="station" class="checkedStyle" value="软件研发工程师"/>软件研发工程师
             &nbsp;&nbsp;&nbsp;&nbsp;<input type="checkbox" name="station" class="checkedStyle" value="数据库开发工程师"/>数据库开发工程师   -->
         </td> 
        </tr>
                <tr>  <td class="tdWidth">企业规模：</td>
                    <td><select class="selectStyle" style="width:120px;" name="company_scope">
                        <option selected="selected" value="${company.company_scope }">${company.company_scope }</option>
                        <c:if test="${company.company_scope !='20-99' }"> <option>20-99</option></c:if>
                        <c:if test="${company.company_scope !='20人以下' }"> <option>20人以下</option></c:if>
                        <c:if test="${company.company_scope !='100-199' }"> <option>100-199</option></c:if>
                        <c:if test="${company.company_scope !='200-499' }"> <option>200-499</option></c:if>
                        <c:if test="${company.company_scope !='500-999' }"> <option>500-999</option></c:if>
                        <c:if test="${company.company_scope !='1000及以上' }"> <option>1000及以上</option></c:if>
                       
                       

                    </select></td></tr>
                    
                    <tr>  <td class="tdWidth">企业关系：</td>
                    <td><select class="selectStyle" style="width:120px;" name="company_category">
                    <option selected="selected" value="${company.company_category }">${company.company_category }</option>
                        <c:if test="${company.company_category != '良好' }"><option>良好</option></c:if>
                        <c:if test="${company.company_category != '中等' }"><option>中等</option></c:if>
                        <c:if test="${company.company_category != '一般' }"><option>一般</option></c:if>
                        <c:if test="${company.company_category != '较差' }"><option>较差</option></c:if>
                        
                        


                    </select></td></tr>
                <tr>  <td class="tdWidth">企业性质：</td>
                    <td><select class="selectStyle" style="width:120px;" name="company_property">
                         <option selected="selected" value="${company.company_property }">${company.company_property }</option>
                  <c:if test="${company.company_property != '国企' }"><option>国企</option></c:if>
                   <c:if test="${company.company_property != '外商独资' }"><option>外商独资</option></c:if>
                    <c:if test="${company.company_property != '代表处' }"><option>代表处</option></c:if>
                     <c:if test="${company.company_property != '民营' }"><option>民营</option></c:if>
                      <c:if test="${company.company_property != '股份制企业' }"><option>股份制企业</option></c:if>
                       <c:if test="${company.company_property != '国家机关' }"><option>国家机关</option></c:if>
                        <c:if test="${company.company_property != '上市公司' }"><option>上市公司</option></c:if>
                         <c:if test="${company.company_property != '事业单位' }"><option>事业单位</option></c:if>
                          <c:if test="${company.company_property != '其他' }"><option>其他</option></c:if>
                  
                  
               


                    </select></td></tr>
                
              


              

                <tr>
                    <td class="tdWidth">企业地址：</td>
                    <td><input type="text"  min="1" max="100"  class="textStyle" style="width:160px;" value="${company.company_Address}" name="company_Address"/></td>
                </tr>
                 <tr>
                    <td class="tdWidth">企业邮箱：</td>
                    <td><input type="text"  min="1" max="100"  class="textStyle" style="width:160px;" value="${company.company_Email}" name="company_Email"/></td>
                </tr>
                <tr>
                    <td class="tdWidth">企业网站：</td>
                    <td><input type="text"  min="1" max="100"  class="textStyle" style="width:160px;" value="${company.company_web}" name="company_web"/></td>
                </tr>
                <tr>
                    <td class="tdWidth">备注：</td>
                    <td><textarea  class="areaStyle" style="width:360px;" name="company_remarks">${company.company_remarks }</textarea>
                    </td>
                </tr>

            </table>
            <h2 class="tabTitle2">&nbsp;</h2>
            <div class="btposition1">
                <input type="submit" value="保存" class="saveBotton" />
                <input type="button" class="BackBotton" value="返回"/>
            </div>
        </form>


    </div>
</div>
<div class="saveStyle" > 保存成功！（<span class="setTime"></span>） </div>

</body>
</html>


