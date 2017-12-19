<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>编辑访谈信息</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/switch.css">
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
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
                location.href="interview_search.jsp";
            }
        }
        /*保存读秒结束*/
    </script>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <h1 class="tabTitle">编辑访谈信息</h1>
        <form action="#" method="post" >
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                <tr>
                    <td class="tdWidth">访谈人：</td>
                    <td><input type="text" class="textStyle" value="张磊" style="width:160px;" placeholder="请输入姓名"  />
                    </td></tr>
                <tr>
                    <td class="tdWidth">被访谈人：</td>
                    <td><input type="text" class="textStyle" value="张磊" style="width:160px;" placeholder="请输入姓名"  />
                    </td></tr>
                    <tr>
                    <td class="tdWidth">访谈时间：</td>
                    <td><input type="date" class="dateStyle"  value='2017-08-07"' style="width:160px;"/></td>
                </tr>
                    
                      <tr>
                    <td class="tdWidth">访谈原因：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入原因"   value="事假"/>
              		 </tr>
              		   <tr>
                    
                  
                    <td class="tdWidth">访谈内容：</td>
                    <td><textarea  class="areaStyle" style="width:360px;">有事回家过年</textarea>
                    </td>
                </tr>
              		
              		  <tr>
                    <td class="tdWidth">记录人：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名" value="张三" />
              		 
               	  </tr>
                
                 </table>
                    
                       <div class="btposition1">
              <input type="button" value="保存" class="saveBotton"  />
          		  </div>
                  </form>  
                
             
             <div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>   
 
</div>
</div>
</body>
</html>