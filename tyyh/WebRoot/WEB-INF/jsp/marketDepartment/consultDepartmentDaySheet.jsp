<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">

<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
<title>日报表</title>
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

</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
  <h1 class="tabTitle">日报表</h1>
    <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
        
         
                 <td class="tdWidth">咨询师：</td>
                                <td>
                                    <select class="selectStyle" style="width:130px;">
                                        <option>------全部------</option>
                                        <option>乔珊珊</option>
                                        <option>宋强</option>
                                        
                <td>日期：<input type="date" class="dateStyle" style="width:130px;" /></td>
            
            <td><input type="button"  value="搜索" class="searchBotton" />
            <input type="button"  value="导出" class="searchBotton" /></td>
        </tr>

      
       </table>
    </div>

    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tr>
          <th>电话咨询量</th>
          <th>直上咨询量</th>
          <th>总咨询量</th>
          <th>电话上门量</th>
          <th>总上门量</th>
          <th>总报名量</th>
          <th>总定金量</th>
          <th>电转率</th>
          <th>面转率</th>
          <th>总转率</th>

        </tr>
        <tr>
          <td>50</td>
          <td>10</td>
          <td>5</td>
          <td>30</td>
          <td>5</td>
          <td>15</td>
          <td>25</td>
          <td>40%</td>
          <td>70%</td>
          <td>80%</td>
          
        </tr>
       <tr>
          <td>50</td>
          <td>10</td>
          <td>5</td>
          <td>30</td>
          <td>5</td>
          <td>15</td>
          <td>25</td>
          <td>40%</td>
          <td>70%</td>
          <td>80%</td>
          
        </tr>
         <tr>
          <td>50</td>
          <td>10</td>
          <td>5</td>
          <td>30</td>
          <td>5</td>
          <td>15</td>
          <td>25</td>
          <td>40%</td>
          <td>70%</td>
          <td>80%</td>
          
        </tr>
        
 
       
      </table>
	  <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
</div>
</body>
</html>
