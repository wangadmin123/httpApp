<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>教务排课</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/switch.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/paike.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

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
</script>
<script type="text/javascript">
	/*排课行点击*/
	$(function(){
		$(".paikeTable tr").slice(1).each(function(){  
		var p = this;  
		$(this).children().slice(1).click(function(){  
			$($(p).children()[0]).children().each(function(){  
				if(this.type=="checkbox"){  
					if(!this.checked){  
						this.checked = true;  
					}else{  
						this.checked = false;  
					}  
				}  
			});  
		  });  
	   }); 
	  /*行点击结束*/
	});
</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">排课</h1>
      <form action="#" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth"><span>*</span>选择班级：</td>
          <td>
              <input type="radio"  name="grade" id="grade_1"  class="radioStyle" checked="checked"/>
                  <label for="grade_1">T76</label>
              <input type="radio"  name="grade"  id="grade_2" class="radioStyle" checked="checked"/>
                  <label for="grade_2">T77</label>
              <input type="radio"  name="grade"  id="grade_3" class="radioStyle" checked="checked"/>
                  <label for="grade_3">T78</label>
              <input type="radio"  name="grade"  id="grade_4" class="radioStyle" checked="checked"/>
                  <label for="grade_4">C13</label>
          </td>
        </tr>
        <tr>
          <td class="tdWidth">请选择课程：</td>
          <td>
           <div class="paikeContent">
            <div >
                 <table cellpadding="0" cellspacing="0" border="0" class="paikeTable" >
                    <tr>
                      <th style="width:35px;"></th>
                      <th style="width:70px;">状态</th>
                      <th>课程名称</th>
                      <th>章节名称</th>
                      <th>课时</th>
                    </tr>
                  </table>
            </div>
            <div class="paikediv" >
                  <table cellpadding="0" cellspacing="0" border="0" class="paikeTable" >
                    <tr style="height:1px;">
                      <th style="width:35px;"></th>
                      <th style="width:70px;"></th>
                      <th></th>
                      <th></th>
                      <th></th>
                    </tr>
                    <tr class="yixue">
                      <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
                      <td>已学</td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第一章:初识Java</td>
                      <td>32</td>
                    </tr>
                    <tr class="yixue">
                      <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
                      <td>已学</td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第二章:变量、数据类型和运算符</td>
                          <td>32</td>
                    </tr>
                    <tr class="yixue">
                      <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
                      <td>已学</td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第三章:选择结构（一）</td>
                          <td>32</td>
                    </tr>
                   <tr>
                      <td><input type="checkbox" name="CheckBox" value="pro1"/></td>
                      <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td>第四章:选择结构（二）</td>
                          <td>32</td>
                    </tr>
                   <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                      <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第五章:循环结构</td>
                          <td>32</td>
                    </tr>
                    <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第六章:数组</td>
                          <td>32</td>
                    </tr>
                      <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第七章:aaaaaaaaa</td>
                          <td>32</td>
                    </tr>
                      <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第八章:bbbbbbbbbb</td>
                          <td>32</td>
                    </tr>
                      <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第九章:cccccccc</td>
                          <td>32</td>
                    </tr>
                          <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第九章:cccccccc</td>
                          <td>32</td>
                    </tr>
                          <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第九章:cccccccc</td>
                          <td>32</td>
                    </tr>
                          <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第九章:cccccccc</td>
                          <td>32</td>
                    </tr>
                          <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第九章:cccccccc</td>
                          <td>32</td>
                    </tr>
                          <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第九章:cccccccc</td>
                          <td>32</td>
                    </tr>
                          <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第九章:cccccccc</td>
                          <td>32</td>
                    </tr>
                          <tr>
                      <td ><input type="checkbox" name="CheckBox" value="pro1"/></td>
                       <td><span class="wx">未学</span></td>
                      <td>使用Java理解程序逻辑</td>
                      <td >第九章:cccccccc</td>
                          <td>32</td>
                    </tr>
                    </table>
                  </div>
              </div>
          </td> 
        </tr>
    
         
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="保存" class="saveBotton" />
	  </div>
     </form> 

   
</div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
	

  </head>
  
 
  </body>
</html>
