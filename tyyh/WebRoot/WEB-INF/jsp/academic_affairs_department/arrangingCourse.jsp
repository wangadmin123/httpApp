<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>排班</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
<script type="text/javascript">
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
					$("#all").attr("checked",false);
				}else{
					$("#all").attr("checked",false);
				}
			}
	        ifAllChecked();//页面加载完后运行
		
	});
	/*表格全选结束*/
		/* 查询 */
  function show(index){
  		var number=$("#number").val();
       	if(number==null){
       		number=10;
       	}
        var temp = "&index="+index+"&pageSizes="+number;
		$.post("getUnArranging",temp,showListInfo,"json");
  }
  
  		function showListInfo(data){
		
			var index=data.index;
			var pageCount=data.pageCount;
			var consulterList=data.consulterList;
			var totalCount=data.totalCount;
			var pageSize=data.pageSize;
			showInfo(index,consulterList);
			showPage(index,pageCount,totalCount,pageSize);
		}
  		
    		function showInfo(index,data){
    				$("#consulters").empty();
    				$("#Nofind").empty();
    					
    				if(data.length==0){
    				$("#Nofind").html("哎呀，都排完了哦~ ");
    				
    				}else{
	    				for(var i=0;i<data.length;i++ ){
	    					var type=data[i].specialtyID==1?"A班":"C班";
							var stage1="";
							if(data[i].stage==1){
								stage1="S1";
							}else if(data[i].stage==2){
								stage1="S2";
							}else{
								stage1="Y2";
							}
	    					var typ="<tr><td><input type='checkbox' name='CheckBox' value='"+data[i].id+"'></td>"
	    					+"<td>"+(i+1)+"</td>"
	    					+"<td>"+data[i].name+"</td>"
	    					+"<td>"+type+"</td>"
	    					+"<td>"+stage1+"</td>"
	    					+"<td>"+data[i].createTime+"</td>"
	    					+"</tr>";
	    					
	    					$("#consulters").append(typ);
	    				}
	    				
    				}
    			}
    			

/* 分页 */
function showPage(index,pageCount,totalCount,pageSize){
				$("#page").empty();
			
			
				if(index!=1){
					$("#page").append("<a href='javascript:onclick=show(1) '>首页</ a>");
					$("#page").append("<a href=' javascript:onclick=show("+(index-1)+")'>上一页</ a>");
				}
		
				for(var i=1;i<=pageCount;i++){
					if(i==index){
					$("#page").append("<span>"+i+"</span>");
					}else{
					$("#page").append("<a href='javascript:onclick=show("+i+")'>"+i+"</ a>");
					}
					
			 	}
	
				if(index!=pageCount){
					$("#page").append("<a href=' javascript:onclick=show("+(parseInt(index)+1)+")'>下一页</ a>");
					$("#page").append("<a href=' javascript:onclick=show("+pageCount+")'>末页</ a>");
				}
				
				
				$("#page").append("<span>共"+pageCount+"页</span>&nbsp;"+totalCount+"&nbsp;条数据</span>&nbsp;");
				$("#page").append("每页显示的数量：<input type='number' id='number' onchange='changenum()' value="+pageSize+"   min='1' max='100'  class='textStyle' style='width:45px;'/>条");
}
function paike(){
				var number=$("#number").val();
		       	if(number==null){
		       		number=10;
		       	}
				var consultTeacherid=$(".selectStyle").val();
				if(consultTeacherid==0){
					alert("请选择要分配的时间");
				}else{
					var a = $("input:checkbox[name='CheckBox']:checked");/* 获得所有被选中的标签(name属性为CheckBox的) */
					var s;
					if(a.length==0){
						alert("请选择要分配的班级!");
					}else{
						var result = confirm("确定要为这些班级分配吗？");
						if(result==true){
							 s = new Array(a.length);/* 创建数组 */
							for(var i=0;i<s.length;i++){
								s[i] = a[i].value;
							}
							$.ajax({
									url:"addArrange",
									type: "POST",
									traditional:true,
									data:{
				        				s:s,
				        				consultTeacherid:consultTeacherid,
				       		 		},
				       		 		dataType:"text",
									success:function(data){
								
										if(data=="false"){
											alert("回收错误！");
										}
										if(data=="true"){
							    		show(1);
										}
										if(data=="口碑更新错误！"){
											alert("口碑更新错误！")
										}
										
									},
									
								});
						}
					}	 
				}
		}
function changenum(){
	show(1);
}
 $(function(){
   		show(1);  
   		$("#number").change(function(){
   			show(1);
   		});
   });
</script>
  </head>
  
  <body>
    <div class="rightContent">
    	<div class="tabContent">
    	   <h1 class="tabTitle">安排课程</h1>
    	   <div class="btposition2" id="distributeToteacher">
		    	 <div>
		         上课时间分配:	
		             <select class="selectStyle" style="width:130px;">
		                  <option value="0">请选择</option>
						  <option value="1">上午</option>
						  <option value="2">下午</option>
		                  <option value="3">全天</option>
		              </select>
		    <input type="button"  class="searchBotton"  onclick="paike()" value="排课" />  
		  
		    </div> 
		    </div>
    	   <div class="serach">
    			<div class="divTable" >
				      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
				        <thead>
				        <tr>
						  <th><input type="checkbox" id="all"/></th>
				          <th>序号</th>
				          <th>班级</th>
				          <th>班级类型</th>
				          <th>班级阶段</th>
				          <th>开班时间</th>
				        </tr>
						</thead>
						<tbody id="consulters">
						
						</tbody>
				      </table>
				        <div id="Nofind">
				        </div>
					  <div id="page"></div>
    	   </div>
    	</div>
    </div>
  </body>
</html>
