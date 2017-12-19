<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
 <base href="<%=basePath%>"> 
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/config.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/index.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".ygxm span").click(function(){
               	var title=$(this).text();
                $(".qxfp").html("正在给 <span style='color:#ff0000;'>"+title+"</span> 分配权限...");
                var userid = $(this).next().val();
                $.ajax({
                	type:"post",
                	url:"getData/Subfields?userid="+userid,
                	datatype:"json",
                	success:function(data){
                	var data = eval("("+data+")");
                		var subfields = data.subfields;
                		var userFunctions = data.userFunctions;
                		var str = "";
                		$(".gnxs").empty();
                		for(var i=0;i<subfields.length;i++){
                			str+="<div class='bk'>";
                			str+="<span class='bk_head'>"+subfields[i].subfield_name+":</span>";
                			str+="<div class='bk_title'>";
                			var functions = subfields[i].functions;
                			for(var j=0;j<functions.length;j++){
                				var falg = 0;
                				for(var z=0;z<userFunctions.length;z++){
                					if(userFunctions[z].function_id = functions[j].function_id){
                						falg = 1;
                					}
                				}
                				str+="<div class='gnmk' >";
                				if(functions[j].function_jurisdiction <4){
                					str+="<label for='num"+functions[j].function_id+"'>"+functions[j].function_name+"</label><span><input type='checkbox' id='num"+functions[j].function_id+"' value="+functions[j].function_id+" disabled='disabled' checked='checked'></span>";
                				}else if(falg == 1){
                					str+="<label for='num"+functions[j].function_id+"'>"+functions[j].function_name+"</label><span><input type='checkbox' id='num"+functions[j].function_id+"' value="+functions[j].function_id+" checked='false'></span>";
                					
                				}else{
                					str+="<label for='num"+functions[j].function_id+"'>"+functions[j].function_name+"</label><span><input type='checkbox' id='num"+functions[j].function_id+"' value="+functions[j].function_id+"></span>";	
                				}
                				/* str+="<label for='num"+functions[j].function_id+"'>"+functions[j].function_name+"</label><span><input type='checkbox' id='num"+functions[j].function_id+"' value="+functions[j].function_id+"></span>"; */
                				str+="</div>";
                			}
                			str+="</div>";
                			str+="</div>";
                		}
                		$(".gnxs").append(str);
                	}
                });
            });
        });
    </script>
</head>
<body>

<div class="contentConfig">
      <div class="ygxm">
      
      
      
      	<c:forEach var="position" items="${positions}">
      		${position.position_name}:
      		<c:forEach var="user" items="${position.users }">
      			<span>${user.emp.emp_name}</span><input type="hidden" name="user_id" class="user_id" value="${user.user_id }" >
      		</c:forEach>
      	</c:forEach>
      
      
          	<!-- 员工：<span>张三</span><span>李四</span><span>王五</span> -->
      </div>
     <div class="qxfp">分配权限</div>
     <!-- <h2 class="qx_name">基本功能</h2> -->
      	<div class="gnxs">
      	
      	
      		<c:forEach var="subfield" items="${subfields}">
      		<div class="bk">
      			<span class="bk_head">${subfield.subfield_name}:</span>
                <div class="bk_title">
                	<c:forEach var="function" items="${subfield.functions }">
                		<c:if test="${function.function_jurisdiction >3}">
	                		<div class="gnmk" >
		                      <label for="num${function.function_id}">${function.function_name }</label><span><input type="checkbox" id="num${function.function_id}" value="${function.function_id}"></span>
		                    </div>
                		</c:if>
                		<c:if test="${function.function_jurisdiction <= 3}">
	                		<div class="gnmk" >
		                      <label for="num${function.function_id}">${function.function_name }</label><span><input type="checkbox" id="num${function.function_id}" disabled="disabled" checked="checked"></span>
		                    </div>
                		</c:if>
                	</c:forEach>
      			</div>
      		</div>
      		</c:forEach>
      	</div>
    <!-- <h2 class="qx_name">扩展功能</h2> -->
      <!-- <div class="bk">
        <span class="bk_head">学员:</span>
        <div class="bk_title">
            <div class="gnmk">
                <label for="num4">创建学生档案</label><span><input type="checkbox" id="num4"></span>
            </div>
            <div class="gnmk">
            <label for="num5">查看学生档案</label><span><input type="checkbox" id="num5" disabled="disabled" checked="checked"></span>
        	</div>
            <div class="gnmk">
                <label for="num6">查看学生档案</label><span><input type="checkbox" id="num6"></span>
            </div>
            <div class="gnmk">
                <label for="num7">查看学生档案</label><span><input type="checkbox" id="num7"></span>
            </div>
            <div class="gnmk">
                <label for="num8">查看学生档案</label><span><input type="checkbox" id="num8" disabled="disabled" checked="checked"></span>
            </div>
            <div class="gnmk">
                <label for="num9">查看学生档案</label><span><input type="checkbox" id="num9"></span>
            </div>
            <div class="gnmk">
                <label for="num10">查看学生档案</label><span><input type="checkbox" id="num10"></span>
            </div>
            <div class="gnmk">
                <label for="num11">查看学生档案</label><span><input type="checkbox" id="num11"></span>
            </div>
            <div class="gnmk">
                <label for="num12">查看学生档案</label><span><input type="checkbox" id="num12"></span>
            </div>
        </div>


    </div> -->

     <h2 class="tabTitle2">&nbsp;</h2>
    <div class="btposition1">
        <input type="submit" value="保存" class="saveBotton" />
    </div>
</div>
</body>
</html>
