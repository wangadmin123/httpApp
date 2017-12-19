<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">

<title>列表模板</title>
<link rel="stylesheet" type="text/css"
	href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/search.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css" />


<link rel="stylesheet" type="text/css" href="statics/common/css/add.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/css/popup.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/cssstyle/popup-notsee.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/cssstyle/popups.css" />
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/tab.js"></script>
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
        
        
        function show(index){
        
        var number=$("#number").val();
       	if(number==null){
       		number=10;
       	}
       	var orderId=$("#orderId").val();
        var temp = $("#formQ").serialize()+"&index="+index+"&pageSizes="+number+"&orderId="+orderId;;
			
		$.post("Consultway/ToconsultAssistantQuery",temp,showListInfo,"json");
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
    		console.log(data);
    			$("#consulters").empty();
    			$("#Nofind").empty();
    			if(data.length==0){
    				$("#Nofind").html("哎呀，好像没有该咨询量哦~ ");
    				
    			}else{
    				for ( var i = 0; i < data.length; i++) {
					var sex = data[i].sex==1?"男":"女";
					var allotstatus = data[i].allotstatus==1?"已分量":data[i].allotstatus==2?"未分量":data[i].allotstatus==3?"未查看":data[i].allotstatus==4?"已查看":"未知";
					
					var payStatus=data[i].payStatusName;
					var enrollStatus=data[i].enrollStatus;
					var come=data[i].come;
					
					var typ="";
					
						var returnTime =data[i].returnvisitTime==null?"暂无":data[i].returnvisitTime;
				typ+="<tr>"
								+"<td>"+(i+1)+"</td><td>"+allotstatus+"</td><td>"+data[i].consultTeacherName+"</td><td  >"+data[i].firstConsultTimes+"</td><td onclick=studentInfo("+data[i].id+") >"+data[i].name+"</td><td onclick=studentInfo("+data[i].id+") >"+sex+"</td><td onclick=studentInfo("+data[i].id+") >"+data[i].age+"</td>"
								+"<td>"+returnTime+"</td><td >"+data[i].telphone1+"</td><td>"+data[i].consultLessonName+"</td><td>"+data[i].consultwayName+"</td>"
								+"<td>"+data[i].city+"</td><td>"+data[i].statusName+"</td><td>"+data[i].educationName+"</td><td><span style='color: #2828FF;' onclick=ToRevise("+data[i].id+") class='edit'  >完善</span><span style='color: #2828FF;' onclick=studentInfo("+data[i].id+") class='edit'>查看</span><a href='javascript:void(0)' onclick=ConDelete("+data[i].id+") class='edit'><span id='edit' style='color: #2828FF;' >删除</span></a>";
						
					
					/* <span style='color: #2828FF;'  class='delete'onclick=displayNone("+data[i].id+")>删除</span> */
					if(data[i].consultTeacherName!="暂无"){
							typ +="<span class='edit'style='color: #2828FF;' consultTeacherName='"+data[i].consultTeacherName+"'  num='"+data[i].id+"' stuname='"+data[i].name+"' tea='"+data[i].consultTeacher+"' onclick=retrieve(this,this)>回收</span>"
							+"<span href='' class='paifa' style='color: #2828FF;' onclick=follow("+data[i].id+",0) >跟踪</span>"
							
					}else{
						typ+="<span style='color: #2828FF;'  class='paifa' onclick=follow("+data[i].id+",0) >跟踪</span>"
							
					}
					
           					
					if(enrollStatus==1){/* 报名 */
						typ+="<sapn style='width: 60px; height: 25px; border:1px; background-color: #FF5151 ;  ' class='paifa1'><span style='color:white; '>&nbsp;&nbsp;报名&nbsp;&nbsp;</span></sapn>"
					}else if(payStatus=="定金"){/* 定金 */
						typ+="<sapn style='width: 60px; height: 25px; border:1px; background-color: #FFA042 ;  ' class='paifa1'><span style='color:white; '>&nbsp;&nbsp;定金&nbsp;&nbsp;</span></sapn>"
					}else if(come==1){/* 上门 */
						typ+="<sapn style='width: 60px; height: 25px; border:1px; background-color: #46A3FF ;  ' class='paifa1'><span style='color:white; '>&nbsp;&nbsp;上门&nbsp;&nbsp;</span></sapn>"
					}
					
					
					typ+="</td></tr>";
							$("#consulters").append(/* "<tr  style='color:#FFAA00 ;'><td ><input type='checkbox' name='CheckBox' value='pro1'/></td><td  >"+data[i].id+"</td>"
							+"<td>"+data[i].consultTeacherName+"</td><td onclick=studentInfo()  >"+data[i].firstConsultTimes+"</td><td onclick=studentInfo() >"+data[i].name+"</td><td onclick=studentInfo() >"+sex+"</td><td onclick=studentInfo() >"+data[i].age+"</td>"
							+"<td >"+data[i].telphone1+"</td><td>"+data[i].consultLessonName+"</td><td>"+data[i].consultwayName+"</td>"
							+"<td>"+data[i].city+"</td><td>"+data[i].statusName+"</td><td>"+data[i].educationName+"</td><td><a href='#' class='edit'  onclick=NewPage('revise.jsp') >编辑</a>"
							+"<a href='Consultway/consultAssistantQuery' class='edit'  num='"+data[i].id+"' onclick=retrieve(this)><span class='notsee'>回收</span></a>"
							+"<a href='#' class='delete'>删除</a><a href='#' class='paifa'>跟踪</a></td>"
							+"</tr>" */typ);
					}
    			}   					
    		}
    		/*删除*/
    	function ConDelete(Id) {
    	var employee_id=${loginUser.emp_id};
    		var msg = "您真的确定要删除吗？";
    		if (confirm(msg) == true) {
    			location.href = "Consultway/ConsulterDelete?id=" + Id+"&employee_id="+employee_id;
    			return true;
    		} else {
    			return false;
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
    	
    	
 /* 删除按钮 */
function displayNone(Id){
	var result=confirm("删除后不可恢复！确定删除？");
	if(result){
	var id="id="+Id;
	$.post("Consultway/DisplayNone",id,NoneShow(),"text");	
	}else{}
}
function   NoneShow(data){
	show();
}

    		
/* 跟踪显示 */
	function follow(Id,stuId){
				location.href="Consultway/findFollow?id="+Id+"&stuId="+stuId;	
			}

function VisitInfoClose(){

	 $(".mbStyle").css("display","none");
    $(".popupStyle-study").css("display","none");
}

	

/* 显示咨询量详细信息 */
function studentInfo(Id){
	
	var id="id="+Id;
	$.post("Consultway/ToconsultAssistantQuery",id,AssistantInfoShow,
	"json");

	   
}
function AssistantInfoShow(datas){
	var data=datas.consulterList;
	var imageBase64QRCode=datas.imageBase64QRCode;
	
	if(data.length==0){
		alert("查询失败！--'未获取到相关信息'")/* 没有查询到结果 */
	}else if(data.length!=1){
		alert("查询错误！--'查询结果不唯一'")/* 查询的结果不为一条 */
	}else{
		$("#AssistantInfoShow").empty();
		for(var i=0;i<data.length;i++){
		
			var sex=data[i].sex==1? "男":"女";
			var come=data[i].come==1?"已上门":"未上门";
			var enrollStatus=data[i].enrollStatus==1?"已报名":"未报名";
			var invalid
			if(data[i].invalid==1){
			invalid="有效";
			}else if(data[i].invalid==3){
			invalid="待审核";
			}else if(data[i].invalid==2||data[i].invalid==null){
			invalid="无效";
			}else{
			invalid="未知";
			}
			
			var temp=" <tr> <td class='tdWidth'>姓名：</td>"
                    +"<td><label>"+data[i].name+"</label> </td>"
                    +"<td class='tdWidth'>性别：</td>"
					+"<td><label >"+sex+"</label></td>"
					+"<td class='tdWidth'>年龄：</td>"
                    +"<td><label >"+data[i].age+"</label></td></tr>"
                    
                    +"<tr><td class='tdWidth'>联系方式：</td>"
                    +"<td><label >"+data[i].telphone1+"</label></td>"
                    +"<td class='tdWidth'>QQ/微信：</td>"
                    +"<td><label >"+data[i].wechat+"</label></td>"
                	+"<td class='tdWidth'>现住城市：</td>"
                    +"<td><label >"+data[i].city+"</label></td></tr>"
               		
               		+"<tr><td class='tdWidth'>紧急联系人：</td>"
                    +"<td><label >"+data[i].urgentTelpeople+"</label></td>"
                    +"<td class='tdWidth'>紧急联系方式：</td>"
                    +"<td><label >"+data[i].ungenTelphone+"</label></td> "
               		+"<td class='tdWidth'>社会状态：</td>"
                    +"<td><label >"+data[i].statusName+"</label></td></tr>"
                    
                    +"<tr><td class='tdWidth'>毕业院校：</td>"
                    +"<td><label >"+data[i].schoolName+"</label></td> "
                    +"<td class='tdWidth'>学历：</td>"
                    +"<td><label >"+data[i].educationName+"</label></td>"
                    +"<td class='tdWidth'>专业：</td>"
                    +"<td><label >"+data[i].specialty+"</label></td></tr>"
                	
                	+"<tr><td class='tdWidth'>负责咨询师：</td>"
                    +"<td><label >"+data[i].consultTeacherName+"</label></td>"
                    +"<td class='tdWidth'>咨询课程：</td>"
                    +"<td><label >"+data[i].consultLessonName+"</label></td>"
                    +"<td class='tdWidth'>上门状态：</td>"
                    +"<td><label >"+come+"</label></td></tr>"
                    
  					+"<tr><td class='tdWidth'>报名状态：</td>"
                    +"<td><label >"+enrollStatus+"</label></td>"
               		+" <td class='tdWidth'>咨询量等级：</td>"
                    +"<td><label >"+data[i].rankName+"</label></td>"
  					+"<td class='tdWidth'>有效状态：</td>"
                    +"<td><label >"+invalid+"</label></td></tr>"
                    
                
                	+"<tr><td class='tdWidth' >备注：</td>"
                    +"<td colspan='3'><textarea   cols='x'  rows='y'  style='width: 395px ;height: 170px; resize:none;' readonly='readonly' >"+data[i].comments+"</textarea  ></td>"
                    +"<td colspan='2'><img src='data:image/png;base64,"+imageBase64QRCode+"' style='width: 195px; height: 195px;' /> </td> </tr>"
               			
               		+"<tr><td class='tdWidth' colspan='3'><input  type='button' value='确定' onclick=infoconfirm()  class='saveBotton' /></td></tr>";
                    
                
               
			$("#AssistantInfoShow").append(temp);
               
		}
	
	   var mbHeight= $(document).height();
       var mbWidth=$(window).width();
       var delHeight=$(window).height();
         
         $(".mbStyle").css("height",mbHeight); 
         $(".popupStyle").css("left",mbWidth/2-350);
         $(".popupStyle").css("top",delHeight/50);
         $(".popupStyle").css("display","block");
         $(".mbStyle").css("display","block");
        
            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });
	}
}

