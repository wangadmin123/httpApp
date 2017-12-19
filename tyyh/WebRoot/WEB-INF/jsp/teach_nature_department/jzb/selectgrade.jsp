<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<input type="hidden" id="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>选项卡模板</title>
<style type="text/css">
.page{
	float:right; 
	font-size:12px;
	color:#333333; 
	font-family:"微软雅黑";
	margin-right:20px; 
	line-height:30px;
	height:30px; 
	cursor:pointer;
}
.page span{
    margin:0px 4px;
}

</style>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>


<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/addpatrol.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/showpatrol.css"/>

<link rel="stylesheet" href="statics/teach_nature_department/jzb.css/jquery-labelauty.css">
 
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/echarts.min.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/jquery-labelauty.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/selectgrade.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/tab.js"></script>

<script type="text/javascript" src="statics/teach_nature_department/jzb.js/addDbjh.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/selgrade.js"></script>
<script type="text/javascript">

/* 根据时间搜索班级数据 */
$(function(){
	showGradeData(1);
	$("#selgrad").click(function(){
		showGradeData(1);
	});
});
	function showGradeData(index){
		var datatime=document.getElementById("datatime").value;
		var query = "currentdate=" + datatime + "&index=" + index;
		$.get("seltime",query,showdata,"json");
	}
	 function showdata(data){
	 var fals1 = data.fals;
	 	var oaJzbGradedatas = data.oaJzbGradedatas;
	 	var stuDks=data.stuDk;
	  	var pageCount = data.pageCount;
	  	var index = data.index;
	  	showPer(stuDks,oaJzbGradedatas,fals1);
	  	showGradeDataPage(pageCount,index);
	  }	
	  function showPer(stuDks,oaJzbGradedatas,fals1){
	  	$("#dbsb").empty();
		$("#dbsb").append("<tr><th width='10%'>学号</th><th width='10%'>姓名</th><th width='10%'>上午打卡</th><th width='15%'>上午打卡时间</th><th width='10%'>下午打卡</th><th width='15%'>下午打卡时间</th><th width='7.5%'>单词</th><th width='7.5%'>当天课时</th><th width='7.5%'>请假课时</th><th width='15%'>时间</th></tr>");/* <th>操作</th> */
		for(var i = 0; i< oaJzbGradedatas.length; i++){
		var ambool=true;
		var pmbool=true;
		var tables="<tr><td>"+oaJzbGradedatas[i].stu_number+" </td><td>"+ oaJzbGradedatas[i].stu_name+"</td>";
		for(var j = 0; j< stuDks.length; j++){
			if(stuDks[j].stu_Id==oaJzbGradedatas[i].student_id){
				if((stuDks[j].am_dk!=null||stuDks[j].am_dk!="")&&(oaJzbGradedatas[i].amturn=="正常")){
					tables=tables+"<td>"+ stuDks[j].am_dk +"</td><td>"+stuDks[j].am_time+"</td>";
					ambool=false;
				}else if((stuDks[j].am_dk!=null||stuDks[j].am_dk!="")&&(oaJzbGradedatas[i].amturn!="正常")){
					tables=tables+"<td style='font-weight:bolder;color:red;'>"+ oaJzbGradedatas[i].amturn +"</td><td>"+stuDks[j].am_time+"</td>";
					ambool=false;
				}
				if((stuDks[j].pm_dk!=null||stuDks[j].pm_dk!="")&&(oaJzbGradedatas[i].pmturn=="正常")){
					tables=tables+"<td>"+ stuDks[j].pm_dk +"</td><td>"+stuDks[j].pm_time+"</td>";
					pmbool=false;
				}else if((stuDks[j].pm_dk!=null||stuDks[j].pm_dk!="")&&(oaJzbGradedatas[i].pmturn!="正常")){
					tables=tables+"<td style='font-weight:bolder;color:red;'>"+ oaJzbGradedatas[i].pmturn +"</td><td>"+stuDks[j].pm_time+"</td>";
					pmbool=false;
				}
			}
		}
		if(ambool){
			if(oaJzbGradedatas[i].amturn=="正常"){
			tables=tables+"<td>"+ oaJzbGradedatas[i].amturn +"</td><td></td>";
			}else{
			tables=tables+"<td style='font-weight:bolder;color:red;'>"+ oaJzbGradedatas[i].amturn +"</td><td></td>";
			}
		}
		if(pmbool){
		if(oaJzbGradedatas[i].pmturn=="正常"){
		tables=tables+"<td>"+ oaJzbGradedatas[i].pmturn +"</td><td></td>";
		}else{
		tables=tables+"<td style='font-weight:bolder;color:red;'>"+ oaJzbGradedatas[i].pmturn +"</td><td></td>";
		}}
		tables=tables+"<td>"+ oaJzbGradedatas[i].word +"</td><td>"+ oaJzbGradedatas[i].classHour +"</td>"
		if(oaJzbGradedatas[i].qijiaHour=="0"){
		tables=tables+"<td>"+ oaJzbGradedatas[i].qijiaHour +"</td>";
		}else{
		tables=tables+"<td style='font-weight:bolder;color:red;'>"+ oaJzbGradedatas[i].qijiaHour +"</td>";
		}
		tables=tables+"<td>" + oaJzbGradedatas[i].time + " </td></tr>";
				/*if(fals1[i]){
				$("#dbsb").append("<tr><td>"+oaJzbGradedatas[i].stu_number+" </td><td>"+ oaJzbGradedatas[i].stu_name+"</td><td>"+ oaJzbGradedatas[i].amturn +"</td><td>"+ oaJzbGradedatas[i].pmturn +"</td><td>"+ oaJzbGradedatas[i].word +"</td><td>"+ oaJzbGradedatas[i].classHour +"</td><td>"+ oaJzbGradedatas[i].remarks +"</td><td>" + oaJzbGradedatas[i].time + " </td></tr>");
				}else{
				$("#dbsb").append("<tr><td>"+oaJzbGradedatas[i].stu_number+" </td><td>"+ oaJzbGradedatas[i].stu_name+"</td><td>"+ oaJzbGradedatas[i].amturn +"</td><td>"+ oaJzbGradedatas[i].pmturn +"</td><td>"+ oaJzbGradedatas[i].word +"</td><td>"+ oaJzbGradedatas[i].classHour +"</td><td>"+ oaJzbGradedatas[i].remarks +"</td><td>" + oaJzbGradedatas[i].time + " </td></tr>");/* <td><a href=\"toupdateGradeData?id=" + oaJzbGradedatas[i].student_id +"&time=" + oaJzbGradedatas[i].time + "\" >编辑</a></td> */
				/*}*/
		$("#dbsb").append(tables);
		}	
	  }
	  function showGradeDataPage(pageCount,index){
	 	$("#pageList").empty();
	 	$("#pageList").append("<a href='javascript:onclick=showGradeData(1)' >首页</a>");
	 	if(index != 1){
	 		$("#pageList").append("<a href='javascript:onclick=showGradeData("+(index-1)+")' >上一页</a>");
	 	}
	 	for(var i = 1;i <= pageCount;i++){
	 		$("#pageList").append("<a href='javascript:onclick=showGradeData("+i+")' >"+i+"</a>");
	 	}
	 	if(index != pageCount){
	 		$("#pageList").append("<a href='javascript:onclick=showGradeData("+(index+1)+")' >下一页</a>");
	 	}
	 	$("#pageList").append("<a href='javascript:onclick=showGradeData(" + pageCount + ")' >末页</a>");
	 }
