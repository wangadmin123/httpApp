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
            $(".pooupBottons").click(function(){
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

			$.post("market/query",temp,showInfoList,"json");
		
			
		}
		function showInfoList(data){
			var querylist = data.querylist;
			var index = data.index;
			var pageCount = data.pageCount;
			var count =data.count;
			var pageSize=data.pageSize;
		
			showInfo(querylist,index);
			showPage(index,pageCount,count,pageSize);
		}
		
		
    		function showInfo(data,index){
    			$("#consulters").empty();
    			$("#jiao").empty();
    			if(data.length==0){
    				 $("#consulters").html("<tr><td colspan='12'>暂无数据</td></tr>");
    				
    			}else{
    				
    				for( var i = 0; i < data.length; i++) {
    					var sex = data[i].sex==1?"男":"女";
    					var id=data[i].id;
						var name =data[i].name==null?"未知":data[i].name;
						var age =data[i].age==null?"未知":data[i].age;
						var telphone1 =data[i].telphone1==null?"暂无":data[i].telphone1;
						var district = data[i].district ==null || data[i].district==''?"未知":data[i].district;
						var schoolName=data[i].schoolName=null||data[i].schoolName=='请选择'?"未知":data[i].schoolName;
						$("#consulters").append( "<tr>"
												+"<td><input type='checkbox' name='CheckBox' value="+data[i].id+"></td>"
												+"<td>"+(i+1)+"</td>"
												+"<td>"+name+"</td>"
												+"<td>"+sex+"</td>"
												+"<td>"+age+"</td>"										
												+"<td>"+telphone1+"</td>"
												+"<td>"+schoolName+"</td>"
												+"<td>"+district+"</td>"
												+"<td><c:if test="${loginUser.position.position_id!=39}"><a href='teacher/consultTeacherVisit?id="+id+"&stuId=1'>跟踪</a></c:if>"
												+"&nbsp;&nbsp;<a href='javascript:void(0)' onclick=follow("+data[i].id+",1) >查看</a><c:if test="${loginUser.position.position_id==39}">&nbsp;&nbsp;<a href='javascript:void(0)' onclick=ConDelete("+data[i].id+")>删除</a></c:if>"
												+"</td>"
												+"</tr>" 
												
							);
							
							/* +"<td><a href='javascript:void(0)' onclick=handOnInfo("+data[i].id+")>提交</a></td>" */
					
					}
				$("#jiao").append(
					 "<tr>"
					+"<td><c:if test="${loginUser.position.position_id!=39}"><input type='button' onclick='handall("+index+")' class='searchBotton' value='提交'></c:if></td>"
					+"</tr>"
				 );
    			}
                  				
                           					
    		}
    		/*删除*/
	function ConDelete(Id){
	 var msg = "您真的确定要删除吗？"; 
 if (confirm(msg)==true){ 
 location.href="market/ConsulterDelete?id="+Id;
  return true; 
 }else{ 
  return false; 
 } 
	
	}
    		/* 批量 */
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
							url:"market/handall",
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
    		/* 分页 */
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
				$("#page").append("每页显示的数量：<input type='number' id='number' value="+pageSize+" onchange='show(1)'  min='1' max='100'  class='textStyle' style='width:45px;'/>条");
				
			} 
    		
    	/* 单次提交 */	
    	function handOnInfo(data){
    		
    		  /* var temp = "id="+data; */
              var a = confirm("确定要提交吗？");
              
               if(a){
               		
               		alert("提交成功");
               		$.ajax({
               		
    				url:"market/update/"+data,
    				dataType:"text",
    				success:callback 
    				
    			});
    			
    			function callback(data){
    				window.location.href="market/query";
    				}
    			}
    		}
    		function follow(Id,stuId){
    
				location.href="Consultway/findFollow?id="+Id+"&stuId="+stuId;	
			}
    	 $(function(){
    	 	$.ajax({
					url:"market/getall",
					dataType:"json",
					success:function(data){
						$(data).each(function(){
							$("#dschool").append("<option value='"+this.schoolName+"'>"+this.schoolName+"</option>");
						});
					}
				});
			show(1);
			
			$("#btn").click(function(){
			
				show(1);
			
			});
		
		
		});  
    
    		/* 查询未提交量 */
/* function showHandout(){

	window.location.href="market/query";
	
} */
/* 显示查询信息量 */
function showQuery(){

window.location.href="market/amarketQuery";
	
}   

    </script>
</head>
<body>
<div class="rightContent" width=98%>
	<div class="tabs" id="tabs"  >
      <span class="spanOut" onclick="showQuery()">查询信息量</span>
      <span class="spanHover"  id="spanLast"  >查询未提交量</span>     
      
  	</div>
    <div class="tabContent">
        <h1 class="tabTitle">查询咨询量</h1>
        <div class="serach">
			
            <div class="searchContent">

                <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%; margin-bottom: 8px; padding-left: 30px;" >
                    <form id="form">

                        <tr>
                            <td>姓名：<input type="search"  class="searchStyle" name="name" style="width:130px;"/></td>
                            <td>学院：<select id="dschool" class="searchStyle" name="schoolName" style="width:130px;">
                            	<option value="请选择">请选择</option>
                            </select></td>
                            <td>性别：<select class="selectStyle" name="sex" style="width:130px;">
                                <option value="0">全部</option>
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select></td>
                            <td ><input type="button" id="btn" value="搜索" class="searchBotton" />
                        </tr>

                    </form>
                </table>
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
                        <th>学校</th>
                        <th>地区</th>
                        <th>操作</th>

                    </tr>
                   
				</thead>
					<tbody  id="consulters">
					
					
					
					</tbody>
				
                </table>
                <div id="jiao">
                	<!-- <input type="button" id="tijiao" value="提交" class="searchBotton" /> -->
                </div>
                <div id="page"> </div>
            </div>
        </div>
    </div>


</body>
</html>
