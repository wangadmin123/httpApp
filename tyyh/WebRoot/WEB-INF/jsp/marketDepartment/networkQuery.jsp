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
    </script>
    <script type="text/javascript">
    	function show(index){
    		
    		var number=$("#number").val();
       	if(number==null){
       		number=10;
       	}
	
			var temp = $("#form").serialize()+"&index="+index+"&pageSizes="+number;
			
			$.post("Network/networkQuery",temp,showInfoList,"json");
		
			
		}
		
		function showInfoList(data){
		
			var checkList = data.checkList;
			var index = data.index;
			var pageCount = data.pageCount;
			var totalCount=data.totalCount;
			var pageSize=data.pageSize;
			showInfo(checkList,index);
			showPage(index,pageCount,totalCount,pageSize);
			
		}
		

    	function showInfo(data,index){
    		console.log(data);
    			$("#consulters").empty();
    			if(data.length==0){
    				$("#consulters").html("空");
    			}else{
    			
    				for ( var i = 0; i < data.length; i++) {
					var sex = data[i].sex==1?"男":"女";
					var consultTeacherName =data[i].consultTeacherName==null || data[i].consultTeacherName==""?"暂无":data[i].consultTeacherName;
					var statusName =data[i].statusName==null || data[i].statusName==""?"暂无":data[i].statusName;
					var keywords =data[i].keywords==null || data[i].keywords==""?"暂无":data[i].keywords;
					var schoolName =data[i].schoolName==null || data[i].schoolName==""?"暂无":data[i].schoolName;
					var schoolDorm =data[i].schoolDorm==null || data[i].schoolDorm ==""?"暂无":data[i].schoolDorm;
					var city =data[i].city==null || data[i].city =="" ?"暂无":data[i].city;
					var specialty =data[i].specialty==null || data[i].specialty==""?"暂无":data[i].specialty;
					var consultLessonName =data[i].consultLessonName==null || data[i].consultLessonName== ""?"暂无":data[i].consultLessonName;
					var consultwayName =data[i].consultwayName==null || data[i].consultwayName==""?"暂无":data[i].consultwayName;
					var rankName =data[i].rankName==null || data[i].rankName ==""?"暂无":data[i].rankName;
					
					var allotTimes =data[i].allotTimes==null || data[i].allotTimes ==""?"暂无":data[i].allotTimes;
					var mediaName=data[i].mediaNames==null || data[i].mediaNames ==""?"暂无":data[i].mediaNames;;
					
					$("#consulters").append("<tr><td>"+(i+1)+"</td>"
					+"<td>"+data[i].name+"</td><td>"+sex+"</td><td>"+data[i].age+"</td><td>"+allotTimes+"</td><td>"+consultTeacherName+"</td>"
					+"<td>"+consultwayName+"</td><td>"+consultLessonName+"</td><td>"+rankName+"</td><td>"+data[i].telphone1+"</td><td>"+city+"</td><td>"+specialty+"</td>"
					+"<td>"+schoolName+"</td>"
					+"<td>"+statusName +"</td><td>"+keywords+"</td><td>"+mediaName+"</td>"
					+"<td><a href='javascript:void(0)' onclick=follow("+data[i].id+",0)  class='edit'>跟踪</a></td></tr>");
											
					}
    			}          					
    	}
    	
    
    		
    		function follow(Id,stuId){
    
				location.href="Consultway/findFollow?id="+Id+"&stuId="+stuId;	
			}
    	/* function OaScbNetworkVisitFind(data){

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
                    	+"<input type='button' onclick=VisitInfoClose()  value='确定' class='saveBotton' /></td></tr>");
                    
                    
		var mbHeight= $(document).height();
	    var mbWidth=$(window).width();
	    var delHeight=$(window).height();
	         
         
         $(".mbStyle").css("height",mbHeight); 
         $(".mbStyle-studyInfo").css("height",mbHeight); 
         $(".popupStyle-study").css("left",mbWidth/2-280);
         $(".popupStyle-study").css("top",delHeight/4-50);
         $(".popupStyle-study").css("display","block");
         $(".mbStyle").css("display","block");
        
          
            $(".closeX").click(function(){
            	$(".mbStyle").css("display","none");
                $(".mbStyle-studyInfo").css("display","none");
                $(".popupStyle-study").css("display","none");
            });
      }
}	 */
    	
    	
    
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

				$("#page").append("每页显示的数量：<input type='number' id='number' onchange='show(1)' value="+pageSize+"   min='1' max='100'  class='textStyle' style='width:45px;'/>条");
			} 
    
    
    
    	$(function(){
			show(1);
			
			$("#btn").click(function(){
			
				show(1);
			
			});
		}); 
		
		/* 查看详情 */
		function retrieve(id){		
	    	var temp = "id="+id;
	    	
		$.post("Network/networklookcon",temp,showInfoOne,"json");
		
   		var mbHeight= $(document).height();
        var mbWidth=$(window).width();
        var delHeight=$(window).height();
         
         $(".mbStyle").css("height",mbHeight); 
         $(".popupStyle").css("left",mbWidth/2-280);
         $(".popupStyle").css("top",delHeight/600);
         $(".mbStyle").css("display","block");
         $(".popupStyle").css("display","block");
       
        
            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
                
            });
            
            $(".popupStyle").click(function(){
            	$(".mbStyle").css("display","none");
            	$(".popupStyle").css("display","none");
            }); 
	
	}
    
    
  /*   点击查看详情页面 */
    
    		function showInfoOne(data){
    			
    			$("#addTable").empty();
    			if(data.length==0){
    				$("#addTable").html("空");
    			}else{	
    				var sex = data.sex==1?"男":"女";
    				/* var schoolName =data.schoolName==null || data.schoolName=='' ? "暂无":data.schoolName; */
    				$("#addTable").append("<tr><td class='tdWidth'>姓名:</td><td>"+data.name+"</td><td class='tdWidth'>性别:</td><td>"+sex+"</td></tr>"
    				+"<tr><td>年龄:</td><td>"+data.age+"</td><td>分量日期:</td><td>"
    				+data.allotTime+"</td></tr><tr>"
					+"<td>咨询师:</td><td>"+data.consultTeacher+"</td><td>咨询方式:</td><td>"+data.consultWay+"</td></tr>"
					+"<tr><td>咨询课程:</td><td>"
					+data.consultLesson+"</td>"
					+"<td>等级:</td><td>"+data.rank+"</td></tr>"
					+"<tr><td>院校:</td><td>"+schoolName +"</td></tr>"
					+"<tr><td>学校宿舍:</td><td>"+data.schoolDorm+"</td><td>状态:</td><td>"
					+data.status+"</td></tr>");							
				}
				
    		} 
    		
    		/* 查询提交量 */
