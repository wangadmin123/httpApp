<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>选项卡模板</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/student.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/public.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/tab.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/popup.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/jzb.js/tabaa.js"></script>
<link rel="stylesheet" href="statics/teach_nature_department/jzb.css/xytable.css" type="text/css"></link>
<script type="text/javascript">

function stuPrint(oper){
	if (oper < 10){ 
		bdhtml=window.document.body.innerHTML;//获取当前页的html代码 
		sprnstr="<!--startprint"+oper+"-->";//设置打印开始区域 
		eprnstr="<!--endprint"+oper+"-->";//设置打印结束区域 
		prnhtml=bdhtml.substring(bdhtml.indexOf(sprnstr)+18); //从开始代码向后取html 
		
		prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));//从结束代码向前取html 
		window.document.body.innerHTML=prnhtml; 
		window.print(); 
		window.document.body.innerHTML=bdhtml; 
	
	}
	 else{ 
	window.print(); 
	} 
}
</script>
</head>
<body>
<input type="hidden" value="${index}" id="getIndex"/>
<div class="rightContent">
  <div class="tabs">
      <span class="spanHover">学员详细信息</span>
      <span class="spanOut">学生访谈</span>
      <span class="spanOut">家长访谈</span>
      <span class="spanOut">奖惩信息</span>
  </div>
  <div class="tabContent">
  	<div class="divTable">
		    <div class="showPatrolDiv1">
  	<div>
	<!-- <input type="button" onclick="stuPrint(1)"  value="打印档案"/> -->
	</div><br/><br/>
  	<table width="1000" style="table-layout：fixed;" border="1"  cellpadding="0" cellspacing="0"  class="studentStyle">
    <!--合并五行的--> 
    
    <tr>
      <td width="150">姓名</td>
      <td  width="180">${studentInfo.stu_name }</td>
      <td width="200" >姓名拼音</td>
      <td  width="200">${studentInfo.spellName }</td>
      <td rowspan="5"  width="200"><img src="http://localhost:8080/tyyh/statics${studentInfo.photograph } " height="250" width="180"/></td>
    </tr>
     
    <tr>
      <td>性别</td>
      <td>${studentInfo.stu_sex }</td>
      <td >出生日期</td>
      <td>${studentInfo.birthday }</td>
    </tr>
    <tr>
      <td>班级:</td>
      <td>${studentInfo.grade_name }</td>
      <td>身份证号</td>
      <td>${studentInfo.ID_number }</td>      
    </tr>
    <tr>
      <td >学历</td>
      <td>${studentInfo.education_name }</td>
      <td >专业</td>
      <td>${studentInfo.specialty }</td>
    </tr>
    <tr>
      <td >现住址</td>
      <td colspan="3">${studentInfo.present_address }</td>
    </tr>
    <!--合并俩列的-->
    <tr>
      <td >邮政编码</td>
      <td>${studentInfo.postalcode } </td>
      <td >信息来源</td>
      <td colspan="2">${studentInfo.infoSource }</td>
    </tr>
    <tr>
      <td>通讯地址</td>
      <td colspan="4">${studentInfo.address }</td>
    </tr>
   
    <tr>
                <td rowspan="3" >联<br/>系<br/>方<br/>式</td>
                <td >手机号码</td>
                <td colspan="3">${studentInfo.contact_way }</td> 
    </tr>
     <tr>
                <td>电子邮件</td>
                <td colspan="3">${studentInfo.e_mail }</td>
     
     </tr>
     <tr>
                 <td >微信号</td>
                 <td colspan="3">${studentInfo.wechat }</td>
    </tr>
    <tr>
      <td>兴趣爱好</td>
      <td colspan="2">${studentInfo.hobbys } </td>
      <td >学习/工作状态：</td>
      <td colspan="2">
       	${studentInfo.stu_status }
      </td>
    </tr>
    <tr>
     	 <td rowspan="3">家庭状况</td>
     	 <td>家长姓名</td>
     	 <td>${studentInfo.memberName }</td> 
     	 <td>工作单位</td>
     	 <td>${studentInfo.work_unit }</td>     	 	 
    </tr>
    <tr>
     <td>关系</td>
     	 <td>${studentInfo.member_ship }</td> 
     	  <td>联系方式</td>
     	 <td>${studentInfo.memberContact_way }</td> 
    </tr>
    <tr>
     <td rowspan="1">备注</td>
     	 <td colspan="3">${studentInfo.member_remarks }</td>
    </tr>
    <tr>
      <td rowspan="8" >学习工作简历</td>
      <td>高中/中专</td>
      <td>${studentInfo.high_school }</td>
      <td >大专</td>
      <td>${studentInfo.secondary_school }</td>
    </tr>
    <tr>
      <td>本科</td>
      <td>${studentInfo.undergraduate_school }</td>
      <td >持有证书</td>
      <td>${studentInfo.credentials }</td>
    </tr>
    <tr>
      <td >工作经历</td>
      <td colspan="3">${studentInfo.work_experience }</td>
    </tr>
    <tr>
      <td>学习经历</td>
      <td colspan="3">${studentInfo.learning_experience }</td>
    </tr>
    <tr>
      <td>培训经历</td>
      <td colspan="3">${studentInfo.training_experience }</td>
    </tr>
    <tr>
    <td>意向就业城市及就业岗位</td>
      <td colspan="3">${studentInfo.intentional_City }</td>
      
    </tr>      
    <tr>           
    <td>其他说明</td>
      <td colspan="3">${studentInfo.other_help }</td>
    </tr>  
    <tr>
    <td>建档日期</td>
      <td colspan="3"><fmt:formatDate value="${studentInfo.entry_date }" pattern="yyyy-MM-dd"/></td>
    </tr>
  </table>
  </div>
  </div>
    </div>
 	</div>
