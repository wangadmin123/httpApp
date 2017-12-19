<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  
  <body>
   <head>
     <base href="<%=basePath%>"> 
    
    <title>My JSP 'ceshi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
	
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css">
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/tab.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/back.js"></script>
    <script type="text/javascript">
    $(function(){showinfo(1);});
     function show(data){
	     	 
	         var oaJybActivitys=data.oaJybActivitys; 
	         
	        
	         var index=data.index;
	         var count = data.count;
	      
	         var list=data.list;
	         
	        showxinxi(oaJybActivitys,list);
	        showpage(index,count);
	
	    }
	    
	     function showxinxi(oaJybActivitys,list){
	      $("#list").empty();
	 	
	    

	 for(var i=0;i<oaJybActivitys.length;i++){
	      
	     /* $("#list").append("<tr><td><input type='checkbox' name='CheckBox' value='pro1'/></td><td ><a href='employment_department/company.html?id="+companys[i].company_id+"' >"+companys[i].company_id+"</a></td><td>"+companys[i].company_name+"</td><td>"+companys[i].company_job+"</td> <td>"+companys[i].company_phone+"</td><td>"+companys[i].company_station+"</td><td>"+companys[i].company_scope+"</td> <td>"+companys[i].company_category+"</td><td>"+companys[i].company_trade+"</td> <td>"+companys[i].company_type+"</td><td>"+companys[i].company_Address+"</td> <td><a href='employment_department/xiugaiqiye.html?id="+companys[i].company_id+"' class='edit'>编辑</a></td> </tr>"); */
	 $("#list").append(" <div class='nn'><a href='employment_department/hdd.html?id="+oaJybActivitys[i].activity_id+"'> <img alt='1234' src='"+list[i][1]+"' style='width: 220px;height: 170px'></a><p class='pp'><a href='employment_department/hdd.html?id="+oaJybActivitys[i].activity_id+"'><span class='mm'>"+oaJybActivitys[i].activity_theme+"        分类："+oaJybActivitys[i].activity_type+"</span></a></p></div>");
	 
	 }
	     
	     
	     
	       /* 	
	        $("#citys").html("");
			  var str="<option value=''>--请选择--</option>"; 
			  for(var i = 0; i < stations.length; i++){
				str+= "<option value=\""+stations[i].company_station+"\">"+stations[i].company_station+"</option>";
			}; 
			   $("#citys").html(str);
			   
			   $("#city").html("");
			   var st="<option value=''>--请选择--</option>";
			 for(var i = 0; i < citys.length; i++){
				st+= "<option value=\""+citys[i].company_city+"\">"+citys[i].company_city+"</option>";
			};   $("#city").html(st); */
			
	    
	    
	    
	  
	
	
	 
	 }  
        
        
        
        function showinfo(index){
      
         
	     /* var query="&index="+index; */
	   
	    /* $.post("employment_department/showlist1.html",query,show,"json");  */
	 
	   $.ajax({
	    
		type:"post",//请求类型
		url:"employment_department/showhuodong?index="+index,//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		
		success: show,
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载就业信息失败！");
		}
	});
	     
	    
	   
	     } 
	     
	     
	      function showpage(index,count){
	 $("#page").empty();
	 if(count != 0){ $("#page").append("<span><a href='javascript:onclick=showinfo(1)'>首页</a></span>");
	 if(index!=1 ){$("#page").append("<span><a href='javascript:onclick=showinfo("+(index-1)+")'>上一页</a></span>");}
	 for(var i=index;i<=index+2;i++){
	 $("#page").append("<span><a href='javascript:onclick=showinfo("+i+")'>"+i+"</a></span>");
	 if(i>count-1){break;}
	 }
	  if(index!=count ){$("#page").append("<span><a href='javascript:onclick=showinfo("+(index+1)+")'>下一页</a></span>");}
	   $("#page").append("<span><a href='javascript:onclick=showinfo("+count+")'>末页</a></span>");
	   $("#page").append("<span>共"+count+"页</span>");}
	   else $("#page").append("<span>共"+count+"页</span>");
	
	 }
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    </script>
    <style type="text/css">
    
    .nn{
    background-color:#84FFFF;
     padding:5px;
    width: 220px;
    display: inline-block;
    
    height: 205px;
    margin-left: 16px;
    padding-left:4px;
    margin-top: 10px;
     border-radius:20px;
    }
    .mm{
    display:inline-block;
    font-family: inherit;
    font-size: 13px;
    color: black;
    margin-top: 8px;
    font-weight: bolder;
    }
    .pp{
    text-align: center;
    }
     .wo{ 
     display:inline-block;
      background-color:#44bb00;
     width:65px;
     height:30px;
     line-height:30px;
     text-align:center; 
     color:#fff;
    font-size:12px;
    font-weight:bold; 
    border:0px;
     border-radius: 3px; 
     margin-right:20px;} 
    </style>
    

  </head>
  <div class="rightContent">
  <h3>活动列表</h3>
  <br>
  
  <hr/>
  
    <div class="ll">
   <div class="hh" id="list"> 
  
  <div class="nn"><a href="ceshi1.jsp"> <img alt="1234" src="statics\employment_department\images1\demoUpload长城.jpg" style="width: 220px;height: 170px"></a>
  
  
  
  <p class="pp"><a href="ceshi1.jsp"><span class="mm">汾河踏青         分类：班级活动</span></a></p>
  </div>
 <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
   <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
    <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
     <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
   <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
        <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
  
  
    <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
 <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
   <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
    <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
     <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
   <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
        <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
  
  
<!--     <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
 <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
   <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
    <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
     <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
   <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
        <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
  
  
   <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
 <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
   <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
    <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
     <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
   <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
        <div class="nn"> <img alt="1234" src="../images/ie.png" style="width: 220px;height: 170px">
  <p class="pp"><span class="mm">汾河踏青         分类：班级活动</span></p>
  </div>
   -->
  
  
  
  
   
   </div>
   
   
   
	       
	       <div id="page">  </div>
	  
   <div class="btposition2">
	       <div><input type="button" class="BackBotton" value="返回"/>
	       <a class="wo" href="employment_department/addhuodong">新增</a>
	       </div></div>
   
   </div>
    </div>
  </body>
</html>
