<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>列表模板</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>


    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>

    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup-notsee.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popups.css"/>
    <script type="text/javascript" src="statics/common/js/index.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
     <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
    function FY(pageNo){
    var sowqs=null;
    var Time=$(".Time").val();
    var consulter_name=$(".consulter_name").val();
    var emp_name=$("#emp_name").val();
    var pageSize=$("#number").val();
    if(${loginUser.position.position_id}==12){
     sowqs={"pageNo":pageNo,"employee_id":${loginUser.emp_id},"Time":Time,"consulter_name":consulter_name,"emp_name":emp_name,"pageSize":pageSize};
    }else{
     sowqs={"pageNo":pageNo,"Time":Time,"consulter_name":consulter_name,"emp_name":emp_name,"pageSize":pageSize};
    }
    $.post("oaScbOperation/OperationSelectJSON",sowqs,function(data){
    var $table="";
   
 	$(data.getOaScbOperationList).each(function(){
    var str="";
   if(this.consulter_name=='' || this.consulter_name==null){
    str=str+"<tr><td><span style='color:red'>"+this.employee_name+"</span>"+this.content;
  
   }else if(this.content=="分发给了"){
   str=str+"<tr><td><span style='color:red'>"+this.employee_name+"</span>将<span style='color:blue'>"+this.consulter_name+"</span>"+this.content+"<span style='color:pink'>"+this.emp_name+"</span>";
   }else if(this.emp_name=='' || this.emp_name==null){
   str=str+"<tr><td><span style='color:red'>"+this.employee_name+"</span>"+this.content+"<span style='color:blue'>"+this.consulter_name+"</span>";
   } else{
   str=str+"<tr><td><span style='color:red'>"+this.employee_name+"</span>"+this.content+"<span style='color:pink'>"+this.emp_name+"</span>的咨询量：<span style='color:blue'>"+this.consulter_name+"</span>";
   }
   str=str+"<td>"+
   this.times+"</td></tr>";
  	$table=$table+str;
   });
   var fycx=" <td colspan='2' style='text-align: right'>";
   var iqishi=1;
	 	if(data.totalPageCount>=8){
	 		if((data.currPageNo+4)>=data.totalPageCount){
	 		iqishi=data.totalPageCount-8;
	 	}else if(data.currPageNo>=5){
	 		iqishi=data.currPageNo-4;
	 	}
	 	}
   if(data.currPageNo>1){
   fycx=fycx+"<a href='javascript:FY("+1+")'>首页</a><a href='javascript:FY("+(data.currPageNo-1)+")'>上一页</a>";
   }
   		for(var i=iqishi;i<=iqishi+8;i++){
						if(i==data.currPageNo){
							fycx = fycx+"<a href=' javascript:onclick=FY("+i+")' style='color:red;'>"+i+"</a>";
						}else{
							fycx = fycx+"<a href=' javascript:onclick=FY("+i+")'>"+i+"</a>";
						}
						if(i>data.totalPageCount-1){
							break;
						}
		 			}
   	if(data.currPageNo<data.totalPageCount){
   	fycx=fycx+"<a href='javascript:FY("+(data.currPageNo+1)+")'>下一页</a><a href='javascript:FY("+(data.totalPageCount)+")'>尾页</a>";
   	}
   	fycx=fycx+"每页显示的数量：<input type='number' id='number' value='"+data.PageSize+"' onchange='FY(1)'   min='1' max='100'  class='textStyle' style='width:45px;'/>条";
   $("#consulters").html($table);
   $("#page").html(fycx);
    });
    };
    $(function(){
  	FY(1,null);
  	$(".searchBotton").click(function(){
  	FY(1);
  	
  	});
    });
    </script>

  </head>
  
  <body>
    <div class="tabContent">
        <h1 class="tabTitle">查询操作记录</h1>
        <div class="serach">
            <div class="searchTitle">
                搜索条件
            </div>
            <div style="margin:50px">
   咨询师：<select id="emp_name" class="selectStyle" style="width:130px;" name="emp_name">
    <option value="0">请选择</option>
   <c:forEach var="Employee" items="${OaRlzybEmployeeList}">
   <option value="${Employee.emp_id}">${Employee.emp_name}</option>
   </c:forEach>
   </select>
   时间：<input type="date" name="Time" class="Time">
   <input type="button" class="searchBotton"  value="搜索" >
   </div>
            <hr>
<input type="hidden" value="1" id="orderId" >
            <h1 class="tabTitle">操作信息</h1>
            <div class="divTable" >
                <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
                	<thead>
                    <tr>
                    	<th>事件</th>
                        <th>时间</th>
                    </tr>
					</thead>
					<tbody id="consulters">
					</tbody>
                </table>

                <div id="page" style="margin-top: 20px"></div>
            </div>

        </div>
  
  	
  </body>
</html>
