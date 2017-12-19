<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>选项卡模板</title>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/jzb.css/insert.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/jzb.css/all.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/jzb.css/addpatrol.css"/>
<link rel="stylesheet" type="text/css" href="statics/employment_department/jzb.css/showpatrol.css"/>
<link rel="stylesheet" href="statics/employment_department/jzb.css/jquery-labelauty.css">
<script type="text/javascript" src="statics/employment_department/js/back.js"></script>
<script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
<script type="text/javascript" src="statics/employment_department/js/tab.js"></script>

<script type="text/javascript">
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
		location.href="welcome.html";
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
/*表格全选结束*/


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
            
           $(".BackBotton").click(function(){
		
		window.history.back();
	});
            
        });
</script>
</head>
<body>
<div class="rightContent">

<div class="tabContent">
    <h1 class="tabTitle">回访记录</h1>
</div>
  <!--  巡班记录 -->


									
			<c:if test="${oaJybVisit != null }">
			<c:forEach var="station" items="${oaJybVisit}">
			<c:if test="${station.visit_way != null || station.xianshishijian != null || station.visit_content != null }">
			<div class="showPatrolDiv">
            <ul>
             <li>姓名:${ station.studentname}</li>
             <li >回访方式:${ station.visit_way}</li>
             <li>回访时间:${ station.xianshishijian}</li>
            <%--  <li> 
                 <a href="employment_department/addhuifang?id=${station.visit_studentId }" class="addPatrol">添加</a></li> --%>
               
         </ul>
            <div class="showPatrolDiv3" style="float: right">

                
             </div>
 <div class="showPatrolDiv2">
&nbsp;&nbsp;回访记录:${ station.visit_content}
                 </div>
              
     </div></c:if>
			</c:forEach>
			</c:if>			
			
			
									

     <!-- <div class="showPatrolDiv">
         <ul>
             <li>姓名:张三</li>
             <li>回访方式:电话</li>
             <li>回访时间:2016/7/1 10:37:12 - 2016/7/1 11:00:12</li>
             <li>回访记录:最后去了北京</li>
         </ul>
          `   <div class="showPatrolDiv3" style="float: right">

                 <a href="xiugaihuifang.html" class="updatePatrol" >修改</a>
                 <a href="addhuifang.html" class="addPatrol">添加</a>
             </div>

              
     </div>




    <div class="showPatrolDiv">
        <ul>
            <li>姓名:张三</li>
            <li>回访方式:电话</li>
            <li>回访时间:2016/7/1 10:37:12 - 2016/7/1 11:00:12</li>
            <li>回访记录:最后去了北京</li>
        </ul>
        `   <div class="showPatrolDiv3" style="float: right">

        <a href="xiugaihuifang.html" class="updatePatrol" >修改</a>
        <a href="addhuifang.html" class="addPatrol">添加</a>
    </div>

      
    </div>



    <div class="showPatrolDiv">
        <ul>
            <li>姓名:张三</li>
            <li>回访方式:电话</li>
            <li>回访时间:2016/7/1 10:37:12 - 2016/7/1 11:00:12</li>
            <li>回访记录:最后去了北京</li>
        </ul>
        `   <div class="showPatrolDiv3" style="float: right">

        <a href="xiugaihuifang.html" class="updatePatrol" >修改</a>
        <a href="addhuifang.html" class="addPatrol">添加</a>
    </div>

       
    </div> -->

    <div class="btposition2">
	       <div><input type="button" class="BackBotton" value="返回"/></div>
	  </div>


</div>

  </body>
</html>
