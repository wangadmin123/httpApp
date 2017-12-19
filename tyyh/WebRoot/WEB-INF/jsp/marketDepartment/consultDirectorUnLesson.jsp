<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en"><head>
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
 <script type="text/javascript" src="statics/common/js/index.js"></script>  
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
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
		alert('你点击了确定');
	 });
	 /*删除取消*/
	 $(".bottomStyle2").click(function(){
		$(".mbStyle").css("display","none");
		$(".deleteStyle").css("display","none");
		alert('你点击了取消');
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
				$("#all").attr("checked",false);
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
       
</script>
 <script type="text/javascript">
 	
 		
    	function show(){
			
			$.post("director/Unuselessonquery",showLessonList,"json");

		}
		
		function showLessonList(data){
			$("#lessons").empty();
			$(".btposition2").empty();
			if(data.length==0){
				$("#lessons").html("空");
			}else{
			
				for(var i = 0;i<data.length;i++){
					$("#lessons").append("<tr><td><input type='checkbox' name='CheckBox' value='"+data[i].id+"'/></td>"
					+"<td>"+data[i].id+"</td><td>"+data[i].consultLesson+"</td>"
					+"</tr>");
				}
			}
			$(".btposition2").append("<div><input type='button' class='pooupBotton' value='解冻' onclick='unUseLesson()'></div>"); 
			
		}
		
		

			/* 批量解冻*/
			function unUseLesson(index){
				var arr = $("input:checkbox[name='CheckBox']:checked");
				if(arr.length==0){
					alert("请选择要解冻的课程!");
				}else{
					var result = confirm("确定将选中的课程解除冻结吗？");
					if(result==true){
						var str = new Array(arr.length);
						 for(var i=0;i<str.length;i++){
						 	str[i] = arr[i].value;
						 }
						$.ajax({
							url:"director/moveunUseLesson",
							type: "POST",
							traditional:true,
							data: {
		        				str:str,
		       		 		},
							dataType:"text",
							success:function(){
								show();
							}
						});
					}
				}
			}

    	$(function(){
			show();
		}); 
		
		function UseLesson() {
			window.location.href="director/conDirectorlesson";
		}
		
    </script>
</head>
<body style="width:60%; margin: auto;">
<div class="rightContent">
	<div class="tabs" id="tabs"  >
      <span class="spanOut" onclick="UseLesson()">有效咨询课程</span>
      <span class="spanHover" id="spanLast">失效咨询课程</span>
  	</div>
	

  <div class="tabContent">
  <h1 class="tabTitle">冻结咨询课程</h1>
    

    <h1 class="tabTitle">基本信息</h1>
    <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0"  class="selectTable" >
        <thead><tr>
		  <th><input type="checkbox" id="all" ></th>
          <th>编号</th>
          <th>课程名称</th>
        </tr>
	</thead>
	<tbody id="lessons">
	
	
     </tbody>
      </table>
    <div class="btposition2">
       
    </div>
    </div>

  </div>
</div>

<div class="mbStyle">&nbsp;</div>


</body>
</html>