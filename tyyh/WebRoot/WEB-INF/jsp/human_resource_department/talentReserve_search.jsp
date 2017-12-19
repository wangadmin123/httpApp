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
<title>查询人才储备信息</title>
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
<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<style type="text/css">
	.page-bar{
		text-align: right;
		padding-right: 50px;
	}
	span,.page-bar a{
		color: #666;
		text-decoration: none;
		font-size: 18px;
		font-family:"楷体";
	}
	.page-bar a:HOVER{
		color: red;
	}
</style>
<script type="text/javascript">
/* 
$(function(){
	 点击删除
	 $(".deleteBotton").click(function(){
		/* $(".mbStyle").css("display","block"); 
		$(".deleteStyle").css("display","block");
	 }); 
	 确定删除
	 $(".bottomStyle1").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了确定');
	 });
	删除取消
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
	 });
	 
	点击删除信息 
	  $(".delete").click(function(){
		/* $(".mbStyle").css("display","block"); 
		$(".deleteStyle").css("display","block");
	 }); 
});
 */
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



	function showDate(index){
	  	//获得搜索条件
		var position_id = $(".position_id").val();
	  	$.ajax({
			type:"POST",
			url:"talentReserve_search",
			dataType:"json",
			data:{
				position_id:position_id,
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
	  		  	
	  	var oaRlzybTalentPools = datas.oaRlzybTalentPools;
	  	
	  	showStuList(oaRlzybTalentPools);
	  	showPageIndex(pageCount,index,count);
	 }

	 /* function dateFmt(time){
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
	}  */
	
	function showStuList(oaRlzybTalentPools){
	
	  	$(".selectTable").html("");
		
		var str = "<tr>";
			str += "<th>编号</th>";
			str += "<th>姓名</th>";
			str += "<th>性别</th>";
			str += "<th>年龄</th>";
			str += "<th>联系电话</th>";
			str += "<th>应聘职位</th>";
			str += "<th>薪资期望</th>";
			str += "<th>操作</th>";
			str += "</tr>";
  		
			for(var i = 0;i < oaRlzybTalentPools.length ; i++){
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
				str += "<td>" + oaRlzybTalentPools[i].talent_pool_name + "</td>";
				str += "<td>" + oaRlzybTalentPools[i].talent_pool_sex  + "</td>";
				str += "<td>" + oaRlzybTalentPools[i].talent_pool_age + "</td>";
				str += "<td>" + oaRlzybTalentPools[i].talent_pool_phone  + "</td>";
				str += "<td>" + oaRlzybTalentPools[i].position_name + "</td>";
				str += "<td>" + oaRlzybTalentPools[i].talent_pool_salaryExpect  + "</td>";
				str += "<td>";

				str += "<a href=\"javascript:;\" class=\"link\" talent_pool_id=\"" + oaRlzybTalentPools[i].talent_pool_id  + "\" talent_pool_name = \"" + oaRlzybTalentPools[i].talent_pool_name  + "\">查看</a>";
				
				var date1 = new Date(oaRlzybTalentPools[i].create_time);
				var date3 = new Date();
				if(date3.getTime()-date1.getTime()<=172800000){
												str += "<a href=\"javascript:;\" class=\"edit\" talent_pool_id=\"" + oaRlzybTalentPools[i].talent_pool_id + "\" talent_pool_name = \"" + oaRlzybTalentPools[i].talent_pool_name  + "\">编辑</a>";
					str += "<a href=\"javascript:;\" class=\"delete\" talent_pool_id=\"" + oaRlzybTalentPools[i].talent_pool_id  + "\" talent_pool_name = \"" + oaRlzybTalentPools[i].talent_pool_name  + "\">删除</a>";

				}
				
				str += "</td>";
				str += "</tr>";
			}
			
		$(".selectTable").html(str);
		
		$(".edit").click(function(){
			var talent_pool_id = $(this).attr("talent_pool_id");
			/* alert(emp_id);  */
			location.href="talentReserve_edit?talent_pool_id=" + talent_pool_id; 
			
		});
		
		 $(".delete").click(function(){
			$(".deleteStyle").css("display","block");
			var talent_pool_id = $(this).attr("talent_pool_id");
		
			 /*删除确定*/
			 $(".bottomStyle1").click(function(){
				$(".deleteStyle").css("display","none");
				/* location.href="talentReserve_delete?talent_pool_id=" + talent_pool_id; */
				$.ajax({
					url:"talentReserve_delete",
					data:{
						talent_pool_id:talent_pool_id
					},
					success:function flag(data){
						var index = $("#index").val();
						
	  					if(oaRlzybTalentPools.length % 10 == 0 && oaRlzybTalentPools.length != 0){
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
			var talent_pool_id = $(this).attr("talent_pool_id");
			/* alert(emp_id);  */
			location.href="talentReserve_show?talent_pool_id=" + talent_pool_id; 
			
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
	 });
$(function(){
	$("#depart_id").change(function(){
		showPositionName();
	});
	
	function showPositionName(){
		var depart_id = $("#depart_id").val();
		$.ajax({
			url:"showPositionName",
			dataType:"json",
			data:{
				depart_id:depart_id
			},
			success:showPosition
		});
	}
	
	function showPosition(data){
		$("#position_id").html("");
		
		var str = "";
		
		for(var i = 0;i < data.length; i++){
			str += "<option value=\"" + data[i].position_id + "\">" + data[i].position_name + "</option>";
		}
		
		$("#position_id").html(str);
	}
	
	function show(){
		showPositionName();
	}
	
	show();
});

/* 点击添加跳转到添加页面 */
$(function(){

	$("#addInfo").click(function(){
		NewPage("talentReserve-add.html");
	});
	
	$("#qing").click(function(){
	  		$("#depart_id").val("");
	  		$("#position_id").html("");
	  	});
	
	
});
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
     <form method="post" action="talentReserve-sel.html">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;">
        <tr>
		  <td class='tdWidth'>应聘部门：</td> <td>
		  	<select name="depart_id"  class="textStyle" id="depart_id">
		  		<option value="0">--请选择--</option>
		  		<c:if test="${oaRlzybDepartments != null }">
		  			<c:forEach items="${oaRlzybDepartments }" var="oaRlzybDepartments">
		  				<option value="${oaRlzybDepartments.depart_id }">${oaRlzybDepartments.depart_name }</option>
		  			</c:forEach>
		  		</c:if>
		  	</select>
		  </td>
		  <td class='tdWidth'>应聘职位：</td> <td>
		  	<select id="position_id"  class="textStyle" name="position_id" style="min-width: 80px;">
		  		
		  	</select>
		  </td>
		  <td></td>
           <td><input type="button" value="搜索" class="searchBotton"  id="chaxun" /><input id="addInfo"  type="button" value="添加 "  class="searchBotton">
           <input type="button" value="清空搜索条件" class="searchBotton"  style='width:120px' id="qing"/>
           <span id="countId"></span>
           </td>
        </tr>
	</table>
	<input type="hidden" name="pageIndex" id="index" value="1" />
    </div>
</form>
    <h1 class="tabTitle">人才储备信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="1" class="selectTable">
        
    				
			
		      </table>
		      <br/>
    		<div class="pageList" id="page" >
				
			</div> 



        <script src="statics/common/js/rollpage.js"></script>
			
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
