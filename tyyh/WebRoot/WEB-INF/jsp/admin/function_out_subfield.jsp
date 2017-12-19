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
<title>新增功能组信息</title>
<link rel="stylesheet" type="text/css"
	href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css" />
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/css/switch.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript">


        function getfunctionname(subfield_id) {
	        if(subfield_id == ""){
	        	var str = "";
	        	$("#function_id").empty();
	        		str+="<option value=''>--请选择--</option>";
	        	$("#function_id").html(str);
	        	
	        }else{
	        	/* alert("depart_id有值"); */
	        	$.ajax({
					type:"post",
					url:"getData/functionBySubfield?subfield_id="+subfield_id,
		            datatype:"object",
		            success:function(data){
		            var data = eval("("+data+")");
		                var str = "";
		                $("#function_id").empty();
		                str+="<option value=''>--请选择--</option>";
		                for(var i=0 ; i < data.length ; i++){
		                	str+="<option value='"+data[i].function_id+"'>"+data[i].function_name+"</option>";
		                }
		                $("#function_id").html(str);
		            }
				});
	        }
		}
    $(function() {
		$("#subfield_id").change(function() {
			var subfield_id=$("#subfield_id").val();
			var function_id=$("#function_id").val();
			/* alert(position_id+"+++"+subfield_id); */
			if (subfield_id=="" || function_id==""){
			   	$("#submit").attr("disabled", "disabled");
			   	$("#submit").next().text("请确认信息完整性");
			}else{
			    $("#submit").removeAttr("disabled");
			    $("#submit").next().text("");
			}
		});
		$("#function_id").change(function() {
			var subfield_id=$("#subfield_id").val();
			var function_id=$("#function_id").val();
			/* alert(position_id+"+++"+subfield_id); */
			if (subfield_id=="" || function_id==""){
			   	$("#submit").attr("disabled", "disabled");
			   	$("#submit").next().text("请确认信息完整性");
			}else{
			    $("#submit").removeAttr("disabled");
			    $("#submit").next().text("");
			}
		});
	}); 
        
    </script>
</head>
<body>
	<div class="rightContent">

		<div class="tabContent">
			<h1 class="tabTitle">功能移出功能组</h1>
			<form action="function/function_out_search" method="post">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth">功能组：</td>
						<td><select class="selectStyle"onchange="getfunctionname(this.options[this.selectedIndex].value)" 
						name="subfield_id" id="subfield_id" style="width:120px;">
						<option value="">--请选择--</option>
						<c:forEach var="subfield" items="${subfields }">
							<option value="${subfield.subfield_id }">${subfield.subfield_name }</option>
						</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="tdWidth">功能：</td>
						<td><select class="selectStyle" name="function_id"
							id="function_id" style="width:120px;">
								<option value="">--请选择--</option>
						</select></td>
					</tr>
				</table>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<input type="submit" id="submit" disabled="disabled" value="保存" class="saveBotton" /><span></span>
				</div>
			</form>
		</div>
	</div>
	<div class="saveStyle">
		保存成功！（<span class="setTime"></span>）
	</div>

</body>
</html>