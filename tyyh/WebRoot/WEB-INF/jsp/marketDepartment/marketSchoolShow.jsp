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
    <title>查询院校</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
<!--     
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/noe-show.css"> -->
         
    
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript">

       /*确定保存弹出框的位置*/
        $(function(){
       
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".saveStyle").css("left",saveWidth/2-130);
            $(".saveStyle").css("top",saveHeight/2-40);
        });

		       /*保存读秒*/
        var miao;
        var myTime;
        $(function(){
            $(".saveBotton").click(function(){
                miao=2;
                $(".setTime").text(miao);
                $(".saveStyle").css("display","block");
                myTime=setInterval("divHide()",1000);
            });
        });
        
        function divHide(){
            miao--;
            $(".setTime").text(miao);
            if(miao==0){
                clearInterval(myTime);
                $(".saveStyle").hide();
                location.href="welcome.html";
            }
        }
        /*保存读秒结束*/
        
       /* 显示院校信息 */
         /* $(function(){
         
            $(".pooupBottons").click(function(){
              
                $(".schools").css("display","block");
                 $(".schools-show").css("display","block");
                $(".schools-show").val("隐藏");
               
            });
       	 }); */
       	 
       	 
    
       	 /* 隐藏学院信息 */
       	/*  $(function(){
       	 
            $(".hide").click(function(){
                $(".schools").css("display","none");
                $(".schools-show").css("display","block");
            });
       	 }); */
       	 
       	 
    </script>
    <script type="text/javascript">
    	
    	function show(index){
			var number=$("#number").val();
       	if(number==null){
       		number=10;
       	}
			var temp = $("#form").serialize()+"&index="+index+"&pageSizes="+number;

			$.post("market/marketSchoolInfoShow1",temp,showInfoList,"json");
		
			
		}
		function showInfoList(data){
			var marketlist = data.marketlist;
			var index = data.index;
			var pageCount = data.pageCount;
			var pageSize= data.pageSize;
			var totalCount=data.totalCount;
			showInfo(marketlist,index);
			showPage(index,pageCount,pageSize,totalCount);
		}
    	function showInfo(data,index){
    			$("#consulters").empty();
    			$(".btposition2").empty();
    			if(data.length==0){
    				$("#consulters").html("空");
    			}else{
    				
    				for( var i = 0; i < data.length; i++) {
						
						var schoolName =data[i].schoolName==null?"未知":data[i].schoolName;
						var schoolAddress =data[i].schoolAddress==null?"未知":data[i].schoolAddress;
						$("#consulters").append( "<tr><td><input type='radio' name='choice' value="+data[i].id+" onchange=display("+data[i].id+")></td>"												
												+"<td>"+(i+1)+"</td>"
												+"<td>"+schoolName+"</td>"
												+"<td>"+schoolAddress+"</td>"
												+ "<td><a href='market/marketPersonAdd?id="+data[i].id+"'>添加系主任</a>&nbsp;&nbsp;&nbsp;"
												+ "<a href='market/marketTeacherAdd?id="+data[i].id+"'>添加班主任</a>&nbsp;&nbsp;&nbsp;"
												+ "<a href='market/marketMajorAdd?id="+data[i].id+"'>添加专业</a>&nbsp;&nbsp;&nbsp;"
												+"<a href='market/marketSchoollUpdate?id="+data[i].id+"'>修改学院信息</a>&nbsp;&nbsp;&nbsp;"
												+"<a href='market/marketMajorUpdate?id="+data[i].id+"'>修改专业</a></td>"
												+"</tr>" );
					}
    			}
    		$(".btposition2").append("<input type='button'  value='显示详情' class='searchBotton' onclick='showdetails()' />");	                        				
                           					
    	}
    	
    	
    	function showdetails(){
    		var a = $("input:radio[name='choice']:checked");
    		var id = a[0].value;
    		
    		window.location.href="market/schoolDetail?id="+id;
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
    	
   	
    	/* function showPage(index,pageCount,pageSize,totalCount){
				$("#page").empty();
			
				$("#page").append("<a href='javascript:onchange=show("+1+") '>首页</ a>");
			
				if(index!=1){
					$("#page").append("<a href=' javascript:onclick=show("+(index-1)+")'>上一页</a>");
				}
		
			for(var i=index;i<=index+2;i++){
				$("#page").append("<a href=' javascript:onclick=show("+i+")'>"+i+"</a>");
				if(i>pageCount-1){
					break;
				}
		 	}

			if(index!=pageCount){
				$("#page").append("<a href=' javascript:onchange=show("+(index+1)+")'>下一页</a>");
			}
				
				$("#page").append("<a href=' javascript:onclick=show("+pageCount+")'>末页</a>");
				$("#page").append("<span>共"+pageCount+"页</span>");
			
				$("#page").append("<span>共&nbsp;"+pageCount+"&nbsp;页,</span><span>共&nbsp;"+totalCount+"&nbsp;条咨询量</span>");
				
				$("#page").append("每页显示的数量：<input type='number' id='number' value="+pageSize+" onchange='show(1)'  min='1' max='100'  class='textStyle' style='width:45px;'/>条");
			}  */
			
			
    	/* function display(data){
    	
    		
    		var temp ="id="+data;

			$.post("market/marketSchoolInfoShow2",temp,showdetailed,"json");
			$("#schoolinfoAll").css("display","block");
			$(".showSpecialtyInfo").css("display","none");
    	}
    	
    	
    	
    	function showdetailed(data){
    		var schoolinfo = data.schoolinfo;
    		var majorinfoList = data.majorinfoList;
    		
    		showName(schoolinfo,majorinfoList);
    		
    		
    	}
    	
    	function showName(schoolinfo,majorinfoList){
    		$("#schoolNameAdd").empty();
    		$("#schoolNameAdd").append("<tr><td class='tdWidth'>学校名称：</td><td>"+schoolinfo.schoolName+"</td>"
    									+"</tr><tr><td class='tdWidth'>地址：</td><td colspan='5'>"+schoolinfo.schoolAddress+"</td></tr>");
    		$("#majorName").empty();
    		if(majorinfoList.length==0){
    			$("#majorName").html("空");
    		}else{
    			
    			for( var i = 0; i < majorinfoList.length; i++){

    				$("#majorName").append("<span class='tdWidth'>专业名称："+majorinfoList[i].specialtyName+"<a onclick='showPerson("+majorinfoList[i].id+")' style='color: #2828FF;'>(查看)</a></span>");
    				if((i+1)%3==0){
    					$("#majorName").append("<br/>");
    				}
    				
    			}
    		
    		}
    		$("#timePlan").empty();
    		var schoolTimePlan =schoolinfo.schoolTimePlan==null || schoolinfo.schoolTimePlan=='' ?"暂无":schoolinfo.schoolTimePlan;
    		var opptSituation =schoolinfo.opptSituation==null || schoolinfo.opptSituation=='' ?"暂无":schoolinfo.opptSituation;
    		var schoolsSchedule =schoolinfo.schoolsSchedule==null || schoolinfo.schoolsSchedule=='' ?"暂无":schoolinfo.schoolsSchedule;
    		var pushingSchedule =schoolinfo.pushingSchedule==null || schoolinfo.pushingSchedule=='' ?"暂无":schoolinfo.pushingSchedule;
    		var studentsSituation =schoolinfo.studentsSituation==null || schoolinfo.studentsSituation=='' ?"暂无":schoolinfo.studentsSituation;
    		$("#timePlan").append("<h4>院校时间安排</h4><textarea name='showText'  cols='x'  rows='y' style='width: 1000px ;height: 150px; '  disabled='disabled'  >"+schoolTimePlan+"</textarea>");
    		$("#opptSituation").empty();
    		$("#opptSituation").append("<h4>竞争对手情况</h4><textarea name='showText'  cols='x'  rows='y'  style='width: 1000px ;height: 150px;'  disabled='disabled'>"+opptSituation+"</textarea>");
    		$("#schoolsSchedule").empty();
    		$("#schoolsSchedule").append("<h4>院校合作进度</h4><textarea name='showText'  cols='x'  rows='y'  style='width: 1000px ;height: 150px;'  disabled='disabled'>"+schoolsSchedule+"</textarea>");
    		$("#pushingSchedule").empty();
    		$("#pushingSchedule").append("<h4>地推合作进度</h4><textarea name='showText'  cols='x'  rows='y'  style='width: 1000px ;height: 150px;'  disabled='disabled'>"+pushingSchedule+"</textarea>");
    		$("#studentsSituation").empty();
    		$("#studentsSituation").append("<h4>学生会情况</h4><textarea name='showText'  cols='x'  rows='y'  style='width: 1000px ;height: 150px;'  disabled='disabled'>"+studentsSituation+"</textarea>");
    	}
    	
    	function showPerson(data){
    		
    		var temp = "id="+data;
    		
    		$.post("market/marketmajorInfo",temp,showmajorperson,"json");
    		$(".showSpecialtyInfo").css("display","block");
    	}
    	function showmajorperson(data){
    		var majorpersonList = data.majorpersonList;
    		
    		var majorteacherList = data.majorteacherList;
    		
    		var oaScbMajorinfo = data.oaScbMajorinfo;
    		showpersoninfo(oaScbMajorinfo,majorpersonList,majorteacherList);
    	}
    	
    	function showpersoninfo(oaScbMajorinfo,majorpersonList,majorteacherList){
    		
    		$("#majorthing").empty();
    		var specialtySituation =oaScbMajorinfo.specialtySituation==null || oaScbMajorinfo.specialtySituation=='' ?"未知":oaScbMajorinfo.specialtySituation;
    		var specialtyPeoplenNumber =oaScbMajorinfo.specialtyPeoplenNumber==null || oaScbMajorinfo.specialtyPeoplenNumber==''?"暂无":oaScbMajorinfo.specialtyPeoplenNumber;
    		var classNumber =oaScbMajorinfo.classNumber==null || oaScbMajorinfo.classNumber=='' ?"暂无":oaScbMajorinfo.classNumber;
    		var developDirection =oaScbMajorinfo.developDirection==null || oaScbMajorinfo.developDirection=='' ?"未知":oaScbMajorinfo.developDirection;
    		var studySituation =oaScbMajorinfo.studySituation==null || oaScbMajorinfo.studySituation== '' ?"未知":oaScbMajorinfo.studySituation;
    		var specialtyComments =oaScbMajorinfo.specialtyComments==null || oaScbMajorinfo.specialtyComments=='' ?"未知":oaScbMajorinfo.specialtyComments; 
    		$("#majorthing").append("<tr><td class='tdWidth'>专业情况：</td><td>"+specialtySituation+"</td>"
    								+"<td class='tdWidth'>人数：</td><td>"+specialtyPeoplenNumber+"</td>"
    								+"<td class='tdWidth'>班级数量：</td><td>"+classNumber+"</td>"
    								+"</tr><tr><td class='tdWidth'>发展方向：</td><td>"+developDirection+"</td>"
    								+"<td class='tdWidth'>现阶段学习情况：</td><td>"+studySituation+"</td>"
    								+"<td class='tdWidth'>备注：</td><td>"+specialtyComments+"</td>"
    								+"</tr>");
    	
    		$("#majortitle").empty();
    		$("#majortitle").append("<tr><td colspan='6'><h3>院系主要负责人</h3></td></tr>");
    		$("#majorPersonInfo").empty();
    		
    		if(majorpersonList.length==0){
    			$("#majorPersonInfo").html("空");
    		
    		}else{
    		
    			for( var i = 0; i < majorpersonList.length; i++){
    			
    		 		var sex = majorpersonList[i].sex ==1?"男":"女";
    		 		var Name =majorpersonList[i].name==null?"未知":majorpersonList[i].name;     		 		
    		 		var directorClass =majorpersonList[i].directorClass==null || majorpersonList[i].directorClass ==''? "未知":majorpersonList[i].directorClass;
    		 		var comments =majorpersonList[i].comments==null?"未知":majorpersonList[i].comments;
    		 		$("#majorPersonInfo").append("<tr><td class='tdWidth'>系主任/书记：</td><td>"+Name+"</td>"
    		 		+"<td class='tdWidth'>负责班级：</td><td>"+directorClass+"</td><td class='tdWidth'>性别：</td>"
    		 		+"<td>"+sex+"</td></tr><tr>"
    		 		+"<td class='tdWidth'>备注：</td>"
    		 		+"<td colspan='5'>"+comments+"</td></tr>");
    		 	
    		 	}
    		}
    		
    		$("#majorteacherInfo").empty();
    		if(majorteacherList.length==0){
    			$("#majorteacherInfo").html("空");
    		}else{
    		
    			for( var i = 0; i < majorteacherList.length; i++){
    			
    		 		 var sex = majorteacherList[i].Sex ==1?"男":"女";
    		 		var Name =majorteacherList[i].name==null?"未知":majorteacherList[i].name;
    		 		
    		 		var teacherClass =majorteacherList[i].teacherClass==null ||majorteacherList[i].teacherClass==''?  "未知":majorteacherList[i].teacherClass;

    		 		var comments =majorteacherList[i].comments==null?"未知":majorteacherList[i].comments;
    		 		$("#majorteacherInfo").append(
    		 				"<tr><td class='tdWidth'>班主任：</td><td>"+Name+"</td>"
    		 				+"<td class='tdWidth'>负责班级：</td><td>"+teacherClass+"</td><td class='tdWidth'>性别：</td>"
    		 				+"<td>"+sex+"</td></tr><tr>"
    		 				+"<td class='tdWidth'>备注：</td>"
    		 				+"<td colspan='5'>"+comments+"</td></tr>"); 
					
    		 	}
    		} 
    		
    		
    		
    	} */
    	
    	
    	$(function(){
    	
    		show(1);
    		$("#schoolinfoAll").css("display","none");
    		$(".showSpecialtyInfo").css("display","none");
    		$(".schoolNameAdd").css("display","none");
    		$(".majorName").css("display","none");
    		$("#btn").click(function(){
    			show(1);
    		});
    	});
/* 查询新增院校信息量 */
function showyuanadd(){
	
	window.location.href="market/amarketSchoolAdd";
	
}
  
/* 显示查询院校信息量 */
function showyuan(){

window.location.href="market/amarketSchoolShow";
	
} 
    </script>
    
    
    
</head>
<body>
<div class="rightContent">
<div class="tabs" id="tabs"  >
    
      <span class="spanOut"  onclick="showyuanadd()">添加院校信息</span>
       <span class="spanHover" id="spanLast"  onclick="showyuan()">查询院校信息量</span>
      
  	</div>
    <div class="tabContent">
        <h1 class="tabTitle">查询院校</h1>
        <form id="form" >
        	<table cellpadding="0" cellspacing="0" border="0" class="addTable" style="width:100%;  text-align: center; margin-left:0px;">
        		<tr>
                    <td>院校名称:<input type="text" oninput="show(1)" name="schoolName"  class="textStyle" style="width:160px;"/>
			                  
                   				 &nbsp;&nbsp;&nbsp;<input type="button" id="btn" value="搜索" class="searchBotton"/>
                   	</td>   
           		</tr>
         	</table>
          </form>
          
          
          <div class="divTable">
                <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
                	<thead>
                		<tr>
                		<th></th>
                        <th>序号</th>
                        <th>学院名称</th>
                        <th>地址</th>
                        <th>操作</th>
                    </tr>
                	
                	</thead>
                    <tbody id="consulters">
                    
                    
                    </tbody>
                    

                </table>
                <div id="page"></div>
            </div>
            
        <div class="btposition2">
    		
    	</div>

    </div>
</div>


</body>
</html>
