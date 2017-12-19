<%@page import="cn.tyyhoa.pojo.OaJwbFuckType"%>
<%@page import="cn.tyyhoa.pojo.OaJwbFuckClass"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>排课</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>

<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
 <script type="text/javascript" src="statics/common/js/index.js"></script>  
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<style type="text/css">
	table{
		margin:20px auto 0;
	}
	td,th{
		padding:10px 20px;
		text-align: center;
		border-bottom:1px solid #ddd;
	}
	input{
		padding:5px 10px;
		background:green;
		color:#fff;
		border-radius:5px;
		border:0;
		outline:none;
	}
	tr:nth-child(odd){
		background:#ddd;
	}
	tr:nth-child(1){
	background:#999;
	}
</style>
<script type="text/javascript">
$(function(){
	$("input[type='button']").click(function(){
		var btntxt=$(this).val();
		if(btntxt=="修改"){
			$(this).val("保存");
			$(this).parent().prevAll().children().removeAttr("disabled");
		}else{
			var btn=$(this);
			var gradeId=$(this).parent().prevAll().children("[name='gradeId']").val();
			var mon=$(this).parent().prevAll().children("[name='mon']").val();
			var tue=$(this).parent().prevAll().children("[name='tue']").val();
			var wed=$(this).parent().prevAll().children("[name='wed']").val();
			var thu=$(this).parent().prevAll().children("[name='thu']").val();
			var tri=$(this).parent().prevAll().children("[name='tri']").val();
			var sat=$(this).parent().prevAll().children("[name='sat']").val();
			var dxt="gradeId="+gradeId+"&mon="+mon+"&tue="+tue+"&wed="+wed+"&thu="+thu+"&tri="+tri+"&sat="+sat;
			$.post("jwb/updateClass.html",dxt,function(data){
				if(data=="1"){
					$(btn).val("修改");
					$(btn).parent().prevAll().children().attr("disabled","disabled");
				}else{
					alert("修改失败！");
				}
			},"json");
		}
	});
});
</script>
  </head>
  
  <body>
    <table border="0" cellpadding="0" cellspacing="0" >
    	<tr>
    	<th>编号</th><th>班级</th><th>班主任</th><th>教员</th>
    	<th>星期一</th><th>星期二</th><th>星期三</th><th>星期四</th><th>星期五</th><th>星期六</th>
    	<th>操作</th>
    	</tr>
    	<%
    		List<OaJwbFuckClass> listClass=(List<OaJwbFuckClass>)request.getAttribute("class");
			List<OaJwbFuckType> listType=(List<OaJwbFuckType>)request.getAttribute("type");
			int i=1;
			for(OaJwbFuckClass listC:listClass){%>
				<tr>
					<td><%=i %></td>
					<td><%=listC.getGrade().getName() %><input name="gradeId" type="hidden" value="<%=listC.getGrade().getId() %>" ></td>
					<td><%=listC.getGrade().getTeacher() %></td>
					<td><%=listC.getGrade().getClassTeacher() %></td>
					<td><select name="mon" disabled="disabled">
							<%for(OaJwbFuckType listT:listType){%>
								<option value="<%=listT.getId() %>" <%if(listC.getMon().getId()==listT.getId()){ %>selected="selected"<%} %>  >
									<%=listT.getType() %></option>
								<%}%>
						</select></td>
						<td><select name="tue" disabled="disabled" >
							<%for(OaJwbFuckType listT:listType){%>
								<option value="<%=listT.getId() %>" <%if(listC.getTue().getId()==listT.getId()){ %>selected="selected"<%} %>  >
									<%=listT.getType() %></option>
								<%}%>
						</select></td>
						<td><select name="wed" disabled="disabled" >
							<%for(OaJwbFuckType listT:listType){%>
								<option value="<%=listT.getId() %>" <%if(listC.getWed().getId()==listT.getId()){ %>selected="selected"<%} %>  >
									<%=listT.getType() %></option>
								<%}%>
						</select></td>
						<td><select name="thu" disabled="disabled" >
							<%for(OaJwbFuckType listT:listType){%>
								<option value="<%=listT.getId() %>" <%if(listC.getThu().getId()==listT.getId()){ %>selected="selected"<%} %>  >
									<%=listT.getType() %></option>
								<%}%>
						</select></td>
						<td><select name="tri" disabled="disabled" >
							<%for(OaJwbFuckType listT:listType){%>
								<option value="<%=listT.getId() %>" <%if(listC.getTri().getId()==listT.getId()){ %>selected="selected"<%} %>  >
									<%=listT.getType() %></option>
								<%}%>
						</select></td>
						<td><select name="sat" disabled="disabled" >
							<%for(OaJwbFuckType listT:listType){%>
								<option value="<%=listT.getId() %>" <%if(listC.getSat().getId()==listT.getId()){ %>selected="selected"<%} %>  >
									<%=listT.getType() %></option>
								<%}%>
						</select></td>
						<td><input type="button" value="修改" ></td>
				</tr>
				
			<%
			i++;
			}
    	 %>
    </table>
  </body>
</html>
