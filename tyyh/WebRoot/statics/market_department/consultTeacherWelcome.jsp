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
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popups.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/adds.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popups.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup-notsee.css"/>
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/index.js"></script>
	<script type="text/javascript">
		$(function(){
 		$(".study").click(function(){
         var mbHeight= $(document).height();
         var mbWidth=$(window).width();
         var delHeight=$(window).height();

         $(".mbStyle").css("height",mbHeight);
         $(".mbStyle").css("display","block");

         $(".popupStyle-study").css("left",mbWidth/2-250);
         $(".popupStyle-study").css("top",delHeight/4-92);

         $(".popupStyle-study").css("display","block");
            });

            /*点击显示弹出框*/
            $(".study").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle-study").css("display","block");
            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-study").css("display","none");
            });

            /*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-study").css("display","none");
            });

        });
        
         $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle-study").css("left",saveWidth/2-250);
            $(".popupStyle-study").css("top",50);

        });
        
           /* 不再显示无销量  */
        $(function(){
            /*点击显示弹出框*/
            $(".notsee").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle-notsee").css("display","block");


            });
			
			$.ajax({
					url:"weidu",
					data:{"id":parent.user},
					dataType:"json",
					success:function(data){
						if(data>0){
							$("#geshu").text(data);
							$(".weidu").show();
						}
					}
			});
			
            /*关闭*/
            $(".closeX").click(function(){
            	$.ajax({
            		url:"yidu",
					data:{"id":parent.user},
					dataType:"json",
					success:function(data){
						if(data>0){
							$("#geshu").text(0);
							$(".weidu").hide();
							$(".mbStyle").css("display","none");
                			$(".popupStyle-notsee").css("display","none");
						}
					}
            	});
               
            });

            /*关闭*/
            $(".saveBotton").click(function(){
              $.ajax({
            		url:"yidu",
					data:{"id":parent.user},
					dataType:"json",
					success:function(data){
						if(data>0){
							$("#geshu").text(0);
							$(".weidu").hide();
							$(".mbStyle").css("display","none");
                			$(".popupStyle-notsee").css("display","none");
						}
					}
            	});
            });

        });
        
        
          function shan(id){
        	 $.ajax({
        				  	url:"shan",
        				  	data:{"id":id},
							dataType:"json",
							success:function(data){
								if(data==1){
									xiaoxi();
								}
							}
        				  });
        }
        
        function xiaoxi(){
        				  $.ajax({
        				  	url:"getalladvice",
        				  	data:{"id":parent.user},
							dataType:"json",
							success:function(data){
								$(".selectTable").html("");
								$(".selectTable").append("<tr><th style='width: 15%;'>发送者</th><th style='width: 40%;'>内容</th><th style='width: 30%;'>时间</th><th style='width: 15%;'>操作</th></tr>");
								var i=0;
									$(data).each(function(){
									if(this.advicestate!=2){
										if(this.advicestate==0){
											i++;
										}
										$(".selectTable").append("<tr><td>"+this.from.emp_name+"</td><td>"+this.content+"</td><td>"+this.date+"</td><td><a href='javascript:void(0)' onclick='shan("+this.id+")'>删除</a></td></tr>");
									}
									
								});
							}
        				  });
        				  
				          var mbHeight= $(document).height();
				          var mbWidth=$(window).width();
				          var delHeight=$(window).height();
				         	 
				         $(".mbStyle").css("height",mbHeight);
				         $(".popupStyle-study").css("left",mbWidth/2-300);
				         $(".popupStyle-study").css("top",delHeight/3-120);
				         $(".popupStyle-study").css("display","block");
				          $(".mbStyle").css("display","block");
				           
				           
				            $(".closeX").click(function(){
				                $(".mbStyle").css("display","none");
				                $(".popupStyle-study").css("display","none");
				            }); 
							
							/*关闭*/
				            $(".saveBotton").click(function(){
				                $(".mbStyle").css("display","none");
				                $(".popupStyle-study").css("display","none");
				            
				            });
        }
	</script>
</head>
<body>

<div class="contentConfig">
    <div class="qxfp">我的桌面 </div>
    <div class="gn_nav">

        <div class="gnmk" onclick="NewPage('teacher/consultTeacherQuery')">
            查询咨询量
        </div>
          <div class="gnmk" onclick="NewPage('teacher/transferclassTeacher')">
            审核通过
        </div>
        <div class="gnmk" onclick="NewPage('oaScbOperation/OperationSelect')">
        操作记录
        </div>
        <div class="gnmk" onclick="xiaoxi()">
        消息盒子 <spon class="weidu">(<spon id="geshu">0</spon>)</span>
        </div>
    </div>

<div class="mbStyle">&nbsp;</div>
<div class="popupStyle-study" style="width: 570px; height: 470px;">
    <h1>消息盒子<span class="closeX">X</span></h1>
    	<div style="overflow:scroll; overflow-x:hidden; height: 350px;">
    		<table cellpadding="0" cellspacing="0" class="selectTable">

        	</table>
    	</div>
        
        <h2 class="tabTitle2">&nbsp;</h2>

        <div class="btposition1">
        	<input type="button" value="确定"  class="saveBotton" />    	
        </div>
</div>
</div>
</body>
</html>
