<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>选项卡模板</title>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css" />
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css"/>
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/back.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/tab.js"></script>
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
                location.href="welcome.html";
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
      function showinfo(){
      
         
	     var query=$("#query").serialize();
	   
	    /* $.post("employment_department/showlist1.html",query,show,"json");  */
	 
	   $.ajax({
	    
		type:"post",//请求类型
		url:"employment_department/monimoni?"+query,//请求的url
		dataType:"json",//ajax接口（请求url）返回的数据类型
		
		success: show,
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载就业信息失败！");
		}
	});
	
     }
     function show(data){
       
        var i=data.zongfen;
        $("#lilili").text(" :"+i);
     }
     
     
     
     
    </script>
</head>
<body>
<div class="rightContent">
   
    <div class="tabContent">
        <h1 class="tabTitle">面试成绩</h1>
        <div class="divTable">


            <form action="${pageContext.request.contextPath }/employment_department/jiamianshii" id="query" method="post">
               <input type="hidden" value="${id }" name="studentid">
                <table border="1" align="center"cellspacing="0">

                    <tr>
                        <td colspan="7" align="center" valign="middle">北大青鸟模拟面试评分标准细则表</td>
                    </tr>
                    
                    <!-- <tr>
                      <td colspan="2" align="center" valign="middle">中心编号：</td>
                      <td align="center" valign="middle"><input type="text" name="interview_centrality" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                      <td align="center" valign="middle">活动主题：</td>
                      <td align="center" valign="middle"><input type="text" name="interview_activity_theme" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                      <td align="center" valign="middle">组织者：</td>
                      <td align="center" valign="middle"><input type="text" name="interview_constitutor" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                    </tr> -->
                    <tr>
                      <td colspan="2" align="center" valign="middle"> 班 级：</td>
                      <td align="center" valign="middle"><input type="text" style="border:0; width:100%; 

height:100%; text-align:center;" value="${gname }" name="interview_class"/></td>
                      <td align="center" valign="middle">面试日期：</td>
                      <td align="center" valign="middle"><input type="text" style="border:0; width:100%; 

height:100%; text-align:center;" value="${shijian }" name="mianshiriqi"/></td>
                      <td align="center" valign="middle">面试人员：</td>
                      <td align="center" valign="middle"><input type="text" name="interview_staff" style="border:0; width:100%; 

height:100%; text-align:center; margin-bottom: 4px;"/></td>
                    </tr>
                    <tr>
                        <td width="23" align="center" valign="middle">考评项目</td>
                        <td width="74" align="center" valign="middle">评分大项</td>
                        <td width="107" align="center" valign="middle">总分值</td>
                        <td width="121" align="center" valign="middle">评分小项 </td>
                        <td width="178" align="center" valign="middle">权重</td>
                        <td width="178" align="center" valign="middle">学员：${stuname }</td>
                        <td width="445" align="center" valign="middle">评分标准</td>
                    </tr>
                    <tr>
                        <td rowspan="23" align="center" valign="middle"><p>面<br />
                            试<br />
                            礼<br />
                            仪</p>
                            <p>共<br />
                                20<br />
                                分</p></td>
                        <td rowspan="5" align="center" valign="middle">基本礼仪</td>
                        <td rowspan="5" align="center" valign="middle">5</td>
                        <td align="center" valign="middle">敲门</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" style="border:0; width:100%; 

height:100%; text-align:center;" name="jibenliyi" /></td>
                        <td align="center" valign="middle">有得1分，无为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">进场问候</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="jibenliyi" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">有得1分，无为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">落座</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="jibenliyi" style="border:0;  width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">询问后或得到面试官允许后落座得1分，其他为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">递交简历</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="jibenliyi" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">双手正向递交为合格，得1分，其他为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">离场告别</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="jibenliyi" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">有得1分，无为0分</td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="5" align="center" valign="middle">衣着</td>
                        <td rowspan="5" align="center" valign="middle">5</td>
                        <td align="center" valign="middle" style="color:#F00">是否正装</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle" style="color:#F00"><input type="number" name="zhengzhuang"

style="border:0; width:100%; height:100%;  text-align:center;"/></td>
                        <td align="center" valign="middle" style="color:#F00">完全未穿正装者此大项得分为0分

