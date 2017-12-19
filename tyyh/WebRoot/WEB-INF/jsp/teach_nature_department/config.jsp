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
    <title>首页</title>

    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/config.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
    <script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/teach_nature_department/js/index.js"></script>
    <script type="text/javascript">
        $(function(){
            $(".ygxm span").click(function(){
               var title=$(this).text();
                $(".qxfp").html("正在给 <span style='color:#ff0000;'>"+title+"</span> 分配权限...");
            });
        });
    </script>

</head>
<body>

<div class="contentConfig">
      <div class="ygxm">
          员工：<span>张三</span><span>李四</span><span>王五</span>
      </div>
     <div class="qxfp">分配权限</div>
     <!--<h2 class="qx_name">基本功能</h2>-->
      <div class="bk">
                <span class="bk_head">班级:</span>
                <div class="bk_title">
                    <div class="gnmk" >
                      <label for="num1">创建班级</label><span><input type="checkbox" id="num1"></span>
                    </div>
                    <div class="gnmk" >
                        <label for="num2">查看班级</label><span><input type="checkbox" id="num2" disabled="disabled" checked="checked"></span>
                    </div>
                    <div class="gnmk">
                        <label for="num3">修改班级</label><span><input type="checkbox" id="num3"></span>
                    </div>
        </div>


 </div>
    <!--<h2 class="qx_name">扩展功能</h2>-->
      <div class="bk">
        <span class="bk_head">学员:</span>
        <div class="bk_title">
            <div class="gnmk">
                <label for="num4">创建学生档案</label><span><input type="checkbox" id="num4"></span>
            </div>
            <div class="gnmk">
            <label for="num5">查看学生档案</label><span><input type="checkbox" id="num5" disabled="disabled" checked="checked"></span>
        </div>
            <div class="gnmk">
                <label for="num6">查看学生档案</label><span><input type="checkbox" id="num6"></span>
            </div>
            <div class="gnmk">
                <label for="num7">查看学生档案</label><span><input type="checkbox" id="num7"></span>
            </div>
            <div class="gnmk">
                <label for="num8">查看学生档案</label><span><input type="checkbox" id="num8" disabled="disabled" checked="checked"></span>
            </div>
            <div class="gnmk">
                <label for="num9">查看学生档案</label><span><input type="checkbox" id="num9"></span>
            </div>
            <div class="gnmk">
                <label for="num10">查看学生档案</label><span><input type="checkbox" id="num10"></span>
            </div>
            <div class="gnmk">
                <label for="num11">查看学生档案</label><span><input type="checkbox" id="num11"></span>
            </div>
            <div class="gnmk">
                <label for="num12">查看学生档案</label><span><input type="checkbox" id="num12"></span>
            </div>

        </div>


    </div>

     <h2 class="tabTitle2">&nbsp;</h2>
    <div class="btposition1">
        <input type="submit" value="保存" class="saveBotton" />
    </div>
</div>
</body>
</html>
