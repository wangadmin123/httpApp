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

    <title>列表模板</title>
    <link rel="stylesheet" type="text/css" href="statics/common/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
    
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>


    <link rel="stylesheet" type="text/css" href="statics/common/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/popup.css"/>

    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup-notsee.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popups.css"/>


    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
        <script type="text/javascript" src="statics/common/js/index.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
    <script type="text/javascript">
    
         $(function(){
           
            $(".deleteBotton").click(function(){
                $(".mbStyle").css("display","block");
                $(".deleteStyle").css("display","block");
            });
           
            $(".bottomStyle1").click(function(){
                $(".mbStyle").css("display","none");
                $(".deleteStyle").css("display","none");
                alert('你点击了确定')
            });
            
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
            ifAllChecked();

        }); 
        /*表格全选结束*/

        $(function(){
            
            $(".pooupBottons").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");

            });

            
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

        });
        
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",50);


        }); 



            /*关闭*/
             $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-notsee").css("display","none");
            }); 

       
        /*确定保存弹出框的位置*/
         $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyle-notsee").css("left",saveWidth/2-250);
            $(".popupStyle-notsee").css("top",50);


        }); 

    </script>
    <script type="text/javascript">
        function show(index){
	        var number=$("#number").val();
	       	if(number==null){
	       		number=10;
	       	}
    
            var temp = $("#form").serialize()+"&index="+index+"&pageSizes="+number;
            
            $.post("Network/networkHandin",temp,showInfoList,"json");
            
        }
        
        function showInfoList(data){
			var checkList = data.checkList;
			var index = data.index;
			var pageCount = data.pageCount;
			var totalCount=data.totalCount;
			var pageSize=data.pageSize;
			showInfo(checkList,index);
			showPage(index,pageCount,totalCount,pageSize);
			
		}
            function showInfo(data,index){
                $("#consulters").empty();
                $("#submit").empty();
                if(data.length==0){
                    $("#consulters").html("空");
                }else{
                    for ( var i = 0; i < data.length; i++) {
                    var sex = data[i].sex==1?"男":"女";
                    var name =data[i].name==null?"暂无":data[i].name;
                    var age =data[i].age==null?"暂无":data[i].age;
                    var telphone1 =data[i].telphone1==null?"暂无":data[i].telphone1;
                    var ungenTelphone =data[i].ungenTelphone==null || data[i].ungenTelphone==''?"暂无":data[i].ungenTelphone;
                    var district =data[i].district==null?"暂无":data[i].district;
                    $("#consulters").append("<tr><td ><input type='checkbox' name='CheckBox' value='"+data[i].id+"'/></td><td>"+data[i].id+"</td>"
                    +"<td>"+name+"</td>"
                    +"<td>"+sex+"</td>"
                    +"<td>"+age+"</td>"
                    +"<td>"+telphone1+"</td>"
                    +"<td>"+ungenTelphone+"</td>"
                    +"<td>"+district +"</td>"
                    +"</tr>");      
                    
                   /*  <td><a href='javascript:void(0)' class='edit' onclick='handOn("+data[i].id+")'>提交</a></td>    */                                   
                }
                $("#submit").append("<input  type='button' onclick='handall("+index+")' value='提交' class='saveBotton' />");   
            } 
                                   
    	}
    	
    	function handall(index){
				
				var a = $("input:checkbox[name='CheckBox']:checked");
				if(a.length==0){
					alert("请选择要提交的信息量!");
				}else{
					var result = confirm("确定提交选中的信息量吗？");
					if(result==true){
						var s = new Array(a.length);
					
					for(var i=0;i<s.length;i++){
						s[i] = a[i].value;
					}
					$.ajax({
							url:"Network/handall",
							type: "POST",
							traditional:true,
							data:{
		        				s:s,
		       		 		},
		       		 		dataType:"text",
							success:handallreturn
						});
					}else{
						show(index);
					}
				}
					
				function handallreturn(data){
					show(index);
				}
			
			}
    	
    	
    
    function showPage(index,pageCount,totalCount,pageSize){
    			
					$("#page").empty();
				$("#page").append("共"+totalCount+"条记录");
				$("#page").append("<a href=' javascript:onclick=show(1)'>首页</a>");
				var iqishi=1;
	 	if(pageCount>=8){
	 		if((index+4)>=pageCount){
	 		iqishi=pageCount-8;
	 	}else if(index>=5){
	 		iqishi=index-4;
	 	}
	 	}
				if(totalCount!=0){
					if(index!=1){
						$("#page").append("<span><a href=' javascript:onclick=show("+(index-1)+")' >上一页</a></span>");
					}
					for(var i=iqishi;i<=iqishi+8;i++){
						if(i==index){
							$("#page").append("<span><a href=' javascript:onclick=show("+i+")' style='color:red;'>"+i+"</a></span>");
						}else{
							$("#page").append("<span><a href=' javascript:onclick=show("+i+")'>"+i+"</a></span>");
						}
						
				
						if(i>pageCount-1){
							break;
						}
		 			}
					if(index!=pageCount){
					var num=1;
					num= parseInt(index)+num;
						$("#page").append("<span><a href=' javascript:onchange=show("+num+")'>下一页</a></span>");
					}
				}
				
				$("#page").append("<a href=' javascript:onclick=show("+pageCount+")'>末页</a>");
				$("#page").append("<span>共"+pageCount+"页</span>");
				 $("#page").append("每页显示的数量：<input type='number' id='number' onchange='show(1)' value="+pageSize+"   min='1' max='100'  class='textStyle' style='width:45px;'/>条");
		} 
    
    
    function handOn(id){
    	
    	
    	var result = confirm("确定要提交吗？");
    	
    	if(result ==true){
    	
    		
    		
    		$.ajax({
    			url:"Network/handOnInfo",
    			data:{
    				id:id,
    			},
    			dataType:"text",
    			success:handOnEnd
    		});
    		
    		function handOnEnd(data){
    			
    			show(1);
    		} 
    	}else{
    		show(1);
    	}
    }
    
    
    
    
        $(function(){
            show(1);
            
            $("#btn").click(function(){
            
                show(1);
            
            });
        });
        
     		/* 查询提交量 */
