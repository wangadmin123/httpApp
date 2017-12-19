
</body>
</html>
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
       
</script>
 <script type="text/javascript">
 function show1(){
  var $page=$("#pp").val()==""?10:$("#pp").val();
    	    $("#consulters").html("");
    	    $("#page").html("");
    	    $("#pp").html("");
    	      $.ajax({
    	       url:"director/selectCF",
    	        data:{"pagecount":1,"pagesize": $page},
    	        type:"post",
    	        dataType:"json",
    	        success:function(data){
    	        var $data=$(data);
    	       $(data.osa).each(function(){
    	       if(this.repetitionStatus==0){
    	       this.repetitionStatus="否";
    	       }else{
    	        this.repetitionStatus="是";
    	       }
    	     
    	       var citys=this.city==null?"未知":this.city;
    	       var districts=this.district==null?"未知":this.district;
                $("#consulters").append("<tr><td ><input type='checkbox' name='CheckBox' value='"+this.id+"'/></td><td class='CFName'>"+this.name+"</td><td>"+this.sex+"</td><td>"+this.age
             +"</td><td>"+this.telphone1+"</td><td>"+this.firstConsultTimes+"</td><td>"+citys+"==>"+districts+"</td><td><a href='javascript:updexsist("+this.id+");'  id='hh'>"+
             this.repetitionStatus+"</a></td><td><a href='javascript:delcf("+this.id+");'>删除</a></td></tr>");  
    	    })
				 var index=data.currentPageIndex;
			var totalCount=data.totalCount;
		
			var pageCount=data.totalPageCount;
			var pageSize=data.pageSize;
			showPage(index,pageCount,totalCount,pageSize);	
    	        }
    	      })
 }
    	    $(function(){
    	    var $page=$("#pp").val()==""?10:$("#pp").val();
	      $("#consulters").html("");
		  $("#page").html("");
		  $("#pp").html("");
    	    $("#consulters").html("");
    	    $("#page").html("");
    	    $("#pp").html("");
    	      $.ajax({
    	       url:"director/selectCF",
    	        data:{"pagecount":1,"pagesize":10},
    	        type:"post",
    	        dataType:"json",
    	        success:function(data){
    	        var $data=$(data);
    	       $(data.osa).each(function(){
    	       if(this.repetitionStatus==0){
    	       this.repetitionStatus="否";
    	       }else{
    	        this.repetitionStatus="是";
    	       }
    	        var citys=this.city==null?"未知":this.city;
    	       var districts=this.district==null?"未知":this.district;
                $("#consulters").append("<tr><td ><input type='checkbox' name='CheckBox' value='"+this.id+"'/></td><td  class='CFName'>"+this.name+"</td><td>"+this.sex+"</td><td>"+this.age
             +"</td><td>"+this.telphone1+"</td><td>"+this.firstConsultTimes+"</td><td>"+citys+"==>"+districts+"</td><td><a href='javascript:updexsist("+this.id+");'  id='hh'>"+
             this.repetitionStatus+"</a></td><td><a href='javascript:delcf("+this.id+");'>删除</a></td></tr>");  
    	    })
			var index=data.currentPageIndex;
			var totalCount=data.totalCount;
			var pageCount=data.totalPageCount;
			var pageSize=data.pageSize;
			showPage(index,pageCount,totalCount,pageSize);	
    	        }
    	      })
    	    })
    	    function show(obj){
    	   var $page=$("#pp").val()==""?10:$("#pp").val();
		  $("#consulters").html("");
		  $("#page").html("");
		   $("#pp").html("");
    	    $("#consulters").html("");
    	    $("#page").html("");
    	     $.ajax({
    	       url:"director/selectCF",
    	        data:{"pagecount":obj,"pagesize":$page},
    	        type:"post",
    	        dataType:"json",
    	        success:function(data){
    	        var $data=$(data);
    	        $(data.osa).each(function(){
    	        if(this.repetitionStatus==0){
    	        this.repetitionStatus="否";
    	        }else{
    	         this.repetitionStatus="是";
    	        }
    	            var citys=this.city==null?"未知":this.city;
    	       var districts=this.district==null?"未知":this.district;
             $("#consulters").append("<tr><td ><input type='checkbox' name='CheckBox' value='"+this.id+"'/></td><td  class='CFName'>"+this.name+"</td><td>"+this.sex+"</td><td>"+this.age
             +"</td><td>"+this.telphone1+"</td><td>"+this.firstConsultTimes+"</td><td>"+citys+"==>"+districts+"</td><td><a href='javascript:updexsist("+this.id+");'  id='hh'>"+
             this.repetitionStatus+"</a></td><td><a href='javascript:delcf("+this.id+");'>删除</a></td></tr>");  
    	    })
				var index=data.currentPageIndex;
			var totalCount=data.totalCount;
			var pageCount=data.totalPageCount;
			var pageSize=data.pageSize;
			showPage(index,pageCount,totalCount,pageSize);	
    	        }
    	      })
    	    }
    	    function showchongfu1(){
    	     var $page=$("#pp").val()==""?10:$("#pp").val();
		  $("#consulters").html("");
		  $("#page").html("");
		   $("#pp").html("");
    	    $("#consulters").html("");
    	    $("#page").html("");
    	     $.ajax({
    	       url:"director/selectCF",
    	        data:{"pagecount":1,"pagesize":$page},
    	        type:"post",
    	        dataType:"json",
    	        success:function(data){
    	        var $data=$(data);
    	        $(data.osa).each(function(){
    	        if(this.repetitionStatus==0){
    	        this.repetitionStatus="否";
    	        }else{
    	         this.repetitionStatus="是";
    	        }
    	            var citys=this.city==null?"未知":this.city;
    	       var districts=this.district==null?"未知":this.district;
             $("#consulters").append("<tr><td ><input type='checkbox' name='CheckBox' value='"+this.id+"'/></td><td  class='CFName'>"+this.name+"</td><td>"+this.sex+"</td><td>"+this.age
             +"</td><td>"+this.telphone1+"</td><td>"+this.firstConsultTimes+"</td><td>"+citys+"==>"+districts+"</td><td><a href='javascript:updexsist("+this.id+");'  id='hh'>"+
             this.repetitionStatus+"</a></td><td><a href='javascript:delcf("+this.id+");''>删除</a></td></tr>");  
    	    })
				var index=data.currentPageIndex;
			var totalCount=data.totalCount;
			var pageCount=data.totalPageCount;
			var pageSize=data.pageSize;
			showPage(index,pageCount,totalCount,pageSize);	
    	        }
    	      })
    	    }
    	    /*全选删除*/
    	    function delall(){
            var array = new Array(); //用于保存 选中的那一条数据的ID   
            var arrayName=new Array();
            var flag; //判断是否一个未选   
            $("input[name='CheckBox']:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
            	
                        if ($(this).attr("checked")) { //判断是否选中  
                            flag = true; //只要有一个被选择 设置为 true  
                        }  
                    });  
            if (flag) {  
                $("input[name='CheckBox']:checkbox").each(function() { //遍历所有的name为selectFlag的 checkbox  
                            if ($(this).attr("checked")) { //判断是否选中    
                         
                                array.push($(this).val()); //将选中的值 添加到 array中   
                              
                            }  
                        });  
                //将要集体删除的数据 传递给action处理   
               if(confirm('您确定要批量删除吗?')==true){
                 $.ajax({
								url : "director/delAll",
								type : "post",
								data : {
									"array" : array,
									"employee_id":${loginUser.emp_id}
								},
								dataType : "json",
								success : function(result) {
								if(result==true){
								alert("批量删除成功！");
								show1();
								}else{
							  alert("批量删除失败！");
								}
								}
								});
             } else {  
                alert("请至少选择一个用户");  
             }  
               }else{
               return false;
               }
		}
			/* 分页 */
	function showPage(index,pageCount,totalCount){
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
				
			} 
 function updexsist(id){
var hh=$("#hh").html();
if(hh=="是"){
  hh=1
}
if(hh=="否"){
  hh=0
}
      if(confirm("您确定不是重复信息吗？")==true){
     $.ajax({
      url:"director/updexsist",
      type:"post",
      data:{"id":id,"repetitionStatus":hh,"employee_id":${loginUser.emp_id}},
      dataType : "json",
      success:function(data){
       if(data==1){
       alert("您好,更改成功!")
       show1();
       }else{
       alert("您好,更改失败！")
       }
      }
     })
  }else{
  return false;
  } 
     }
