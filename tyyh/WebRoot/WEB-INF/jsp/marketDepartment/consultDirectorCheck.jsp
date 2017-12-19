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
		alert('你点击了确定');
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
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
    	function show(index){
			var pageSize = $("#pageSize").val();
			var temp = $("#form").serialize()+"&index="+index+"&pageSize="+pageSize;
	
			$.post("director/checkquery",temp,showInfoList,"json");
		
			
		}
		
		function showInfoList(data){
			var checkList = data.checkList;
			var index = data.index;
			var pageCount = data.pageCount;
			var totalCount = data.totalCount;
			showInfo(checkList,index);
			showPage(index,pageCount,totalCount);
		}
		
		
    		function showInfo(data,index){
    			$("#consulters").empty();
    			$(".btposition2").empty();
    			if(data.length==0){
    				$("#consulters").html("<tr><td colspan='12'>暂无无效量</td></tr>");
    				
    			}else{
    				for ( var i = 0; i < data.length; i++) {
						var sex = data[i].sex==1?"男":"女";
						var infoSource =data[i].infoSourceName==null?"无":data[i].infoSourceName;
						var consultTeacher = data[i].consultTeacher==null?"暂无":data[i].consultTeacher;
						var consultLesson = data[i].consultLessonName == null?"暂无":data[i].consultLessonName;
						var ungenTelphone = data[i].ungenTelphone == null || data[i].ungenTelphone=='' ?"暂无":data[i].ungenTelphone;
						$("#consulters").append("<tr><td ><input type='checkbox' name='CheckBox' value='"+data[i].id+"|"+data[i].name+"|"+data[i].consultTeacher+"|"+data[i].consultTeacherName+"'/></td><td>"+data[i].id+"</td>"
						+"<td>"+data[i].name+"</td><td>"+data[i].age+"</td><td>"+sex+"</td><td>"+consultTeacher+"</td>"
						
						+"<td>"+infoSource+"</td><td>"+consultLesson+"</td><td>"+data[i].city+"</td>"
						+"<td>"+data[i].telphone1+"</td><td>"+ungenTelphone+"</td>"
						+"<td><a href='javascript:void(0)' class='edit' style='width:80px;'  onclick=lookresult("+data[i].id+") >查看原因</a>"
						+"</td></tr>");
						
						
					}
					
    			}  
    			$(".btposition2").append("<div><input type='button' class='saveBotton' value='继续跟进' onclick='chk("+index+")'>"
												+"&nbsp;&nbsp;&nbsp;&nbsp;"
												+"<input type='button' class='pooupBotton' value='无效' onclick='chkinval("+index+")'></div>");      					
    		}
    		
    		$(function(){
         		$(".popupStyle").css("display","none");
    		});
    	
    		function lookresult(id){
    		
    		 var mbHeight= $(document).height();
         	 var mbWidth=$(window).width();
         	 var delHeight=$(window).height();
         	 
         	$(".mbStyle").css("height",mbHeight);
           	$(".mbStyle").css("display","block");
            $(".popupStyle").css("display","block");
           
    		var temp = "id="+id;
    		$.post("director/lookResult",temp,lookconResult,"json"); 
         	 /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });
            /*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });
    	
    		function lookconResult(data){
    			$("#result").empty();
    			$("#result").append(data.uselessCause);
    		}
    	}	
    	
    	
    	
    				/* 			+"<td><a href='javascript:void(0)' style='width:80px;' class='edit' status='1'  num='"+data[i].id+"' index ='"+index+"' onclick=continuefollow(this)  >继续跟进</a>"
						+"<a href='javascript:void(0)' class='edit'  status='2'  num='"+data[i].id+"'  index ='"+index+"' onclick=effective(this) ><span class='notsee'>无效</span></a>" */
    		
    		/* 无效 */
    		/* function effective(choose){
    			var status = $(choose).attr("status");
    			var num = $(choose).attr("num");
    			var index= $(choose).attr("index");
    			
    			var result = confirm("确定审核为无效吗？");
    			if(result==true){
    				$.ajax({
	    				url:"director/checkStatus/"+status+"/"+num,
	    				dataType:"text",
	    				success:checkStatus
    				
    				} );
	    			function checkStatus(data){
	    			
	    				show(index);
	    			}	
    			}else{
    				show(index);
    			}
    		} */
    		/* 继续跟进 */
    		/* function continuefollow(choose){
    			var status = $(choose).attr("status");
    			var num = $(choose).attr("num");
    			var index= $(choose).attr("index");
    			var result = confirm("确定继续跟进吗？");
    			if(result==true){
    				$.ajax({
	    				url:"director/checkStatus/"+status+"/"+num,
	    				dataType:"text",
	    				success:checkStatus
    				} );
	    			function checkStatus(data){
	    			
	    				show(index);
	    			}
    			}else{
    				show(index);
    			}
    		} */
    		
			
			function chk(index){
				
				var a = $("input:checkbox[name='CheckBox']:checked");
				var s;
				if(a.length==0){
					alert("请选择要审核的咨询量!");
				}else{
					var result = confirm("确定继续跟进选中的咨询量吗？");
					if(result==true){
						var s = new Array(a.length);
					
					for(var i=0;i<s.length;i++){
						s[i] = a[i].value;
					}
					$.ajax({
							url:"director/checksome",
							type: "POST",
							traditional:true,
							data:{
		        				s:s,
		        				employee_id:${loginUser.emp_id}
		       		 		},
		       		 		dataType:"text",
							success:function(){
								 for(var i=0;i<s.length;i++){
												var sz=s[i].split("|")
												var to=sz[2];
												var stuname=sz[1];
												var tea=sz[3];
												$.ajax({
													url:"adviceadd",
													type:"GET",
													data:{"from":parent.user,"content":tea+",你的咨询量"+stuname+"需要继续跟进","to":to},
													datatype:"text",
							    					success:function(dat){
							    						if(dat){
							    							var temp="{from:'"+parent.user+"',content:'"+tea+",你的咨询量"+stuname+"需要继续跟进',to:'"+to+"'}";
															parent.ws.send(temp);
							    						}
							    					}
							    				});	
											} 
								show(index);
							}
						});
					}else{
						show(index);
					}
				}
					
			
			}
			
			
			
			
			
			
			/* 批量无效 */
			function chkinval(index){
				var arr = $("input:checkbox[name='CheckBox']:checked");
				if(arr.length==0){
					alert("请选择要审核的咨询量!");
				}else{
				
					var result = confirm("确定将选中的咨询量标记为无效吗？");
					if(result==true){
						var str = new Array(arr.length);
						 for(var i=0;i<str.length;i++){
						 	str[i] = arr[i].value;
						 }
						$.ajax({
							url:"director/checkinvalid",
							type: "POST",
							traditional:true,
							data: {
		        				str:str,
		        				employee_id:${loginUser.emp_id}
		       		 		},
							dataType:"text",
							success:function(){
								for(var i=0;i<s.length;i++){
									var sz=s[i].split("|")
									var to=sz[2];
									var stuname=sz[1];
									var tea=sz[3];
									$.ajax({
										url:"adviceadd",
										type:"GET",
										data:{"from":parent.user,"content":tea+",你提交的无效量"+stuname+"已通过审核","to":to},
										datatype:"text",
				    					success:function(dat){
				    						if(dat){
				    							var temp="{from:'"+parent.user+"',content:'"+tea+",你提交的无效量"+stuname+"已通过审核',to:'"+to+"'}";
												parent.ws.send(temp);
				    						}
				    					}
				    				});		
								} 
								show(index);
							}
						});
					}else{
						show(index);
					} 
				}
			}
    		
    		function showPage(index,pageCount,totalCount){
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
						$("#page").append("<span><a href=' javascript:onclick=show("+(index-1)+")'>上一页</a></span>");
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
						$("#page").append("<span><a href=' javascript:onchange=show("+(index+1)+")'>下一页</a></span>");
					}
				}
				
				$("#page").append("<a href=' javascript:onclick=show("+pageCount+")'>末页</a>");
				$("#page").append("<span>共"+pageCount+"页</span>");
			} 
    		
    		
    	$(function(){
			show(1);
			
			$("#btn").click(function(){
			
				show(1);
			
			});
		
		
		}); 
		
