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
</script>
<script type="text/javascript">
	function  findHandOut(index) {
		var pageSize = $("#pageSize").val();
		var temp = $("#form").serialize()+"&index="+index+"&pageSize="+pageSize;
		$.post("director/findHandout",temp,showHandoutList,"json");
	}
		
	function showHandoutList(data){

		var handOutList = data.handOutList;
		var index = data.index;
		var pageCount = data.pageCount;
		var totalCount = data.totalCount;
		showHandout(handOutList,index);
		showPage(index,pageCount,totalCount);
	}
	
	function showHandout(data,index) {
		$("#handoutCon").empty();
		$(".btposition2").empty();

		if(data.length==0){
			$("#handoutCon").html("空");
		}else{
			for ( var i = 0; i < data.length; i++){
				var sex = data[i].sex==1?"男":"女";
				var consultwayName = data[i].consultwayName==null?"未知":data[i].consultwayName;
				var consultLessonName = data[i].consultLessonName ==null?"未知":data[i].consultLessonName;
				var educationName = data[i].educationName ==null?"未知":data[i].educationName;
				var statusName = data[i].statusName ==null?"未知":data[i].statusName;
				$("#handoutCon").append("<tr><td><input type='checkbox' name='CheckBox' value='"+data[i].id+"'/></td>"
				+"<td>"+data[i].id+"</td>"
				+"<td>"+consultwayName+"</td><td>"+consultLessonName+"</td>"
				+"<td>"+data[i].name+"</td><td>"+sex+"</td><td>"+data[i].age+"</td>"
				+"<td>"+data[i].telphone1+"</td><td>"+data[i].city+"</td>"
				+"<td>"+educationName+"</td><td>"+statusName+"</td>"
				+"</tr>");
			}
			
			
		}	
		$(".btposition2").append("<div>咨询师：<select name= 'consultTeacher' style='width:100px;height:30px;'>"
				+"<option value='0'>--请选择--</option><c:if test='${empList !=null}'>"
				+"<c:forEach var ='teacher' items='${empList}'>"
				+"<option <c:if test='${teacher.emp_id == consultTeacher}'> selected='selected'"
				+"</c:if> value='${teacher.emp_id}'>${teacher.emp_name}</option></c:forEach></c:if>"
				+"</select>&nbsp;&nbsp;&nbsp;<input type='button'  value='分发' class='searchBotton' onclick='handoutall("+index+",this)' /></div>");	
	}
	
			function handoutall(index,handout){
				var consultTeacherid=$(handout).prev().val();
				var s;
				if(consultTeacherid==0){
					alert("请选择要分发的咨询师");
				}else{
					var a = $("input:checkbox[name='CheckBox']:checked");
					if(a.length==0){
						alert("请选择要分发的咨询量!");
					}else{
						var result = confirm("确定分发选中的咨询量吗？");
						if(result==true){
							s = new Array(a.length);
							for(var i=0;i<s.length;i++){
								
								s[i] = a[i].value;
								
							}
							$.ajax({
									url:"director/handoutall",
									type: "POST",
									traditional:true,
									data:{
				        				s:s,
				        				consultTeacherid:consultTeacherid,
				        				employee_id:${loginUser.emp_id}
				       		 		},
				       		 		dataType:"text",
									success:function(){
										var to=$(handout).prev().val();
										$.ajax({
											url:"adviceadd",
											type:"GET",
											data:{"from":parent.user,"content":"收到"+s.length+"条咨询量","to":to},
											datatype:"text",
							    			success:function(dat){
							    				var temp="{from:'"+parent.user+"',content:'收到"+s.length+"条咨询量',to:'"+to+"'}";
												parent.ws.send(temp);
												findHandOut(index);
							    			}
							    		});
									},
									
							});
						}
					}
				}
				
			}
	
	function showPage(index,pageCount,totalCount){
				$("#page").empty();
				$("#page").append("共"+totalCount+"条记录");
				$("#page").append("<span><a href=' javascript:onclick=findHandOut(1)'>首页</a></span>");
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
						$("#page").append("<span><a href=' javascript:onclick=findHandOut("+(index-1)+")'>上一页</a></span>");
					}
					
					for(var i=iqishi;i<=iqishi+8;i++){
						if(i==index){
							$("#page").append("<span><a href=' javascript:onclick=findHandOut("+i+")' style='color:red;'>"+i+"</a></span>");
						}else{
							$("#page").append("<span><a href=' javascript:onclick=findHandOut("+i+")'>"+i+"</a></span>");
				
						}
						
				
						if(i>pageCount-1){
							break;
						}
		 			}

					if(index!=pageCount){
						$("#page").append("<span><a href=' javascript:onchange=findHandOut("+(index+1)+")'>下一页</a></span>");
					}
				}
				$("#page").append("<span><a href=' javascript:onclick=findHandOut("+pageCount+")'>末页</a></span>");
				$("#page").append("<span>共"+pageCount+"页</span>");
			} 
			
	$(function(){
		findHandOut(1);
		
		$("#btn").click(function(){
			findHandOut(1);
		});
	});
	