/* 信息详情页面关闭 */
function infoconfirm(){
 				$(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
}


    		
/* 回收咨询量 */
function retrieve(choose,consultTeacherName){
		var employee_id=${loginUser.emp_id};
		var consultTeacherName=$(consultTeacherName).attr("consultTeacherName");
	
    	var result=confirm("确定要回收吗？");
    		if(result){
	    		var num = $(choose).attr("num");
	    		var stuname=$(choose).attr("stuname");
	    		var tea=$(choose).attr("tea");
	    		
	    		
	    		$.ajax({
	    			url:"Consultway/retrieveConsulter/"+num,
	    			data:{employee_id:employee_id,consultTeacherName:consultTeacherName},
	    			dataType:"text",
	    			success:function(){
	    			var user="${loginUser.emp_name}";
	    				$.ajax({
								url:"adviceadd",
								type:"GET",
								data:{"from":parent.user,"content":stuname+"这条资源被回收了","to":tea},
								dataType:"text",
		    					success:function(dat){
				    				var  temp="{from:'"+${loginUser.emp_id}+"',content:'"+user+"回收了"+stuname+"这条资源',to:'"+tea+"'}";
				    				parent.ws.send(temp);
				    				show(1);
				    			}
				    	});
	    			}
	    	});
    }
}
		
function callback (data){
		
	   show(1);
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
/* 查询页面 */
$(function(){
		show(1);
		
	$("#btn").click(function(){
		show(1);
	});
}); 

/* 跳转编辑页面 */
function ToRevise(num){
	/* var temp="id="+num;
	$.post("Consultway/Torevise",{id:num},Revise,"json"); */
	
	window.location.href="Consultway/Torevise?id="+num;
}



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
		<div class="rightContent" width=98%>
		<!-- style="width:1580px;" -->

		<div class="tabs" id="tabs">
			<span class="spanHover" onclick="showQuery()">查询咨询量</span> <span
				class="spanOut" onclick="showHandout()">分发咨询量</span> <span
				class="spanOut" onclick="EnrollCheck()">报名审核</span> <span
				class="spanOut" onclick="showUseless()">查看无效量</span> <span
				class="spanOut" id="spanLast" onclick="showHistory()">查看历史量</span>
		</div>

		<input type="hidden" value="1" id="orderId">
		<!-- 查询咨询量 -->
		<div class="tabContent" id="Query">
			<h1 class="tabTitle">查询咨询量</h1>
			<div class="serach">
				<div class="searchTitle">
					搜索条件
					<div class="searchShow">展开>></div>
				</div>
				<div class="searchContent">
					<form id="formQ">
						<table class="searchTable">
							<tr>
								<td colspan="2" style="text-align: center;"><span>查询：<input
										type="text" oninput="show(1)" class="textStyle" name="name"
										style=" width:400px; height: 30px;"
										placeholder="搜索姓名，年龄，专业，联系方式，毕业院校，现住地，信息来源"></span></td>
							</tr>
						</table>
						<table cellpadding="0" cellspacing="0" class="searchTable"
							border="0"
							style="width:100%;  text-align: right ;margin-left:-25px;">
							<tr>
								<td class="tdWidth">咨询师： <select class="selectStyle"
									style="width:130px;" name="consultTeacher">
										<option value="0">全部</option>
										<c:if test="${ConsultTeacherList !=null}">
											<c:forEach var="teacher" items="${ConsultTeacherList}">
												<option
													<c:if test="${teacher.emp_id == consultTeacher}">selected="selected"</c:if>
													value="${teacher.emp_id}">${teacher.emp_name}</option>
											</c:forEach>
										</c:if>
								</select>
								</td>
								<td class="tdWidth">分量： <select class="selectStyle"
									style="width:130px;" name="allotstatus"></div>
										<option value="0" name="allotstatus">全部</option>
										<option value="1" name="allotstatus">已分量</option>
										<option value="2" name="allotstatus">未分量</option>
								</select>
								</td>
								<td class="tdWidth">咨询量分类： <select class="selectStyle"
									style="width:130px;" name="type"></div>
										<option value="0" name="type">全部</option>
										<option value="1" name="type">常规</option>
										<option value="2" name="type">市场</option>
								</select>
								</td>
								<td class="tdWidth">咨询等级： <select class="selectStyle"
									style="width:130px;" name="rank">
										<option value="0">全部</option>
										<c:if test="${RanktypeList !=null}">
											<c:forEach var="ranktype" items="${RanktypeList}">
												<option
													<c:if test="${ranktype.id == rank}">selected="selected"</c:if>
													value="${ranktype.id}">${ranktype.rank}</option>
											</c:forEach>
										</c:if>
								</select>
								</td>
							</tr>
							<tr>
								<td class="tdWidth">性别： <select class="selectStyle"
									style="width:130px;" name="sex"></div>
										<option value="0" name="sex">全部</option>
										<option value="1" name="sex">男</option>
										<option value="2" name="sex">女</option>
								</select>
								</td>
								<td class="tdWidth">学历： <select class="selectStyle"
									style="width:130px;" name="education">
										<option value="0">全部</option>
										<c:if test="${EducationList !=null}">
											<c:forEach var="edu" items="${EducationList}">
												<option
													<c:if test="${edu.id == education}">selected="selected"</c:if>
													value="${edu.id}">${edu.education}</option>
											</c:forEach>
										</c:if>
								</select>
								</td>
								<td class="tdWidth">状态： <select class="selectStyle"
									style="width:130px;" name="status">
										<option value="0">全部</option>
										<c:if test="${ConsultstatusList !=null}">
											<c:forEach var="consultStatus" items="${ConsultstatusList}">
												<option
													<c:if test="${consultStatus.id == status}">selected="selected"</c:if>
													value="${consultStatus.id}">${consultStatus.status}
												</option>
											</c:forEach>
										</c:if>
								</select>
								</td>
								<td class="tdWidth">上门： <select class="selectStyle"
									style="width:130px;" name="come"></div>
										<option value="0" name="come">全部</option>
										<option value="1" name="come">是</option>
										<option value="2" name="come">否</option>
								</select>
								</td>
							</tr>
							<tr>

								<td class="tdWidth">咨询课程： <select class="selectStyle"
									name="consultLesson" style="width:130px;">
										<option value="0">全部</option>
										<c:if test="${SpecialtyList !=null}">

											<c:forEach var="lesson" items="${SpecialtyList}">
												<option
													<c:if test="${lesson.id == consultLesson}">selected="selected"</c:if>
													value="${lesson.id}">${lesson.consultLesson}</option>
											</c:forEach>
										</c:if>
								</select>
								</td>

								<td class="tdWidth">咨询方式： <select class="selectStyle"
									style="width:130px;" name="consultWay">
										<option value="0">全部</option>
										<c:if test="${ConsultwayLsit !=null}">
											<c:forEach var="OaScbConsultway" items="${ConsultwayLsit}">
												<option
													<c:if test="${OaScbConsultway.id == consultWay}">selected="selected"</c:if>
													value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
												</option>
											</c:forEach>
										</c:if>
								</select>
								</td>

								<td class="tdWidth">首次咨询日期：<input type="date"
									name="firstConsultTimes" class="dateStyle" style="width:130px;" /></td>
								<!-- <td class="tdWidth">预计回访时间：<input type="date" name="nextvisitTimes" class="dateStyle" style="width:130px;" /></td> -->
								<td class="tdWidth">报名日期：<input type="date"
									name="enrollTimes" class="dateStyle" style="width:130px;" /></td>
							</tr>
						</table>

						<div style="border: 1px; line-height:50px; float: right;">
							<input type="button" id="btn" class="saveBotton" value="搜索" />
							<!--  <input type="button" class="saveBotton" value="导出"/> -->
						</div>
					</form>
				</div>

				
				<h1 class="tabTitle">基本信息</h1>
						<table cellpadding="0" cellspacing="0" border="0"
							class="selectTable">
							<thead>
								<tr>
									<th>序号</th>
									<th>分量状态</th>
									<th>咨询师</th>
									<th onclick="order(1)">首次咨询日期</th>
									<th>学员姓名</th>
									<th>性别</th>
									<th>年龄</th>
									<th>回访日期</th>
									<th>电话</th>
									<th>咨询课程</th>
									<th>咨询方式</th>
									<th>地区</th>
									<th>状态</th>
									<th>学历</th>
									<th>操作</th>
								</tr>

							</thead>
							<tbody id="consulters">

							</tbody>
	
						</table>
						<div id="Nofind"></div>
						<div id="page"></div>


				
			



		<div class="mbStyle">&nbsp;</div>
		<div class="popupStyle" style="width: 700px; height: 600px; ">
			<h1>
				学生详情<span class="closeX">X</span>
			</h1>
			<table cellpadding="0" cellspacing="0" border="0" class="addTable">
				<tbody id="AssistantInfoShow">

				</tbody>

			</table>
		</div>


		<div class="mbStyle-studyInfo">&nbsp;</div>
		<div class="popupStyle-study" style="width: 570px; height: 440px;">
			<h1>
				咨询量跟踪情况<span class="closeX">X</span>
			</h1>
			<form action="">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tbody id="VisitInfo">
					</tbody>

				</table>
			</form>
		</div>
</body>
</html>