/* 显示分发咨询量 */
function showHandout(){
	window.location.href="director/consultDirectorHandout";
}

/* 显示查询咨询量 */
function showQuery(){
	window.location.href="director/consultDirectorQuery";
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
      <span class="spanHover"  onclick="showCheck()">审核无效量</span>
      <span class="spanOut"  onclick="showHandout()" >分发咨询量</span>
      <span class="spanOut"  onclick="showUseless()" >查看无效量</span>
      <span class="spanOut" onclick="showHistory()">查看历史量</span>
      <span class="spanOut"  onclick="showChongfu()">疑似重复量</span>
  	</div>
	

  <div class="tabContent">
  <h1 class="tabTitle">审核无效量</h1>
    <div class="serach">
          <form id="form">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;  " >
        
         	 <tr>
 
                 <td class="tdWidth">咨询师：</td>
                     <td>
                        <select  class="selectStyle" style="width:170px;" name="consultTeacher">
		                  <option value="0">--请选择--</option>
		                  <c:if test="${empList !=null}">
						
							<c:forEach var="teacher" items="${empList}">
							<option <c:if test="${teacher.emp_id == consultTeacher}">selected="selected"</c:if>
							 value="${teacher.emp_id}">${teacher.emp_name}
							</option>
						</c:forEach>
				  </c:if>
             	 		</select>
          				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="btn" value="搜索" class="searchBotton" />
              		</td>
               
             </tr>
    	
        </table>

        </form>
    </div>

    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <thead><tr>
		  <th><input type="checkbox" id="all" ></th>
          <th>编号</th>
          <th>姓名</th>
          <th>年龄</th>
          <th>性别</th>
          <th>咨询师</th>
          <th>信息来源</th>
          <th>咨询课程</th>
          <th>城市</th>
          <th>联系方式</th>
          <th>紧急联系方式</th>
          <th>操作</th>
        </tr>
	</thead>
	<tbody id="consulters">
	
	
     </tbody>
      </table>
     
      <span id="pageSizeChange" style="float:right;"><input type="number"  min="1" max="100" name="pageSize" onchange="show(1)" style="width:80px;" id="pageSize"/>条/每页&nbsp;&nbsp;&nbsp;</span>
	  <div id="page"></div>
    <div class="btposition2">
       
    </div>
    </div>

  </div>
</div>

<div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 550px; height: 280px;">
    <h1>查看原因<span class="closeX">X</span></h1>
   
   	<textarea name="showText" id="result" cols="x"  rows="y" style="width: 470px; height: 140px; margin-left:30px; margin-top: 30px; resize:none;"  disabled="disabled" ></textarea  >
    <input type="button"  value="确定" class="saveBotton" style="margin-top:30px; margin-left: 450px;" /> 
</div>

</body>
</html>