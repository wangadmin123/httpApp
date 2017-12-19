<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    		function showidPage(index,pageCount,count,pageSize){
				$("#page").empty();
			
				$("#page").append("<a href='javascript:onchange=getByIdfy("+1+") '>首页&nbsp;&nbsp;</ a>");
			if(count!=0){
				if(index!=1){
					$("#page").append("<a href=' javascript:onclick=getByIdfy("+(index-1)+")'>上一页&nbsp;&nbsp;</a>");
				}
		
				for(var i=index;i<=index+2;i++){
					$("#page").append("<a href=' javascript:onclick=getByIdfy("+i+")'>"+i+"</a>&nbsp;&nbsp;");
					if(i>pageCount-1){
						break;
					}
			 	}
		if(index!=pageCount){
				$("#page").append("<a href=' javascript:onchange=getByIdfy("+(index+1)+")'>下一页&nbsp;&nbsp;</ a>");
			}
				
				$("#page").append("<a href=' javascript:onclick=getByIdfy("+pageCount+")'>末页&nbsp;</ a>");
				
				
				$("#page").append("<span>共&nbsp;"+pageCount+"&nbsp;页,</span>&nbsp;<span>共&nbsp;"+count+"&nbsp;条咨询量</span>");
				
				$("#page").append("每页显示的数量：<input type='number' id='number' onchange='getByIdfy(1)' value="+pageSize+"   min='1' max='100'  class='textStyle' style='width:45px;'/>条");
			} 
				
				
			}
			function getByIdfy(index){
			var school=$("#cang").val();
			var number=$("#number").val();
       			if(number==null){
       				number=10;
       			}
				$.ajax({
					url:"market/getBySchoolName",
					data:{"schoolName":school,"index":index,"number":number},
					dataType:"json",
					success:function(data){
						var marketlist = data.marketlist;
						var index = data.index;
						var pageCount = data.pageCount;
						var count =data.count;
						var pageSize=data.pageSize;
			
						showInfo(marketlist,index);
						showidPage(index,pageCount,count,pageSize);
					}
				});
			}
    	 function getById(choose,index){
    	 	var num=$(choose).attr("schoolName");
    	 	$("#cang").val(num);
			var number=$("#number").val();
       			if(number==null){
       				number=10;
       			}
				$.ajax({
					url:"market/getBySchoolName",
					data:{"schoolName":num,"index":index,"number":number},
					dataType:"json",
					success:function(data){
						var marketlist = data.marketlist;
						var index = data.index;
						var pageCount = data.pageCount;
						var count =data.count;
						var pageSize=data.pageSize;
			
						showInfo(marketlist,index);
						showidPage(index,pageCount,count,pageSize);
					}
				});
			}
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
			
		
			
			
            /*点击展开搜索面板*/
            $(".searchShow").click(function(){
				$.ajax({
					url:"market/getall",
					dataType:"json",
					success:function(data){
						$("#yuanxiao").html("");
						$("#yuanxiao").append("院校名:");
						$(data).each(function(){
							$("#yuanxiao").append("<a href='javascript:void(0)' schoolName='"+this.schoolName+"'  onclick='getById(this)'>"+this.schoolName+"</a>&nbsp;&nbsp;")
						});
					}
				});
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

        $(function(){
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

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",50);


        });



        /* 回收无销量  */
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



        /* 分发咨询师  */
        $(function(){
            /*点击显示弹出框*/
            $(".distribute").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle-study").css("display","block");


            });

            /*关闭*/
            $(".closeX").click(function(){
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
    </script>
    <script type="text/javascript"> 
    	function show(index){
			var number=$("#number").val();
       	if(number==null){
       		number=10;
       	}
			var temp = $("#form").serialize()+"&index="+index+"&pageSizes="+number;

			$.post("market/marketQuery",temp,showInfoList,"json");
		
			
		}
		
		function showInfoList(data){
			var marketlist = data.marketlist;
			var index = data.index;
			var pageCount = data.pageCount;
			var count =data.count;
			var pageSize=data.pageSize;
			
			showInfo(marketlist,index);
			showPage(index,pageCount,count,pageSize);
		}
		
    		function showInfo(data,index){
    			$("#consulters").empty();
    			
    			if(data.length==0){
    				 $("#consulters").html("<tr><td colspan='12'>暂无数据</td></tr>");
    			}else{
    				
    				for( var i = 0; i < data.length; i++) {
						var sex = data[i].sex==1?"男":"女";
						var id=data[i].id;
						var name =data[i].name==null?"暂无":data[i].name;
						var age =data[i].age==null?"暂无":data[i].age;
						var allotTimes =data[i].allotTimes==null?"暂无":data[i].allotTimes;
						var consultTeacher =data[i].consultTeacherName==null?"暂无":data[i].consultTeacherName;
						var consultwayName =data[i].consultwayName==null?"暂无":data[i].consultwayName;
						var consultLessonName =data[i].consultLessonName==null?"暂无":data[i].consultLessonName;
						var rankName =data[i].rankName==null?"暂无":data[i].rankName;
						var returnvisitTimes =data[i].returnvisitTimes==null?"暂无":data[i].returnvisitTimes;
						var telphone1 =data[i].telphone1==null || data[i].telphone1==""?"暂无":data[i].telphone1;
						var city =data[i].city==null?"暂无":data[i].city;
						var specialty =data[i].specialty==null?"暂无":data[i].specialty;
						var schoolName =data[i].schoolName==null || data[i].schoolName==""?"暂无":data[i].schoolName;
						var statusName =data[i].statusName==null?"暂无":data[i].statusName;
						$("#consulters").append( "<tr>"
												+"<td>"+(i+1)+"</td>"
												 +"<td>"+name+"</td>"
												+"<td>"+sex+"</td>"
												+"<td>"+age+"</td>"
												+"<td>"+allotTimes+"</td>"
												+"<td>"+consultTeacher+"</td>"
												+"<td>"+consultwayName+"</td>"
												+"<td>"+consultLessonName+"</td>"
												+"<td>"+rankName+"</td>"
												+"<td>"+telphone1+"</td>"
												+"<td>"+city+"</td>"
												+"<td>"+specialty+"</td>"
												+"<td>"+schoolName+"</td>"
												+"<td>"+statusName+"</td>"+ "<td><c:if test="${loginUser.position.position_id!=39}"><a href='javascript:ToRevise("+data[i].id+");' >完善</a>&nbsp;&nbsp;<a href='teacher/consultTeacherVisit?id="+id+"&stuId=1'>跟踪</a>&nbsp;&nbsp;<a href='javascript:void(0)' class='study' ><span onclick='enrollStatus("+data[i].id+","+index+")'>报审</span></a></c:if>"
												+ "&nbsp;&nbsp;<a href='javascript:void(0)' onclick=follow("+data[i].id+
												",1) >查看</a><c:if test="${loginUser.position.position_id==39}">&nbsp;&nbsp;<a href='javascript:void(0)' onclick=ConDelete("+data[i].id+")>删除</a></c:if></td>"
												+"</tr>" );
						
				}
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
			    /* 跳转编辑页面 */
function ToRevise(num){

	window.location.href="Consultway/ToreviseQD?id="+num;
}
			
	/*删除*/
	function ConDelete(Id){
	 var msg = "您真的确定要删除吗？"; 
 if (confirm(msg)==true){ 
 location.href="market/ConsulterDelete?id="+Id;
  return true; 
 }else{ 
  return false; 
 } 
	
	}
			
	/* 跟踪显示 */
	function follow(Id,stuId){
    
				location.href="Consultway/findFollow?id="+Id+"&stuId="+stuId;	
			}
	/* 报审 */
    		var commitIndex =0 ;
    		function enrollStatus(id,index){
    			
    			conId = id;
    			commitIndex = index;
			/* $.post("teacher/enrollStatusConsulter/"+data+"",showInfo2,"json");  */ 
			
				$.ajax({
					url:"teacher/enrollStatusConsulter/"+id,
					dataType:"json",
					success:showInfo21
				});
			

			}
			
	function showInfo21(data){
						
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
	function commitShenhe(conId){


		var temp = $("#shenheform").serialize()+"&id="+conId+"&employee_id="+${loginUser.emp_id};
		$.post("teacher/commitShenhe",temp,showInfo2,"text");
		

	}
	function commitShenhe(conId){


		var temp = $("#shenheform").serialize()+"&id="+conId+"&employee_id="+${loginUser.emp_id};
		$.post("teacher/commitShenhe",temp,showInfo2,"text");
		

	}
		
	function  showInfo2() {
		var stuname=$("#name_consult").val();
		var tea="${loginUser.emp_name}";
		$.ajax({
			url:"chazhiwei",
			type:"GET",
			data:{"name":"咨询助理"},
		    dataType:"JSON",
		    success:function(res){
		    $list=$(res);
		    $list.each(function(){
		       var id=this.emp_id;
		       	$.ajax({
								url:"adviceadd",
								type:"GET",
								data:{"from":parent.user,"content":tea+"提交了报名申请","to":id},
								datatype:"text",
				    			success:function(){
				    					var temp="{from:'"+parent.user+"',content:'"+tea+"提交了报名申请',to:'"+id+"'}";
										parent.ws.send(temp);
								        show(commitIndex);
				    			}
				    		});
		    });
		 
		    
		    /* var $res=$(data);
				$res.each(function() {
					
					$.ajax({
								url:"adviceadd",
								type:"GET",
								data:{"from":parent.user,"content":tea+"提交了报名申请","to":id},
								datatype:"text",
				    			success:function(){
				    					var temp="{from:'"+parent.user+"',content:'"+tea+"提交了报名申请',to:'"+id+"'}";
										parent.ws.send(temp);
								        show(commitIndex);
				    			}
				    		});
				}) */
		    	
		    }
		 });
		
	}
	
		 

				
//旧跟踪
/* function AssistantOaScbVisitFind(data){

	if(data.length==0||data==null){
		alert("暂无该跟踪记录");
	}else{
	
	$("#VisitInfo").empty();
	var temp="";
	var num=data.length;
			 for ( var i = 0; i < data.length; i++) {
			
					temp+="<span style='line-height:25px;color:#000;display:block;'>第"+(num-i)+"次回访</span><span style='line-height:25px;color:#000;display:block;'>本次回访时间："+data[i].returnvisitTimes+"&nbsp;&nbsp;&nbsp;"
					+"回访人："+data[i].returnvisitPeopleName+"&nbsp;&nbsp;&nbsp;</span>"
					+"<span style='line-height:25px;color:#000;display:block;'>下次回访时间："+data[i].nextvisitTimes+"</span>"
			 		+"<span style='line-height:25px;color:#000;display:block;'>回访内容:"+data[i].returnvisitRecord+"</span>"
			 		+"<h6 style='clear:both;border-bottom:1px solid #ccc;height:10px;margin:0px; padding:0px;'></h6>";
				
			}
	
	 $("#VisitInfo").append("<tr><td class='tdWidth'>咨询量姓名：</td>"
                        +"<td><label >"+data[0].consultName+"</label></td>"
                        +"<td class='tdWidth'>当前负责咨询师：</td>"
                        +"<td><label >"+data[0].consultTeacherName+"</label></td></tr>"
                        +"<tr><td class='tdWidth'>回访记录：</td>"
                        +"<td colspan='3'><div style='width:420px; height:300px;overflow:auto;border:1px solid #ccc;padding:5px;'>"+temp+"</div></td></tr>"
                        +"<tr><td colspan='5'  style='text-align: center;'>"
                    	+"<input type='button' onclick=VisitInfoClose()  value='确定' style= 'margin-top:10px;' class='saveBotton' /></td></tr>");
                    
                    
			 var mbHeight= $(document).height();
         	 var mbWidth=$(window).width();
         	 var delHeight=$(window).height();
         	 
         $(".mbStyle").css("height",mbHeight);
         $(".popupStyle-study").css("left",mbWidth/2-250);
         $(".popupStyle-study").css("top",delHeight/3-50);
         $(".popupStyle-study").css("display","block");
          $(".mbStyle").css("display","block");
           
           
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-study").css("display","none");
            }); 
			
			/*关闭
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-study").css("display","none");
            
            });
      
			}	
		} */
    	$(function(){
			show(1);
			
			$("#btn").click(function(){
			
				show(1);
			
			});
		
		
		}); 
    
    		/* 查询未提交量 */
function showHandout(){

	window.location.href="market/getquery";
	
}
/* 显示查询信息量 */
function showQuery(){

window.location.href="market/amarketQuery";
	
}   
    </script>
</head>
<body>
<div class="rightContent" width=98%><!-- style="width:1580px;" -->
<div class="tabs" id="tabs"  >
      <span class="spanHover" onclick="showQuery()">查询信息量</span>
      <span class="spanOut" id="spanLast"   onclick="showHandout()">查询未提交量</span>
      
  	</div>
    <div class="tabContent">
    	<input type="hidden" id="cang">
        <h1 class="tabTitle">查询咨询量</h1>
        <div class="serach">
        	
            <div class="searchTitle">
                搜索条件
                <div class="searchShow">展开>></div>
            </div>
            <div class="searchContent">
            <form action="#" method="post" id="form" enctype="multipart/form-data">
            <table class="searchTable">
            <tr><td colspan="2" style="margin-left:65px;" id="yuanxiao"></td></tr>
            	<tr>
            		
                	<td colspan="2" style="margin-left:65px;">查询条件：<input type="text" oninput="show(1)" name="name"  style=" width:350px;   height: 30px;" placeholder="搜索姓名，年龄，专业，联系方式，毕业院校，城市"></td>
                </tr>
            </table>
                		
                	
                <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%; text-align: right ;margin-left:-25px; " >
                    
                        <tr>
                        					
                           <td class="tdWidth">咨询师：
                            <select class="selectStyle" style="width:130px;" name="consultTeacher">
                                <option value="0">全部</option>
                                <c:if test="${ConsultTeacherList !=null}">
									<c:forEach var="teacher" items="${ConsultTeacherList}">
										<option <c:if test="${teacher.emp_id == consultTeacher}">selected="selected"</c:if>
										 value="${teacher.emp_id}">${teacher.emp_name}
										</option>
									</c:forEach>
				  				</c:if>
                            </select>
            		  </td> 
                            <td class="tdWidth">分量:
                                <select class="selectStyle" style="width:130px;" name="type">
                                <option value="0">全部</option>
                                <option value="1">已分量</option>
                                <option value="2">未分量</option>
                                </select>
                            </td>
                          
                            <td class="tdWidth">性别:<select class="selectStyle" name="sex" style="width:130px;">
                                <option value="0">全部</option>
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select></td>
                            
                            <td class="tdWidth">学历：
                            <select class="selectStyle" name="education" style="width:130px;" name="education">
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
                            
                        </tr>

                        <tr>
                            
                            <td class="tdWidth">首次咨询日期:<input type="date" name="firstConsultTimeq" class="dateStyle" style="width:130px;" /></td>
                            <td class="tdWidth">咨询方式：
                            <select class="selectStyle" style="width:130px;" name="consultWay">
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
                        

                        
                           <td class="tdWidth">媒体名称：
                     	   <select class="selectStyle" name="mediaName" style="width:130px;">
                             	<option value="0">全部</option>
                         
                				 <c:if test="${mediaNameList !=null}">
						
									<c:forEach var="media" items="${mediaNameList}">
									<option <c:if test="${media.id == mediaName}">selected="selected"</c:if>
										 value="${media.id}">${media.mediaName}
									</option>
								 </c:forEach>
				 				 </c:if>
                    			 </select></td>

                            <td class="tdWidth">咨询量分类:
                                <select class="selectStyle" name="type" style="width:130px;">
                                    <option value="0">全部</option>
                                    <option value="1">常规</option>
                                    <option value="2">市场</option>

                                </select>
                            </td>
                            
                      </tr>
                      <tr>
                            <td class="tdWidth">报名日期:<input type="date" name="enrollTimeq" class="dateStyle" style="width:130px;" /></td>
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
                            
                        
                            
                            <td class="tdWidth">上门:
                                <select class="selectStyle" style="width:130px;">
                                    <option value="0">全部</option>
                                    <option value="1">是</option>
                                    <option value="2">否</option>
                                </select></td>
                                

                        
                             <td class="tdWidth">咨询等级：
                            <select class="selectStyle" style="width:130px;" name="rank">
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
                        
                  </tr>
                  <tr>
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
                        <tr>
                            <td colspan="5"><input type="button" id="btn" value="搜索" class="searchBotton"/>
                                
                        </tr>
                    
                </table>
                </form>
            </div>






            <h1 class="tabTitle">基本信息</h1>
            <div class="divTable" >
                <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
                <thead>
                    <tr>
                      
                        <th>序号</th>
                        <th>咨询者姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>分量日期</th>
                        <th>咨询师姓名</th>
                        <th>咨询方式</th>
                        <th>咨询课程</th>
                        <th>咨询量等级</th>
                       <!--  <th>回访时间</th> -->
                        <th>联系方式</th>
                        <th>城市</th>
                        <th>专业</th>
                        <th>学校</th>                        
                        <th>状态</th>
                        <th>操作</th>


                    </tr>
                    </thead>
					<tbody  id="consulters">
					
					
					
					</tbody>

				

                </table>
        </div>
                <div id="page"></div>
                
            <div class="mbStyle">&nbsp;</div>
			<div class="popupStyle-study" style="width: 570px; height: 440px;">
            <h1>咨询量跟踪情况<span class="closeX">X</span></h1>
                <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                  	<tbody id="VisitInfo">
                  	</tbody>
                  	</table>
            </div>
        
            
        </div>
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
