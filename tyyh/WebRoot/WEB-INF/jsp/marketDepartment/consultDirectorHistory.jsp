<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"><head>
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
		alert('你点击了确定');
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
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
				$("#all").attr("checked",true);
			}else{
				$("#all").attr("checked",false);
			}
		}
        ifAllChecked();//页面加载完后运行
	
});
/*表格全选结束*/


$(function(){
            /*点击显示弹出框*/
            $(".pooupBotton").click(function(){
            
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
       
</script>
 <script type="text/javascript">
    	function show(index){
			var pageSize = $("#pageSize").val();
			var temp = $("#form").serialize()+"&index="+index+"&pageSize="+pageSize;
			$.post("director/historyquery",temp,showInfoList,"json");
		}
		
		function showInfoList(data){
			var hislist = data.hisList;
			var index = data.index;
			var pageCount = data.pageCount;
			var totalCount = data.totalCount;
			showInfo(hislist,index);
			showPage(index,pageCount,totalCount);
		}
		
		
    		function showInfo(data,index){
    			$("#consulters").empty();
    			
    			if(data.length==0){
    				$("#consulters").html("空");
    			}else{
    				for ( var i = 0; i < data.length; i++) {
						var sex = data[i].sex==1?"男":"女";
						var consultTeacherName = data[i].consultTeacherName==null || data[i].consultTeacherName ==""?"暂无":data[i].consultTeacherName;
						var consultwayName = data[i].consultwayName ==null || data[i].consultwayName ==""?"未知":data[i].consultwayName;
						var rankName = data[i].rankName ==null || data[i].rankName ==""?"未知":data[i].rankName;
						var wechat = data[i].wechat == null || data[i].wechat =="" ?"未知":data[i].wechat;
						var consultLessonName =data[i].consultLessonName ==null || data[i].consultLessonName==""?"未知":data[i].consultLessonName;
						var educationName = data[i].educationName == null || data[i].educationName =="" ?"未知":data[i].educationName;
						var specialty = data[i].specialty ==null || data[i].specialty =="" ?"未知":data[i].specialty;
						var statusName = data[i].statusName ==null || data[i].statusName ==""?"未知":data[i].statusName;
						var infoSource = data[i].infoSource == null || data[i].infoSource ==""?"未知":data[i].infoSource;
						var keywords = data[i].keywords == null || data[i].keywords =="" ?"未知":data[i].keywords;
						var city = data[i].city == null || data[i].city ==""?"未知":data[i].city;
						var district = data[i].district ==null || data[i].district ==""?"未知":data[i].district;
						$("#consulters").append("<tr>"
						+"<td>"+data[i].id+"</td><td>"+consultTeacherName+"</td><td>"+consultwayName+"</td>"
						
						+"<td>"+consultLessonName+"</td><td>"+rankName+"</td><td>"+data[i].name+"</td><td>"+sex+"</td><td>"+data[i].age+"</td>"
						+"<td>"+data[i].telphone1+"</td><td>"+wechat+"</td><td>"+city+"</td><td>"+district+"</td><td>"+educationName+"</td>"
						+"<td>"+specialty+"</td><td>"+statusName+"</td><td>"+infoSource+"</td><td>"+keywords+"</td>"
						+"</tr>");
					}
					
    			}        					
    		}
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
						$("#page").append("<span><a href=' javascript:onchange=show("+(parseInt(index)+1)+")'>下一页</a></span>");
					}
				}
				
				$("#page").append("<a href=' javascript:onclick=show("+pageCount+")'>末页</a>");
				$("#page").append("<span>共"+pageCount+"页</span>");
				
			} 
    		
    		
    	$(function(){
			show(1);
			
			$("#btn").click(function(){
			
				show(1);
			
			});
		
		
		}); 
		
/* 显示分发咨询量 */
function showHandout(){
	window.location.href="director/consultDirectorHandout";
}

/* 显示查询咨询量 */
function showQuery(){
	window.location.href="director/consultDirectorQuery";
}

function showCheck(){
	window.location.href="director/consultDirectorCheck";
}

function showuseless() {
	window.location.href="director/consultDirectorUseless";
}
		function showChongfu(){
   window.location.href="director/consultDirectorChongfu";
}
function showChongfu(){
   window.location.href="director/consultDirectorChongfu";
}
    </script>
</head>
<body>
<div class="rightContent">
	<div class="tabs" id="tabs"  >
      <span class="spanOut" onclick="showQuery()">查询咨询量</span>
      <span class="spanOut"  onclick="showCheck()">审核无效量</span>
      <span class="spanOut"  onclick="showHandout()" >分发咨询量</span>
      <span class="spanOut" onclick="showuseless()">查看无效量</span>
      <span class="spanHover" id="spanLast">查看历史量</span>
      <span class="spanOut"  onclick="showChongfu()">疑似重复量</span>
      
  	</div>
	

  <div class="tabContent">
  <h1 class="tabTitle">查看历史量</h1>
   

    <h3 class="tabTitle">基本信息</h3>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <thead>
        	<tr>
		  
          		<th>序号</th>
				<th>咨询师姓名</th>
				<th>咨询方式</th>
				<th>咨询课程</th>
				<th>咨询量等级</th>
				<th>咨询者姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>联系方式</th>
				<th>QQ/微信</th>
				<th>城市</th>
				<th>区域</th>
				<th>学历</th>
				<th>专业</th>
				<th>状态</th>
				<th>信息来源</th>
				<th>关键词</th>
        </tr>
	</thead>
	<tbody id="consulters">
	
	
     </tbody>
      </table>
      <span style="float:right;"><input type="number"  min="1" max="100" name="pageSize" onchange="show(1)" style="width:80px;" id="pageSize"/>条/每页&nbsp;&nbsp;&nbsp;</span>
	  <div id="page"></div>
  		
    </div>
	
  </div>
</div>

<div class="mbStyle">&nbsp;</div>

</body>
</html>