<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查看访谈信息</title>
<link rel="stylesheet" type="text/css" href="css/index.css">

<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/index.js"></script>

<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<script type="text/javascript">
$(function(){
	/*点击删除*/
	 $(".deleteBotton").click(function(){
		/* $(".mbStyle").css("display","block"); */
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

/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="interview_search.html";
    });  
});

</script>

</head>
<body>
<div class="rightContent">
 <h1 class="tabTitle">查看访谈信息</h1>
  <div class="tabContent">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
		  <td style="width: 130px;text-align: right;">访谈人：</td> <td>${oaRlzybInterview1.emp_name }</td>
          </tr>
			 <tr>
				 <td style="text-align: right;" >访谈人部门：</td> <td>${oaRlzybInterview1.depart_name }</td>
			 </tr>
			 <tr>
				 <td style="text-align: right;" >访谈人岗位：</td> <td>${oaRlzybInterview1.position_name }</td>
			 </tr>
           <tr>
			 <tr>
				 <td style="text-align: right;" >被访谈人：</td> <td>${oaRlzybInterview2.emp_name }</td>
			 </tr>
			 <tr>
				 <td style="text-align: right;" >被访谈人部门：</td> <td>${oaRlzybInterview2.depart_name }</td>
			 </tr>
			 <tr>
				 <td style="text-align: right;" >被访谈人岗位：</td> <td>${oaRlzybInterview2.position_name }</td>
			 </tr>
			 <tr>
			 <tr>
          <td style="text-align: right;" >访谈时间：</td> <td>${interview_date }</td>
          </tr>
             <tr>
          <td style="text-align: right;" >访谈原因：</td> <td> ${oaRlzybInterview1.interview_reason }</td>
          </tr>
			 <tr>
				 <td style="text-align: right;" >访谈内容：</td> <td>${oaRlzybInterview1.interview_content }</td>
			 </tr>
          <tr>
          <td style="text-align: right;" >记录人：</td> <td>${oaRlzybInterview1.interview_recorder }</td>
          </tr>   
       </table>
	  <div class="btposition1">
	    <input type="button" value="返回" class="saveBotton" />
	  </div>
	  </div>
	  </div>
   
    </div>

	
</body>
</html>

