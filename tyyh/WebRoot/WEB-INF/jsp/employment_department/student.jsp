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
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/student.css">
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <style type="text/css">
    /* 
     .left_div{
     width: 400px;
     height: 140px;
    position:relative;
     left: -420px; 
     display: none; 
     
     }
     */
     div[class*=left_div]{
         width: 400px;
     height: 140px;
    position:relative;
     left: -420px; 
     display: none; 
     top:-120px;
     
     }
    .right_div{
    
     width: 400px;
     height: 140px;
    position:relative;
     right: -220px; 
     display:none;
     top:-120px;
    }
    
    </style>
    <script type="text/javascript">
    
  /*   function show (aa){
  
  
    var str=aa.id.toString();
    
     
    $("#leftz"+str.slice(6)+"").css("display","block");
    
   }
   function shoo(aa){
   
    var str=aa.id.toString();
    
    
    $("#leftz"+str.slice(6)+"").css("display","none");
    
   
   
   }
   
    function shoow (aa){
  
  
    var str=aa.id.toString();
    
     
    $("#righty"+str.slice(6)+"").css("display","block");
    
   }
   function shooo(aa){
   
    var str=aa.id.toString();
    
    
    $("#righty"+str.slice(6)+"").css("display","none");
    
   
   
   } */
   
   $(function(){
     
   showinfo();
   
   
   });
   function showinfo(){
   var query="stuid="+$("#stuid").val();
	   
	    /* $.post("employment_department/showlist1.html",query,show,"json");  */
	 
	   $.ajax({
	    
		type:"post",//请求类型
		url:"employment_department/showjishi?",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		data:query,
		success: show,
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载就业信息失败！");
		}
	});
   }
   function show(data){
   
    $("#lilili").empty();
    $("#lilili").html(data.gradename+"班学员"+data.stuname+"记事");
    $("#stu_line").empty();
   var lists = data.newlist;
   var lists1=data.newlist1;
   
   var i;
   var htmll="";
  
   
   for( i=0;i<lists.length;i++){
      var flag=true;
      for(var j=0;j<lists[i].length;j++){
      if(lists[i][j].isNormal==1){flag=false;}
      }
      
     if(!flag){
     
     var hig=0;
     
      hig=80+45*(lists[i].length-1); 
     htmll+="<div class='stu_left' style='height:"+hig+"px'><label></label><div class='left_line'></div>";
     for(var j=0;j<lists[i].length;j++){
     htmll+="<span>"+lists[i][j].event_name+"</span><span>"+lists[i][j].event_time+"</span>";
     }
     htmll+="</div>";
     }
     
    
     else{
    var hig=0;
     
     hig=80+45*(lists[i].length-1); 
     htmll+="<div class='stu_right' style='height:"+hig+"px'><label></label><div class='right_line'></div>";
     for(var j=0;j<lists[i].length;j++){
     htmll+="<span>"+lists[i][j].event_name+"</span><span>"+lists[i][j].event_time+"</span>";
     }
     htmll+="</div>";
      }
      
     
   } for(i=0;i<lists1.length;i++){
      var hig=0;
     
     hig=80+45*(lists1[i].length-1); 
     htmll+="<div class='stu_right' style='height:"+hig+"px'><label></label><div class='right_line'></div>";
     for(var j=0;j<lists1[i].length;j++){
     htmll+="<span>"+lists1[i][j].eventName+"</span><span>"+lists1[i][j].eventTime+"</span>";
     }
     htmll+="</div>";
      
     
   
   }$("#stu_line").html(htmll);
   }
    </script>
 
</head>
<body>
         <div class="stu" id="stu">
          <input type="hidden" id="stuid" value="${stuid }" >
             <h1 id="lilili">T80班学员张三记事</h1>
            
             <div class="stu_line" id="stu_line">
                 
                
             </div>
         </div>
</body>
</html>