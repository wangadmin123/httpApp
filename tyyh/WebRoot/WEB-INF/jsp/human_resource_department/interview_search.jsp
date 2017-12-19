<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查询访谈信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">

<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>

<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>

<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<script type="text/javascript">

  
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
/*表格全选结束*/


/* 点击添加跳转到添加页面 */
$(function(){
	$("#addInfo").click(function(){
		location.href="interview_add.html";
	});
});


function showDate(index){
	  	//获得搜索条件
		var interview_person = $("#interview_person_name").val();
		var emp_name = $("#emp_name").val();
		var interview_date = $("#interview_date").val();
	  	$.ajax({
			type:"POST",
			url:"interview_search",
			dataType:"json",
			data:{
				interview_person:interview_person,
				emp_name:emp_name,
				interview_date:interview_date,
				pageIndex:index
			},
			success: showList,
			error:function(){
				alert("数据不存在");
			}
		});
	 }

	 function showList(data){
		var datas = eval("("+data+")");
	  	var pageCount = datas.totalPageCount;
	  	
	  	var index= datas.currentPageNo;
	  	var count = datas.totalCount;
	  		  	
	  	var person = datas.person;
	  	var empName = datas.empName;
	  	
	  	showStuList(person,empName);
	  	showPageIndex(pageCount,index,count);
	 }

	 function dateFmt(time){
		var t = new Date(time);
		var year = t.getFullYear(); //年
		var month = t.getMonth() + 1; //月
		var day = t.getDate(); //日
		if(month < 10){
			month = "0" + month;
		}
		if(day < 10){
			day = "0" + day;
		}
		var dateTimeStr= year + "-" + month + "-"+day;
		return dateTimeStr;
	}
	
	function showStuList(person,empName){
	
	  	$(".selectTable").html("");
		
		var str = "<tr>";
			str += "<th>编号</th>";
			str += "<th>访谈人</th>";
			str += "<th>访谈人部门</th>";
			str += "<th>访谈人岗位</th>";
			str += "<th>被访谈人</th>";
			str += "<th>被访谈人部门</th>";
			str += "<th>被访谈人岗位</th>";
			str += "<th>访谈时间</th>";
			str += "<th>记录人</th>";
			str += "<th>操作</th>";
			str += "</tr>";
  		
			for(var i = 0;i < person.length ; i++){
				var interview_id= person[i].interview_id;
				for(var j = 0;j < empName.length;j++){
					if(interview_id == empName[j].interview_id){
						str += "<tr>";
						
						var id = j + 1;
						if(id < 10){
							id = "000" + id;
						}else if(id < 100){
							id = "00" + id;
						}else if(id < 1000){
							id = "0" + id;
						}else{
							id = "" + id;
						}
						str += "<td>" + id  + "</td>";
						str += "<td>" + person[i].emp_name  + "</td>";
						str += "<td>" + person[i].depart_name + "</td>";
						str += "<td>" + person[i].position_name  + "</td>";
						str += "<td>" + empName[j].emp_name  + "</td>";
						str += "<td>" + empName[j].depart_name + "</td>";
						str += "<td>" + empName[j].position_name  + "</td>";
						str += "<td>" + person[i].interview_date  + "</td>";
						str += "<td>" + person[i].interview_recorder  + "</td>";
						str += "<td>";
						str += "<a href=\"javascript:;\" class=\"link\" interview_id=\"" + person[i].interview_id + "\">查看</a>";
						
						var date1 = new Date(person[i].create_time);
						var date3 = new Date();
						
						
						
						if(date3.getTime()-date1.getTime()<=172800000){
							str += "<a href=\"javascript:;\" class=\"delete\" interview_id=\"" + person[i].interview_id  + "\">删除</a>";
						}
						
						
						str += "</td>";
						str += "</tr>";
					}
				}
			}
			
		$(".selectTable").html(str);
		
		 $(".delete").click(function(){
			$(".deleteStyle").css("display","block");
			var interview_id = $(this).attr("interview_id");
		
			 
			 $(".bottomStyle1").click(function(){
				$(".deleteStyle").css("display","none");
				$.ajax({
					url:"interview_delete",
					data:{
						interview_id:interview_id
					},
					success:function(data){
						var index = $("#pageIndex").val();
						
	  					if(person.length % 10 == 0 && person.length != 0){
							showDate(index-1);
						}else{
							showDate(index);
						}
					}
				});
				
				
			 });
			
			 $(".bottomStyle2").click(function(){
				$(".deleteStyle").css("display","none");
				
			 }); 
		}); 
		
		$(".link").click(function(){
			var interview_id = $(this).attr("interview_id");
			location.href="interview_show?interview_id=" + interview_id; 
			
		});
	}
	
	
	function showPageIndex( pageCount,  index, count){
	  	$("#page").html("");//避免出现页码累加的情况
	  	
	  	var str = "";
	  	$("#pageIndex").val(index);
	  	var start = (index-1) * 10 + 1;
	  	var end = index * 10;
	  	if(end > count){
	  		end = count;
	  	}
	  		
	  	if(end == 0){
	  		str += " 当前无数据 ";
	  	}else{
	  		str += " 当前" + start + "-" + end + "  条 ";
	  	}
	  	
	  	/* 显示页码 */
	  	for(var i = 1; i<= pageCount; i++){	
	  		str += " <a href='javascript:onclick=showDate("+ i +")'  style='color: #333;' >"+i+"</a> ";  			
	  	}
	  	
	  	/* 	③　当当前页为末页时，”下一页”不显示 */
	  	
	  	str += " 共" +  pageCount + "页";
	  	
	  	$("#page").html(str);
	  	$("#countId").html("结果数：<input type='text' class='textStyle' style='width:50px;'  value='" + count + "' disabled='disabled' />人");
     }

	 $(function(){
	  	showDate(1);
	  		
	  	$("#chaxun").click(function(){
	  		showDate(1);
	  	});
	  	
	  	$("#qing").click(function(){
	  		$("#interview_person_name").val("");
	  		$("#emp_name").val("");
	  		$("#interview_date").val("");
	  	});
	 });



