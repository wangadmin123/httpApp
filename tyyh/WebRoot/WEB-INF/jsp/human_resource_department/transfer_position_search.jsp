<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查询调岗信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<style type="text/css">
	.deleteStyle{
		position: absolute;
		top:200px;
		left: 580px;
	}
</style>
<script type="text/javascript">

/* $(function(){

	 $(".deleteBotton").click(function(){
		 $(".mbStyle").css("display","block"); 
		$(".deleteStyle").css("display","block");
	 }); 
	
	 $(".bottomStyle1").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了确定');
	 });
	
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
	 });
	 

	  $(".delete").click(function(){
		 $(".mbStyle").css("display","block"); 
		$(".deleteStyle").css("display","block");
	 }); 
}); */

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
		location.href="transfer_position_add.html";
	});
});

function showDate(index){
	  	//获得搜索条件
		var emp_name = $("#emp_name").val();
	  	$.ajax({
			type:"POST",
			url:"transfer_position_search",
			dataType:"json",
			data:{
				emp_name:emp_name,
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
	  		  	
	  	var oaRlzybTransferPosition = datas.oaRlzybTransferPosition;
	  	var oaRlzybTransfer = datas.oaRlzybTransfer;
	  	
	  	showStuList(oaRlzybTransferPosition,oaRlzybTransfer);
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
	
	function showStuList(oaRlzybTransferPosition,oaRlzybTransfer){
	
	  	$(".selectTable").html("");
		
		var str = "<tr>";
			str += "<th>编号</th>";
			str += "<th>姓名</th>";
			str += "<th>原部门</th>";
			str += "<th>原岗位</th>";
			str += "<th>调岗原因</th>";
			str += "<th>调岗后部门</th>";
			str += "<th>调岗后岗位</th>";
			str += "<th>调岗时间</th>";
			str += "<th>操作</th>";
			str += "</tr>";
  		
			for(var i = 0;i < oaRlzybTransferPosition.length ; i++){
				str += "<tr>";
				
				var id = i + 1;
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
				str += "<td>" + oaRlzybTransferPosition[i].emp_name + "</td>";
				str += "<td>" + oaRlzybTransfer[i].depart_name + "</td>";
				str += "<td>" + oaRlzybTransfer[i].position_name  + "</td>";
				str += "<td>" + oaRlzybTransferPosition[i].transfer_position_reason  + "</td>";
				str += "<td>" + oaRlzybTransferPosition[i].depart_name + "</td>";
				str += "<td>" + oaRlzybTransferPosition[i].position_name  + "</td>";
				str += "<td>" + oaRlzybTransferPosition[i].transfer_position_time  + "</td>";
				str += "<td>";
				/* str += "<a href=\"javascript:;\" class=\"edit\" transfer_position_id=\"" + oaRlzybTransferPosition[i].transfer_position_id + "\">编辑</a>"; */
				str += "<a href=\"javascript:;\" class=\"link\" transfer_position_id=\"" + oaRlzybTransferPosition[i].transfer_position_id + "\">查看</a>";
				
				var date1 = new Date(oaRlzybTransferPosition[i].create_time);
				var date3 = new Date();
				if(date3.getTime()-date1.getTime()<=172800000){
					str += "<a href=\"javascript:;\" class=\"delete\" transfer_position_id=\"" + oaRlzybTransferPosition[i].transfer_position_id  + "\">删除</a>";
				}
				str += "</td>";
				str += "</tr>";
			}
			
		$(".selectTable").html(str);
		
		 $(".delete").click(function(){
			$(".deleteStyle").css("display","block");
			var transfer_position_id = $(this).attr("transfer_position_id");
		
			 /*删除确定*/
			 $(".bottomStyle1").click(function(){
				$(".deleteStyle").css("display","none");
				$.ajax({
					url:"transfer_position_delete",
					data:{
						transfer_position_id:transfer_position_id
					},
					success:function(){
						var index = $("#index").val();
						
	  					if(oaRlzybTransferPosition.length % 10 == 0 && oaRlzybTransferPosition.length != 0){
							showDate(index-1);
						}else{
							showDate(index);
						}
					}
				});
				
				
			 });
			 /*删除取消*/
			 $(".bottomStyle2").click(function(){
				$(".deleteStyle").css("display","none");
				
			 }); 
		});
		
		$(".link").click(function(){
			var transfer_position_id = $(this).attr("transfer_position_id");
			location.href="transfer_position_show?transfer_position_id=" + transfer_position_id; 
			
		});
	}
	
	
	function showPageIndex( pageCount,  index, count){
	  	$("#page").html("");//避免出现页码累加的情况
	  	
	  	var str = "";
	  	$("#index").val(index);
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
	  		$("#emp_name").val("");
	  	});
	 });


</script>
	<style>
/*		*{border: black solid 1px;}*/
	</style>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
     <form method="post" action="transfer_position_search">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;">
        <tr>
		   <td class="tdWidth" style="text-align:left;">姓名：&nbsp;<input type="text" id="emp_name" name="emp_name" class="textStyle" placeholder="请输入要查找的员工姓名" style="width:160px;"/>
           &nbsp;&nbsp;<input type="button" value="搜索" id="chaxun" class="searchBotton" /><input type="button" value="清空搜索条件" class="searchBotton" style='width:120px'  id="qing"/>
           <span id="countId"></span>
           </td>
        </tr>
	</table>
	     <input type="hidden" name="pageIndex" id="index"  value="1"/>
    </div>
</form>
    <h1 class="tabTitle">调岗信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="1" class="selectTable">
       		
			
      </table>
      <br/>
       <div class="pageList" id="page" >
				
			</div> 
       
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
