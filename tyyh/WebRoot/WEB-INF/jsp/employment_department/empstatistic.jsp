<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>

  <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>列表模板</title>

     <link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="sstatics/employment_department/css/formStyle.css"/>
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/back.js"></script>
    <script type="text/javascript" src="statics/employment_department/laydate/laydate.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/empstatic.js"></script>
    <script type="text/javascript">
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
        /*表格全选结束*/
        

    </script>
    
    <style type="text/css">
    .ll{
  
    width: 45%;
    height: 180px;
    display: inline-block;
    
    }
    .nn{
    float: right;
    }
    
    .classStatShow tr{
     text-align:center;
     vertical-align:middle;
     display: inline-block;
    }
    </style>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <div class="serach">
        <form id="statQuery">
            <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
                <tr>
                     <td class="tdWidth">班级：</td>
                    <td><select class="selectStyle" name="className" style="width:120px;" >
                               <c:if test="${className != null }">
									   <option  							   
									   value="">--请选择--</option>
									   <c:forEach var="clas" items="${className}">
									   		<option <c:if test="${clas.name == classId }">selected="selected"</c:if> 		
									   		value="${clas.name}">${clas.name}</option>
									   </c:forEach>
									</c:if>
                    </select></td>  
                       <td><input type="button"  value="搜索" class="searchBotton" id="cliclStatic" style="cursor:pointer;background-color:#44bb00;width:65px;height:30px;line-height:30px;
text-align:center; color:#fff;font-size:12px;font-weight:bold; border:0px; border-radius: 3px; margin-right:20px;" /></td>
       
            </table>
            </form>
        </div>
        <h1 class="tabTitle">班级总就业统计</h1>
        <div class="divTable" >
            <table cellpadding="0" cellspacing="0" border="0" class="selectTable" id="classShow">
            </table>
      
        </div>
    </div>
  <!-- ********************************************************************* -->
    <div class="tabContent">
        

        <h1 class="tabTitle">班级就业详情统计</h1>
        <div class="divTable" >
    
  <table cellpadding="0" class="selectTable" cellspacing="0" border="0" class="" id="classStaShow1">
  
  </table>  
  </div>
            
</div>
    
    <div class="btposition2">
    <div><input type="button" class="BackBotton" value="返回" style="cursor:pointer;background-color:#44bb00;width:65px;height:30px;line-height:30px;
text-align:center; color:#fff;font-size:12px;font-weight:bold; border:0px; border-radius: 3px; margin-right:20px;" /></div>
    </div>
    
</div>
<div class="mbStyle">&nbsp;</div>
<!--<div class="deleteStyle">
    <h3>操作提示</h3>
    <h2>确定要删除吗？</h2>
    <div class="btn">
        <div class="bottomStyle1">确定</div>
        <div class="bottomStyle2">取消</div>
    </div>
</div>-->
</body>
</html>

