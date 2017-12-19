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
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
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
<link rel="stylesheet" href="statics/teach_nature_department/jzb.css/xytable.css" type="text/css"></link>
 <link rel="stylesheet" type="text/css" href="statics/employment_department/jzb.css/JYBindex.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/jzb.css/JYBstudent.css">
 <style type="text/css">
    /* 
     .left_div{
     width: 400px;
     height: 140px;
    position:relative;
     left: -420px; 
     display: none; 
     
     }
     */
     div[class*=left_div]{
         width: 400px;
     height: 140px;
    position:relative;
     left: -420px; 
     display: none; 
     top:-120px;
     
     }
    .right_div{
    
     width: 400px;
     height: 140px;
    position:relative;
     right: -220px; 
     display:none;
     top:-120px;
    }
    
    </style>
<script type="text/javascript">
//学员来源
function showCome(){
	var name=$("#studentInfo_stu_name").text();
	$.ajax({
		type:"post",//请求类型
		url:"ConsultDirectorCome?name="+name,//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){
		if(data==null){
		$(".divCome").html("<span style='color: red; font-size: 14px;  margin-left:15px;'>该学员通过教质部直接报名！</span>");
		}else{
		var str=$("<table width='1000' style='table-layout：fixed;' border='1'  cellpadding='0' cellspacing='0'  class='studentStyle'></table>");
		if(data.firstConsultTime==null || data.firstConsultTime==""){
		str.append("<tr><td width='150'>首次咨询时间：</td><td width='150'>未填写</td></tr>");
		}else{
		str.append("<tr><td width='150'>首次咨询时间：</td><td width='150'>"+data.firstConsultTime+"</td></tr>");
		}
		if(data.consultTeacherName==null || data.consultTeacherName==""){
		str.append("<tr><td width='150'>咨询师姓名：</td><td width='150'>未填写</td></tr>");
		}else{
		str.append("<tr><td width='150'>咨询师姓名：</td><td width='150'>"+data.consultTeacherName
		+"</td></tr>");
		}
		str.append("<tr><td width='150'>咨询方式：</td><td width='150'>"+data.consultwayName
		+"</td></tr>");
		if(data.educationName==null || data.educationName==""){
		str.append("<tr><td width='150'>学历：</td><td width='150'>未填写</td></tr>");
		}else{
		str.append("<tr><td width='150'>学历：</td><td width='150'>"+data.educationName+"</td></tr>");
		}
		$(".divCome").html(str);
		}
		}
	});
	
}
//学员大记事
 $(function(){
   showinfo();
   
   });
   /*
   	加载学生就业信息，查看学生详情信息页面
   */
   function jobinfo(){
   	var query = "stuid="+$("#stuid").val();
   	$.ajax({
	    
		type:"post",//请求类型
		url:"employment_department/selectoneEmp?"+query,//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success: function(data){
			if(data!=null){
			var tab = $("<table width='1000'  border='1'  cellpadding='0' cellspacing='0'  class='studentStyle'></table>");
			tab.append( "<tr><td >入职时间</td><td colspan='3'>"+data.employment_time +"</td></tr><tr><td >入职城市</td><td colspan='3'>"+data.employment_city +"</td></tr><tr><td >就业单位</td><td colspan='3'>"+data.employment_unit +"</td></tr><tr><td >试用期薪资</td><td colspan='3'>"+data.employment_Salary_probation +"</td></tr><tr><td >转正薪资</td><td colspan='3'>"+data.employment_Salary_worker +"</td></tr><tr><td >就业岗位类型</td><td colspan='3'>"+data.employment_engaged_type +"</td></tr><tr><td >就业状态</td><td colspan='3'>"+data.employment_status +"</td></tr>");
  			   $(".aaa").html(tab);
			}else{
				$(".aaa").html("<span style='color: red; margin-left:15px; font-size: 14px;'>学员暂未毕业！</span>")
			}
		}
	});
   };
   function showinfo(){
   var query="stuid="+$("#stuid").val();
   
	   
	    /* $.post("employment_department/showlist1.html",query,show,"json");  */
	 
	   $.ajax({
	    
		type:"post",//请求类型
		url:"employment_department/showjishi?"+query,//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		
		success: show
	});
   }
   function show(data){
   if(data.newlist!=null){
   $("#lilili").empty();
    $("#lilili").html(data.gradename+"班学员"+data.stuname+"记事");
    $("#stu_line").empty();
   var lists = data.newlist;
   var lists1=data.newlist1;
   var i;
   var htmll="";
   var hong=0;
   var lv=0;
   for( i=0;i<lists.length;i++){
      for(var j=lists[i].length-1;j>=0;j--){
      var flag=true;
      if(lists[i][j].isNormal==1){flag=false;}
     if(!flag){
     hong++;
     htmll+="<div class='stu_left' style='height:80px'><label></label><div class='left_line'></div>";
     htmll+="<span>"+lists[i][j].event_name+"</span><span>"+lists[i][j].event_time+"</span>";
     htmll+="</div>";
     }
     else{ 
     lv++;
     htmll+="<div class='stu_right' style='height:80px'><label></label><div class='right_line'></div>";
     htmll+="<span style='text-align:left;'>"+lists[i][j].event_name+"</span><span>"+lists[i][j].event_time+"</span>";
     htmll+="</div>";
      }
      }
   } 
   $("#stu_line").html(htmll);
$("#dianCount").html("<label>差&nbsp;&nbsp;</label>&nbsp;&nbsp;<label class='hong'></label><label>&nbsp;&nbsp;"+hong+"个&nbsp;&nbsp;</label><label>优&nbsp;&nbsp;</label>&nbsp;&nbsp;<label class='lv'></label><label>&nbsp;&nbsp;"+lv+"个</label>");

  
   }else{
   $(".stu").css("width","1500px");
   $(".stu").html("");
   $(".stu").append("<div style='color: red; font-size: 14px; float:left; margin-left:15px;'>该学员尚未有大记事信息！</div>")
   }
     
   }
