<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html lang="en">
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>会议模板</title>
    <link rel="stylesheet" type="text/css" href="statics/develop_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/develop_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/develop_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/develop_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/develop_department/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/develop_department/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/develop_department/css/switch.css">
    <script type="text/javascript" src="js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="js/globle.js"></script>
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
                /* location.href="develop/saveZzhyshowlist.html?id=${id}"; */
            }
        }
        /*保存读秒结束*/
    </script>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <h1 class="tabTitle">修改会议记录</h1>
        <form action="develop/saveZzhyshowlist.html?id=${met.id}&&uid=${uid}" method="post">
				<table cellpadding="0" cellspacing="0" border="0" class="addTable">
					<tr>
						<td class="tdWidth">组名：</td>
						<td><input type="text" class="textStyle" style="width:160px;"
							placeholder="请输入小组id" name="groupid"  value="${met.groupname }"></td>
					</tr>
				
					<tr>
						<td class="tdWidth"><span>*</span>记录人：</td>
						<td><input type="text" class="textStyle" name="witer"
							style="width:160px;" placeholder="请输入记录人姓名"  value="${met.stu_name }"/>
					</tr>

					<tr>
						<td class="tdWidth">会议时间：</td>
						<!-- <td><input type="date" class="dateStyle" name="starttime"
							style="width:160px;" /></td> -->
						<td><fmt:formatDate value="${met.starttime }"
										pattern="yyyy-MM-dd " />
						</td>	
					</tr>
				
					<tr>
						<td class="tdWidth">会议类型：</td>
						<td>${(met.type)==1?"晨会":"班后会" }</td>

					</tr>
						<tr>
						<td class="tdWidth">会议记要：</td>
						<td><textarea class="areaStyle" name="content"
								style="width:360px;"  value="${met.content }" required="required">  ${met.content } </textarea></td>
					</tr>


				</table>
				<h2 class="tabTitle2">&nbsp;</h2>
				<div class="btposition1">
					<td><%-- <a href="develop/saveZzhyshowlist.html?id=${met.id }"
									class="modifyVersion" data-toggle="tooltip"
									data-placement="top" title="" data-original-title="提交">提交</a> --%>
									<!-- <button id="tjrw">提交任务</button> -->
									
						<input type="submit" value="提交" class="saveBotton" />			
				</td>
				</div>
			</form>


    </div>
</div>



<div class="saveStyle"> 提交成功！（<span class="setTime"></span>） </div>

</body>
</html>