</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">上衣</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yizhuo" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">褶皱，污迹、挽袖，不系第二颗扣，敞在裤外得0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">裤（裙）</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yizhuo" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">不是正装西裤（裙）得0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">鞋</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yizhuo" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">不是正装皮鞋得0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">搭配</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yizhuo" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">衣服鞋皮带背包款式、颜色搭配不当得0分</td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="5" align="center" valign="middle">仪表</td>
                        <td rowspan="5" align="center" valign="middle">5</td>
                        <td align="center" valign="middle">头发、发型</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yibiao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">发型新潮、怪异、染发为0分，无得1分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">胡须（男）</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yibiao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">胡须干净得1分，无为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">妆容（女）</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yibiao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">妆容是否合适，是得1分，否为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">配饰纹身</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yibiao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">有纹身和不合适的配饰为0分，无得1分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">整体面貌</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yibiao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">是否让人感到舒适，是得1分，否为0分</td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="5" align="center" valign="middle">场外表现</td>
                        <td rowspan="5" align="center" valign="middle">5</td>
                        <td align="center" valign="middle" style="color:#F00">对非面试工作人员不礼貌</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle" style="color:#F00"><input type="number" name="limao"

style="border:0; width:100%; height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle" style="color:#F00">有此现象此大项得分为0分,无得1分

</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">大声喧哗</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="chengwaibiaoxian" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">无此现象得1分，有为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">抽烟、随地吐痰</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="chengwaibiaoxian" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">无此现象得1分，有为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">嬉笑打闹</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="chengwaibiaoxian" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">无此现象得1分，有为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">懒散、睡觉</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="chengwaibiaoxian" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">无此现象得1分，有为0分</td>
                    </tr>
                    <tr>
                        <td colspan="7" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="26" align="center" valign="middle"><p>面<br />
                            试<br />
                            技<br />
                            巧</p>
                            <p>共<br />
                                50<br />
                                分</p></td>
                        <td rowspan="3" align="center" valign="middle">基本技巧</td>
                        <td rowspan="3" align="center" valign="middle">7</td>
                        <td align="center" valign="middle">目光交流</td>
                        <td align="center" valign="middle">2</td>
                        <td align="center" valign="middle"><input type="number" name="jibenjiqiao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">眼神柔和、自信，和面试官有目光交流得2分，目光闪烁，

左顾右盼，或者不礼貌盯看面试官酌情扣分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">声音口齿表达</td>
                        <td align="center" valign="middle">3</td>
                        <td align="center" valign="middle"><input type="number" name="jibenjiqiao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">声音洪亮，口齿清晰，语调语速合适得3分，反之声音过小

或过大，口齿不清，语速过快或过慢酌情扣分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">仪态</td>
                        <td align="center" valign="middle">2</td>
                        <td align="center" valign="middle"><input type="number" name="jibenjiqiao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">坐姿是否端正，是得1分，身体抖动、小动作过多</td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="5" align="center" valign="middle">自我介绍</td>
                        <td rowspan="5" align="center" valign="middle">8</td>
                        <td align="center" valign="middle" style="color:#F00">完全没有准备</td>
                        <td align="center" valign="middle"><input type="number" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle" style="color:#F00"><input type="number" 

style="border:0; width:100%; height:100%; text-align:center;" name="zhunbei"/></td>
                        <td align="center" valign="middle" style="color:#F00">有此现象此大项得分为0分，表现为

：（1）极短，一两句话就结束；（2）内容非常随意，或仅仅是姓名年龄等基本信息；</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">姓名介绍</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="ziwojieshao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">令人印象不深，或者含糊不清一带而过为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">说出应聘职位</td>
                        <td align="center" valign="middle">2</td>
                        <td align="center" valign="middle"><input type="number" name="ziwojieshao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">介绍中有涉及应聘岗位并做了相应阐释得2分；完全没有涉

及为0分；其他情况酌情扣分。</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">结合企业招聘要求合理展示自身优势</td>
                        <td align="center" valign="middle">4</td>
                        <td align="center" valign="middle"><input type="number" name="ziwojieshao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">酌情给分；<span style="color:#F00">如果主动说出自己

劣势并使面试官对其产生负面评价此大项得0分</span></td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">结束语</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="ziwojieshao" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">介绍完毕有结束语和礼貌用语得1分，反之得0分</td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="14" align="center" valign="middle">面试技巧要点考察</td>
                        <td rowspan="14" align="center" valign="middle">30</td>
                        <td align="center" valign="middle" style="color:#00F">此大项为扣分项</td>
                        <td align="center" valign="middle"><input type="number" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle" style="color:#F00"><input type="number" 

style="border:0; width:100%; height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle" style="color:#F00">学员在面试中有以下表现的按照分值

点酌情扣分</td>
                    </tr>
                    <tr>
                        <td rowspan="4" align="center" valign="middle">表达能力</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">问一句答一句，回答过于简单</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">答非所问</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">表述空洞，没有实际内容</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input name="yaodiankaocha" type="number" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">罗嗦，说话无重点，无条理</td>
                    </tr>
                    <tr>
                        <td rowspan="2" align="center" valign="middle">逻辑思维</td>
                        <td align="center" valign="middle">3</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">回答问题思路不清晰，想到哪说哪，东一句西一句</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">思路不连贯，中间停顿过长</td>
                    </tr>
                    <tr>
                        <td rowspan="2" align="center" valign="middle">抗压应变能力</td>
                        <td align="center" valign="middle">2</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">面对压力性问题不知所措，结结巴巴</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">2</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">面对连续压力问题情绪反应激动，或者沮丧</td>
                    </tr>
                    <tr>
                        <td rowspan="5" align="center" valign="middle">工作态度稳定性</td>
                        <td align="center" valign="middle">5</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">对待面试提问的态度散漫</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">5</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">表现出对面试或者目标职位无所谓</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">3</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">主动表达出不稳定的工作态度，比如只想短期积累经验；

