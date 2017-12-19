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
        
        
        
	
});



  
  
  
     	 function show(data){
	     	 
	         var reports=data.reports; 
	        
	         var index=data.index;
	         var count = data.count;
	      
	 
	        showxinxi(reports);
	        showpage(index,count);
	
	    }
	    
	    
	    
	    
	 
	    
	     function showxinxi(reports){
	      $("#list").empty();
	 	 
	    var str="<tr bgcolor='#5f9ea0'><th >编号</th><th>时间</th><th>类型</th><th>员工</th><th>备注</th><th>管理</th></tr>";

	 for(var i=0;i<reports.length;i++){
	   
	     /* $("#list").append("<tr><td><input type='checkbox' name='CheckBox' value='pro1'/></td><td ><a href='employment_department/company.html?id="+companys[i].company_id+"' >"+companys[i].company_id+"</a></td><td>"+companys[i].company_name+"</td><td>"+companys[i].company_job+"</td> <td>"+companys[i].company_phone+"</td><td>"+companys[i].company_station+"</td><td>"+companys[i].company_scope+"</td> <td>"+companys[i].company_category+"</td><td>"+companys[i].company_trade+"</td> <td>"+companys[i].company_type+"</td><td>"+companys[i].company_Address+"</td> <td><a href='employment_department/xiugaiqiye.html?id="+companys[i].company_id+"' class='edit'>编辑</a></td> </tr>"); */
	 
         /* $("list").append("<tr><td><input type='checkbox' name='CheckBox' value='pro1'/></td><td ><a href='chakanbaobiao1.html'>"+reports[i].report_id+"</a></td><td>"+reports[i].report_createtime+"</td><td>"+reports[i].report_type+"</td><td>"+reports[i].work_plan_remarks+"</td> <td><a href='chakanbaobiao1.html' class='edit'>查看</a></td></tr>");	  */
	    var colorr =  reports[i].report_type=="周报"?"#EF4712":"#83639B";
	   
	    str+="<tr><td ><a href='employment_department/jutire2.html?id="+reports[i].report_id+"'>"+(i+1)+"</a></td><td>"+reports[i].report_createtime+"</td><td style='color:"+colorr+";font-weight:bolder'>"+reports[i].report_type+"</td><td>"+reports[i].report_people+"</td><td >-"+reports[i].work_plan_remarks+"-</td> <td><a href='employment_department/jutire2.html?id="+reports[i].report_id+"' class='edit'>查看</a></td></tr>";
	 }
	     
	      $("#list").html(str);
	     
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
		url:"employment_department/showtable1",//请求的url
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
	   else $("#page").append("<span>共"+count+"页</span>");
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
            <td class="tdWidth">报表日期：</td>
            <td> <input type="date" class="dateStyle"  style="width:160px;" name="tabletime"/> 
             
    
              </td>
		 
            <td class="tdWidth">报表类型：</td>
            <td><select name="tableType" class="selectStyle" style="width:120px;" onchange="showinfo(1)">
                <option value="">--请选择--</option>
                <option value="日报">日报</option>
                <option value="周报">周报</option>
               


            </select></td>
            
            
             <td class="tdWidth">员工姓名：</td>
            <td><select name="report_people" class="selectStyle" style="width:120px;" onchange="showinfo(1)">
                <option value="">--请选择--</option>
                <c:forEach var="report" items="${lists }">
                <option value="${report.report_people}">${report.report_people}</option>
                
                </c:forEach>
                
               


            </select></td>
            
            
            
           <td><input type="button" id="queryy" value="搜索" class="searchBotton" onclick="showinfo(1)"/></td>
          
        
        </tr>

      
       </table>
       </form>
    </div>






    <h1 class="tabTitle">报表列表</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable" id="list">
        <tr bgcolor="#5f9ea0">
		  <th><input type="checkbox" id="all"/></th>
          <th >编号</th>
          <th>时间</th>
          <th>类型</th>
            <th>备注</th>
          <th>管理</th></tr>
        <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td ><a href="chakanbaobiao1.html">1001</a></td>
          <td>2017-03-12</td>
          <td>日报</td>
          <td>从青岛回来，安排了C10班同学的就业。</td>
          <td><a href="chakanbaobiao1.html" class="edit">查看</a></td>
        </tr>

          <tr>
              <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
               <td ><a href="chakanbaobiao1.html">1001</a></td>
          <td>2017-03-12</td>
          <td>周报</td>
          <td>从青岛回来，安排了C10班同学的就业。</td>
          <td><a href="chakanbaobiao1.html" class="edit">查看</a></td>
          </tr>
 
       
      </table>
	  <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
        <div class="btposition2">
	       <div><input type="button" class="BackBotton" value="返回"/></div>
	  </div>
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
</body>
</html>
