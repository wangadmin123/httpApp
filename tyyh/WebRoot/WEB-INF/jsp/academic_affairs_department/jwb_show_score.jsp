
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
   <title>成绩统计表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/popup.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/add.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/tab.js"></script>

<script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/DatePicker.js"></script>
    <script src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/SimpleCanleder.js"></script>
    <link href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/SimpleCanleder.css" rel="stylesheet">
<script type="text/javascript">
/*确定保存弹出框的位置*/
$(function(){
    xlk();
    xlkk();
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
		alert('你点击了确定');
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
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
/*绑定下拉框*/
function xlk(){
  $.ajax({
   url:"oajzb/gradeId",
   type:"post",
   datatype:"json",
   success:function(result){
     $(result).each(function(){
      $("#sel").append("<option value="+this.name+">"+this.name+"</option>");
     });  
   },error:function(){
   alert("报错!");
   }
  });
}
/*绑定下拉框*/
function xlkk(){
  $.ajax({
   url:"oajzb/gradeId",
   type:"post",
   datatype:"json",
   success:function(result){
     $(result).each(function(){
      $("#sele").append("<option value="+this.name+">"+this.name+"</option>");
     });  
   },error:function(){
   alert("报错!");
   }
  });
}

/*表格全选结束*/

</script>
</head>
<body>
<input type="hidden" value="${index}" id="getIndex"/>
<div class="rightContent">
  <div class="tabs">
      <span class="spanHover">学生成绩统计</span>
 
      <span class="spanOut" id="spanLast">班级成绩统计</span>
  </div>
  <div class="tabContent">
    <h1 class="tabTitle">学生成绩统计</h1>
  
     <div class="divTable" >
       <div class="serach">
       <form action="jwb/showScore.html">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
      <td>班级：</td> <td>
       <select name="grade" id="sel">
       
       </select>
      </td>
         <td><label for="search_begindate">月考月份：</label></td>
          <td><input type="text" name="selectDate" value="${selectDate }" id="search_begindate" style="width: 160px; height: 27px; " /></td>
           <td><input type="submit"  value="搜索" class="searchBotton" /></td>
        </tr>
        <script type="text/javascript">
        $(function (){
            $("#search_begindate").simpleCanleder();
            var listScore=new Array();
            var score=$(".score");
            for (var i = 0; i < score.size(); i++) {
 				listScore[i] = score.text();//将获取的价格 添加的价格数组里面
 				alert(score[i].val());
			}
			
           /*  for ( var int = 0; int < listScore.length; int++) {
				alert(listScore[i]);
			} */
        });     
</script>     
       </table>
       </form>
    </div>
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">

         <tr>

                    <th>班级</th>
                    <th>班主任</th>
                    <th>教员</th>
                    <th>学生姓名</th>
                    <th>出勤率</th>
                    <th>上机完成率</th>
                    <th>作业完成率</th>
                    <th>笔试成绩</th>
                    <th>机试成绩</th>
                    
                    <th>综合</th>
                    <th>排名</th>
                   
                </tr>
           <c:if test="${ObJwblist !=null }">
           
          <c:forEach var="Grade" items="${ObJwblist }" varStatus="status">
         <tr>
          <td class="GradeName">${Grade.name }</td>
          <td>${Grade.classTeacher }</td>
          <td>${Grade.teacher }</td>
          <td>${Grade.stuName }</td>
          
 <td><fmt:formatNumber type="number" 
          		value="${Grade.classHourPT*100 }" maxFractionDigits="2"/>%</td>
          
           <td><fmt:formatNumber type="number" 
          		value="${Grade.obuPT*100 }" maxFractionDigits="2"/>%</td>
           <td pattern="#.00" class="manami" id="manami">
          	<c:if test="${Grade.manamiPT==null }">
          		0
          	</c:if>
          	<c:if test="${Grade.manamiPT!=null }">
          		<fmt:formatNumber type="number" 
          		value="${Grade.manamiPT*100 }" maxFractionDigits="2"/>%
          	</c:if>
          </td>           
          <td>${Grade.written }</td>
          <td>${Grade.scjd }</td>
           <td class="score">
           <fmt:formatNumber type="number"
          		value="${Grade.classHourPT*25+Grade.obuPT*25+Grade.manamiPT*20+Grade.written*0.15+Grade.scjd*0.15 }" maxFractionDigits="2"/>%
          		</td>
            <td>${status.count }</td>
        </tr>
        </c:forEach>
        </c:if>
    </table>
    <!-- <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
        <div class="btposition2"> -->
           
      </div>
    </div>
    </div>
	
	
    <div class="rightContent">
    <div class="divTable" style="display:none;">
    <div class="serach">
       <form action="jwb/showScore.html" style="width: 1307px; ">
        <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
      <td>班级：</td> <td>
       <select name="grade" id="sele">
       
       </select>
      </td>
             <td><input type="submit"  value="搜索" class="searchBotton" /></td>
        </tr></table>
       </form>
    </div>
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
       <tr>

        <th>班级</th>
        <th>班主任</th>
        <th>教员</th>
        <th>出勤率</th>
        <th>上机完成率</th>
        <th>作业完成率</th>
       
        <th>月考及格率</th>

        
    </tr>
    <c:forEach var="Grade" items="${ObJwblistG }" varStatus="status">
         <tr>
          <td class="GradeName">${Grade.name }</td>
          <td>${Grade.classTeacher }</td>
          <td>${Grade.teacher }</td>
          
 <td><fmt:formatNumber type="number" 
          		value="${Grade.classHourPT*100 }" maxFractionDigits="2"/>%</td>
          
           <td><fmt:formatNumber type="number" 
          		value="${Grade.obuPT*100 }" maxFractionDigits="2"/>%</td>
           <td pattern="#.00" class="manami" id="manami">
          	<c:if test="${Grade.manamiPT==null }">
          		0
          	</c:if>
          	<c:if test="${Grade.manamiPT!=null }">
          		<fmt:formatNumber type="number" 
          		value="${Grade.manamiPT*100 }" maxFractionDigits="2"/>%
          	</c:if>
          </td>           
          <td><fmt:formatNumber type="number" 
          		value="${Grade.homeworkPT }" maxFractionDigits="2"/>%</td>
        </tr>
        </c:forEach>
</table>
      </table>
	  <!-- <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
        <div class="btposition2"> -->
	       
	  </div>
    </div>
    </div>
    
</div>

<!--保存-->
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
<!--结束-->

<!--删除开始-->
<div class="mbStyle">&nbsp;</div>
<div class="deleteStyle">
	<h3>操作提示</h3>
	<h2>确定要删除吗？</h2>
	<div class="btn">
	   <div class="bottomStyle1">确定</div>
	   <div class="bottomStyle2">取消</div>
	</div>
</div>
<!--删除结束-->
  </body>
</html>