/* 显示查询咨询量 */
function showQuery(){
	window.location.href="director/consultDirectorQuery";
}
/* 审核无效量 */
function showCheck(){
	window.location.href="director/consultDirectorCheck";
}	

function showUseless() {
	window.location.href="director/consultDirectorUseless";
}

function showHistory() {
	window.location.href="director/historyCon";
}
function showChongfu(){
   window.location.href="director/consultDirectorChongfu";
}

</script>
</head>
<body>
<div class="rightContent">
	<div class="tabs" id="tabs"  >
      <span class="spanOut" onclick="showQuery()">查询咨询量</span>
      <span class="spanOut"  onclick="showCheck()">审核无效量</span>
      <span class="spanHover" >分发咨询量</span>
      <span class="spanOut"  onclick="showUseless()" >查看无效量</span>
      <span class="spanOut" onclick="showHistory()">查看历史量</span>
        <span class="spanOut"  onclick="showChongfu()">疑似重复量</span>
  	</div>
	
  <div class="tabContent">
  <h1 class="tabTitle">分发咨询量</h1>
    <div class="serach">
     <form id="form">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;  text-align: right ;margin-left:-120px;" >
        
         	 <tr>
		     	<td  class="tdWidth">姓名： <input type="search"  class="searchStyle" name="name" style="width:130px;"/></td>
          		
          		 <td class="tdWidth">咨询课程：
             		<select class="selectStyle" style="width:130px;" name="consultLesson">
                                <option value="0">全部</option>
                                <c:if test="${consultLessonList !=null}">
									<c:forEach var="lesson" items="${consultLessonList}">
										<option <c:if test="${lesson.id == consultLesson}">selected="selected"</c:if>
										 value="${lesson.id}">${lesson.consultLesson}
										</option>
									</c:forEach>
				  				</c:if>
                     </select>
              </td>        	
          	  <td class="tdWidth">状态：
         			<select class="selectStyle" style="width:130px;" name="status">
                                <option value="0">全部</option>
                                <c:if test="${consultStatusList !=null}">
									<c:forEach var="consultStatus" items="${consultStatusList}">
										<option <c:if test="${consultStatus.id == status}">selected="selected"</c:if>
							 				value="${consultStatus.id}">${consultStatus.status}
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





    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
      <thead>
        <tr>
		  <th><input type="checkbox" id="all"/></th>
          <th>序号</th>
          <th>咨询方式</th>
          <th>咨询课程</th>
          <th>咨询者姓名</th>
          <th>性别</th>
          <th>年龄</th>
          <th>联系方式</th>
          <th>城市</th>
          <th>学历</th>
          <th>状态</th>
        </tr>
		</thead>

	<tbody id="handoutCon">
	
	
	</tbody>
  
      </table>
      <span style="float:right;"><input type="number"  min="1" max="100" name="pageSize" onchange="findHandOut(1)" style="width:80px;" id="pageSize"/>条/每页&nbsp;&nbsp;&nbsp;</span>
	  <div id="page"></div>
	  
    <div class="btposition2">
    	
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 500px; height: 150px;">
    <h1>操作提示<span class="closeX">X</span></h1>
   
     <span class="closeX" style="text-align: center;" > &nbsp;确定执行该操作？&nbsp;</span>

    <h2 class="tabTitle2">&nbsp;</h2>

    <div class="btposition1">
        <input type="button" value="当然" class="saveBotton" onclick=NewPage("assigns.jsp") />
        <input type="button" value="再想想" class="saveBotton" onclick=NewPage("assigns.jsp") />
    </div>
</div>
</div>

</body>
</html>