//项目答辩合并
$(function(){
$(".row").each(function(index, element) {  
        if(!$(this).hasClass("hide")) {   
        	 var next=$(this).parent("tr").next("tr").children(".row");//下一个合并的对象
        	 var nexts=$(this).parent("tr").next("tr").children(".row1");
           	 $(this).attr("rowspan",1);
             while($(this).text()==next.text()){
                    $(this).attr("rowspan",parseInt($(this).attr("rowspan"))+1);
                    next.hide(); 
                    next.addClass("hide");
                    next=next.parent("tr").next("tr").children(".row");//下一个合并的对象 
                    
                    //siblings() 获得匹配集合中每个元素的同胞，通过选择器进行筛选是可选的。
                    $(this).siblings(".row1").attr("rowspan",parseInt($(this).attr("rowspan")));
			        nexts.hide();
			        nexts.addClass("hide");
			        nexts=nexts.parent("tr").next("tr").children(".row1");
                } 
        	}
    });
     $(".stageRow").each(function(index, element) {  
        if(!$(this).hasClass("hide")) {   
        	 var next=$(this).parent("tr").next("tr").children(".stageRow");//下一个合并的对象
           	 $(this).attr("rowspan",1);
             while($(this).text()==next.text()){
                    $(this).attr("rowspan",parseInt($(this).attr("rowspan"))+1);
                    next.hide();
                    next.addClass("hide");
                    next=next.parent("tr").next("tr").children(".stageRow");//下一个合并的对象 
                } 
        	}
    });

});
//跳到当前选项卡
function showJiuye(){
	
	var inn = $("#indexShow").val();
	if(inn == 1){		
		$(".tabs span").addClass("spanHover");
		$(".tabs span").siblings().removeClass("spanHover");
		$(".tabs span").siblings().addClass("spanOut");	
		var $text=$(this).text();
		$("h1").text($text);
		$(".divTable").hide();	
		$(".divTable").eq($(this).index()).show();
	}
	
}
$(function(){
	$(".editDBJH").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		window.location.href=path+"editdbjh/";
	});
});
/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);
});
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
		location.href="welcome.jsp";
	}		
}
/*保存读秒结束*/

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
				$("#all").attr("checked",true);
			}else{
				$("#all").attr("checked",false);
			}
		}
        ifAllChecked();//页面加载完后运行
});


