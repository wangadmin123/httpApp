<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<input type="hidden" id="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>班级数据列表</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/gradeshowlist.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/insert.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/all.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/laydate/laydate.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/gradeShowList.js"></script>
<script type="text/javascript">
$(function(){
	/*点击删除*/
      $(".deleteBotton").click(function(){
          var mbHeight= $(document).height();
          var mbWidth=$(window).width();
          var delHeight=$(window).height();
          $(".mbStyle").css("height",mbHeight);
          $(".mbStyle").css("display","block");
          $(".deleteStyle").css("left",mbWidth/2-150);
          $(".deleteStyle").css("top",delHeight/2-92);
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
          alert('你点击了取消');
      });


 /*点击展开搜索面板*/
    $(".searchShow").click(function(){
      $(".searchContent").slideDown(300);
      $(".searchShow").hide();
    });
/*点击搜索关闭面板*/
   $(".searchBotton").click(function(){
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
				$("#all").attr("checked",true);
			}else{
				$("#all").attr("checked",false);
			}
		}
        ifAllChecked();//页面加载完后运行
    //添加班级按钮
    $("#search").click(function(){
    location.href="addgrade.jsp";
    });
});
/*表格全选结束*/

</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">班级信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable" style="text-align:center;">
          <tr>
          <th>班级名称</th>
          <th>专业</th>
          <th>状态</th>
          <th>班主任</th>
          <th>教员</th>
          <th>就业老师</th>
          <th>阶段</th>
          <th>机房</th>
          <th>开班时间</th>
          <th width="30%">操作</th>
        </tr>
        <c:forEach items="${OaJwbGrades }" var="oaJwbGrades" varStatus="status">
        	 <tr>
	          <td>${oaJwbGrades.name }</td>
	          <td>${oaJwbGrades.specialtyname }</td>
	          <td>${oaJwbGrades.strutsName }</td>
	          <td>${oaJwbGrades.classTeacher }</td>
	          <td>${oaJwbGrades.teacher }</td>
	          <td>${oaJwbGrades.careerteacher }</td>  
			  <td>${oaJwbGrades.stagename }</td>
			  <td>${oaJwbGrades.motor }</td>
			  <td>
			 <c:choose>
			  	<c:when test="${oaJwbGrades.createTime !=null}">
			  	<fmt:formatDate value="${oaJwbGrades.createTime }" pattern="yyyy-MM-dd"/>
			  	</c:when>
			  	<c:otherwise>
			  	待定
			  	</c:otherwise>
			  </c:choose>		  
			  </td>
	          <td>             
	             <%--  <a href="${pageContext.request.contextPath }/gradeShowListLink/${oaJwbGrades.id}" gradeid=${oaJwbGrades.id } class="link" >查看</a>
	              <a href="${pageContext.request.contextPath }/joinxbjl/${oaJwbGrades.id}" gradeid=${oaJwbGrades.id } class="link" >查看巡班记录</a> --%>
	             <c:if test="${loginUser.position_name eq '班主任' or loginUser.position_name eq '教质部主管'or loginUser.position_name eq '学术教质经理'}">
	              	<a href="${pageContext.request.contextPath }/getStudentsByGriade_ID?gradeid=${oaJwbGrades.id }&stageId=${oaJwbGrades.stageId }" class="link">答辩</a>
	              	<%-- <a href="gradeName?gradeid=${oaJwbGrades.id }" gradeid=${oaJwbGrades.id } class="link" style="width:90px;" >添加班级数据</a> --%>
	             </c:if>
	             <c:if test="${loginUser.position_name ne '校长'}">
	              <a href="${pageContext.request.contextPath }/addClassPlan?gradeid=${oaJwbGrades.id}" class="link" style="width:65px">带班计划</a>
	              <a href="${pageContext.request.contextPath }/adddbjhSumView?gradeid=${oaJwbGrades.id}" class="link" style="width:65px">带班总结</a>
	          	</c:if>
	          	<c:if test="${loginUser.position_name eq '校长'}">
	          	<a href="${pageContext.request.contextPath }/gradeShowListLink/${oaJwbGrades.id}" gradeid=${oaJwbGrades.id } class="link" >查看</a>
	          		<a href="${pageContext.request.contextPath }/joinxbjl/${oaJwbGrades.id}" gradeid=${oaJwbGrades.id } class="link" style="width:90px;" >查看巡班记录</a>
	          		<span style="font-size:8px;color:#666;">（当前用户只支持查看）</span>
	          	</c:if>
	          </td>
       		</tr>
        </c:forEach>       
      </table>
    <div>
  </div>
</div>
<div class="mbStyle">&nbsp;</div>
</body>
</html>