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


        function getPositionNames(depart_id) {
	        if(depart_id == ""){
	        	alert("depart_id没有值");
	        	var str = "";
	        	$("#position_id").empty();
	        		str+="<option value=''>--请选择--</option>";
	        	$("#position_id").html(str);
	        }else{
	        	/* alert("depart_id有值"); */
	        	$.ajax({
					type:"post",
					url:"getData/position?depart_id="+depart_id,
		            datatype:"json",
		            success:function(data){
		            var data = eval("("+data+")"); 
		                var str = "";
		                $("#position_id").empty();
		                str+="<option value=''>--请选择--</option>";
		                for(var i=0 ; i < data.length ; i++){
		                	str+="<option value='"+data[i].position_id+"' onchange='getsubfields(this.options[this.selectedIndex].value)' >"+data[i].position_name+"</option>";
		                }
		                $("#position_id").html(str);
		            }
				});
	        }
		}
		function getsubfields(position_id) {
	        if(position_id == ""){
	        	/* alert("depart_id没有值"); */
	        	var str = "";
	        	$("#subfield_id").empty();
	        		str+="<option value=''>--请选择--</option>";
	        	$("#subfield_id").html(str);
	        	
	        }else{
	        	/* alert("depart_id有值"); */
	        	$.ajax({
					type:"post",
					url:"getData/subfieldsByPosition?position_id="+position_id,
		            datatype:"json",
		            success:function(data){
		            var data = eval("("+data+")"); 
		                var str = "";
		                $("#subfield_id").empty();
		                str+="<option value=''>--请选择--</option>";
		                for(var i=0 ; i < data.length ; i++){
		                	str+="<option value='"+data[i].subfield_id+"'>"+data[i].show_name+"</option>";
		                }
		                $("#subfield_id").html(str);
		            }
				});
	        }
		}
	function showPositionList(data) {
		/* alert(data);  */
		$("#emp_position").html(data);
	}
    $(function() {
		$("#position_id").change(function() {
			var position_id=$("#position_id").val();
			var subfield_id=$("#subfield_id").val();
			/* alert(position_id+"+++"+subfield_id); */
			if (position_id=="" || subfield_id==""){
			   	$("#submit").attr("disabled", "disabled");
			   	$("#submit").next().text("请确认信息完整性");
			}else{
			    $("#submit").removeAttr("disabled");
			    $("#submit").next().text("");
			}
		});
		$("#subfield_id").change(function() {
			var position_id=$("#position_id").val();
			var subfield_id=$("#subfield_id").val();
			/* alert(position_id+"+++"+subfield_id); */
			if (position_id=="" || subfield_id==""){
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
			<h1 class="tabTitle">功能组移除职位</h1>
			<form action="subfield/subfield_out_position" method="post">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth">部门：</td>
						<td><select class="selectStyle"onchange="getPositionNames(this.options[this.selectedIndex].value)" 
						name="depart_id" id="depart_id" style="width:120px;">
						<option value="">--请选择--</option>
						<c:forEach var="department" items="${departments }">
							<option value="${department.depart_id }">${department.depart_name }</option>
						</c:forEach>
						</select></td>
					</tr>
					<tr>
						<td class="tdWidth">职位：</td>
						<td><select class="selectStyle" name="position_id" onchange="getsubfields(this.options[this.selectedIndex].value)"
							id="position_id" style="width:120px;">
								<option value="">--请选择--</option>
						</select></td>
					</tr>
					<tr>
						<td class="tdWidth">功能组：</td>
						<td><select class="selectStyle" 
						name="subfield_id" id="subfield_id" style="width:120px;">
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