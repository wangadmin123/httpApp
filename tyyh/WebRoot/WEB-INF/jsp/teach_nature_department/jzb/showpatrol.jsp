<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  <base href="<%=basePath%>">
    <title>显示学生访谈记录</title>
	<meta charset="UTF-8">
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/showpatrol.css">
      <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/popup.css"/>
    <script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
 <script type="text/javascript">
        $(function(){
            /*点击显示弹出框*/
            $(".updatePatrol").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");

            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",50);


        });
    </script>
  </head>
  
  <body>
   	 <div class="showPatrolDiv">
   	 	<ul>
   	 		<li>班主任:周欢</li>
   	 		<li>学期:S1</li>
   	 		<li>访谈类型:<span>月访</span></li>
   	 		<li>访谈时间:2017-07-18</li>
   	 		<li>录入时间:2016/7/1 15:37:12</li>
   	 	</ul>
   	 	<div class="showPatrolDiv2">
   	 		访谈结果:与寝室同学王慧慧的矛盾,性格问题.希望大家在一个集体环境里面能够多包容一下他人.学会与人融洽相处.
   	 		<div class="showPatrolDiv3">
   	 		<a href="#" class="deletePatrol">删除</a>
   	 		<a href="#" class="updatePatrol">修改</a>
   	 		<a href="#" class="addPatrol">添加</a>
   	 		</div>
   	 	</div>
   	 </div>
   	 <div class="showPatrolDiv">
   	 	<ul>
   	 		<li>班主任:刘丁柯</li>
   	 		<li>学期:C11</li>
   	 		<li>访谈类型:<span>常规</span></li>
   	 		<li>访谈时间:2016-07-18</li>
   	 		<li>录入时间:2016/7/1 15:37:12</li>
   	 	</ul>
   	 	<div class="showPatrolDiv2">
   	 		访谈结果:人生如戏,戏如人生
   	 		<div class="showPatrolDiv3">
   	 		<a href="#" class="deletePatrol">删除</a>
   	 		<a href="#" class="updatePatrol">修改</a>
   	 		<a href="#" class="addPatrol">添加</a>
   	 		</div>
   	 	</div>
   	 </div>
   	  <div class="showPatrolDiv">
   	 	<ul>
   	 		<li>就业老师:张鑫焱</li>
   	 		<li>学期:C14</li>
   	 		<li>访谈类型:<span>就业</span></li>
   	 		<li>访谈时间:2016-05-18</li>
   	 		<li>录入时间:2016/7/1 15:37:12</li>
   	 	</ul>
   	 	<div class="showPatrolDiv2">
   	 		访谈结果:以梦为马,不负韶华
   	 		<div class="showPatrolDiv3">
   	 		<a href="#" class="deletePatrol">删除</a>
   	 		<a href="#" class="updatePatrol">修改</a>
   	 		<a href="#" class="addPatrol">添加</a>
   	 		</div>
   	 	</div>
   	 </div>
   	 <div>
			<div class="mbStyle">&nbsp;</div>
			<div class="popupStyle" style="width: 500px; height: 460px;">
			    <h1>修改访谈记录<span class="closeX">X</span></h1>
			    <table cellpadding="0" cellspacing="0" border="0" class="addTable">
			        <tr>
			            <td class="tdWidth">
				            <select  style="height: 29px;">
					            <option>班主任</option>
					            <option>就业老师</option>
					            <option>教员</option>
				            </select>：</td>
			            <td>
			            	<select style="height: 29px;">
				            <option>刘丁柯</option>
				            <option>高春燕</option>
				            <option>张鑫焱</option>
			            	</select>
			            </td>
			        </tr>
			        <tr>
			            <td class="tdWidth">学期：</td>
			            <td>
			            	<select style="height: 29px;">
				            <option>S1</option>
				            <option>S2</option>
				            <option>Y1</option>
				            <option>无</option>
			            	</select>
			            </td>
			        </tr>
			        <tr>
			            <td class="tdWidth">访谈类型：</td>
			            <td>
			            	<select>
			            		<option>月访</option>
			            		<option>常规</option>
			            		<option>就业</option>
			            	</select>
			            </td>
			        </tr>
			        <tr>
			            <td class="tdWidth">访谈时间：</td>
			            <td><input type="Date" /> </td>
			        </tr>
			        <tr>
			            <td class="tdWidth">录入时间：</td>
			            <td><input type="datetime-local" /></td>
			        </tr>
			        <tr>
			            <td class="tdWidth">访谈结果：</td>
			            <td><textarea cols="20" rows="4"></textarea></td>
			        </tr>
			
			    </table>
			    <h2 class="tabTitle2">&nbsp;</h2>		
			    <div class="btposition1">
			        <input type="button" value="保存" class="saveBotton" />
			    </div>
			</div>
	 </div>		
  </body>
</html>
