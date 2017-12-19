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
<title>列表模板</title>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
<script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>


<script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
<script type="text/javascript" src="statics/employment_department/laydate/laydate.js"></script>
<script type="text/javascript" src="statics/employment_department/js/back.js"></script>
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
      
          showinfo(1); 
      
      //新增的JS
      
      
      
	     
	     
	       $("#queryy").click(function(){
	  
	      showinfo(1);
	      }); 
	   
	     
	    
	     
        
        
	
});


	     	 function show(data){
	     	 
	         var companys=data.companys; 
	         var citys=data.citys;
	         var stations = data.stations;
	         var index=data.index;
	         var count = data.count;
	      
	 
	        showxinxi(companys,citys,stations);
	        showpage(index,count);
	
	    }
	    
	    
	    
	    
	 
	    
	     function showxinxi(companys,citys,stations){
	      $("#list").empty();
	 	 
	 $("#list").append(" <tr bgcolor='#5f9ea0'><th >编号</th><th>企业名称</th><th>联系人</th> <th>职务</th><th>联系方式</th><th>招聘岗位</th><th>企业规模</th><th>企业关系</th><th>行业</th><th>合作类型</th> <th>城市</th> <th>管理</th> </tr>");

	 for(var i=0;i<companys.length;i++){
	   
	     $("#list").append("<tr><td ><a href='employment_department/company.html?id="+companys[i].company_id+"' >"+(i+1)+"</a></td><td><a href='employment_department/company.html?id="+companys[i].company_id+"' >"+companys[i].company_name+"</a></td><td>"+companys[i].company_person+"</td><td>"+companys[i].company_job+"</td> <td>"+companys[i].company_phone+"</td><td>"+companys[i].company_station+"</td><td>"+companys[i].company_scope+"</td> <td>"+companys[i].company_category+"</td><td>"+companys[i].company_trade+"</td> <td>"+companys[i].company_type+"</td><td>"+companys[i].company_city+"</td> <td><a href='employment_department/xiugaiqiye.html?id="+companys[i].company_id+"' class='edit'>编辑</a><a href='employment_department/company.html?id="+companys[i].company_id+"' class='edit' >查看</a></td></tr>");
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
      
         
	     var query=$("#query").serialize()+"&index="+index;
	   
	    /* $.post("employment_department/showlist1.html",query,show,"json");  */
	 
	   $.ajax({
	    
		type:"post",//请求类型
		url:"employment_department/showlist?",//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		data:query,
		success: show,
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载就业信息失败！");
		}
	});
	     
	    
	   
	     } 
	     
	     
	      function showpage(index,count){
	 $("#page").empty();
	 if(count != 0){
	 $("#page").append("<span><a href='javascript:onclick=showinfo(1)'>首页</a></span>");
	 if(index!=1){$("#page").append("<span><a href='javascript:onclick=showinfo("+(index-1)+")'>上一页</a></span>");}
	 for(var i=index;i<=index+2;i++){
	 $("#page").append("<span><a href='javascript:onclick=showinfo("+i+")'>"+i+"</a></span>");
	 if(i>count-1){break;}
	 }
	  if(index!=count){$("#page").append("<span><a href='javascript:onclick=showinfo("+(index+1)+")'>下一页</a></span>");}
	   $("#page").append("<span><a href='javascript:onclick=showinfo("+count+")'>末页</a></span>");
	   $("#page").append("<span>共"+count+"页</span>");}
	   
	   else{$("#page").append("<span>共"+count+"页</span>");}
	 }
        
        
       

/*表格全选结束*/