$(function(){

	/*点击删除*/
	 $(".deleteBuutton,.deletePatrol,.deletePatrol_P").click(function(){
		$(".deleteStyle").css("display","block");
	 }); 
	 /*确定删除*/
	 $(".bottomStyle1").click(function(){
		$(".deleteStyle").css("display","none");
		alert('你点击了确定');
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
	 });
	 /*
	 
	 */
	 $(".spanJob").click(function(){
	 	jobinfo();
	 	
	 });
	 
	 $(".spanCome").click(function(){
	 showCome();
	 });
});
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
      <span class="spanOut">学员大记事</span>
      <span class="spanJob spanOut">学员就业信息</span>
      <span class="spanCome spanOut">学员来源</span>
  </div>
  <div class="tabContent">
  	<div class="divTable">
		    <div class="showPatrolDiv1">
<!--   	<div>
	</div> -->
	<br/><br/>
  	<table width="1000" style="table-layout：fixed;" border="1"  cellpadding="0" cellspacing="0"  class="studentStyle">
    <!--合并五行的--> 
    <tr>
      <td width="150">姓名</td>
      <td  width="180" id="studentInfo_stu_name">${studentInfo.stu_name}</td>
      <td width="200" >姓名拼音</td>
      <td  width="200">${studentInfo.spellName }</td>
      <td rowspan="5"  width="200"><img src="http://localhost:8080/tyyh/statics/${studentInfo.photograph } " height="250" width="180"/></td>
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

<!-- 学员大记事 -->
<div class="divTable" style="display:none;">
<div class="stu">

             <h1 style="display:none" >T80班学员张三记事</h1>
           <p   style="font-size:36px; font-size: 16px; font-weight:bold;
    color: #5C5C5C;
    height: 100px;
    line-height: 100px;">
    ${studentInfo.stu_name}学员大记事</p>
             <input type="hidden" id="stuid" value="${stuid }" >
       
             <div id="dianCount"></div>
             <div class="stu_line" id="stu_line">
                 ${studentInfo.stu_Id }
                
             </div>
         </div>
 </div>

 <div class="divTable" style="display:none;">
	<div class="aaa">
             <input type="hidden" id="stuid" value="${stuid }" >
             <div class="stu_linea" id="stu_linea">
             </div>
         </div>
 </div>      
 </div> 
 
 <!-- 学员大记事 -->
<div class="divTable" style="display:none;">
	<div class="divCome"></div>
 </div>   
 
        
<!--保存-->
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
<!--结束-->
<div class="mbStyle">&nbsp;</div>
<div class="deleteStyle">
	<h3>操作提示</h3>
	<h2>确定要删除吗？</h2>
	<div class="btn">
	   <div class="bottomStyle1">确定</div>
	   <div class="bottomStyle2">取消</div>
	</div>
</div>
<!-- 添加学生访谈 -->



<!--添加家长访谈  -->


</body>
</html>
