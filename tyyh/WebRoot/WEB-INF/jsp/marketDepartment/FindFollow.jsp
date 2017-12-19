<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'FindFollow.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css" />
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
function follow(Id,stuId){
	var id="id="+Id+"&stuId="+stuId;
	
	$.post("Consultway/AssistantOaScbVisitFind",id,AssistantOaScbVisitFind,"json");
	

}
function AssistantOaScbVisitFind(data){

	if(data.length==0||data==null){
		$("#VisitInfo").html("<h1>暂无该跟踪记录</h1><input type='button'  value='返回' class='saveBotton' />");
		 $(".saveBotton").click(function(){
            var pId=${loginUser.position.position_id};
  					window.history.go(-1);	
            });
	}else{
	
	$("#VisitInfo").empty();
	var temp="";
	var num=data.length;
			 for ( var i = 0; i < data.length; i++) {
				temp+="<span style='line-height:25px;color:#000;display:block;'>第"+(num-i)+"次回访</span><span style='line-height:25px;color:#000;display:block;'>本次回访时间："+data[i].returnvisitTimes+"&nbsp;&nbsp;&nbsp;"
					+"回访人："+data[i].returnvisitPeopleName+"&nbsp;&nbsp;&nbsp;</span>"
					+"<span style='line-height:25px;color:#000;display:block;'>下次回访时间："+data[i].nextvisitTimes+"</span>"
			 		+"<span style='line-height:25px;color:#000;display:block;'>回访内容:"+data[i].returnvisitRecord+"</span>"
			 		+"<h6 style='clear:both;border-bottom:1px solid #ccc;height:10px;margin:0px; padding:0px;'></h6>";
				}
	
	 $("#VisitInfo").append("<tr><td class='tdWidth'>咨询量姓名：</td>"
                        +"<td><label >"+data[0].consultName+"</label></td>"
                        +"<td class='tdWidth'>当前负责咨询师：</td>"
                        +"<td><label >"+data[0].consultTeacherName+"</label></td></tr>"
                        +"<tr><td class='tdWidth'>回访记录：</td>"
                        +"<td colspan='3'><div style='width:420px; border:1px solid #ccc;padding:5px;'>"+temp+"</div></td></tr>"
                        +"<tr><td colspan='5'  style='text-align: center;'>"
                    	+"<input type='button'  value='返回' class='saveBotton' /></td></tr>");
        
        
            /*返回*/
            $(".saveBotton").click(function(){
          	  window.history.go(-1);
            });
      }
}	
$(function(){
var id="${id}";
var stuId="${stuId}";
follow(id,stuId);


});
</script>
</head>
<div class="tabContent">
	<h1 class="tabTitle">查询咨询量跟踪情况</h1>
</div>
<table cellpadding="0" cellspacing="0" border="0" class="addTable">
	<tbody id="VisitInfo">
	</tbody>

</table>
</div>
<body>

</body>
</html>