</script>
<style type="text/css">
	.deleteStyle{
		position: absolute;
		top:200px;
		left: 580px;
	}
</style>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
     <form method="post" action="">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;">
        <tr>
		  <td class='tdWidth' style="text-align:left" width="150" colspan="2">
		  访谈人：&nbsp;<input type="search" id="interview_person_name" name="interview_person" class="searchStyle" style="width:160px;"/>
		  &nbsp;&nbsp;&nbsp;&nbsp;被访谈人：<input type="search" id="emp_name" name="emp_name" class="searchStyle" style="width:160px;"/>
		  &nbsp;&nbsp;&nbsp;&nbsp;访谈时间：<input type="date" id="interview_date" name="interview_date" class="dateStyle" style="width:160px;" />
		  </td>
       </tr>
       <tr>
       	  <td><input type="button" id="chaxun" value="搜索" class="searchBotton"><input type="button" value="清空搜索条件" class="searchBotton" id="qing" style="width: 120px">
       	  <span id="countId"></span>
       	  </td>
       </tr>
       </table>
	         <input type="hidden" name="pageIndex" id="pageIndex" value="1" />
    </div>
</form>
    <h1 class="tabTitle">员工访谈信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="1" class="selectTable">
        
       
 
       
    </table>
	     <br/>
	     <!-- 分页 -->
			<div class="pageList" id="page" >
				
			</div> 


	     <!-- 分页 -->
        <script
                src="statics/common/js/rollpage.js"></script>
        
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
<div class="deleteStyle">
	<h3>操作提示</h3>
	<h2>确定要删除吗？</h2>
	<div class="btn">
	   <div class="bottomStyle1">确定</div>
	   <div class="bottomStyle2">取消</div>
	</div>
</div>
          
		
</body>
</html>

