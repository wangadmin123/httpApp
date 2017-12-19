<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
    
<title>列表模板</title>
<link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
<link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>

    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/add.css"/>
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
 <script type="text/javascript" src="statics/common/js/index.js"></script>  

<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
<script type="text/javascript">
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
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",50);


        });


/* 
显示咨询量信息 */
$(function(){

		$(".pooupBottons").click(function(){
         var mbHeight= $(document).height();
         var mbWidth=$(window).width();
         var delHeight=$(window).height();

         $(".mbStyle").css("height",mbHeight);
         $(".mbStyle").css("display","block");

         $(".popupStyle").css("left",mbWidth/2-250);
         $(".popupStyle").css("top",delHeight/6-102);

         $(".popupStyle").css("display","block");
            });
            
            /*点击显示弹出框*/
            $(".pooupBottons").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");
            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

            $(".saveBotton").click(function(){
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
<div class="rightContent">

  <div class="tabContent">
  <h1 class="tabTitle">口碑审核</h1>
    <div class="serach">
          <form>
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%;  text-align: right ;margin-left:-320px;" >
        
         	 <tr>
		     	<td>首次咨询日期：<input type="date" class="dateStyle" style="width:120px;" /></td>          		<td>申报人：<input type="search"  class="searchStyle" style="width:130px;"/></td>
          	 </tr>
        	
        </table>
        <div style="text-align: right;">
        <input type="submit"  value="搜索" class="searchBotton" />
        </div>
        </form>
    </div>

    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <tbody><tr>
		  <th><input type="checkbox" id="all"></th>
          <th>编号</th>
          <th>姓名</th>
          <th>年龄</th>
          <th>性别</th>    
          <th>信息来源</th>
          <th>介绍人</th>
          <th>咨询课程</th>
         
          <th>联系方式</th>
           <th>状态</th>
          <th>操作</th>
        </tr>

         <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td class="pooupBottons">张三</td>
          <td>本科</td>
          
           <td>15386880458</td>
           <td>待业</td>
          
          <td>咨询师：<select class="selectStyle" style="width:80px;">
               	   <option>--全部--</option>
                  <option>朱晶</option>
                  <option>宋强</option>
                  <option>申晓霞</option>
                  <option>韩宁</option>
                  <option>乔珊珊</option>
                  <option>李朝倩</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="通过并分发"  />
              &nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="未通过"  /></td>
        <tr>
       <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"></td>
          <td>1001</td>
          <td >张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td class="pooupBottons">张三</td>
          <td>本科</td>
          
           <td>15386880458</td>
           <td>待业</td>
          
          <td>咨询师：<select class="selectStyle" style="width:80px;">
               	   <option>--全部--</option>
                  <option>朱晶</option>
                  <option>宋强</option>
                  <option>申晓霞</option>
                  <option>韩宁</option>
                  <option>乔珊珊</option>
                  <option>李朝倩</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="通过并分发"  />
              &nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="未通过"  /></td>
        <tr>
       <tr>
		  <td><input type="checkbox" name="CheckBox" value="pro1"></td>
          <td>1001</td>
          <td>张三</td>
          <td>咨询部</td>
          <td>23</td>
          <td>男</td>
          <td class="pooupBottons">张三</td>
          <td>本科</td>
          
           <td>15386880458</td>
           <td>待业</td>
          
          <td>咨询师：<select class="selectStyle" style="width:80px;">
               	   <option>--全部--</option>
                  <option>朱晶</option>
                  <option>宋强</option>
                  <option>申晓霞</option>
                  <option>韩宁</option>
                  <option>乔珊珊</option>
                  <option>李朝倩</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="通过并分发"  />
              &nbsp;&nbsp;&nbsp;&nbsp;<input type="button"  value="未通过"  /></td>
        <tr>
        
       
      </tbody>
      
      </table>
	  <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
    <div class="btposition2">
         <div><input type="button" class="pooupBotton" value="通过并分发">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="pooupBotton" value="未通过"></div>
    </div>
    </div>

  </div>
</div>
<div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 500px; height: 150px;">
    <h1>操作提示<span class="closeX">X</span></h1>
   
     <span class="closeX" style="text-align: center;" > &nbsp;确定执行该操作？&nbsp;</span>

    <h2 class="tabTitle2">&nbsp;</h2>

    <div class="btposition1">
        <input type="button" value="当然" class="saveBotton" onclick=NewPage("signcheck.jsp") />
        <input type="button" value="再想想" class="saveBotton" onclick=NewPage("signcheck.jsp") />
    </div>
</div>



<div class="mbStyle">&nbsp;</div>
<div class="popupStyle" style="width: 600px; height: 600px; ">
    <h1>学生详情<span class="closeX">X</span></h1>
    <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
            <td class="tdWidth">姓名：</td>
            <td><label >李四</label></td>
            <td class="tdWidth">性别：</td>

            <td><label >男</label></td>

        </tr>
        <tr>
            <td class="tdWidth">年龄：</td>
            <td><label >22</label></td>
            <td class="tdWidth">联系方式：</td>
            <td><label >18434369783</label></td>
        </tr>

        <tr>
            <td class="tdWidth">专业：</td>
            <td><label >计算机</label></td>
            <td class="tdWidth">咨询师姓名：</td>
            <td><label >宋强</label></td>
        </tr>
        <tr>

            <td class="tdWidth">关键词：</td>
            <td><label >北大青鸟</label></td>
            <td class="tdWidth">本地/外地：</td>
            <td><label >本地</label></td>
        </tr>
        <tr>
            <td class="tdWidth">学历：</td>
            <td><label >研究生</label></td>
            <td class="tdWidth">城市：</td>
            <td><label >太原</label>
            </td>
        </tr>

        <tr>

            <td class="tdWidth">状态：</td>
            <td><label >在职</label></td>

            <td class="tdWidth">毕业院校：</td>
            <td><label >清华</label></td>

        </tr>
        <tr>

            <td class="tdWidth">QQ/微信：</td>
            <td><label >135687563</label></td>
            <td class="tdWidth">班主任：</td>
            <td><label >暂无</label></td>
        </tr>
        <tr>
            <td class="tdWidth">咨询课程：</td>
            <td><label >JAVA</label></td>
            <td class="tdWidth">回访时间：</td>
            <td><label >2017.7.15</label></td>

        </tr>
        <tr>
            <td class="tdWidth">媒体名称：</td>
            <td><label >Google</label></td>

            <td class="tdWidth">备注：</td>
            <td><label >较为有意</label></td>
        </tr>
        <tr>
            <td class="tdWidth">修改时间：</td>
            <td><label >暂无</label></td>
            <td class="tdWidth">修改人：</td>
            <td><label >暂无</label></td>
        </tr>

        <tr>
            <td class="tdWidth" colspan="3">
                <input type="button" value="导出" class="saveBotton" />
            </td>
        </tr>


    </table>

</div>


</body></html>