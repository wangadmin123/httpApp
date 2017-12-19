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
<title>查询奖惩信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
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
		location.href="Randp_add.html";
	});
});




function showDate(index){
	  	//获得搜索条件
		var emp_name = $("#emp_name").val();
		var rewards_type = $("#rewards_type").val();
	  	$.ajax({
			type:"POST",
			url:"Randp_search",
			dataType:"json",
			data:{
				emp_name:emp_name,
				rewards_type:rewards_type,
				pageIndex:index
			},
			success:showList
		});
	 }

	 function showList(data){
		var datas = eval("("+data+")");
	  	var pageCount = datas.totalPageCount;
	  	
	  	var index= datas.currentPageNo;
	  	var count = datas.totalCount;
	  		  	
	  	var oaRlzybRewards = datas.oaRlzybRewards;
	  	
	  	showStuList(oaRlzybRewards);
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
	
	function showStuList(oaRlzybRewards){
	
	  	$(".selectTable").html("");
		
		var str = "<tr>";
			str += "<th>编号</th>";
			str += "<th>姓名</th>";
			str += "<th>岗位</th>";
			str += "<th>部门</th>";
			str += "<th>奖惩类型</th>";
			str += "<th>奖惩原因</th>";
			str += "<th>奖惩时间</th>";
			str += "<th>操作</th>";
			str += "</tr>";
			
			for(var i = 0;i < oaRlzybRewards.length ; i++){
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
				str += "<td>" + oaRlzybRewards[i].emp_name + "</td>";
				str += "<td>" + oaRlzybRewards[i].position_name + "</td>";
				str += "<td>" + oaRlzybRewards[i].depart_name + "</td>";
				str += "<td>" + oaRlzybRewards[i].rewards_type + "</td>";
				str += "<td>" + oaRlzybRewards[i].rewards_reason + "</td>";
				str += "<td>" + oaRlzybRewards[i].rewards_date + "</td>";
				str += "<td>";
				/* str += "<a href=\"javascript:;\" class=\"edit\" rewards_id=\"" + oaRlzybRewards[i].rewards_id + "\">编辑</a>"; */
				str += "<a href=\"javascript:;\" class=\"link\" rewards_id=\"" + oaRlzybRewards[i].rewards_id + "\">查看</a>";
				
				var date1 = new Date(oaRlzybRewards[i].create_time);
				var date3 = new Date();
				if(date3.getTime()-date1.getTime()<=172800000){
					str += "<a href=\"javascript:;\" class=\"delete\" rewards_id=\"" + oaRlzybRewards[i].rewards_id  + "\">删除</a>";
				}
				
				str += "</td>";
				str += "</tr>";
			}
			
		$(".selectTable").html(str);
		
		 $(".delete").click(function(){
			$(".deleteStyle").css("display","block");
			var rewards_id = $(this).attr("rewards_id");
		
			 
			 $(".bottomStyle1").click(function(){
				$(".deleteStyle").css("display","none");
				$.ajax({
					url:"Randp_delete",
					data:{
						rewards_id:rewards_id
					},
					success:function(data){
						var index = $("#index").val();
						
	  					if(oaRlzybRewards.length % 10 == 0 && oaRlzybRewards.length != 0){
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
			var rewards_id = $(this).attr("rewards_id");
			location.href="rewards_show?rewards_id=" + rewards_id; 
			
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
	  		$("#rewards_type").val("");
	  	});
	 });

</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
     <form method="post" action="">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;">
        <tr>
		  <td class='tdWidth'>姓名：&nbsp;<input type="search" id="emp_name" name="emp_name" class="searchStyle" style="width:160px;"/>
		  &nbsp;&nbsp;&nbsp;奖惩类型：&nbsp;<select class="selectStyle" id="rewards_type" name="rewards_type" style="width:120px;" >
          		  <option value=""> 全部 </option>
                  <option value="奖励"> 奖励 </option>
                  <option value="处分"> 处分 </option>
              </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input type="button" id="chaxun" value="搜索" class="searchBotton" />
              <input type="button" value="清空搜索条件" class="searchBotton" style='width:120px'  id="qing"/>
              <span id="countId"></span>
		  </td>
        </tr>
       </table>
	   <input type="hidden" name="pageIndex" id="index" value="1"/>
    </div>
</form>
    <h1 class="tabTitle">奖惩信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="1" class="selectTable">
        

      </table>
	    <br/>
	  <div class="pageList" id="page">
				
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
