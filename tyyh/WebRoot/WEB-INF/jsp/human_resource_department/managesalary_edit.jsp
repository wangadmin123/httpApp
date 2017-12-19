<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>编辑调薪信息</title>
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
                location.href="managesalary_search.html";
            }
        }
        /*保存读秒结束*/
    </script>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <h1 class="tabTitle">编辑调薪信息</h1>
        <form action="#" method="post" >
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                <tr>
                    <td class="tdWidth">部门：</td>
                    <td>
                        <select class="selectStyle" style="width:160px;">
                            <option>人力资源部</option>
                            <option>咨询部</option>
                            <option>教质部</option>
                            <option>学术部</option>
                            <option>市场部</option>
                            <option>就业部</option>
                            <option>网络部</option>
                            <option>教务部</option>
                            <option>开发部</option>
                            <option>校长办公室</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="tdWidth"><span></span>姓名：</td>
                    <td><select class="selectStyle" style="width:160px;">
                        <option>张三</option>
                    </select></td>
                </tr>
                <tr>
                    <td class="tdWidth"><span></span>岗位：</td>
                    <td><input type="text" class="textStyle" style="width:160px;border-style: none" readonly   />
                </tr>
               <tr>
                    <td class="tdWidth">调薪前薪资：</td>
                   <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="1000" />
                   </td>
                   </tr>
                   
                   <tr>
                    <td class="tdWidth">调薪后薪资：</td>
                   <td><input type="text" class="textStyle" style="width:160px;" placeholder=""  value="1212"/>
                   </tr>
                    <tr>
                    <td class="tdWidth">调薪原因：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入原因"  />
              		 <tr>
              		   <tr>
                    
                  
                    <td class="tdWidth">详细说明：</td>
                    <td><textarea  class="areaStyle" style="width:360px;"></textarea>
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

</body>
</html>