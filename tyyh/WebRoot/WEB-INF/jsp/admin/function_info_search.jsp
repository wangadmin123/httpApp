<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset="UTF-8">
	    <base href="<%=basePath%>">
<title>功能管理</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
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
		/*$(".mbStyle").css("display","none");*/
		$(".deleteStyle").css("display","none");
		alert('你点击了确定');
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		/*$(".mbStyle").css("display","none");*/
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
	 });
	 
	 /* 点击删除信息 */ 
	  $(".delete").click(function(){
		/* $(".mbStyle").css("display","block"); */
		$(".deleteStyle").css("display","block");
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

/* 点击添加跳转到添加页面 */
$(function(){
	$("#addInfo").click(function(){
		location.href="function/addfunctionPage";
	});
});


/* 点击添加跳转到编辑页面 */
$(function(){
	$(".edit").click(function(){
		location.href="employee_info_edit.html";
	});
});
/* 点击添加跳转到查看页面 */
$(function(){
	$(".link").click(function(){
		location.href="employee_info_show.html";
	});
});
</script>
    <style>
       /* *{border: black 1px solid}*/
    </style>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
      <form method="post" action="">
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
	        <tr>
	            <td class="tdWidth">姓名：</td>
	            <td><input type="text" class="textStyle" style="width:160px;"  />
	          <td class="tdWidth">年龄段开始于：</td>
	          <td><input type="number"  min="1" max="100"  class="textStyle" style="width:160px;"/></td> 
	               <td class="tdWidth">年龄段终止于：</td>
	          <td><input type="number"  min="1" max="100"  class="textStyle" style="width:160px;"/></td>
	        </tr>
             <tr>
                 <td class="tdWidth">出生日期：</td>
                 <td><input type="date" class="dateStyle"   style="width:160px;"/></td>
                 <td class="tdWidth">性别：</td>
                 <td><select class="selectStyle" style="width:120px;">
                     <option>全部</option>
                     <option>男</option>
                     <option>女</option>
                 </select></td>
                 <td class="tdWidth">薪资级别：</td>
                 <td><select class="selectStyle" style="width:120px;">
                     <option>一级</option>
                     <option>二级</option>
                     <option>三级</option>
                     <option>四级</option>
                 </select></td>

             </tr>
		<tr>



           <td><input type="button"  value="搜索" class="searchBotton" /></td>
         <td><input type="button"  value="添加" class="searchBotton" id="addInfo"  /></td>
            <td class="tdWidth">结果数：</td>
            <td><input type="text" class="textStyle" style="width:50px;" value=""/>人</td>
            <td class="tdWidth">结果包含员工类型:</td>
            <td class="tdWidth"><input type="checkbox"  name="hobby"  class="checkedStyle" checked="checked"  disabled />在职&nbsp;&nbsp; <input type="checkbox"  name="hobby"  class="checkedStyle" />离职&nbsp;&nbsp;<input type="checkbox" name="hobby" class="checkedStyle"/>停薪留职&nbsp;&nbsp;</td><td></td>
		</tr>
		
       </table>
	   <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
	   <tr>

		</tr>
	   </table>
        <input type="hidden" name="pageIndex" value="1" />
    </div>
      </form>
    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr>
          <th><input type="checkbox" id="all"/></th>
          <th>编号</th>
          <th>姓名</th>
            <th>岗位</th>
          <th>部门</th>

          <th>年龄</th>
          <th>性别</th>
          <th>学历</th>
          <th>技术职称</th>
            <th>联系方式</th>
            <th>紧急联系人(电话)</th>
            <th>邮箱</th>
          <th>入职时间</th>
          <th>管理</th>
        </tr>
        
         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"/></td>  
          <td>1009</td>
             <td>张三</td>
             <td>市场活动专员</td>
             <td>咨询部</td>

             <td>23</td>
             <td>男</td>
             <td>本科</td>
             <td>工程师</td>
             <td>15386880458</td>
             <td>父亲：13100000000</td>
             <td>877218421@qq.com</td>
             <td>2017年06月05日</td>
 <td ><a href="#" class="edit" >编辑</a> <a href="#" class="delete">删除</a><a href="#" class="link">查看</a></td>
        </tr>
      </table>
	  <div id="page">当前${(pages.currentPageNo-1)*pages.currentPageSize-1}-${pages.currentPageNo*pages.currentPageSize }条
          <c:forEach var="i" begin="1" end="${pages.totalPageCount }" step="1">
              <span onclick="javascript:page_nav(document.forms[0],${i});">${i}</span>
          </c:forEach>
          共${pages.totalPageCount}页</div>
        <script
                src="statics/common/js/rollpage.js"></script>
          <div class="btposition2">
	       <div><input type="button" class="deleteBotton" value="删除"/></div>
	  </div>
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