function showHandout(){

	window.location.href="Network/networkHand";
	
}
/* 显示查询信息量 */
function showQuery(){

window.location.href="Network/networkQuery";
	
}        
        
        
         
</script>
</head>
<body>
<div class="rightContent" width=98%><!-- style="width:1580px;" -->
<div class="tabs" id="tabs"  >
      <span class="spanOut" onclick="showQuery()">查询信息量</span>
      <span class="spanHover" id="spanLast" onclick="showHandout()">查询提交量</span>
      
  	</div>
    <div class="tabContent">
        <h1 class="tabTitle">查询待提交量</h1>
        <div class="serach">

            <div class="searchContent">
   			<form action="#" method="post" enctype="multipart/form-data" id="form">
              <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%; margin-bottom: 8px; padding-left: 30px;" >
                        <tr>
                            <td>姓名：<input type="search" name="name"  class="searchStyle" style="width:130px;"/></td>
                            <td>性别：<select class="selectStyle" name="sex" style="width:130px;">
                                <option value="0">全部</option>
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select></td>
                            <td><input type="button"  value="搜索" id="btn" class="searchBotton" />
                        </tr>
                        
                </table>
                </form>
            </div>


            <h1 class="tabTitle">基本信息</h1>
            <div class="divTable" >
                <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="all"/></th>
                        <th>序号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>电话</th>
                        <th>紧急联系方式</th>
                        <th>地区</th>
                    </tr>
                    </thead>
                    
                    <tbody id="consulters">
                    
                    </tbody>

                </table>
                <div id="page"></div>
            </div>
            
              <div id="submit">
               
              </div>     
                       
             
        </div>
    </div>


</body>
</html>
