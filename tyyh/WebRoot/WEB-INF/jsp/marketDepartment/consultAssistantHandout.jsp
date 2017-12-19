<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"><head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
    
<title>列表模板</title>
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
				$("#all").attr("checked",false);
			}else{
				$("#all").attr("checked",false);
			}
		}
        ifAllChecked();//页面加载完后运行
	
});
/*表格全选结束*/


$(function(){
            /*点击显示弹出框*/
            $(".pooupBotton").click(function(){
            
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");

            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

});
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",50);
        });
        
	/* 查询 */
  function show(index){
  		var number=$("#number").val();
       	if(number==null){
       		number=10;
       	}
        var temp = $("#formQ").serialize()+"&index="+index+"&pageSizes="+number;
		$.post("Consultway/HandoutFind",temp,showListInfo,"json");
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
    		
    				$("#distributeToteacher").empty();
    				$("#consulters").empty();
    				$("#Nofind").empty();
    			$("#distributeToteacher").append("<div>咨询师："
    						+"<select style='width:130px;' class='selectStyle' ><option value='0' >请选择</option>"
          					+"<c:if test='${ConsultTeacherList !=null}'>"
          					+"<c:forEach var='OaScbConsultTeacher' items='${ConsultTeacherList}'>"
          					+"<option value='${OaScbConsultTeacher.emp_id}'>${OaScbConsultTeacher.emp_name}"
							+"</option>"
          					+"</c:forEach>"
          					+"</c:if>"
          					+"</select>"
            		  		+"&nbsp;<input type='button'  class='searchBotton'  onclick=handoutall("+index+",this) value='分发' />"
            		  		+"</div>");
    		
    					
    				if(data.length==0){
    				$("#consulters").html("哎呀，好像没有该咨询量哦~ ");
    				
    				}else{
	    				for(var i=0;i<data.length;i++ ){
	    					var sex=data[i].sex==1?"男":"女";
	    					if(data[i].sex==0){
	    					sex="暂无";
	    					}
	    					var typ="<tr><td><input type='checkbox' name='CheckBox' value='"+data[i].id+"'></td>"
	    					+"<td>"+(i+1)+"</td>"
	    					+"<td>"+data[i].name+"</td>"
	    					+"<td>"+sex+"</td>"
	    					+"<td>"+data[i].age+"</td>"
	    					+"<td>"+data[i].telphone1+"</td>"
	    					+"<td>"+data[i].city+"</td>"
	    					+"<td>"+data[i].educationName+"</td>"
	    					+"<td class='hha'>"+data[i].consultwayName+"</td>"
	    					+"<td>"+data[i].statusName+"</td>"
	    					/* +"<td ><table><tr>"
          					+"<td class='tdWidth' >咨询师:</td>"
          					+"<td ><select style='width:80px;height:30px;' ><option value='0' >请选择</option>"
          					+"<c:if test='${ConsultTeacherList !=null}'>"
          					+"<c:forEach var='OaScbConsultTeacher' items='${ConsultTeacherList}'>"
          					+"<option value='${OaScbConsultTeacher.emp_id}'>${OaScbConsultTeacher.emp_name}"
							+"</option>"
          					+"</c:forEach>"
          					+"</c:if>"
          					+"</select>"
            		  		+"&nbsp;&nbsp;<input type='button' onclick=Todistribute(this,"+data[i].id+","+index+") class='searchBotton'   value='分发' /></td>"
          					+"</tr> </table></td>" */
	    					+"</tr>";
	    					
	    					$("#consulters").append(typ);
	    				}
	    				
    				}
    			}
    			