</script>





	
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <div class="serach">
    <form id="query" >
         <table id="query2" cellpadding="0" cellspacing="0"  class="searchTable" border="0"  style="width:80%;">
        <tr>
		  <td>企业名称：</td> <td><input type="search"  id="lilili" onkeyup="return showinfo(1)"  name="company_name"  class="searchStyle" style="width:160px;"/></td>
            <td class="tdWidth">招聘岗位：</td>
            <td > <select id="citys" name="company_station" class="selectStyle" style="width:120px;" onchange="showinfo(1)">
              <!--   <option>java开发工程师</option>
                <option>ios开发工程师</option>
                <option>android开发工程师</option>
                <option>实施工程师</option>
                <option>游戏策划</option>
                <option>游戏设计开发</option>  -->
                	<c:if test="${stations != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="station" items="${stations}">
									   		<option  value="${station.company_station}">${station.company_station}</option>
									   </c:forEach>
									</c:if>
 
            </select>
            
            
            
            </td>
            <td class="tdWidth" id="stations">城市：</td>
            <td><select name="company_city"class="selectStyle" style="width:120px;" id="city" onchange="showinfo(1)">
              <c:if test="${citys != null }">
									   <option value="">--请选择--</option>
									   <c:forEach var="city" items="${citys}">
									   		<option value="${city.company_city}">${city.company_city}</option>
									   </c:forEach>
									</c:if>

            </select></td>
            <td class="tdWidth">企业关系：</td>
            <td><select name="company_category" class="selectStyle" style="width:120px;" onchange="showinfo(1)">
                <option value="">--请选择--</option>
                <option value="良好">良好</option>
                <option value="中等">中等</option>
                <option value="一般">一般</option>
                <option value="较差">较差</option>


            </select></td>
           <td><input type="button" id="queryy" value="搜索" class="searchBotton" /></td>
          
        
        </tr>

      
       </table>
       </form>
    </div>

    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable" >
      <table id="list" cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr bgcolor="#5f9ea0">
		  <th><input type="checkbox" id="all"/></th>
          <th >编号</th>
          <th>企业名称</th>
          <th>职务</th>
            <th>联系方式</th>
          <th>招聘岗位</th>
          <th>企业规模</th>
            <th>企业类别</th>
          <th>公司行业</th>
          <th>企业类型</th>

          <th>公司地址</th>
            <th>管理</th>

        </tr>
        
        <%--  <c:if test="${companys != null }">
									  
									   <c:forEach var="company" items="${companys}">
									   <tr>
		                            <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
                                      <td ><a href="company.html" >${company.company_id}</a></td>
									   <td>${company.company_name}</td>
									   <td>${company.company_job}</td>
									   <td>${company.company_phone}</td>
									   <td>${company.company_station}</td>
									   <td>${company.company_scope}</td>
									   <td>${company.company_category}</td>
									   <td>${company.company_trade}</td>
									   <td>${company.company_type}</td>
									   <td>${company.company_Address}</td>
									  
									   
									   <td><a href="xiugaiqiye.html" class="edit">编辑</a></td>
									   
									    </tr>
									   
									   
									   		
									   </c:forEach>
									</c:if> --%>
   <!--      <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td ><a href="company.html" value="">1001</a></td>
          <td>北大青鸟</td>
          <td>开发主管</td>
          <td>182****2950</td>
          <td>java开发师</td>
          <td>100</td>
            <td>A</td>
          <td>计算机软件</td>
           <td>民营</td>

            <td>万达广场</td>

          <td><a href="xiugaiqiye.html" class="edit">编辑</a></td>
          
          
          
          
          
        </tr> -->
        

          <!-- <tr>
              <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
              <td ><a href="company.html?id="+>1001</a></td>
              <td>北大青鸟</td>
              <td>开发主管</td>
              <td>182****2950</td>
              <td>java开发师</td>
              <td>100</td>
              <td>B</td>
              <td>计算机软件</td>
              <td>民营</td>

              <td>万达广场</td>

               <td><a href="xiugaiqiye.html" class="edit">编辑</a></td>
          </tr> -->
 
       
      </table>
	  <div id="page"><!-- 当前1-2条
	  
	                              
	  
	  
	  
	  
	  
	   <span><a href="">1</a></span><span>2</span><span>3</span><span>4</span><span>5</span>共13页 --></div>
        <div class="btposition2">
	       <div><input type="button" class="BackBotton" value="返回"/></div>
	  </div>
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
</body>
</html>