<!--学生访谈 -->
<div class="divTable" style="display:none;">
	    <div class="talk_max">
	    <a href="${pageContext.request.contextPath }/addInterview?grade_id=${studentInfo.grade_id }" class="addPatrol_P" id="addPatrol">添加</a>
	    	<c:forEach var="stuInterview" items="${stuInterviewlist }">
		    <div class="showPatrolDiv">
		   	 	<ul>
		   	 		<li>班主任：${stuInterview.emp_name }</li>
		   	 		<li>教员:${stuInterview.teacherScene }</li>
		   	 		<li>学期:${stuInterview.stage }</li>
		   	 		<li>笔试:${stuInterview.writerTest }</li>
		   	 		<li>机试:${stuInterview.engineTest }</li>
		   	 		<li>访谈类型:<span class="span">${stuInterview.interviewType }</span></li>
		   	 		<li>访谈时间:<fmt:formatDate value="${stuInterview.interviewTime }" pattern="yyyy-MM-dd"/></li>
	   	 			<li>录入时间:<fmt:formatDate value="${stuInterview.enteringTime }" pattern="yyyy-MM-dd"/>
	   	 			</li>
		   	 	</ul>
	   	 		<div class="showPatrolDiv2">
	   	 			访谈结果:${stuInterview.interviewContent }
	   	 			<c:choose>
			         <c:when test="${stuInterview.flas==false }">
			      <div class="delAndUpdateCss">
		   	 			<a href="${pageContext.request.contextPath }/deleteStuInterview?id=${stuInterview.id }" class="deletePatrol_P">删除</a>
		   	 			<a href="${pageContext.request.contextPath }/editStuInterview?id=${stuInterview.id }" class="updatePatrol_P">修改</a>
	   	 			</div>
			         </c:when>
			         <c:otherwise>已超48小时</c:otherwise>	         
			         </c:choose>
		   	 		
   	 			</div>
   	 		</div>
	    	</c:forEach>
	 </div>
