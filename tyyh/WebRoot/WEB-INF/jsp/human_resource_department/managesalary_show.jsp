<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>查看调薪信息</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">

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

/*返回查询页面*/
$(function(){
	$(".saveBotton").click(function(){
		location.href="managesalary_search.html";
    });  
});



</script>
</head>
<body>
<div class="rightContent">
 <h1 class="tabTitle">查看调薪信息</h1>
  <div class="tabContent">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
		  <td class="tdWidth">部门：</td> <td>${oaRlzybSalaryAdjustment.depart_name }</td>
          </tr>
			 <tr>
				 <td class="tdWidth">姓名：</td> <td>${oaRlzybSalaryAdjustment.emp_name }</td>
			 </tr>
           <tr>
			 <tr>
				 <td class="tdWidth"><span></span>岗位：</td>
				 <td>${oaRlzybSalaryAdjustment.position_name }</td>
			 </tr>
			 <tr>
          <td class="tdWidth">调薪前薪资：</td> <td>${oaRlzybSalaryAdjustment.salary_adjustment_beforeMoney }</td>
          </tr>
           <tr>
          <td class="tdWidth">调薪后薪资：</td> <td>${oaRlzybSalaryAdjustment.salary_adjustment_afterMoney }</td>
          </tr>
           <tr>
          <td class="tdWidth">调薪原因：</td> <td>${oaRlzybSalaryAdjustment.salary_adjustment_reason }</td>
          </tr>
             <tr>
          <td class="tdWidth">调薪说明：</td> <td>${oaRlzybSalaryAdjustment.salary_adjustment_explain }</td>
          </tr>
       </table>
       <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="返回" class="saveBotton" />
	  </div>
    </div>
    </div>
    </div>
	
</body>
</html>

