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
<title>成绩统计表</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/insert.css"/>
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/tab.js"></script>
<script src="statics/teach_nature_department/jzb.js/jquery.min.js"></script>
<script src="statics/teach_nature_department/jzb.js/DatePicker.js"></script>
<script src="statics/teach_nature_department/jzb.js/SimpleCanleder.js"></script>
<link href="statics/teach_nature_department/jzb.css/SimpleCanleder.css" rel="stylesheet">
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
		location.href="welcome.jsp";
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

</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">学生周考成绩统计</h1>
     <div class="divTable" >
       <div class="serach">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
          <td width="50">班级：</td> <td width="170"><input type="search"  class="searchStyle" style="width:160px;"/></td>
          <td width="110"><select class="ZY_tj">
                  <option>第一月</option>
                  <option>第二月</option>
                  <option>第三月</option>
                  <option>第四月</option>
                  <option>第五月</option>
                  <option>第六月</option>
                  <option>第七月</option>
                  <option>第八月</option>
                  <option>第九月</option>
                  <option>第十月</option>
                  <option>第十一月</option>
                  <option>第十二月</option>
                </select></td>
            <td width="100"><select class="ZY_tj">
                  <option>第一周</option>
                  <option>第二周</option>
                  <option>第三周</option>
                  <option>第四周</option>
                </select></td>
           <td><input type="button"  value="搜索" class="searchBotton" /></td>
        </tr>
        <script type="text/javascript">
          $(function (){
              $("#search_begindate").simpleCanleder();
          });     
        </script>     
      </table>
    </div>
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">

                <tr>
                    <th>班级</th>
                    <th>班主任</th>
                    <th>教员</th>
                    <th>学生姓名</th>
                    <th>笔试成绩</th>
                    <th>机试成绩</th>
                    <th>排名</th>
                </tr>
                <tr>
                    <td>C11</td>
                    <td>蔚丽飒</td>
                    <td>张曼</td>
                    <td>张三</td>
                    <td>85%</td>
                    <td>91%</td>
                    <td>5</td>
                </tr>
   
    </table>
    <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
        <div class="btposition2">
           
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