/* 分页 */
	function showPage(index,pageCount,totalCount,pageSize){
				$("#page").empty();
				$("#page").append("共"+totalCount+"条记录");
				$("#page").append("<a href=' javascript:onclick=show(1)'>首页</a>");
				var iqishi=1;
	 	if(pageCount>=8){
	 		if((index+4)>=pageCount){
	 		iqishi=pageCount-8;
	 	}else if(index>=5){
	 		iqishi=index-4;
	 	}
	 	}
				if(totalCount!=0){
					if(index!=1){
						$("#page").append("<span><a href=' javascript:onclick=show("+(index-1)+")' >上一页</a></span>");
					}
					for(var i=iqishi;i<=iqishi+8;i++){
						if(i==index){
							$("#page").append("<span><a href=' javascript:onclick=show("+i+")' style='color:red;'>"+i+"</a></span>");
						}else{
							$("#page").append("<span><a href=' javascript:onclick=show("+i+")'>"+i+"</a></span>");
						}
						
				
						if(i>pageCount-1){
							break;
						}
		 			}
					if(index!=pageCount){
					var num=1;
					num= parseInt(index)+num;
						$("#page").append("<span><a href=' javascript:onchange=show("+num+")'>下一页</a></span>");
					}
				}
				
				$("#page").append("<a href=' javascript:onclick=show("+pageCount+")'>末页</a>");
				$("#page").append("<span>共"+pageCount+"页</span>");
				$("#page").append("每页显示的数量：<input type='number' id='number' value="+pageSize+" onchange='show(1)'  min='1' max='100'  class='textStyle' style='width:45px;'/>条");
			} 
    		

/* 批量分发 */
 function handoutall(index,handout){
				var consultTeacherid=$(handout).prev().val();
				
				if(consultTeacherid==0){
					alert("请选择咨询师!");
				}else{
					var a = $("input:checkbox[name='CheckBox']:checked");/* 获得所有被选中的标签(name属性为CheckBox的) */
					var s;
					if(a.length==0){
						alert("请选择要分发的咨询量!");
					}else{
						var result = confirm("确定分发选中的咨询量吗？");
						if(result==true){
							 s = new Array(a.length);/* 创建数组 */
							for(var i=0;i<s.length;i++){
								s[i] = a[i].value;
							}
							$.ajax({
									url:"Consultway/Todistribute",
									type: "POST",
									traditional:true,
									data:{
				        				s:s,
				        				consultTeacherid:consultTeacherid,
				        				employee_id:${loginUser.emp_id}
				       		 		},
				       		 		dataType:"text",
									success:function(data){
								
										if(data=="false"){
											alert("回收错误！");
										}
										if(data=="true"){
							    			var to=$(handout).prev().val();
											$.ajax({
												url:"adviceadd",
												type:"GET",
												data:{"from":parent.user,"content":"收到"+s.length+"条咨询量","to":to},
												datatype:"text",
								    			success:function(dat){
								    				var temp="{from:'"+parent.user+"',content:'收到"+s.length+"条咨询量',to:'"+to+"'}";
													parent.ws.send(temp);
													show(index);
								    			}
								    		});	
										}
										if(data=="口碑更新错误！"){
											alert("口碑更新错误！")
										}
										
										/* findHandOut(index); */
									},
									
								});
						}/* else{
							findHandOut(index);
						}  */
					}	 
				}
		}





   /* 查询按钮 */		
   $(function(){
  
   		show(1);
   		  
   		$("#btn").click(function(){
   		
			show(1);
		});
   });
   
  /*  分发按钮 */
  function Todistribute(info,Id,index){

  		var consultTeacherId=$(info).prev().val();
  		
  		/* var consultTeacherid="consultTeacherid="+consultTeacherId;
  		var id="id="+Id+"&consultTeacherid="+consultTeacherId; */
  		if(consultTeacherId==0){
  		alert("请选择咨询师进行分发")
  		}else{
  		/* $.post("Consultway/Todistribute",id,callback,"json"); */
	  		var result=confirm("确定分发?");
	  		if(result){
		  		$.ajax({
		  			url:"Consultway/Todistribute",
		  			type:"post",
		  			data:{
			  			consultTeacherid:consultTeacherId,
			  			id:Id,
		  			},
		  			
		  			dataType:"text",
		  			success:function callback(data){
		  			
		  				 if(data=="0"){
 	 					alert("请选择咨询师进行分发");
					 	 }else if(data=="true"){
					 	 	show(index);
					 	 }else{
					 	 	alert("分发失败!")
					 	 }
		  			}
		  		});
	  		}
  		}
  }



