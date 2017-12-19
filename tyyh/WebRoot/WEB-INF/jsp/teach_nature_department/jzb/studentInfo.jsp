<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
<title>已付款学员基本信息 </title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/public.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/info.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/laydate/laydate.js"></script>
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
    <div class="serach">
        <table> 
        <tr>
		  <td>班级:</td> <td><select class="ZY_tj" style=" width: 100%; height: 30px;">
		      <option>-请选择-</option>
              <option>C11</option>
              <option>C12</option>
            </select></td>
          <td>姓名：</td> <td><input type="search" class="searchStyle" style="width:160px;"/></td>
          <td>是否住宿舍:<select class="searchStyle" style="width:160px;">
          				<option>-请选择-</option>
          				<option>是</option>
          				<option>否</option>
          		  </select>
          </td> 
          <td><input type="button"  value="搜索" class="searchBotton" /></td>
          
        </tr>
		</table>
    </div>

    <h1 class="tabTitle" style="font-size:20px; color: blue;background-color: menu;font-family: '楷体'" >已付款学员基本信息</h1>
    <p style="height:30px;line-height: 30px;margin-left: 20px;"></p>
    <div class="divTable" >
      <table  class="selectTable" cellspacing="0" border="1"  >
        <tr>
        	<th rowspan="2">序号</th>
        	<th colspan="8">已付款学员基本信息</th>
        </tr>
        <tr>
          
          <th>学生学号</th>
		  <th>学生姓名</th>
          <th>性别</th>
          <th>年龄</th>
          <th>班级名称</th>
          <td>是否住宿舍</td>
          <th>联系电话</th>
          <th>紧急联系人</th>
        </tr>
        <tr>
          <td>1</td>
          <td>C11-08</td>
		  <td>张三</td>
          <td>男</td>
          <td>23</td>
          <td>C11</td>
          <td>是</td>
          <td>1591330697</td>
          <td>1591330697</td>
        </tr>
<tr>
         <td>2</td>
          <td>C11-08</td>
		  <td>张三</td>
          <td>男</td>
          <td>23</td>
          <td>C11</td>
          <td>是</td>
          <td>1591330697</td>
          <td>1591330697</td>
        </tr>
<tr>
          <td>3</td>
          <td>C11-08</td>
		  <td>张三</td>
          <td>男</td>
          <td>23</td>
          <td>C11</td>
          <td>是</td>
          <td>1591330697</td>
          <td>1591330697</td>
        </tr>
<tr>
          <td>4</td>
          <td>C11-08</td>
		  <td>张三</td>
          <td>男</td>
          <td>23</td>
          <td>C11</td>
          <td>是</td>
          <td>1591330697</td>
          <td>1591330697</td>
        </tr>
<tr>
          <td>5</td>
          <td>C11-08</td>
		  <td>张三</td>
          <td>男</td>
          <td>23</td>
          <td>C11</td>
          <td>是</td>
          <td>1591330697</td>
          <td>1591330697</td>
        </tr>
<tr>
          <td>6</td>
          <td>C11-08</td>
		  <td>张三</td>
          <td>男</td>
          <td>23</td>
          <td>C11</td>
          <td>是</td>
          <td>1591330697</td>
          <td>1591330697</td>
        </tr>
      </table>
       
       <div class="page"><span>首页</span><span>上一页</span>123456789<span>下一页</span><span>尾页</span><span>当前页1/6</span>    </div>
	  
    </div>
  </div>
</div>
</body>
</html>