跳槽计划</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">3</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">唯工资待遇决定去留意愿</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">2</td>
                        <td align="center" valign="middle"><input type="number" name="yaodiankaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">对中长期职业发展缺乏基本的思考</td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">综合性考察</td>
                        <td align="center" valign="middle">5</td>
                        <td align="center" valign="middle">在面试过程中综合考察面试者的性格特征，做出评估</td>
                        <td align="center" valign="middle">5</td>
                        <td align="center" valign="middle"><input type="number" name="zonghexingkaocha" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle"><span style="color:#F00">有其中任何一点此大项得0分

</span><br />
                            1、性格孤僻、不易于与他人相处<br />
                            2、沉闷木讷迟钝<br />
                            3、固执己见<br />
                            4、表现过于圆滑使人感觉不信任<br />
                            5、自视过高，太狂</td>
                    </tr>
                    <tr>
                        <td colspan="7" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="12" align="center" valign="middle"><p>简<br />
                            历</p>
                            <p>共<br />
                                30<br />
                                分</p></td>
                        <td rowspan="4" align="center" valign="middle">外观</td>
                        <td rowspan="4" align="center" valign="middle">10</td>
                        <td align="center" valign="middle">平整干净</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="waiguan" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">平整无折痕无污渍为合格得1分，反之0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">篇幅过长或过短</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="waiguan" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">少于1页多于3页为不合格，得0分。</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">版式、字体</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="waiguan" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">结构混乱、格式凌乱、字体不一，有错别字为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">7个模块是否齐全</td>
                        <td align="center" valign="middle">7</td>
                        <td align="center" valign="middle"><input type="number" name="waiguan" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">少一个模块扣1分</td>
                    </tr>
                    <tr>
                        <td colspan="6" align="center" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td rowspan="7" align="center" valign="middle">内容</td>
                        <td rowspan="7" align="center" valign="middle">20</td>
                        <td align="center" valign="middle">有抄袭现象</td>
                        <td align="center" valign="middle"><input type="number" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle" class="q"><input type="number" name="chaoxi" style="border:0; 

width:100%; height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle" class="q">有此现象本大项得分为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">求职意向</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="neirong" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">不明确，过多，名称和招聘要求不一致为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">基本信息点不全</td>
                        <td align="center" valign="middle">1</td>
                        <td align="center" valign="middle"><input type="number" name="neirong" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">重要的个人信息如联系方式等不全面，为0分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">自我评价</td>
                        <td align="center" valign="middle">3</td>
                        <td align="center" valign="middle"><input type="number" name="neirong" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">出现喊口号，用箴言，夸张，过长，过短，和本人面试表

现明显不符的情况，酌情给分，0~3分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">教育经历和工作经历有漏洞</td>
                        <td align="center" valign="middle">4</td>
                        <td align="center" valign="middle"><input type="number" name="neirong" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">很容易能看出虚假，时间线有明显漏洞，前后不一致，根

据简历提问马上露馅，换工作太频繁等情况，酌情给分，0~4分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">项目表述空洞</td>
                        <td align="center" valign="middle">6</td>
                        <td align="center" valign="middle"><input type="number" name="neirong" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">项目流程表述不清，在项目中担任的角色不明确，项目中

涉及的技术不清楚，酌情给分0~6分</td>
                    </tr>
                    <tr>
                        <td align="center" valign="middle">技能描述</td>
                        <td align="center" valign="middle">5</td>
                        <td align="center" valign="middle"><input type="number" name="neirong" style="border:0; width:100%; 

height:100%; text-align:center;"/></td>
                        <td align="center" valign="middle">专业性太浅，技能与岗位要求匹配度低，技能描述夸大或

用词不准确，技术描述和求职意向不符，酌情给分，0~5分</td>
                    </tr>
                    <tr>
                        <td colspan="7" align="center" valign="middle"><span><input type="button" value="合计" onclick="showinfo()"></span><span id="lilili"></span></td>
                    </tr>
                    <tr>
                        <td colspan="7" align="center" valign="middle"></td>
                    </tr>
                </table>

           
            <div class="btposition2">
                <div><input type="submit" class="saveBotton" value="提交"/>
                 <input type="button" class="BackBotton" 
                
                value="返回"/></div>
            </div>
        </div>
         </form>

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

