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
<link rel="stylesheet" type="text/css" href="statics/common/css/searchEx.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/cssstyle/addpatrol.css"/>

<link rel="stylesheet" type="text/css" href="statics/common/cssstyle/jquery-labelauty.css"/>
<script type="text/javascript" src="statics/common/AssistantJs/jquery-labelauty.js"></script>  


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
        
        
        function show(index){
        var number=$("#number").val();
       	if(number==null){
       		number=10;
       	}
        
	        var temp = $("#formQ").serialize()+"&index="+index+"&pageSizes="+number;
			
			$.post("Consultway/consultAssistantEnrollCheckQuery",temp,showListInfo,"json");
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
    		
    			/* 批量操作按钮 */
    			$("#batch").empty();
    			$("#batch").append("<div><input type='button' class='pooupBotton' onclick=batchPass() value='通过'>"
         	 	 +"<input type='button' class='pooupBotton' onclick=batchNoPass()  value='待定'> </div>");
        
    			
    			$("#consulters").empty();
    			if(data.length==0){
    			   $("#consulters").html("<tr><td colspan='12'>哎呀，好像没有该咨询量哦~</td></tr>");
    			}else{
    				for ( var i = 0; i < data.length; i++) {
					var sex = data[i].sex==1?"男":"女";
					$("#consulters").append("<tr><td ><input type='checkbox' name='CheckBox' value="+data[i].id+"|"+data[i].name+"|"+data[i].consultTeacher+"|"+data[i].consultTeacherName+"></td><td class='pooupBottons' >"+(i+1)+"</td>"
					+"<td>"+data[i].name+"</td><td class='pooupBottons' >"+data[i].age+"</td><td class='pooupBottons' >"+sex+"</td><td class='pooupBottons' >"+data[i].consultTeacherName+"</td><td class='pooupBottons' >"+data[i].consultLessonName+"</td>"
					+"<td>"+data[i].payMoney+"</td><td>"+data[i].payTypeName+"</td><td>"+data[i].enrollTimes+"</td>"
					+"<td>"+data[i].telphone1+"</td><td>"+data[i].ungenTelphone+"</td>"
					+"</tr>");
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

/* 批量待定按钮 */
function batchNoPass(){
var a = $("input:checkbox[name='CheckBox']:checked");/* 获得所有被选中的标签(name属性为CheckBox的) */
var s;
	if(a.length==0){
			alert("请选择要 '待定' 的咨询量!");
		}else{
			var result = confirm("确定批量 '待定' 选中的咨询量吗？");
						if(result==true){
							s = new Array(a.length);/* 创建数组 */
							for(var i=0;i<s.length;i++){
								s[i] = a[i].value;
							}
							$.ajax({
									url:"Consultway/PraiseCheckAuditingNoPass",
									type: "POST",
									traditional:true,
									data:{
				        				s:s,
				        				employee_id:${loginUser.emp_id}
				       		 		},
				       		 		dataType:"text",
									success:function(data){
									
										if(data=="false"){
											alert("操作失败！");
										}
										if(data=="true"){
											 for(var i=0;i<s.length;i++){
												var sz=s[i].split("|")
												var to=sz[2];
												var stuname=sz[1];
												var tea=sz[3];
												$.ajax({
													url:"adviceadd",
													type:"GET",
													data:{"from":parent.user,"content":tea+",你的咨询量"+stuname+"未通过报申","to":to},
													datatype:"text",
							    					success:function(dat){
							    						var temp="{from:'"+parent.user+"',content:'"+tea+",你的咨询量"+stuname+"未通过报申',to:'"+to+"'}";
														parent.ws.send(temp);
							    					}
							    				});
												
											} 
											show(1);
										}
										if(data=="allfalse"){
											alert("批量操作异常！");
										}
										/* findHandOut(index); */
									},
									
								});
						}
		
		}
}






/* 批量通过按钮 */
function batchPass(){
var a = $("input:checkbox[name='CheckBox']:checked");/* 获得所有被选中的标签(name属性为CheckBox的) */
		if(a.length==0){
			alert("请选择要 '通过' 的咨询量!");
		}else{
			var result = confirm("确定批量 '通过' 选中的咨询量吗？");
						if(result==true){
							var s = new Array(a.length);/* 创建数组 */
							for(var i=0;i<s.length;i++){
								s[i] = a[i].value;
							}
							$.ajax({
									url:"Consultway/PraiseCheckAuditingPass",
									type: "POST",
									traditional:true,
									data:{
				        				s:s,
				        				employee_id:${loginUser.emp_id}
				       		 		},
				       		 		dataType:"text",
									success:function(data){
									
										if(data=="false"){
											alert("操作失败！");
										}
										if(data=="true"){
											for(var i=0;i<s.length;i++){
												var sz=s[i].split("|")
												var to=sz[2];
												var stuname=sz[1];
												var tea=sz[3];
												$.ajax({
													url:"adviceadd",
													type:"GET",
													data:{"from":parent.user,"content":tea+",你的咨询量"+stuname+"已通过报申","to":to},
													datatype:"text",
							    					success:function(dat){
							    						var temp="{from:'"+parent.user+"',content:'"+tea+",你的咨询量"+stuname+"已通过报申',to:'"+to+"'}";
														parent.ws.send(temp);
							    					}
							    				});
												
											} 
											show(1);
										}
										if(data=="allfalse"){
											alert("批量操作异常！");
										}
										/* findHandOut(index); */
									},
									
								});
						}
		
		}
}    		
    		
    		/* 报名通过 */
    		function pass(index,id){
    		var result=confirm("确定审核通过该报名？");
	    		if(result){
	    			$.ajax({
	    				url:"Consultway/PraiseCheckAuditingPass",
	    				type: "POST",
	    				data:{		
				        		id:id,
				        		employee_id:${loginUser.emp_id}
				       		 },
	    				dateType:"text",
	    				success:function callback(date){
			    				if(date!=null){
				    				show(index);
					    		}else if(data=="false"){
					    			alert("操作失败!");
					    		}
	    				}
	    			});
	    		}
    		}
    		
    		
    		
    		/* 报名暂缓 */
    		function Nopass(index,id){
    		var result=confirm("确定暂缓该报名？");
    		
	    		if(result){
	    			$.ajax({
	    				url:"Consultway/PraiseCheckAuditingNoPass",
	    				type: "POST",
	    				data:{		
				        		id:id,
				        		employee_id:${loginUser.emp_id}
				       		 },
	    				dateType:"text",
	    				success:function callbackNopass(data){
	    				
	    					if(data="true"){
	    					show(index);
	    					}else{
	    					alert("操作失败！");
	    					}
	    				}
	    			});
	    		}
    		}
    	
    		
    		/* 查询 */
    	$(function(){
			show(1);
			$("#btn").click(function(){
				show(1);
			});
		}); 
		
/* 显示分发咨询量 */
function showHandout(){

	window.location.href="Consultway/ToHandout";
	
}

/* 显示查询咨询量 */
function showQuery(){

window.location.href="Consultway/consultAssistantQuery";
	
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
      <span class="spanOut" onclick="showQuery()">查询咨询量</span>
      <span class="spanOut" onclick="showHandout()" >分发咨询量</span>
      <span class="spanHover"  onclick="EnrollCheck()"  >报名审核</span>
      <span class="spanOut"    onclick="showUseless()" >查看无效量</span>
      <span class="spanOut" id="spanLast"   onclick="showHistory()">查看历史量</span>
  	</div>
  <div class="tabContent">
  <h1 class="tabTitle">报名审核</h1>
    <div class="serach">
         <form id="formQ" >
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;  text-align: right ;margin-left:-160px;" >
        
         	 <tr>
         		<td>姓名：<input name="name" type="search"  class="searchStyle" style="width:130px;"/></td>
		     	<td>申报日期：<input name="declareTimes" type="date" class="dateStyle" style="width:130px;" /></td>
          	 </tr>
          	 <tr>
		     	<td class="tdWidth" >咨询师：
                            <select class="selectStyle" style="width:130px;" name="consultTeachers">
                                <option value="0">全部</option>
                               <!--  <input type="radio"  value="0" name="consultTeacher"  class="radioStyle"  />全部&nbsp; -->
                                <c:if test="${ConsultTeacherList !=null}">
									<c:forEach var="teacher" items="${ConsultTeacherList}">
									<%-- <input type="radio"  value="${teacher.emp_id}" name="consultTeacher"  class="radioStyle"  />${teacher.emp_name}&nbsp; --%>
									
										<option <c:if test="${teacher.emp_id == consultTeacher}">selected="selected"</c:if>
										 value="${teacher.emp_id}">${teacher.emp_name}
										</option>
									</c:forEach>
				  				</c:if>
                            </select>
              </td> 
             
		     	 <td class="tdWidth">咨询课程：
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
          	 </tr>
        	
        </table>
        <div style="text-align: right;">
        <input type="button" id="btn" value="搜索" class="searchBotton" />
        </div>
        </form>
    </div>
    <div class="btposition2" id="batch">
         <!-- <div><input type="button" class="pooupBotton" onclick="batchPass(this)" value="批量通过">
         	  <input type="button" class="pooupBotton" value="批量待定">
         </div> -->
    </div>
    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tbody>
         <thead>
        <tr>
		  <th><input type="checkbox" id="all"></th>
          <th>编号</th>
          <th>姓名</th>
          <th>年龄</th>
          <th>性别</th>
          <th>咨询师</th>
         
          <th>报选课程</th>
          <th>学费</th>
          <th>缴费方式</th>
          <th>报名时间</th>
          <th>联系方式</th>
          
          <th>紧急联系方式</th>
          <!-- <th>操作</th> -->
        </tr>
        </thead>
		<tbody id="consulters">
		
		</tbody>
       <!--  <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"></td>
          <td>1001</td>
          <td>张三</td>
          
          <td>23</td>
          <td>男</td>
          <td>宋强</td>
          <td>JAVA</td>
          <td>C11</td>
          <td>16000</td>
         <td>2017.7.19</td>
          <td>877218421@qq.com</td>
           
              <td>父亲：13100000000</td>
          <td><a href="file:///D:/Documents/WeChat%20Files/zhang77585211314lv/Files/showlist.html#" class="edit">通过</a>
          	  <a href="file:///D:/Documents/WeChat%20Files/zhang77585211314lv/Files/showlist.html#" class="edit">待定</a>
          </td>
        </tr>
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"></td>
          <td>1001</td>
          <td>张三</td>
          
          <td>23</td>
          <td>男</td>
          <td>宋强</td>
          <td>JAVA</td>
          <td>C11</td>
         <td>16000</td>
          <td>2017.7.19</td>
          <td>877218421@qq.com</td>
           
              <td>父亲：13100000000</td>
          <td><a href="file:///D:/Documents/WeChat%20Files/zhang77585211314lv/Files/showlist.html#" class="edit">通过</a>
          	  <a href="file:///D:/Documents/WeChat%20Files/zhang77585211314lv/Files/showlist.html#" class="edit">待定</a>
          </td>
        </tr>
        <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"></td>
          <td>1001</td>
          <td>张三</td>
         
          <td>23</td>
          <td>男</td>
          <td>宋强</td>
          <td>JAVA</td>
         <td>C11</td>
          <td>16000</td>
          <td>2017.7.19</td>
          <td>877218421@qq.com</td>
            
              <td>父亲：13100000000</td>
          <td><a href="file:///D:/Documents/WeChat%20Files/zhang77585211314lv/Files/showlist.html#" class="edit">通过</a>
          	  <a href="file:///D:/Documents/WeChat%20Files/zhang77585211314lv/Files/showlist.html#" class="edit">待定</a>
          </td>
         </tr> -->
        
       
      </tbody></table>
	  <div id="page"></div>
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 500px; height: 150px;">
    <h1>操作提示<span class="closeX">X</span></h1>
   
     <span class="closeX" style="text-align: center;" > &nbsp;确定提交？&nbsp;</span>

    <h2 class="tabTitle2">&nbsp;</h2>

    <div class="btposition1">
        <input type="button" value="当然" class="saveBotton" onclick=NewPage("signcheck.jsp") />
        <input type="button" value="再想想" class="saveBotton" onclick=NewPage("signcheck.jsp") />
    </div>
</div>


</body></html>