function showHandout(){

	window.location.href="Network/networkHand";
	
}
/* 显示查询信息量 */
function showQuery(){

window.location.href="Network/networkQuery";
	
}         					
   
    
    </script>
</head>
<body>
<div class="rightContent" width=98%><!-- style="width:1580px;" -->
<div class="tabs" id="tabs"  >
      <span class="spanHover" onclick="showQuery()">查询信息量</span>
      <span class="spanOut" id="spanLast" onclick="showHandout()">查询提交量</span>
      
  	</div>
    <div class="tabContent">
        <h1 class="tabTitle">查询信息量</h1>
        <div class="serach">
            <div class="searchTitle">
                搜索条件
                <div class="searchShow">展开>></div>
            </div>
            <div class="searchContent">
            <form action="#" method="post" enctype="multipart/form-data" id="form">            
            <table  class="searchTable" >
                		<tr>
                			<td colspan="2" style="text-align: center;"><span  >查询：<input type="text" name="name" oninput="show(1)" style=" width:350px; height: 30px;" placeholder="搜索姓名，年龄，专业，联系方式，毕业院校，现住地,关键字"></span></td>
                		</tr>
                	</table>
                <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;  text-align: right ;margin-left:-25px;" >
                    
                        <tr>
                            <td class="tdWidth">咨询师:
                                <select class="selectStyle" name="consultTeacher" style="width:130px;">
                                    <option value="0">全部</option>
                                    <option value="1">乔珊珊</option>
                                    <option value="2">宋强</option>
                                </select>
                            </td>
                            <td class="tdWidth">分量:
                                <select class="selectStyle" name="allotstatus" style="width:130px;">
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
                            <td class="tdWidth">学历:
                                <select class="selectStyle" name="education" style="width:130px;">
                                	<option value="0">--请选择--</option>
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
                         <td class="tdWidth">媒体名称:
                                <select class="selectStyle" style="width:130px;" name="mediaName">
                                	<option value="0">--请选择--</option>
                                    <c:if test="${mediaNameList !=null}">
						
						<c:forEach var="media" items="${mediaNameList}">
							<option <c:if test="${media.id == mediaName}">selected="selected"</c:if>
							 value="${media.id}">${media.mediaName}
							</option>
						</c:forEach>
				  </c:if>
                                </select>
                            </td>
                            <td class="tdWidth">咨询量分类:
                                <select class="selectStyle"  style="width:130px;" name="type">
                                    <option value="0">全部</option>
                                    <option value="1">常规</option>
                                    <option value="2">市场</option>
                                </select>
                            </td>                         
                            <td class="tdWidth">首次咨询日期:<input type="date" name="firstConsultTimes" class="dateStyle" style="width:130px;" /></td> 
                            <td class="tdWidth">咨询方式:
                                <select class="selectStyle" name="consultWay" style="width:130px;">
                                <option value="0">--请选择--</option>
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
                             <td class="tdWidth">上门:
                                <select class="selectStyle" name="come" style="width:130px;">
                                    <option value="0">全部</option>
                                    <option value="1">是</option>
                                    <option value="2">否</option>
                                </select></td>
                            <td class="tdWidth">咨询等级:
                                <select class="selectStyle" style="width:130px;" name="rank">                                    
                                   <option value="0">--请选择--</option>
                                <c:if test="${rankList !=null}">						
						<c:forEach var="ranktype" items="${rankList}">
							<option <c:if test="${ranktype.id == rank}">selected="selected"</c:if>
							 value="${ranktype.id}">${ranktype.rank}
							</option>
						</c:forEach>
				  </c:if>
                                </select>
                            </td>
                            <td class="tdWidth">报名日期:<input type="date" name="enrollTimes" class="dateStyle" style="width:130px;" /></td>
                            <td class="tdWidth">咨询课程:
                                <select class="selectStyle" style="width:130px;" name="consultLesson">                                    
                                    <option value="0">--请选择--</option>
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
                          
                            <td class="tdWidth">状态:
                                <select class="selectStyle" name="status" style="width:130px;">
                                	<option value="0">--请选择--</option>
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
                               </td>
                        </tr>
                    </form>
                </table>
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
                        <th>联系方式</th>
                        <th>城市</th>
                        <th>专业</th>
                        <th>学校</th>
                      
                        <th>状态</th>
						<th>关键字</th>
						<th>媒体名称</th>
						<th>操作</th>
                    </tr>
                    </thead>
                    
					<tbody id="consulters">
					
					</tbody>



                    

                </table>
                <div id="page"></div>
            </div>

        </div>
        <div class="mbStyle">&nbsp;</div>
        <div class="popupStyle" style="width: 600px; height: 600px; ">
            <h1>学生详情<span class="closeX">X</span></h1>
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
            
			 
			 
			 <tbody id="addTable">
				
					</tbody>
					
					
					
					

                <tr>
                    <td class="tdWidth" colspan="3">
                        <input  type="button" value="确定" class="saveBotton" />
                    </td>
                </tr> 
	</table>

           

        </div>

  <div class="mbStyle-studyInfo">&nbsp;</div>
<div class="popupStyle-study" style="width: 570px; height: 440px;">
            <h1>咨询量跟踪情况<span class="closeX">X</span></h1>
            <form action="">
                <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                  	<tbody id="VisitInfo">
                  	</tbody>

       

</body>
</html>