/* 显示查询咨询量 */
function showQuery(){
window.location.href="Consultway/consultAssistantQuery";
}
/* 显示分发咨询量 */
function showHandout(){
	window.location.href="Consultway/ToHandout";
}
/* 报名审核 */
function EnrollCheck(){
window.location.href="Consultway/ToconsultAssistantEnrollCheck";
}	

 function showHistory() {
	window.location.href="director/historyCon";
}
function showUseless() {
	window.location.href="director/consultAssistantUseless";
}	
function showHistory() {
	window.location.href="director/consultAssistanthistoryCon";
}
</script>
</head>
<body>
<div class="rightContent">
	<div class="tabs" id="tabs"  >
      <span class="spanOut" 	 onclick="showQuery()">查询咨询量</span>
      <span class="spanHover" onclick="showHandout()" >分发咨询量</span>
      <span class="spanOut"   onclick="EnrollCheck()" >报名审核</span>
      <span class="spanOut"   onclick="showUseless()" >查看无效量</span>
        <span class="spanOut" id="spanLast"   onclick="showHistory()">查看历史量</span>
  	</div>

  <div class="tabContent">
  <h1 class="tabTitle">分发咨询量</h1>
    <div class="serach">
     <form id="formQ" >
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;  text-align: right; margin-left:100px;" >
        
         	 <tr>
		     	<td>姓名:</td><td style="text-align: left;"><input type="search" name="name"  class="searchStyle" style="width:130px;"/></td>
          		
          		<td class="tdWidth" >咨询量分类：</td><td style="text-align: left;">
                            <select class="selectStyle" style="width:130px;" name="type"></div>
                            <option value="0" name="type" >全部</option>
                            <option value="1" name="type" >常规</option>
                            <option value="2" name="type" >市场</option>
                            </select>
                </td>          
         		
          		</tr>
          		<tr>
		
	           <td class="tdWidth">咨询课程：</td><td style="text-align: left;">
                            <select class="selectStyle" name="consultLesson" style="width:130px;">
                                <option value="0">全部</option>
                                <c:if test="${SpecialtyList !=null}">
						
						<c:forEach var="lesson" items="${SpecialtyList}">
							<option <c:if test="${lesson.id == consultLesson}">selected="selected"</c:if>
							 value="${lesson.id}">${lesson.consultLesson}
							</option>
						</c:forEach>
				 	 </c:if>                                
                       </select>
                </td>     	       	
          	<td class="tdWidth">咨询方式：</td><td style="text-align: left;">
          			  
                            <select class="selectStyle" style="width:130px;" name="consultWay">
                                <option value="0">全部</option>
                                <c:if test="${ConsultwayLsit !=null}">
									<c:forEach var="OaScbConsultway" items="${ConsultwayLsit}">
										<option <c:if test="${OaScbConsultway.id == consultWay}">selected="selected"</c:if>
							 				value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
										</option>
									</c:forEach>
				  				</c:if>
                            </select>
                     </td>
        	   </tr>
        	</table>
         <div style="text-align: right;" >
        <input type="button" id="btn" value="搜索" class="searchBotton" />
        </div>
        </form>
    </div>
  <div class="btposition2" id="distributeToteacher">
    	<!-- <div>
         咨询师:	
             <select class="selectStyle" style="width:130px;">
                  <option>宋强</option>
                  <option>乔珊珊</option>
                  
              </select>
    <input type="submit"  value="分发" class="searchBotton" />  
  
    </div> -->
    </div>




    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <thead>
        <tr>
		  <th><input type="checkbox" id="all"/></th>
          <th>序号</th>
          <th>咨询者姓名</th>
          <th>性别</th>
          <th>年龄</th>
          <th>联系方式</th>
          <th>城市</th>
          <th>学历</th>
          <th>咨询方式</th>
          <th>状态</th>
         <!--  <th>操作</th> -->
        </tr>
		</thead>
		<tbody id="consulters">
		
		</tbody>

 	 <!--  <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
          <td>1001</td>
          <td>2017-01-01</td>
          <td>李四</td>
          <td>男</td>
          <td>18</td>
          <td>123234546</td>
          <td>太原</td>
          <td>博士后</td>
          <td>电话</td>
          <td>待业</td>
          <td >
          <table >
          		<tr>
          			<td class="tdWidth">咨询师:</td>
          			<td>
           			  <select >
		                  <option>宋强</option>
		                  <option>乔珊珊</option>
             		 </select>
            		  <input type="submit"  value="分发" /> 
          			</td>
          		</tr>
          </table>
          </td>
        </tr>  -->
      </table>
        <div id="Nofind">
        </div>
	  <div id="page"></div>
  

  </div>
</div>





</body></html>