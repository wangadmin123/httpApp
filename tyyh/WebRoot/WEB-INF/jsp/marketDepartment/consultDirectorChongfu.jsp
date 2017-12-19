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

<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<script type="text/javascript">
    	$(function(){
    	 var $page=$("#pp").val()==""?10:$("#pp").val();
		 $("#consulters").html("");
		$("#page").html("");
		$("#pp").html("");
    	  $.ajax({
    	  url:"director/chongfu",
    	  Type:"post",
    	  data:{"pagecount":1,"pagesize":$page},
    	  dataType:"json",
    	  success:function(data){
    	  
    	
    	    $(data.osa).each(function(){
             $("#consulters").append("<tr><td><a href='director/chong?name="+this.name+"'>"+this.name+"</a></td><td>"+this.number+"</td></tr>");  
    	    })
    	    console.log(data);
    	    var index=data.currentPageNo;
    	    
			var totalCount=data.totalCount;
		
			var pageCount=data.totalPageCount;
			var pageSize=data.pageSize;
			showPage(index,pageCount,totalCount,pageSize);
	
    	     }
    	  })
    	 
		}); 
		/* 分页 */
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
				
			} 
    				
		function show(obj){
		  var $page=$("#pp").val()==""?10:$("#pp").val();
		 $("#consulters").html("");
		 $("#page").html("");
		   $.ajax({
    	  url:"director/chongfu",
    	  Type:"post",
    	  data:{"pagecount":obj,"pagesize":$page},
    	  dataType:"json",
    	  success:function(data){
    	  var $data=$(data);
    	    $(data.osa).each(function(){
             $("#consulters").append("<tr><td><a href='director/chong?name="+this.name+"'>"+this.name+"</a></td><td>"+this.number+"</td></tr>");  
    	    })
    	    	 var index=data.currentPageIndex;
			var totalCount=data.totalCount;
		
			var pageCount=data.totalPageCount;
			var pageSize=data.pageSize;
			showPage(index,pageCount,totalCount,pageSize);
	
    	     }
    	  })
		}
		/*查询每页显示的条数*/
	   function showchongfu(){
		 var $page=$("#pp").val()==""?10:$("#pp").val();
		 $("#consulters").html("");
		$("#page").html("");
		$("#pp").html("");
		   $.ajax({
    	  url:"director/chongfu",
    	  Type:"post",
    	  data:{"pagecount":1,"pagesize":$page},
    	  dataType:"json",
    	  success:function(data){
    	  var $data=$(data);
    	    $(data.osa).each(function(){
             $("#consulters").append("<tr><td><a href='director/chong?name="+this.name+"'>"+this.name+"</a></td><td>"+this.number+"</td></tr>");  
    	    })	
    	   var index=data.currentPageIndex;
			var totalCount=data.totalCount;
		
			var pageCount=data.totalPageCount;
			var pageSize=data.pageSize;
			showPage(index,pageCount,totalCount,pageSize);
	

    	     }
    	  })
    	 
		}
/* 显示分发咨询量 */
function showHandout(){
	window.location.href="director/consultDirectorHandout";
}
function showHistory() {
	window.location.href="director/historyCon";
}

/* 显示查询咨询量 */
function showQuery(){
	window.location.href="director/consultDirectorQuery";
}

function showCheck(){
	window.location.href="director/consultDirectorCheck";
}

function showUseless() {
	window.location.href="director/consultDirectorUseless";
}
function showChongfu(){
   window.location.href="director/consultDirectorChongfu";
}	
    </script>
</head>
<body>
	<div class="rightContent">
		<div class="tabs" id="tabs">
			<span class="spanOut" onclick="showQuery()">查询咨询量</span> <span
				class="spanOut" onclick="showCheck()">审核无效量</span> <span
				class="spanOut" onclick="showHandout()">分发咨询量</span> <span
				class="spanOut" onclick="showUseless()">查看无效量</span> <span
				class="spanOut" onclick="showHistory()">查看历史量</span> <span
				class="spanHover" onclick="showChongfu()">疑似重复量</span>
		</div>


		<div class="tabContent">
			<h1 class="tabTitle">疑似重复量</h1>


			<h3 class="tabTitle">基本信息</h3>
			<div class="divTable">
				<table id="tbl" cellpadding="0" cellspacing="0" border="0"
					class="selectTable">
					<thead>
						<tr>
							<th>姓名</th>
							<th>重复数量</th>
						</tr>
					</thead>
					<tbody id="consulters">


					</tbody>
				</table>
				<span style="float:right;"><input type="number" min="1"
					max="100" id="pp" name="pageSize" onblur="showchongfu()"
					style="width:80px;" id="pageSize" />条/每页&nbsp;&nbsp;&nbsp;</span>
				<div id="page"></div>

			</div>

		</div>
	</div>

	<div class="mbStyle">&nbsp;</div>

</body>
</html>