</div>
<!--家长访谈  -->
<div class="divTable" style="display:none;">
<div class="talk_max">
		 <div class="showyige">
  		 <a href="${pageContext.request.contextPath }/addJZFT" class="addPatrol_P">添加</a>
  		 </div>
		<c:forEach items="${oaJzbPatriarchInterviews }" var="oaJzbPatriarchInterviews">
	    <div class="showPatrolDiv">
	   	 	<ul>
	   	 		<li>访谈人:${oaJzbPatriarchInterviews.emp_name }</li>
	   	 		<li>学期:${oaJzbPatriarchInterviews.stage }</li>
	   	 		<li>访谈对象：${oaJzbPatriarchInterviews.interview_name }</li>
	   	 		<li>访谈方式:<span class="span">${oaJzbPatriarchInterviews.interview }</span></li>
	   	 		<li>访谈时间:<fmt:formatDate value="${oaJzbPatriarchInterviews.interview_time }" pattern="yyyy-MM-dd"/></li>
	   	 		<li>录入时间:<fmt:formatDate value="${oaJzbPatriarchInterviews.entering_time }" pattern="yyyy-MM-dd"/></li>
	   	 	</ul>
   	 		<div class="showPatrolDiv2">
	   	 		访谈内容:${oaJzbPatriarchInterviews.interview_content }
	   	 		<c:choose>
			         <c:when test="${oaJzbPatriarchInterviews.flas==false }">
			     <div class="showPatrolDiv3">
	   	 		<a href="${pageContext.request.contextPath }/deleteJZFT?id=${oaJzbPatriarchInterviews.id}&entering_time=${oaJzbPatriarchInterviews.entering_time }" class="deletePatrol_P">删除</a>
	   	 		<a href="${pageContext.request.contextPath }/updateJZFT?id=${oaJzbPatriarchInterviews.id}" class="updatePatrol_P">修改</a>
   	 			</div>
			         </c:when>
			         <c:otherwise>已超48小时</c:otherwise>	         
			         </c:choose>
  	 		</div>
  		 </div>   
		</c:forEach> 
	</div>   	 	
</div>
<!-- 奖罚信息 -->
<div class="divTable" style="display:none;">
  	<div class="talk_max">
  	
		<div align="left"><a href="${pageContext.request.contextPath }/OaJzbPunish/selectClassTeacherList" class="addPatrol">添加</a></div>
  		<div class="showPatrolDiv">
	  	 	 <c:forEach items="${oaJzbPunishList }" var="oaJzbPunish">
				<ul>
					<li>
						<span>奖惩人：${oaJzbPunish.stuName }</span>
					</li>
					<li>
						<span>奖惩原因：${oaJzbPunish.punish_cause}</span>
					</li>
					<li>
						<span>奖惩时间：<fmt:formatDate value="${oaJzbPunish.punish_time }" pattern="yyyy-MM-dd"/></span>
					</li>
					<li>
						<span>录入时间：<fmt:formatDate value="${oaJzbPunish.entering_time }" pattern="yyyy-MM-dd"/></span>
					</li>
					<li>
						<span>奖惩方式：${oaJzbPunish.punish_way}</span>
					</li>
					<li>
						<span>实施人：${oaJzbPunish.empName}</span>
					</li>
					<li>
						<span>备注：${oaJzbPunish.remarks}</span>
					</li>
				</ul>
	 	 	<div class="showPatrolDiv2" style="width: 100%">
	  	 		
	  	 		<c:choose>
			         <c:when test="${oaJzbPunish.flas==false }">
			    <div class="showPatrolDiv3">
	  	 		<a href="${pageContext.request.contextPath }/OaJzbPunish/deleteOaJzbPunish/${oaJzbPunish.id}" class="deletePatrol">删除</a>
	  	 		<a href="${pageContext.request.contextPath }/OaJzbPunish/showOaJzbPunish/${oaJzbPunish.id}" class="updatePatrol">修改</a>
	  	 		  		
	 	 		</div>
			         </c:when>
			         <c:otherwise>已超48小时</c:otherwise>	         
			         </c:choose>
	  	 		
	 	 		
		 	</div>
		 	</c:forEach>
	 	</div>
	</div>
</div>
<!--保存-->
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
<!--结束-->
<div class="mbStyle">&nbsp;</div>


</body>
</html>
