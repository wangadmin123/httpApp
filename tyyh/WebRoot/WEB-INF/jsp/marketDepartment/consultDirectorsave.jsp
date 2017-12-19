
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">

    <title>列表模板</title>
       <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popups.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/adds.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popups.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup-notsee.css"/>
    
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/index.js"></script>

    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
    <script type="text/javascript">
        $(function(){
            /*点击展开搜索面板*/
            $(".searchShow").click(function(){

                $(".searchContent").slideDown(300);
                $(".searchShow").hide();
            });
            /*点击搜索关闭面板*/
            $(".searchBotton").click(function(){

                $(".searchContent").slideUp(300);
                $(".searchShow").show();
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
	/* 显示咨询量信息 */
	$(function(){

		$(".pooupBottons").click(function(){
         var mbHeight= $(document).height();
         var mbWidth=$(window).width();
         var delHeight=$(window).height();

         $(".mbStyle").css("height",mbHeight);
         $(".mbStyle").css("display","block");

         $(".popupStyle").css("left",mbWidth/2-250);
         $(".popupStyle").css("top",delHeight/6-102);

         $(".popupStyle").css("display","block");
            });
            
            /*点击显示弹出框*/
            $(".pooupBottons").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");
            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

            $(".saveBotton").click(function(){
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


/* 无效审核*/
$(function(){
        
        $(".avail").click(function(){
         var mbHeight= $(document).height();
         var mbWidth=$(window).width();
         var delHeight=$(window).height();

         $(".mbStyle").css("height",mbHeight);
         $(".mbStyle").css("display","block");

         $(".popupStyles").css("left",mbWidth/2-250);
         $(".popupStyles").css("top",delHeight/3-92);

         $(".popupStyles").css("display","block");
            });
        
            /*点击显示弹出框*/
            $(".avail").click(function(){

                $(".mbStyle").css("display","block");
                $(".popupStyles").css("display","block");

            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyles").css("display","none");
            });

            /*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyles").css("display","none");
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyles").css("left",saveWidth/2-250);
            $(".popupStyles").css("top",50);

        });


/* 提交报名信息  */
$(function(){
 		$(".study").click(function(){
         var mbHeight= $(document).height();
         var mbWidth=$(window).width();
         var delHeight=$(window).height();

         $(".mbStyle").css("height",mbHeight);
         $(".mbStyle").css("display","block");

         $(".popupStyle-study").css("left",mbWidth/2-250);
         $(".popupStyle-study").css("top",delHeight/4-92);

         $(".popupStyle-study").css("display","block");
            });

            /*点击显示弹出框*/
            $(".study").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle-study").css("display","block");
            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-study").css("display","none");
            });

            /*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-study").css("display","none");
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle-study").css("left",saveWidth/2-250);
            $(".popupStyle-study").css("top",50);

        });

        /* 不再显示无销量  */
        $(function(){
            /*点击显示弹出框*/
            $(".notsee").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle-notsee").css("display","block");


            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-notsee").css("display","none");
            });

            /*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-notsee").css("display","none");
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle-notsee").css("left",saveWidth/2-250);
            $(".popupStyle-notsee").css("top",50);
        });
        
       
    </script>
    <script type="text/javascript"> 
    	var conId = 0;
    	function show(index){
    	$("#resultAll").empty();
			conId = 0;
			commitIndex =0;
			indexpage = 0;
			var number=$("#number").val();
       			if(number==null){
       				number=10;
       		}
			var temp = $("#form").serialize()+"&index="+index+"&pageSizes="+number;;
			$.post("teacher/consultTeachersave",temp,showListInfo,"json");
					
		}
		function showListInfo(data){
			var index=data.index;
			var pageCount=data.pageCount;
			var totalCount=data.totalCount;
			var consulterList=data.consulterList;
			var pageSize=data.pageSize;
			
			showInfo(consulterList,index);
			showPage(index,pageCount,totalCount,pageSize);
		}
    		function showInfo(data,index){
    			var str = "";
    			$("#consulters").empty();
    		   
    			if(data.length==0){
    				 $("#consulters").html("<tr><td colspan='12'>暂无数据</td></tr>");
    			}else{
    			
    			for ( var i = 0; i < data.length; i++) {
					var sex = data[i].sex==1?"男":"女";
					var consultwayName =data[i].consultwayName==null?"暂无":data[i].consultwayName;
					var consultLessonName =data[i].consultLessonName==null?"暂无":data[i].consultLessonName;
					var allotstatus = data[i].allotstatus==1?"已分量":data[i].allotstatus==2?"未分量":data[i].allotstatus==3?"<img style='width:15px;height:12px;' src='statics/common/images/wjs.jpg' onclick='sfjsStatus("+data[i].id+")'/>":data[i].allotstatus==4?"<img style='width:15px;height:12px;' src='statics/common/images/yjs.jpg'/>":"未知";
					var rankName =data[i].rankName==null?"暂无":data[i].rankName;
					var returnTime =data[i].returnvisitTime==null?"暂无":data[i].returnvisitTime;
					var telphone1 =data[i].telphone1==null?"暂无":data[i].telphone1;
					var city =data[i].city==null?"暂无":data[i].city;
					var educationName =data[i].educationName==null?"暂无":data[i].educationName;
					var specialty =data[i].specialty==null || data[i].specialty == ""?"暂无":data[i].specialty;
					var statusName =data[i].statusName==null || data[i].statusName ==""?"暂无":data[i].statusName;
					var allotTimes =data[i].allotTime==null || data[i].allotTime ==""?"暂无":data[i].allotTime;
					var payStatus=data[i].payStatus;
					var enrollStatus=data[i].enrollStatus;
					var come=data[i].come;
				if( data[i].allotstatus==3){
					str+="<tr style='font-weight:bold'>";
					}else{
					str+="<tr>";
					}
							str+="<td>"+(i+1)+"</td>"+"<td>"+allotstatus+"</td>"+"<td>"+data[i].name+"</td>"+"<td>"+sex+"</td>"
								+"<td>"+data[i].age+"</td>"+"<td>"+consultwayName+"</td>"+"<td>"+consultLessonName+"</td>"
								+"<td>"+rankName+"</td>"+"<td>"+allotTimes+"</td>"+"<td>"+returnTime+"</td>"+"<td>"+telphone1+"</td>"
								+"<td>"+city+"</td>"+"<td>"+educationName+"</td>"+"<td>"+specialty+"</td>"
								+"<td>"+statusName+"</td><td><a href='teacher/consultTeacherAdd?id="+data[i].id+"' class='edit'>"
								+"<span id='edit' style='color: #2828FF;' >完善</span></a><a href='teacher/consultTeacherVisit?id="+data[i].id+"' class='edit'>"
								+"<span id='edit' style='color: #2828FF;' >回访</span></a>";
						
					
					
						if(data[i].invalid ==3){
							str+="<a href = 'javascript:void(0)'><span class='paifa' onclick='follow("+data[i].id+",0)'>跟踪</span></a>";
						}else if(data[i].invalid ==1){
							str+="<a href='javascript:void(0)' class='avail' >"
							+"<span  class='delete' onclick='invalid("+data[i].id+","+index+")'> 无效</span></a>"
							+"<a href='javascript:void(0)' class='study' ><span class='edit' onclick='enrollStatus("+data[i].id+","+index+")'>报审</span></a>"
							+"<a href = 'javascript:void(0)'><span class='paifa' onclick='follow("+data[i].id+",0)'>跟踪</span></a>";						
						}
						
						if(data[i].follow=="不跟进"){
							str +="<a href = 'javascript:void(0)'><span class='paifa' style='color:#FF0000; ' >不跟</span></a>";
						}
						
						if(enrollStatus==1){/* 报名 */
						str+="<sapn style='width: 60px; height: 25px; border:1px; background-color: #FF5151 ;  ' class='paifa1'><span style='color:white; '>&nbsp;&nbsp;报名&nbsp;&nbsp;</span></sapn>"
					}else if(payStatus==2){/* 定金 */
						str+="<sapn style='width: 60px; height: 25px; border:1px; background-color: #FFA042 ;  ' class='paifa1'><span style='color:white; '>&nbsp;&nbsp;定金&nbsp;&nbsp;</span></sapn>"
					}else if(come==1){/* 上门 */
						str+="<sapn style='width: 60px; height: 25px; border:1px; background-color: #46A3FF ;  ' class='paifa1'><span style='color:white; '>&nbsp;&nbsp;上门&nbsp;&nbsp;</span></sapn>"
					}
						 
					str+="</td></tr>";
					
					
					/* +"<span class='delete' onclick='display("+data[i].id+")'>不再显示</span></a>" */
				}
				$("#consulters").append(str);
			  } 
	              					
    		}
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
    		var indexpage = 0;
    		function invalid(data,index){
    		
	    	     var mbHeight= $(document).height();
	         	 var mbWidth=$(window).width();
	         	 var delHeight=$(window).height();
         	 
		         $(".mbStyle").css("height",mbHeight);
		         $(".popupStyle-notsee").css("left",mbWidth/2-250);
		         $(".popupStyle-notsee").css("top",delHeight/3-50);
		         $(".popupStyle-notsee").css("display","block");
           		 $(".mbStyle").css("display","block");
         	 	
         	 	
         	 
	            $(".closeX").click(function(){
	            	
	                $(".popupStyle-notsee").css("display","none");
	                $(".mbStyle").css("display","none");
	                
	            });
    			
         	 	
         	 conId = data;	
         	 indexpage = index;
         	 	
    	}
    	//是否接受
    	function sfjsStatus(id){
    	$.post("teacher/Updatesfjs",{"id":id});
    	location.href="teacher/consultTeacherQuery";
    	}
    	function test(){
    		
    		 var conresultInfo =$("#resultAll").val();
    		$.ajax({
    			url:"teacher/writeResut/"+conId+"/"+conresultInfo,
    			datatype:"json",
    			success:handOnresult
    		
    		});
    		
    		function handOnresult(data){
    			$(".popupStyle-notsee").css("display","none");
           		 $(".mbStyle").css("display","none");
           		
           		 show(indexpage);
    		}
    		
    	}
    	function cancel(){
    		
    		$("#resultAll").val("");
    	}	

    	$(function(){
    		conId = 0;
			show(1);
			
			$("#btn").click(function(){
			
				show(1);
			
			});
	
		}); 
	
    		/* 跟踪 */
   function follow(Id,stuId){
				location.href="Consultway/findFollow?id="+Id+"&stuId="+stuId;	
			}
    	
    
    	
    		/* 不在显示 */
    		/* function display(data){
    			
    			var reult=confirm("确定不显示吗？");
    			
    			if(reult==true){
    			$.ajax({
    				url:"teacher/displayConsulter/"+data,
    				dataType:"text",
    				success:callback 
    			} );
    			function callback(data){
    				window.location.href="teacher/consultTeacherQuery";
    				}
    			}else{
    				window.location.href="teacher/consultTeacherQuery";
    			}
    		
    			
    		} */
    		/* 报审 */
    		var commitIndex =0 ;
    		function enrollStatus(id,index){
    			
    			
    			conId = id;
    			commitIndex = index;
    			
			/* $.post("teacher/enrollStatusConsulter/"+data+"",showInfo2,"json");  */ 
			
				$.ajax({
					url:"teacher/enrollStatusConsulter/"+id,
					dataType:"json",
					success:showInfo2
				});
			
			
	function showInfo2(data){
 
		
    	if(data==null){
			alert("查询错误！");
		}else{
		
		var name=data.name;
		$("#name_consult").html(name);
		var teachername=data.consultTeacherName;		
		$("#teacher_consult").html(teachername);
		var payTime=data.payTimes;
		$("#payTime_consult").val(payTime);
		
		var payMoney=data.payMoney;
		$("#payMoney_consult").val(payMoney);
		var payType=data.payType;
		$("#paytype_consult").find("option[value="+payType+"]").attr("selected",true);
		var payStatus=parseInt(data.payStatus); 
		$("#paystatus_consult").find("option[value="+payStatus+"]").attr("selected",true);
		
		var enlistLesson=parseInt(data.consultLesson);
		$("#consultLesson_consult").find("option[value="+enlistLesson+"]").attr("selected",true);
		var dorm=data.dorm;
		$("#dorm_consult").val(dorm);
		var insurance=data.insurance;
		$("#insurance_consult").val(insurance);
		
           	 var mbHeight= $(document).height();
         	 var mbWidth=$(window).width();
         	 var delHeight=$(window).height();
         	 
         $(".mbStyle").css("height",mbHeight);
         $(".popupStyle-study").css("left",mbWidth/2-300);
         $(".popupStyle-study").css("top",delHeight/3-120);
         $(".popupStyle-study").css("display","block");
          $(".mbStyle").css("display","block");
           
           
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-study").css("display","none");
            }); 
			
			/*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-study").css("display","none");
            
            });
         }
	}  
}			

			
			
			


function saveShenhe(conId){

/* alert($("#shenheform").serialize()) */
	var temp = $("#shenheform").serialize()+"&id="+conId;
	
	$.post("teacher/saveShenhe",temp,saveshenhe2,"text");
	
}
function saveshenhe2(){
	show(commitIndex);
}

function commitShenhe(conId){


		var temp = $("#shenheform").serialize()+"&id="+conId;
		$.post("teacher/commitShenhe",temp,showInfo2,"text");
		

	}
	function  showInfo2() {
		show(commitIndex);
	}
	


function showall(){
	window.location.href="teacher/consultDirectorone";
}
/* 显示查询当天咨询量 */
function showone(){
	window.location.href="teacher/consultDirectorone";
}
/* 显示查询3天内咨询量 */
function showthree(){
	window.location.href="teacher/consultDirectorthree";
}
/* 显示查询7天内咨询量 */
function showsave() {
	window.location.href="teacher/consultDirectorsave";
}
/* 显示查询7天以上咨询量 */
function showsaveup(){
   window.location.href="teacher/consultDirectorsaveup";
}	
    </script>
</head>
<body>
<div class="rightContent" ><!-- style="width:1580px;" -->
    <div class="tabContent">
        <div class="serach">
            <div class="searchTitle">
             	   搜索条件
                <div class="searchShow">展开>></div>
            </div>
            <div class="searchContent">
            <!-- teacher/consultTeacherQuery -->
            <form action="#" method="post" enctype="multipart/form-data" id="form">
            <table  class="searchTable" >
                		<tr>
                			<td colspan="2" style="text-align: center;"><span  >查询：<input type="text" name="name" oninput="show(1)" style=" width:350px; height: 30px;" placeholder="搜索姓名，年龄，专业，联系方式，毕业院校，城市"></span></td>
                		</tr>
              </table>
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%; text-align: right ;margin-left:-25px; " >
      
                    <tr>
                        <td class="tdWidth">学历：
                            <select class="selectStyle" name="education" style="width:130px;">
                                <option value="0">全部</option>
                                <c:if test="${EducationList !=null}">
						
							<c:forEach var="edu" items="${EducationList}">
							<option <c:if test="${edu.id == education}">selected="selected"</c:if>
							 value="${edu.id}">${edu.education}
							</option>
						</c:forEach>
				  </c:if>
                            </select>
                        </td>
                        <td class="tdWidth" >状态：
                            <select class="selectStyle" name="STATUS" style="width:130px;">
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
                        <td class="tdWidth">咨询等级：
                            <select class="selectStyle" name="rank" style="width:130px;">
                                <option value="0">全部</option>
                                <c:if test="${rankList !=null}">						
						<c:forEach var="ranktype" items="${rankList}">
							<option <c:if test="${ranktype.id == rank}">selected="selected"</c:if>
							 value="${ranktype.id}">${ranktype.rank}
							</option>
						</c:forEach>
				  		</c:if>
                            </select>
                        </td>
                 	     
                       <td class="tdWidth">咨询方式：
                 	 <select class="selectStyle" name="consultWay" style="width:130px;">
                                <option value="0">全部</option>
                                
                                <c:if test="${consultWayList !=null}">
						
						<c:forEach var="OaScbConsultway" items="${consultWayList}">
							<option <c:if test="${OaScbConsultway.id == consultWay}">selected="selected"</c:if>
							 value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
							</option>
						</c:forEach>
				  </c:if>
                            </select>
                        </td>   
                       
                    </tr>
                   
                    <tr>
                         <td class="tdWidth">上门：
                            <select class="selectStyle" style="width:130px;" name="come">
                                <option value="0">全部</option>
                                <option value="1">是</option>
                                <option value="2">否</option>
                            </select>
                            </td>            
                        <td class="tdWidth">信息来源：
                        <input type="text" list="url_list"  class="searchStyle" style="width:130px;" name="infoSource"/>
	                    <datalist id="url_list">
					    
					    <c:if test="${InfosourceList !=null}">
						
							<c:forEach var="info" items="${InfosourceList}">
								<option <c:if test="${info.id == infoSource}">selected="selected"</c:if>value="${info.infoSource}">
									${info.infoSource}
								</option>
							</c:forEach>
					    
					    </c:if>
                  		
                  		</datalist>
              	 	</td>

                        <td class="tdWidth">咨询量分类：
                            <select class="selectStyle" name="allotstatus" style="width:130px;">
                                <option value="0">全部</option>
                                <option value="1">常规</option>
                                <option value="2">市场</option>                              
                            </select>
                        </td>
                       
                        <td class="tdWidth" >咨询课程：
                            <select class="selectStyle" name="consultLesson" style="width:130px;">
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
                     </tr>
                       <tr>
                       
                       </tr> 
                                                
                    <tr>
                    	<td class="tdWidth">报名日期：<input type="date"  name="enrollTimey" class="dateStyle" style="width:130px;" /></td>
						<td class="tdWidth">首次咨询日期：<input type="date" name="firstConsultTimey" class="dateStyle" style="width:130px;" /></td>
                    	
                    </tr>
                    <tr>
                        <td colspan="4"><input type="button" id="btn" value="搜索" class="searchBotton"/>
                           <!--  <input type="button" class="deleteBotton" id="one" value="导出"/></td> -->
                    </tr>
               
            </table>
             </form>
            </div>
            <hr>
        </div>
       <div class="tabs" id="tabs"  >
        <span class="spanOut" onclick="showall()" >全部咨询量</span>
       <span class="spanOut" onclick="showone()" >当天咨询量</span>
       <span class="spanOut"  onclick="showthree()" >三日内咨询量</span>
       <span class="spanHover"  onclick="showsave()"  >一周内咨询量</span>
       <span class="spanOut"  onclick="showsaveup()" >一周以上咨询量</span>
    	</div>
        <h1 class="tabTitle">基本信息</h1>
        <div class="divTable">
            <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
            	<thead>
               <tr>
                    <th>序号</th>
                    <th><img style="width:50px;height:30px;" src='statics/common/images/sfjs.jpg'/></th>
                    <th>咨询者姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>咨询方式</th>
                    <th>咨询课程</th>
                    <th>咨询量等级</th>
                     <th>分量时间</th>
                    <th>回访时间</th>
                    <th>联系方式</th>
                    <th>城市</th>
                    <th>学历</th>
                    <th>专业</th>
                    <th>状态</th>
                    <th>操作</th>

                </tr>
                </thead>
                <tbody id="consulters">
 
                </tbody>
                  
            </table>
            <div id="page"></div>
            
        </div>

    </div>
</div>

<div class="mbStyle">&nbsp;</div>

<div class="mbStyle">&nbsp;</div>
<div class="popupStyle-notsee" style="width: 600px; height: 250px; ">
    <h1>提交无效<span class="closeX">X</span></h1>
    <form action="teacher/invalidConsulter" method="post" enctype="multipart/form-data" id="infoform">
    <table cellpadding="0" cellspacing="0" border="0"  class="addTables" >
        <tr>
            <td>请填写无效原因：</td>
            <td>
            <textarea id="resultAll"  name="uselessCause" cols="x"  rows="y" style="width: 400px; height: 140px; margin-top: 18px; resize:none;"></textarea></td>
        </tr>
        <tr>
            <td class="tdWidths" colspan="2">
                <input type="button" value="提交" class="saveBotton" id="saveResult"  onclick ="test()"/>
                <input type="button" value="取消" class="saveBotton" onclick="cancel()"/>
            </td>
        </tr>

    </table>
</form>
</div>

<div class="mbStyle">&nbsp;</div>
<div class="popupStyles" style="width: 600px; height: 500px; ">
    <h1>跟踪<span class="closeX">X</span></h1>
    <div>
    <table cellpadding="0" cellspacing="0" border="0"  class="addTables" >
        
        <tbody id="sss" >
        
        </tbody>
       
    </table>
        
        	
    </div>
    <!-- <tbody id="sss">
    <input type="button" value="确定" class="saveBotton" style="margin-top:110px; margin-left: 500px;" />  
    
    </tbody> -->

</div>

<!-- 
<div class="mbStyle">&nbsp;</div>
<div class="popupStyle-notsee" style="width: 500px; height: 150px;">
    <h1>不再显示该无销量<span class="closeX">X</span></h1>

    <span class="closeX" style="text-align: center;" > &nbsp;确定不再显示？&nbsp;</span>

    <h2 class="tabTitle2">&nbsp;</h2>

    <div class="btposition1">
        <input type="button" value="当然" id="" class="saveBotton" onclick="NewPage('teacher/consultTeacherQuery')" />
        <input type="button" value="再想想" class="saveBotton" onclick="NewPage('teacher/consultTeacherQuery')" />
    </div>
</div> 
-->



<div class="mbStyle">&nbsp;</div>
<div class="popupStyle-study" style="width: 570px; height: 400px;">
    <h1>提交报名审核<span class="closeX">X</span></h1>
   <form action="#" method="post" enctype="multipart/form-data" id="shenheform">
        <table cellpadding="0" cellspacing="0" border="0" class="addTable">
<!--         
        <tbody id="shenhe" >
        
        </tbody> -->
            <tr>
                <td class="tdWidth" >姓名：</td>
                <td>
                    <label id="name_consult" ></label>
                </td>
               <td class="tdWidth">咨询师：</td>
                <td><label id="teacher_consult"></label></td>
            </tr>
            <tr>
                 <td class="tdWidth">缴费金额：</td>
                <td><input type="number"  min="1" id="payMoney_consult"  name="payMoney"class="textStyle"  style="width:130px;" /></td>
               <td class="tdWidth">缴费时间：</td>
		      <td>
		      <input type="date"  name="a_payTime" id="payTime_consult" class="dateStyle" style="width:130px;"  value="${oaJwbGrade.openingTime }"/></td>
              
            </tr> 
            <tr>
             <td class="tdWidth">缴费状态：</td>
                <td><select id="paystatus_consult" class="selectStyle" name="payStatus" style="width:130px;" >
                			<option value="0">请选择</option>
          						<c:if test="${oaScbPaystatusList !=null}">
          						<c:forEach var="oaScbPaystatus" items="${oaScbPaystatusList}">
          						<option value="${oaScbPaystatus.id}">${oaScbPaystatus.payStatus}</option>
          						</c:forEach>
          						</c:if>
          						</select></td>
                <td class="tdWidth">缴费方式：</td>
                <td> <select  id="paytype_consult"  class="selectStyle" name="payType" style="width:130px;" >
                			<option value="0" >请选择</option>
          					<c:if test="${oaScbPaytypeList !=null}">
          					<c:forEach var="oaScbPaytype" items="${oaScbPaytypeList}">
          						<option value="${oaScbPaytype.id}">${oaScbPaytype.payType}
								</option>
          						</c:forEach>   
          						</c:if>
          						</select></td>
               
            </tr>    	
            <tr>
                <td class="tdWidth">住宿情况：</td>
                <td> <select id="dorm_consult" class="selectStyle" name="dorm" style="width:130px;">
              	  <option value="0">请选择</option>
                    <option value="1">是</option>
                    <option  value="2">否</option>
                    <option  value="3">不住</option>
                </select></td>
                <td class="tdWidth">保险：</td>
                <td> <select class="selectStyle" id="insurance_consult" name="insurance" style="width:130px;">
                	<option value="0">请选择</option>
                    <option value="1">是</option>
                    <option value="2">免责</option>
                </select></td>           
			</tr>
			<tr>
			 <td class="tdWidth">报选课程：</td>
                <td><select id="consultLesson_consult" class="selectStyle" name="consultLesson" style="width:130px;">
                                <option value="0">请选择</option>
                                <c:if test="${consultLessonList !=null}">
						<c:forEach var="lesson" items="${consultLessonList}">
							<option  value="${lesson.id}">${lesson.consultLesson}</option>
						</c:forEach>
				 	 </c:if>                                
                       </select></td>
			</tr>
        </table>
        <h2 class="tabTitle2">&nbsp;</h2>

        <div class="btposition1">
        	<input type="button" value="提交" onclick="commitShenhe(conId)" class="saveBotton" />
            <input type="button" value="保存" onclick="saveShenhe(conId)" class="saveBotton" />
            <input type="button" value="取消" class="saveBotton" />
        </div>
          </form>
</div>


</body>
</html>