$(function(){
	
	//查看班级详情
	$("#adddbjhSumView").on("click",function(){
		//将被绑定的元素（a）转换成jquery对象，可以使用jquery方法
		window.location.href="adddbjhSumView/";
	});
	
});
/*表格全选结束*/
//新增代班计划
$(function(){
  $("#searchBotton").click(function(){
    location.href="../jzb/addDbjh.jsp";
  });
});


  $(function(){
            /*点击显示弹出框*/
            $(".updatePatrol").click(function(){
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
        
        
        //周考AJAX
        $(function(){
       	    show(1); 
		});
		
		function search(){
		show(1);
		}
		function show(index){
		var formInfo = $("#queryweek").serialize()+"&index="+index;
				$.post("showzhoukao",formInfo,showdate,"json");
				function showdate(data){
				var OaXsbWeeks = data.OaXsbWeeks;
				var row = data.row;
				var index = data.index;
				var pagecount = data.pagecount;
				showList(OaXsbWeeks);
				showPage(index,pagecount); 
				}
			};
		function showList(OaXsbWeeks1){
					$("#zhoukao").empty();
					$("#zhoukao").append("<tr><th>排名</th><th>学号</th><th>姓名</th><th>笔试(100)</th><th>机试(100)</th><th>总分</th></tr>");
					for(var i = 0; i < OaXsbWeeks1.length ; i++){	
			 		$("#zhoukao").append("<tr><td>"+(i+1)+"</td><td>"+OaXsbWeeks1[i].stu_number+"</td>"+
					"<td>"+OaXsbWeeks1[i].stu_name+"</td><td>"+OaXsbWeeks1[i].written+"</td><td>"+OaXsbWeeks1[i].scjd+"</td><td>"+OaXsbWeeks1[i].a+"</td>"+
					"</tr>"); 
					}
		}
			
			
		function showPage(index,pageCount){
			  	$("#pagezhoukao").empty();
			  	$("#pagezhoukao").append("<a href='javascript:onclick=show(1)'>首页</a>");
			 
			  	if(index!=1){
			  	$("#pagezhoukao").append("<a href='javascript:onclick=show("+(index-1)+")'>上一页</a>");
			  	}
			  	for(var i =1;i<=pageCount;i++){
			  	$("#pagezhoukao").append("<a href='javascript:onclick=show("+i+")'>"+i+"</a>");
			  	}
			  	if(index!=pageCount){
			  		$("#pagezhoukao").append("<a href='javascript:onclick=show("+(index+1)+")'>下一页</a>");
			  	}
			  	$("#pagezhoukao").append("<a href='javascript:onclick=show("+pageCount+")'>末页</a>");
				 }	
				 
/* 开办情况分析表Ajax==开始 */

/* 数据分页、查询===开始*/
function selectName(currentPage){
	var openClassInfo=$("#form").serialize()+"&currentPage="+currentPage;
	$.post("openclass/kb",openClassInfo,selectData,"json");
	function selectData(data){
		var fals1 = data.fals;
		var index=data.currentPage;//当前页
		var pageCount=data.pageCount;//页面总数
		var openclass=data.openclasslist;//参数
		shwList(openclass,fals1);
		showPageInfo(index,pageCount);
	}
}
//页面列表
function shwList(openclass,fals1){
	$("#OpenClass").empty();
	for ( var i = 0; i < openclass.length; i++) {
	var sex=openclass[i].sex==1?"男":"女";
	if(fals1[i]){
	$("#OpenClass").append("<tr>"
									+"<td width='100'><input name=\"name\" value=\""+openclass[i].name+"\" readonly style='width:100px;line-height:20px;text-align:center;border:1px solid white'/></td>"
									+"<td width='70'>"+sex+"</td>"
									+"<td width='70'><input name=\"age\" value=\""+openclass[i].age+"\" readonly style='width:70px;line-height:20px;text-align:center;border:1px solid white'/></td>"
									+"<td width='70'><input name=\"study_experience\" value=\""+openclass[i].education+"\" readonly style='width:70px;line-height:20px;text-align:center;border:1px solid white'/></td>"
									+"<td width='70'><input name=\"computer_horizontal\" value=\""+openclass[i].computer_horizontal+"\" readonly style='width:70px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"<td width='570'><input name=\"age\" value=\""+openclass[i].remarks+"\" readonly style='width:570px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"<td width='120'><input name=\"remarks\" value=\""+openclass[i].city+"\" readonly style='width:120px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"<td style='margin-left:30px;'>超过48小时</td>"
									+"</tr>");
	}else{
	$("#OpenClass").append("<tr>"
									+"<td width='100'><input name=\"name\" value=\""+openclass[i].name+"\" readonly style='width:100px;line-height:20px;text-align:center;border:1px solid white'/></td>"
									+"<td width='70'><input name=\"sex\" value=\""+sex+"\" readonly style='width:70px;line-height:20px;text-align:center;border:1px solid white'/></td>"
									+"<td width='70'><input name=\"age\" value=\""+openclass[i].age+"\" readonly style='width:70px;line-height:20px;text-align:center;border:1px solid white'/></td>"
									+"<td width='70'><input name=\"study_experience\" value=\""+openclass[i].education+"\" readonly style='width:70px;line-height:20px;text-align:center;border:1px solid white'/></td>"
									+"<td width='70'><input name=\"computer_horizontal\" value=\""+openclass[i].computer_horizontal+"\" readonly style='width:70px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"<td width='570'><input name=\"age\" value=\""+openclass[i].remarks+"\" readonly style='width:570px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"<td width='120'><input name=\"remarks\" value=\""+openclass[i].city+"\" readonly style='width:120px;line-height:20px;text-align:center;border:1px solid white''/></td>"
									+"<td style='margin-left:30px;'><a href='${pageContext.request.contextPath }/modifykbqk/"+openclass[i].id+"' class=\"edit\">修改</a><a href='${pageContext.request.contextPath }/delkbqk/"+openclass[i].id+"' class=\"delete\">删除</a></td>"
									+"</tr>");
	}
			
    	}
}
//页数回调
function showPageInfo(index,pageCount){
		$("#page1").empty();
	  	var str="";
	 	str+="<a href='javascript:onclick=selectName(1)'>首页</a>";
	 	if(index!=1){
	 		str+="<a href='javascript:onclick=selectName("+(index-1)+")'>上一页</a>";
	 	}
	 	for(var i=1;i<=pageCount;i++){
	 		str+="<a href='javascript:onclick=selectName("+i+")'>"+i+"</a>";
	 	}
	 	if(index!=pageCount){
	 		str+="<a href='javascript:onclick=selectName("+(index+1)+")'>下一页</a>";
	 	}
	 	str+="<a href='javascript:onclick=selectName("+pageCount+")'>末页</a>";
	 	$("#page1").html(str);
}
//窗体加载事件
$(function(){
$("#getIndex").val("-1");
	selectName(1);
	$("#search").click(function(){
		selectName(1);
	});
});
/* 数据分页、查询===结束*/

/* 开办情况分析表Ajax==结束*/
</script>
</head>
<body>
<input type="hidden" value="${index}" id="getIndex"/>
<div class="rightContent">
    <div class="tabs" >
      <span class="spanHover" style="font-weight:normal;">班级学员月访</span>
      <!-- <span class="spanOut" style="font-weight:normal;">开班情况分析表</span> -->
     <!--  <span class="spanOut" style="font-weight:normal;">周考</span> -->
      <span class="spanOut" style="font-weight:normal;">带班计划</span>
      <span class="spanOut" style="font-weight:normal;">项目答辩成绩</span>
      <span class="spanOut" id="spanLast" style="font-weight:normal;">班级数据</span>
      <!-- <span class="spanOut" id="spanLast" style="font-weight:normal;">巡班记录</span> -->
    </div>
  
     <!-- 班级学员个性访谈 -->
     <div class="divTable">
				<div class="serach" style="margin-top:12px;margin-bottom:15px; border-bottom:1px solid #eee;padding-bottom:10px;">
					<form action="${pageContext.request.contextPath }/selectgrade.html"
						method="post" enctype="multipart/form-data">
						<table cellpadding="0" cellspacing="0" class="searchTable"	border="0" style="width:50%; font-size:12px;font-weight:normal;">
							<tr>
							<td>
								<input type="hidden" name="grade_id" value="${gradeid }" /></td>
							<td>学期：<select class="searchStyle"  style="width:120px;" name="Term_id">
                          <option value="0">--请选择--</option>
                          <c:forEach items="${semesters }" var="semester" varStatus="status">
                          <option value="${semester.id }">${semester.stage }</option>                     
                          </c:forEach>
                     	 </select>
            			</td>

								<td>月份：<select class="searchStyle" style="width:120px;"
									name="month">
										<option value="">--请选择--</option>
										<option value="01">一月</option>
										<option value="02">二月</option>
										<option value="03">三月</option>
										<option value="04">四月</option>
										<option value="05">五月</option>
										<option value="06">六月</option>
										<option value="07">七月</option>
										<option value="08">八月</option>
										<option value="09">九月</option>
										<option value="10">十月</option>
										<option value="11">十一月</option>
										<option value="12">十二月</option>
								</select>
								</td>
								<td><input type="submit" value="搜索" class="searchBotton" /></td>
							</tr>
							
						</table>
					</form>

				</div>
<table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr><th colspan="11" style="text-align: center;font-size:14px; background-color:#fff;padding-bottom:10px;">${oaJwbGrade.name }班 -- 班级学员月访</th></tr>
        <tr>
          <th></th>
          <th>姓名</th>
          <th>学期</th>
          <th>笔试目标</th>
          <th>机试目标</th>
          <th>班主任</th>
          <th>教员</th>
           <th>访谈时间</th>
           <th>录入时间</th>
          <th>访谈内容</th>
          <th>备注</th>
        </tr>

					<c:forEach var="stuInfoList" items="${stuInfoList }"
						varStatus="status">
						<tr>
						
							<td></td>
							<td>${stuInfoList.stu_name }</td>
							<td>${stuInfoList.stage }</td>
							<td>${stuInfoList.writerTest }</td>
							<td>${stuInfoList.engineTest }</td>
							<td>${stuInfoList.emp_name }</td>
							<td>${stuInfoList.teacherScene }</td>
							<td><fmt:formatDate value="${stuInfoList.interviewTime }" pattern="yyyy-MM-dd"/></td>
							<td>${stuInfoList.enteringTime }</td>
							<td>${stuInfoList.interviewContent }</td>
							<td>${stuInfoList.remark }</td>
						</tr>
					</c:forEach>
      </table>
    
     </div>
  </div>
<!-- 开班情况分析表 -->
  <%-- <div class="divTable" style="display:none;">
 <div class="serach">
     <form method="post" enctype="multipart/form-data" id="form">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:50%;">
           <tr class="Jltop">
            
           </tr>
         </table>
    </form>          
      
    </div>

	       <table cellpadding="0" cellspacing="0" border="0" class="selectTable" style="margin-top:12px;margin-bottom:15px;width:98%;margin-left:15px;">
	        <tr><th colspan="8" style="text-align:center;font-size:14px; background-color:#fff;padding-bottom:10px;">${oaJwbGrade.name }班 -- 开班情况分析表</th></tr>
	        <tr>
	          <th>姓名</th>
	          <th>性别</th>
	          <th>年龄</th>
	          <th>学历</th>
	          <th>计算机水平</th>
	          <th>备注</th>
	          <th>就业意向城市</th>
	          <th class="kbqkfx">操作</th>
	        </tr>
	        <tbody id="OpenClass">
	        	
	        </tbody>
	      </table>
  
      <div id="page1" class="page"></div>
     </div>
  </div> --%>
  <!-- 周考 -->
  <%-- <div class="divTable" style="display:none;">
     <div class="serach" style="margin-top:12px;margin-bottom:15px; margin-left:15px; border-bottom:1px solid #eee;padding-bottom:10px;">
      <form id="queryweek" method="post">
        <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:50%;font-size:12px;font-weight:normal;">
           <tr>
      
            <td>当月周考：<select style="width:100px;height:27px;" name="zhou">
            	 <option value="0">请选择</option>
                 <c:forEach items="${weeklists }" var="weeklists">
                 <option value="${weeklists.whatweek }">第${weeklists.whatweek }周</option>
                 </c:forEach>
                  
                </select></td>
            <td><input type="button"  value="搜索"  onclick="search()" class="searchBotton" id="weekbutton"/></td>
         </tr>
       </table>
       </form>
    </div>
    <div style="margin-left:15px;width:98%;">
       <table cellpadding="0" cellspacing="0" border="0"  id="zhoukao"  class="selectTable" id="weekscore" >
 	
      
      </table>
      </div>
       <div id="pagezhoukao" class="page" ></div>
  <!--       <div id="main" style="width: 600px;height:400px;"></div> -->
     </div> --%>
  <!-- 带班计划 -->
  <div class="divTable" style="display:none;">
    <div class="serach">
        <!-- <input type="button"  value="导入" class="searchBotton" style="float:right;" />
        <input type="button"  value="导出" class="searchBotton" style="float:right;"/> -->
    </div>
   		<c:choose>
   		<c:when test="${roaa!=0}">
       <table cellpadding="0" cellspacing="0" border="1" class="selectTable" style="width:98%;margin-left:15px;margin-top:15px;">
        <tr><th colspan="6" style="text-align: center;font-size:14px;background-color:#fff;">${oaJwbGrade.name }班 -- 带班计划表</th></tr>
        <tr>
          <th>老师</th>
          <th>阶段</th> 
          <th>课程内容</th> 
          <th>可能发生的问题</th>
          <th>主要工作</th>
          <th style="width:8%;">操作</th>
        </tr>
        <c:forEach items="${OaJzbClassplans }" var="OaJzbClassplans" varStatus="i">
        		 <tr>
	          		  <td class="dbjh">${OaJzbClassplans.emp_name }</td>
			         <td style="width:8%;">${OaJzbClassplans.termStage_name }</td>
			         <td class="dbjh">${OaJzbClassplans.coursecontent }</td>		 
			          <td class="dbjh1">${OaJzbClassplans.question }</td>        
			          <td class="dbjh1">${OaJzbClassplans.work }</td>
			         <c:choose>
			         <c:when test="${OaJzbClassplans.flas==false }">
			         <td style="width:8%;"><a href="${pageContext.request.contextPath }/editdbjh?id=${OaJzbClassplans.id }" class="edit">修改</a><a href="${pageContext.request.contextPath }/deletedbjh?id=${OaJzbClassplans.id }" class="delete">删除</a></td>        			 
			         </c:when>
			         <c:otherwise><td style="width:60px;">已超48小时</td></c:otherwise>	         
			         </c:choose>
         		 </tr>
         </c:forEach>
      	<c:forEach items="${OaJzbClassplansums }" var="OaJzbClassplansums">
        <tr>
          <td>${OaJzbClassplansums.emp_name }</td>
          <td style="color:red;">总结：</td>
          <td colspan="3">${OaJzbClassplansums.sum }</td>
           			<c:choose>
			         <c:when test="${OaJzbClassplansums.flas==false }">
			        <td><a href="${pageContext.request.contextPath }/editdbjhsumview?id=${OaJzbClassplansums.classplansum_id }" class="edit">修改</a><a href="${pageContext.request.contextPath }/deletedbjhsum?id=${OaJzbClassplansums.classplansum_id }" class="delete">删除</a></td>        			 
			         </c:when>
			         <c:otherwise><td>已超48小时</td></c:otherwise>	         
			         </c:choose>
        </tr>
        </c:forEach> 
      </table>
      	</c:when>
      	<c:otherwise>
      	<div class="classplan" style="margin-left:15px;"><h3>填写尚未完成</h3></div>
      	</c:otherwise>
    	</c:choose>
     </div>
   <!-- 项目答辩成绩表 -->
  <div class="divTable" style="display:none;">
    <div class="serach">
     <form  action="${pageContext.request.contextPath }/getStudentsByGriade_ID" method="post" enctype="multipart/form-data"  id="tb" >
    </div>
       <table  cellpadding="0" cellspacing="0" border="1" class="selectTable" style="margin-top:12px;margin-bottom:15px;width:98%;margin-left:15px;">
        <tr><th colspan="8" style="text-align: center;font-size:14px;background-color:#fff;padding-bottom:10px;font-weight:bold;">${oaJwbGrade.name }班 -- 项目答辩成绩表</th></tr>
         <tr>
         <th>学期</th>
          <th>小组名称</th>
          <th>学生姓名</th>
          <th>个人得分</th> 
          <th>小组得分</th> 
          <th>小组表现</th>
          <th style="width:300px;">备注</th>
          <th style="text-align:center;">操作</th>
        </tr>
      <c:forEach var="project" items="${oaJzbProjectList }" varStatus="status">
				<tr style="font-weight:normal;">
					<td  class="stageRow">
						<span>${project.stage }</span>
					</td>	
					<td class="row">
						<span>${project.group_name }</span>
					</td>
					<td>
						<span>${project.stu_name }</span>
					</td>
					<td>
						<span>${project.score}</span>
					</td>
					<td class="row1">
						<span >${project.group_score}</span>
					</td>
					<td class="row1">
						<span>${project.group_expression}</span>
					</td>
					<td>
						<span>${project.remarks}</span>
					</td>
					<c:choose>
			         <c:when test="${project.flas==false }">
			      <td> 
						<span><a  href="showOaJzbProject/${project.id}"    class="editProject">评分</a></span>
						<span><a  href="deleteOaJzbProject/${project.id }"  class="deleteProject"   projectid="${project.id}">删除</a></span>
				 	</td>
			         </c:when>
			         <c:otherwise><td>已超48小时</td></c:otherwise>	         
			         </c:choose>
        			
        	</tr> 
		</c:forEach>		
      </table>  
      </form>
  </div>
<!-- 班级数据 -->
   
   <div class="divTable" style="display:none;">
   <div class="serach" style="margin-top:12px;margin-bottom:15px;margin-left:15px; border-bottom:1px solid #eee;padding-bottom:10px;">
      	<table cellpadding="0" cellspacing="0" class="searchTable"	border="0" style="width:50%; font-size:12px;font-weight:normal;">
   			<tr>
	   			 <td><input type="date" class="dateStyle" style="width:160px;" name="Datatime"  id="datatime" value="${createTime }"/>&nbsp;&nbsp;&nbsp;&nbsp;<input id="selgrad" type="button" class="searchBotton" value="搜索"/></td> 
	
	        </tr>
   		</table>
      </div>

      
           <table cellpadding="0" cellspacing="0" border="0" class="selectTable"  id="dbsb" style="margin-top:12px;margin-bottom:15px;width:98%;margin-left:15px;">
           </table>

       
       <!-- 显示分页页码 -->
    <div id="pageList" style="text-align: right;margin-right:30px; font-size:12px;font-weight:normal;">     
           
   
   </div>
   </div>
 <!--  巡班记录 -->
 <div class="divTable" style="display:none;"> 
 <c:forEach var="patrolgrade" items="${patrolgradeList}" varStatus="status">
  <div class="showPatrolDiv">
   	 	<ul>
   	 		<li>班主任:${patrolgrade.emp_name}</li>
   	 		<li>巡班时间:<fmt:formatDate value="${patrolgrade.enteringTime}" pattern="yyyy-MM-dd HH:mm"/></li>
   	 	</ul>
   	 	<div class="showPatrolDiv2">
   	 		巡班结果:
   	 		<c:if test="${patrolgrade.stu_name ne ''}">${patrolgrade.stu_name}</c:if>
   	 		 ${patrolgrade.question}
   	 		<div class="showPatrolDiv3">
   	 			<c:choose>
			         <c:when test="${patrolgrade.flas==false }">
			       <a href="${pageContext.request.contextPath }/delpatrol?id=${patrolgrade.id}<c:if test="${patrolgrade.stu_name eq ''}">&del=3</c:if>" class="deletePatrol">删除</a>
   	 		       <a href="${pageContext.request.contextPath }/editxb.html?id=${patrolgrade.id}<c:if test="${patrolgrade.stu_name eq ''}">&up=3</c:if>" class="updatePatrol">修改</a>        			 
			         </c:when>
			         <c:otherwise>已超48小时</c:otherwise>	         
			         </c:choose>
   	 		</div>
   	 	</div>
   	</div>
   	</c:forEach>
  </div>
  </body>
</html>