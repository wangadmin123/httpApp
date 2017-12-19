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
<title>编辑班级管理信息</title>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/popup.css"/>
<link rel="stylesheet" type="text/css" href="statics/teach_nature_department/jzb.css/insert.css">
<script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
<script type="text/javascript">

$(function(){
            /*点击显示弹出框*/
            $(".pooupBotton").click(function(){
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
            var mbHeight= $(document).height();
            var delHeight=$(window).height();
            var saveWidth=$(window).width();
            $(".mbStyle").css("height",mbHeight);
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",delHeight/2-280);
            $(".saveBotton").click(function(){
              location.href="${pageContext.request.contextPath }/jsp/teach_nature_department/jzb/selectgrade.jsp";
            });
        });

</script>
</head>
<body>
<div class="rightContent">
  <div class="tabContent">
    <h1 class="tabTitle">添加班级学员个性访谈</h1>
      <form action="${pageContext.request.contextPath }/showgrade.html" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">姓名：</td>
          <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名" value="" name="stu_name" /><span>*姓名不能为空</span></td>
        </tr>
        <tr>
          <td class="tdWidth">学期：</td>
          <td>
           <select name="formal"><span>*请选择</span>
              <option value="0">--请选择--</option>
              <option value="S1">S1</option>
              <option value="S2">S2</option>
              <option value="Y2">Y2</option>
            </select>
         </td>
        </tr>
        <tr>
          <td class="tdWidth">访谈内容：</td>
          <td><textarea  id="areaStyle" class="areaStyle1" style="width:560px;" name="interviewContent"></textarea></td>
        </tr>
        <tr>
          <td class="tdWidth" rowspan="2">本月设立目标：</td>
          <td>笔试：<input type="text" name="writerTest"/></td>
        </tr>
        <tr>
          <td>机试：<input type="text" name="engineTest"/></td>
        </tr>
        <tr>
          <td class="tdWidth">访谈时间：</td>
          <td><input type="date" class="dateStyle" style="width:160px;" name="interviewTime"/></td>
        </tr>
        <tr>
          <td class="tdWidth">访谈人：</td>
          <td><input type="text" name="interviewName" /></td>
        </tr>
        <tr>
          <td class="tdWidth">备注：</td>
          <td><textarea  id="areaStyle" class="areaStyle2" style="width:300px;height:25px;" name="remark"></textarea></td>
        </tr>
        <tr>
          <td class="tdWidth">本月惩罚：</td>
          <td><textarea  id="areaStyle" class="areaStyle3" style="width:300px;height:25px;" name="monthPunish"></textarea></td>
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
      <div class="btposition1" id="btposition2">
        <input type="submit" value="保存" class="pooupBotton" />
      </div>
     </form> 
</div>
</div>
<div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 500px; height: 620px;">
    <h1>添加员工<span class="closeX">X</span></h1>
    <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">姓名：</td>
          <td>王楠</td>
        </tr>
        <tr>
          <td class="tdWidth">学期：</td>
          <td>S1</td>
        </tr>
        <tr>
          <td class="tdWidth">访谈内容：</td>
          <td>比较腼腆，但是学习态度很认真，言语表达比较好， 对自己来青鸟的目的和未来的规划比较明确。</td>
        </tr>
        <tr>
          <td class="tdWidth" rowspan="2">本月设立目标：</td>
          <td>笔试：80</td>
        </tr>
        <tr>
          <td>机试：80</td>
        </tr>
        <tr>
          <td class="tdWidth">访谈时间：</td>
          <td>2017-7-8</td>
        </tr>
        <tr>
          <td class="tdWidth">访谈人：</td>
          <td>孙学斌、刘丁珂</td>
        </tr>
        <tr>
          <td class="tdWidth">备注：</td>
          <td>接受教员老师的随时提问</td>
        </tr>
        <tr>
          <td class="tdWidth">本月惩罚：</td>
          <td>无</td>
        </tr>
      </table>
    <h2 class="tabTitle2">&nbsp;</h2>
    <div class="btposition1" id="btposition1">
        <input type="button" value="确定" class="saveBotton" />
    </div>
</div>
</body>
</html>