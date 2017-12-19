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

    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup-notsee.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popups.css"/>
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

            /*点击展开搜索面板*/
            $(".searchShow").click(function(){

                $(".searchContent").slideDown(300);
                $(".searchShow").hide();
            });
            /*点击搜索关闭面板*/
            $("#btn").click(function(){

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
        
		/* 回收 */
		function al(num,index,choose){
			var result = confirm("确定要回收吗？");
			var employee_id=${loginUser.emp_id};
			var consultTeacherName=$(choose).attr("consultTeacherName");
			
			if(result==true){
				var stuname=$(choose).attr("stuname");
				var user="${loginUser.emp_name}";
				var tea=$(choose).attr("tea");
				$.ajax({
    				url:"director/retrieveConsulter/"+num,
    				data:{employee_id:employee_id,consultTeacherName:consultTeacherName},
    				dataType:"text",
    				success:function(){
    					$.ajax({
							url:"adviceadd",
							type:"GET",
							data:{"from":parent.user,"content":user+"回收了"+stuname+"这条资源","to":tea},
							datatype:"text",
							success:function(dat){
							    	if(dat){
							    		var  temp="{from:'"+parent.user+"',content:'"+user+"回收了"+stuname+"这条资源',to:'"+tea+"'}";
					    				parent.ws.send(temp);
					    				show(1);
							    	}
							 }
						});	
	    				
	    			}
    			} );
    			
    			function callback (data){

	    			show(index);
	    		}  
			}else{
				show(index);
			}
			
		}
			
			


        /* 回收无销量  */
        $(function(){
            /*点击显示弹出框*/
            

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
        
        
       
    </script>
    <script type="text/javascript">
    function ToRevise(num){
	/* var temp="id="+num;
	$.post("Consultway/Torevise",{id:num},Revise,"json"); */
	
	window.location.href="Consultway/ToreviseZG?id="+num;
}
    	/* 查询 */
    	function show(index){
			var pageSize = $("#pageSize").val();
			var orderId=$("#orderId").val();
			var temp = $("#form").serialize()+"&index="+ index+"&pageSize="+pageSize+"&orderId="+orderId;
			$.post("director/conquery",temp,showListInfo,"json");
		}
		function showListInfo(data){
			var index = data.index;
			var pageCount = data.pageCount;
			var consulterList = data.consulterList;
			var totalCount = data.totalCount;
			showInfo(consulterList,index);
			showPage(index,pageCount,totalCount);
		}
    	function showInfo(data,index){

				var str = "";
    			$("#consulters").empty();
    			
    			if(data.length==0){
    				$("#consulters").html("空");
    				
    			}else{
    				for ( var i = 0; i < data.length; i++) {
					var sex = data[i].sex==1?"男":"女";
					var type = data[i].type==1?"常规":"市场";
					var allotstatus = data[i].allotstatus==1?"已分量":data[i].allotstatus==2?"未分量":data[i].allotstatus==3?"未查看":data[i].allotstatus==4?"已查看":"未知";
					var consultTeacherName =data[i].consultTeacherName==null || data[i].consultLessonName== ""?"暂无":data[i].consultTeacherName;
					var consultLessonName = data[i].consultLessonName==null || data[i].consultLessonName=="" ?"未知":data[i].consultLessonName;
					var consultwayName = data[i].consultwayName == null || data[i].consultwayName==""?"未知":data[i].consultwayName;
					var educationName = data[i].educationName==null || data[i].educationName==""?"未知":data[i].educationName;
					var infoSourceName = data[i].infoSource == null || data[i].infoSource ==""?"未知":data[i].infoSource;
					var rankName = data[i].rankName ==null || data[i].rankName ==""?"未知":data[i].rankName;
					var keywords= data[i].keywords ==null || data[i].keywords==""?"未知":data[i].keywords;
					var firstConsultTimes =data[i].firstConsultTimes ==null || data[i].firstConsultTimes==""?"暂未咨询":data[i].firstConsultTimes;
					var statusName = data[i].statusName==null || data[i].statusName==""?"未知":data[i].statusName;
					var city = data[i].city == null || data[i].city ==""?"未知":data[i].city;				
					str += "<tr><td>"+data[i].id+"</td>"+"<td>"+allotstatus+"</td>"
					+"<td>"+consultTeacherName+"</td><td>"+data[i].name+"</td><td>"+sex+"</td><td>"+data[i].age+"</td>"
					+"<td>"+data[i].telphone1+"</td><td>"+consultLessonName+"</td><td>"+consultwayName+"</td>"
					+"<td>"+educationName+"</td><td>"+infoSourceName+"</td><td>"+type+"</td>"
					+"<td>"+rankName+"</td><td>"+keywords+"</td><td>"+firstConsultTimes+"</td>"
					+"<td>"+city+"</td><td>"+statusName+"</td>"
					+"<td>"
					+"<span style='color: #2828FF;' onclick=ToRevise("+data[i].id+") class='edit'  >完善</span><a href='javascript:void(0)' class='edit' onclick='look("+data[i].id+")'>查看</a><a href='javascript:void(0)' onclick=ConDelete("+data[i].id+") class='edit'><span id='edit' style='color: #2828FF;' >删除</span></a>";
					if(data[i].allotstatus !=2){
						str +="<a href='javascript:void(0)' tea='"+data[i].consultTeacher+"'  consultTeacherName='"+data[i].consultTeacherName+"'  stuname='"+data[i].name+"'   class='edit'   onclick='al("+data[i].id+","+index+",this)'><span class='notsee' >回收</span></a>";
					}
					
					str +="<a href='javascript:void(0)' class='paifa' onclick=follow("+data[i].id+",0)>跟踪</a></td></tr>";
					
				}
					
					$("#consulters").html(str);
    			}			     					
    		}
    		
    		function follow(Id,stuId){
    
				location.href="Consultway/findFollow?id="+Id+"&stuId="+stuId;
    	}
    
    	/*删除*/
    	function ConDelete(Id) {
    	var employee_id=${loginUser.emp_id};
    		var msg = "您真的确定要删除吗？";
    		if (confirm(msg) == true) {
    			location.href = "director/ConsulterDelete?id=" + Id+"&employee_id="+employee_id;
    			return true;
    		} else {
    			return false;
    		}
    
    	}
    	/* 			function directorFollowReturn(data){
    
    					if(data.length==0){
    						alert("暂无该跟踪记录");
    					}else{
    					
    					$("#VisitInfo").empty();
    					var temp="";
    							 for ( var i = 0; i < data.length; i++) {
    
    								temp+="本次回访时间："+data[i].returnvisitTimes+""
    									+"   回访人："+data[i].returnvisitPeopleName+"\n"
    									+"下次回访时间："+data[i].nextvisitTimes+"\n"
    							 		+"回访内容:"+data[i].returnvisitRecord+"\n\n";
    							}
    						var consultTeacherName = data[0].consultTeacherName ==null || data[0].consultTeacherName==''?"暂无":data[0].consultTeacherName;
    					 $("#VisitInfo").append("<tr><td class='tdWidth'>咨询量姓名：</td>"
    				                        +"<td><label >"+data[0].consultName+"</label></td>"
    				                        +"<td class='tdWidth'>当前负责咨询师：</td>"
    				                        +"<td><label >"+consultTeacherName+"</label></td></tr>"
    				                        +"<tr><td class='tdWidth'>回访记录：</td>"
    				                        +"<td colspan='3'><textarea name='comments'  cols='x'  rows='y'  style= 'resize:none; width: 420px ;height: 300px;'resize:none;  readonly='readonly'  >"+temp+"</textarea  ></td></tr>"
    				                        +"<tr><td colspan='5'  style='text-align: center;'>"
    				                    	+"<input type='button' onclick=VisitInfoClose()  value='确定' class='saveBotton' /></td></tr>");
    				                    
    				                    
    										var mbHeight= $(document).height();
    									    var mbWidth=$(window).width();
    									    var delHeight=$(window).height();
    								         
    							         
    							         $(".mbStyle").css("height",mbHeight); 
    							         $(".mbStyle-studyInfo").css("height",mbHeight); 
    							         $(".popupStyle-study").css("left",mbWidth/2-280);
    							         $(".popupStyle-study").css("top",delHeight/0);
    							         $(".popupStyle-study").css("display","block");
    							         $(".mbStyle").css("display","block");
    							        
    							            
    							         $(".closeX").click(function(){
    								         $(".mbStyle").css("display","none");
    								         $(".mbStyle-studyInfo").css("display","none");
    								         $(".popupStyle-study").css("display","none");
    				            		});
    	      }
    	}	
    	function VisitInfoClose(){
    
    		 $(".mbStyle").css("display","none");
    	    $(".popupStyle-study").css("display","none");
    	} */
    
    
    
    
    	function edit(data){
    			window.location.href="director/editCon?id="+data;
    		}
   			 function look(data){
				$.ajax({
    				url:"director/lookconInfo/"+data,
    				dataType:"json",
    				success:lookInfo 
    			} );
        	}
        	
        	function lookInfo (data){
        			var temp ='';
					$("#DirectorInfoShow").empty();
					
		
						var sex=data.sex==1? "男":"女";
						var come=data.come==1?"已上门":"未上门";
						var enrollStatus=data.enrollStatus==1?"已报名":"未报名";
						var invalid='';
						if(data.invalid==1){
							invalid="有效";
						}else if(data.invalid==3){
							invalid="待审核";
						}else if(data.invalid==2||data.invalid==null){
							invalid="无效";
						}else{
							invalid="未知";
						}
						var wechat = data.wechat ==null || data.wechat =='' ?"未知":data.wechat;
						var urgentTelpeople = data.urgentTelpeople ==null || data.urgentTelpeople =='' ?"未知":data.urgentTelpeople;
						var ungenTelphone = data.ungenTelphone == null || data.ungenTelphone ==''?"未知":data.ungenTelphone;
						var statusName = data.statusName ==null || data.statusName ==''?"未知":data.statusName;
						var schoolName =data.schoolName ==null || data.schoolName ==''?"未知":data.schoolName;
						var specialty = data.specialty ==null || data.specialty ==''?"未知":data.specialty;
						var consultTeacherName = data.consultTeacherName==null ||data.consultTeacherName ==''?"暂无":data.consultTeacherName;	
						var rankName =data.rankName ==null || data.rankName ==''?"未知":data.rankName;
						var consultLessonName = data.consultLessonName ==null || data.consultLessonName ==''?"未知":data.consultLessonName;	
						var educationName = data.educationName ==null || data.educationName =="" ?"未知"	:data.educationName;
						temp +=" <tr> <td class='tdWidth'>姓名：</td>"
                    +"<td><label>"+data.name+"</label> </td>"
                    +"<td class='tdWidth'>性别：</td>"
					+"<td><label >"+sex+"</label></td>"
					+"<td class='tdWidth'>年龄：</td>"
                    +"<td><label >"+data.age+"</label></td></tr>"
                    
                    +"<tr><td class='tdWidth'>联系方式：</td>"
                    +"<td><label >"+data.telphone1+"</label></td>"
                    +"<td class='tdWidth'>QQ/微信：</td>"
                    +"<td><label >"+wechat+"</label></td>"
                	+"<td class='tdWidth'>现住城市：</td>"
                    +"<td><label >"+data.city+"</label></td></tr>"
               		
               		+"<tr><td class='tdWidth'>紧急联系人：</td>"
                    +"<td><label >"+urgentTelpeople+"</label></td>"
                    +"<td class='tdWidth'>紧急联系方式：</td>"
                    +"<td><label >"+ungenTelphone+"</label></td> "
               		+"<td class='tdWidth'>社会状态：</td>"
                    +"<td><label >"+statusName+"</label></td></tr>"
                    
                    +"<tr><td class='tdWidth'>毕业院校：</td>"
                    +"<td><label >"+schoolName+"</label></td> "
                    +"<td class='tdWidth'>学历：</td>"
                    +"<td><label >"+educationName+"</label></td>"
                    +"<td class='tdWidth'>专业：</td>"
                    +"<td><label >"+specialty+"</label></td></tr>"
                	
                	+"<tr><td class='tdWidth'>负责咨询师：</td>"
                    +"<td><label >"+consultTeacherName+"</label></td>"
                    +"<td class='tdWidth'>咨询课程：</td>"
                    +"<td><label >"+consultLessonName+"</label></td>"
                    +"<td class='tdWidth'>上门状态：</td>"
                    +"<td><label >"+come+"</label></td></tr>"
                    
  					+"<tr><td class='tdWidth'>报名状态：</td>"
                    +"<td><label >"+enrollStatus+"</label></td>"
               		+" <td class='tdWidth'>咨询量等级：</td>"
                    +"<td><label >"+rankName+"</label></td>"
  					+"<td class='tdWidth'>有效状态：</td>"
                    +"<td><label >"+invalid+"</label></td></tr>"
                    
                
                	+"<tr><td class='tdWidth' >备注：</td>"
                    +"<td colspan='5'><textarea   cols='x'  rows='y'  style='width: 450px ;height: 120px; resize:none;' readonly='readonly' >"+data.comments+"</textarea  ></td> </tr>"
               
               		+"<tr><td class='tdWidth' colspan='3'><input  type='button' value='确定' onclick=infoconfirm()  class='saveBotton' /></td></tr>";
                    
                
               
					$("#DirectorInfoShow").append(temp);
					
					var mbHeight= $(document).height();
				       var mbWidth=$(window).width();
				       var delHeight=$(window).height();
         
			         $(".mbStyle").css("height",mbHeight); 
			         $(".popupStyle").css("left",mbWidth/2-350);
			         $(".popupStyle").css("top",delHeight/1-560);
			         $(".popupStyle").css("display","block");
			         $(".mbStyle").css("display","block");
        
            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });
	    	} 
	    	function infoconfirm(){
 				$(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
			}
    		
    		/* index：当前页码， pageCount：总页码， totalCount:总条数*/
    		
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
    		
    	/* 点击进行排序 */
    	function order(i){
    		var orderId1;
    		var orderId2=$("#orderId").val();
    		if(i==orderId2){
    			orderId1=-i;
    			
    		}else{
    			orderId1=i;
    			
    		}
    		$("#orderId").val(orderId1);
    		show(1);
    	}
    	$(function(){
			show(1);
			
			$("#btn").click(function(){
			
				show(1);
			
			});
		}); 

/* 审核无效量 */
function showCheck(){
	window.location.href="director/consultDirectorCheck";
}

/* 显示分发咨询量 */
function showHandout(){
	window.location.href="director/consultDirectorHandout";
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
<div class="rightContent" width=98%>
    <div class="tabs" id="tabs"  >
      <span class="spanHover" onclick="showQuery()">查询咨询量</span>
      <span class="spanOut"  onclick="showCheck()">审核无效量</span>
      <span class="spanOut"  onclick="showHandout()" >分发咨询量</span>
      <span class="spanOut"  onclick="showUseless()" >查看无效量</span>
      <span class="spanOut"  onclick="showHistory()">查看历史量</span>
      <span class="spanOut"  onclick="showChongfu()">疑似重复量</span>
  	</div>
    <div class="tabContent">
        <h1 class="tabTitle">查询咨询量</h1>
        <div class="serach">
            <div class="searchTitle">
                搜索条件
                <div class="searchShow">展开>></div>
            </div>
            <div class="searchContent">
                <form id="form">
                	
                	<table  class="searchTable" >
                		<tr>
                			<td colspan="2" style="text-align: center;"><span  >查询：<input type="text"  oninput="show(1)" style=" width:350px; height: 30px;" placeholder="搜索姓名，年龄，专业，联系方式1，联系方式2，紧急联系方式，毕业院校，现住地" name="name"></span></td>
                		</tr>
                	</table>
                	<table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;  text-align: right ;margin-left:-25px;" >
                		<tr>
                        <td class="tdWidth">咨询师：
                            <select class="selectStyle" style="width:130px;" name="consultTeacher">
                                <option value="0">全部</option>
                                <c:if test="${empList !=null}">
									<c:forEach var="teacher" items="${empList}">
										<option <c:if test="${teacher.emp_id == consultTeacher}">selected="selected"</c:if>
										 value="${teacher.emp_id}">${teacher.emp_name}
										</option>
									</c:forEach>
				  				</c:if>
                            </select>
                        </td>
                        <td class="tdWidth">分量：
                            <select class="selectStyle" style="width:130px;" name="allotstatus">
                                <option value="0">全部</option>
                                <option value="1">已分量</option>
                                <option value="2">未分量</option>
                            </select>
                        </td>
                        <td class="tdWidth">性别：
                        	<select class="selectStyle" name="sex" style="width:130px;">
	                            <option value="0">全部</option>
	                            <option value="1">男</option>
	                            <option value="2">女</option>
                        	</select>
                        </td>
                        <td class="tdWidth">学历：
                            <select class="selectStyle" style="width:130px;" name="education">
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
                    	<td class="tdWidth">状态：
                            <select class="selectStyle" style="width:130px;" name="status">
                                <option value="0">全部</option>
                                <c:if test="${consultStatusList !=null}">
									<c:forEach var="consultStatus" items="${consultStatusList}">
										<%-- <option <c:if test="${consultStatus.id == status}">selected="selected"</c:if>
							 				value="${consultStatus.id}">${consultStatus.status}
										</option>  --%>
									</c:forEach>
				  				</c:if>
                            </select>
                        </td>
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
                        <td class="tdWidth">信息来源：
                            <select class="selectStyle" style="width:130px;" name="infoSource">
                                <option value="0">全部</option>
									<c:if test="${InfosourceList !=null}">
										<c:forEach var="OaScbInfosource" items="${InfosourceList}">
											<option <c:if test="${OaScbInfosource.id == Infosource}">selected="selected"</c:if>
											 	value="${OaScbInfosource.id}">${OaScbInfosource.infoSource}
											</option>
										</c:forEach>
					 				</c:if>
                            </select>
                        </td>
                        <td class="tdWidth">咨询量分类：
                            <select class="selectStyle" style="width:130px;" name="type">
                                <option value="0">全部</option>
                                <option value="1">常规</option>
                                <option value="2">市场</option>
                            </select>
                        </td>
                         </tr>
                    	<tr>	
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
                        <td class="tdWidth">上门：
                            <select class="selectStyle" style="width:130px;" name="come">
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
                    	
                    			<td class="tdWidth" >首次咨询日期：<input type="date" name="firstConsultTimes" class="dateStyle" style="width:130px;" /></td>
                        		<td class="tdWidth">预计回访时间：<input type="date" name="nextvisitTimes" class="dateStyle" style="width:130px;" /></td>
                        		<td class="tdWidth" >报名日期：<input type="date" name="enrollTimes" class="dateStyle" style="width:130px;" /></td>
                    		
                    </tr>
                    <tr>
                        <td colspan="5"><input type="button"  id="btn" value="搜索" class="searchBotton"/>
                         	
                        </td>
                    </tr>
                	</table>
                    
                </form>
        
            </div>
            <hr>
            
<input type="hidden" value="1" id="orderId" >
            <h1 class="tabTitle">基本信息</h1>
            <div class="divTable" >
                <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
                	<thead>
                    <tr >
                        <th>序号</th>
                        <th>分量状态</th>
                        <th>咨询师</th>
                        <th>学员姓名</th>
                        <th>性别</th>
                        <th onclick="order(2)">年龄</th>
                        <th>联系方式</th>
                        <th>咨询课程</th>
                        <th>咨询方式</th>
                        <th>学历</th>
                        <th>信息来源</th>
                        <th>类型</th>
                        <th onclick="order(3)">等级</th>
                        <th>关键词</th>
                        <th onclick="order(1)">首次咨询日期</th>
                        <th>地区</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
					</thead>

					<tbody id="consulters">
					
						
					
					</tbody>

                </table>
                <span style="float:right;"><input type="number"  min="1" max="100" name="pageSize" onchange="show(1)" style="width:80px;" id="pageSize"/>条/每页&nbsp;&nbsp;&nbsp;</span>
                <div id="page"></div>
            </div>

        </div>
        <div class="mbStyle">&nbsp;</div>
        <div class="popupStyle" style="width: 600px; height: 550px; ">
            <h1>学生详情<span class="closeX">X</span></h1>
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
            
            	<tbody id="DirectorInfoShow">
              
              	</tbody>
                
            </table>

        </div>


        <div class="mbStyle">&nbsp;</div>
        <div class="popupStyle-notsee" style="width: 500px; height: 150px;">
            <h1>回收咨询量<span class="closeX">X</span></h1>

            <span class="closeX" style="text-align: center;" > &nbsp;确定回收该咨询量？&nbsp;</span>

            <h2 class="tabTitle2">&nbsp;</h2>

            
        </div>


        <div class="mbStyle">&nbsp;</div>
        <div class="popupStyle-study" style="width: 570px; height: 450px;">
            <h1>咨询量跟踪情况<span class="closeX">X</span></h1>
            <form action="">
                <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                    <tbody id="VisitInfo">
                  	</tbody>
                </table>
               
            </form>
        </div>

</body>
</html>
