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
    <meta charset="UTF-8">
    <title>详细信息</title>

    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
    <script type="text/javascript" src="statics/common/js/pinying.js"></script>
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/js/sanji.js"></script>
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
</head>
<body>
<div class="rightContent">
	<div class="tabs"  >
      <span class="spanOut" id="spanLast"  >咨询量详情</span>
      
  	</div>
    <div class="tabContent">
    <div class="serach">
       <div class="popupStyle"  style="width: 680px;  height: 520px; ">
            
            <table  cellpadding="0" style="border-color: #97CBFF; font-size:13px; "  cellspacing="0" border="2px  " class="addTable">
              <tr>
              	<td class="tdWidth">姓名：</td><td>${name}</td>
              	<td class="tdWidth">性别：</td><td>${sex}</td>
              	<td class="tdWidth">年龄：</td><td>${age}</td>
              </tr>
              <tr>
              	<td class="tdWidth">联系方式：</td><td>${telphone1}</td>
              	<td class="tdWidth">QQ/微信：</td><td>${wechat}</td>
              	<td class="tdWidth">现住城市：</td><td>${city}</td>
              </tr>
               <tr>
              	<td class="tdWidth">紧急联系人: </td><td>${urgentTelpeople}</td>
              	<td class="tdWidth">紧急联系方式：</td><td>${ungenTelphone}</td>
              	<td class="tdWidth">社会状态：</td><td>${statusName}</td>
              </tr>
                <tr>
              	<td class="tdWidth">毕业院校：</td><td>${schoolName}</td>
              	<td class="tdWidth">学历：</td><td>${educationName}</td>
              	<td class="tdWidth">专业：</td><td>${specialty}</td>
              </tr>
              <tr>
              	<td class="tdWidth">负责咨询师：</td><td>${consultTeacherName}</td>
              	<td class="tdWidth">咨询课程：</td><td>${consultLessonName}</td>
              	<td class="tdWidth">上门状态：</td><td>${come}</td>
              </tr>
              <tr>
              	<td class="tdWidth">报名状态：</td><td>${enrollStatus}</td>
              	<td class="tdWidth">咨询量等级：</td><td>${rankName}</td>
              	<td class="tdWidth">有效状态：</td><td>${invalid}</td>
              </tr>
              <tr>
              <td class="tdWidth">备注：</td><td colspan="5" >
              <textarea   cols='x'  rows='y'  style='width: 100% ;height: 120px;' readonly='readonly' >${comments}</textarea  >
              </td>
              
              </tr>
              
            </table>
        </div>
       </div>
    </div>
</div>
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
</body>
</html>