function delcf(id){
  if(confirm("您确定删除该信息吗？")==true){
     $.ajax({
      url:"director/delete1",
      type:"post",
      data:{"id":id,"employee_id":${loginUser.emp_id}},
      dataType : "json",
      success:function(data){
       if(data==1){
       alert("您好,删除成功!")
       show1();
       }else{
       alert("您好,删除失败！")
       }
      }
     })
  }else{
  return false;
  }
 }
    	    
/* 显示分发咨询量 */
function showHandout(){
	window.location.href="director/consultDirectorHandout";
}

/* 显示查询咨询量 */
function showQuery(){
	window.location.href="director/consultDirectorQuery";
}

function showCheck(){
	window.location.href="director/consultDirectorCheck";
}
function showHistory() {
	window.location.href="director/historyCon";
}
function showUseless() {
	window.location.href="director/consultDirectorUseless";
}
function showChongfu(){
   window.location.href="director/consultDirectorChongfu";
}	
    </script>
</head>
<body>
<div class="rightContent">
	<div class="tabs" id="tabs"  >
     <span class="spanOut" onclick="showQuery()" >查询咨询量</span>
      <span class="spanOut"  onclick="showCheck()" >审核无效量</span>
      <span class="spanOut"  onclick="showHandout()" >分发咨询量</span>
      <span class="spanOut"  onclick="showUseless()" >查看无效量</span>
      <span class="spanOut" onclick="showHistory()" >查看历史量</span>
      <span class="spanHover" onclick="showChongfu()" >疑是重复量</span>
  	</div>
	

  <div class="tabContent">
  <h1 class="tabTitle">疑是重复量</h1>
   

    <h3 class="tabTitle">基本信息</h3>
    <div class="divTable">
      <table id="tbl" cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <thead>
        	<tr>
        	     <th></th>
				<th>姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>联系方式</th>
				<th>首次咨询日期</th>
				<th>地区</th>
				<th>是否重复</th>
				<th>操作</th>
        </tr>
	</thead>
	<tbody id="consulters">
	
	
     </tbody>
      </table>
   
      <span style="float:right;"><input type="number"  min="1" max="100" name="pageSize" onblur="showchongfu1()" style="width:80px;" id="pp"/>条/每页&nbsp;&nbsp;&nbsp;</span>
	  <div id="page"></div>
  		
    </div>
<input type="button" onclick="delall()" class="deleteBotton" value="删除" />
  </div>
</div>



</body>
</html>
