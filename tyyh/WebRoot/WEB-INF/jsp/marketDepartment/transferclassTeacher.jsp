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
    <link rel="stylesheet" type="text/css" href="statics/common/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/css/formStyle.css"/>
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
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
    <script type="text/javascript">
        $(function(){
            /*点击展开搜索面板*/
            $(".searchShow").click(function(){

                $(".searchContent").slideDown(300);
                $(".searchShow").hide();
            });
            /*点击搜索关闭面板*/
            $(".searchBotton").click(function(){

                $(".searchContent").slideUp(300);
                $(".searchShow").show();
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
        /* 显示咨询量信息 */
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


        /* 无效审核*/
        $(function(){

            $(".avail").click(function(){
                var mbHeight= $(document).height();
                var mbWidth=$(window).width();
                var delHeight=$(window).height();

                $(".mbStyle").css("height",mbHeight);
                $(".mbStyle").css("display","block");

                $(".popupStyles").css("left",mbWidth/2-250);
                $(".popupStyles").css("top",delHeight/3-92);

                $(".popupStyles").css("display","block");
            });

            /*点击显示弹出框*/
            $(".avail").click(function(){

                $(".mbStyle").css("display","block");
                $(".popupStyles").css("display","block");

            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyles").css("display","none");
            });

            /*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyles").css("display","none");
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".popupStyles").css("left",saveWidth/2-250);
            $(".popupStyles").css("top",50);

        });


        /* 提交报名信息  */
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
        /*确定保存弹出框的位置*/
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

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-notsee").css("display","none");
            });

            /*关闭*/
            $(".saveBotton").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle-notsee").css("display","none");
            });

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
        var conId = 0;
        function show(index){
            conId = 0;
            commitIndex =0;
            var number=$("#number").val();
            if(number==null){
                number=10;
            }
            var temp = $("#form").serialize()+"&index="+index+"&pageSizes="+number;
            $.post("teacher/transferclassTeacher",temp,showListInfo,"json");

        }
        function showListInfo(data){
            var index=data.index;
            var pageCount=data.pageCount;
            var totalCount=data.totalCount;
            var consulterList=data.consulterList;
            var pageSize=data.pageSize;

            showInfo(consulterList,index);
            showPage(index,pageCount,totalCount,pageSize);
        }
        function showInfo(data,index){
            var str = "";
            $("#consulters").empty();

            if(data.length==0){
                $("#consulters").html("<tr><td colspan='12'>暂无审核通过</td></tr>");
            }else{

                for ( var i = 0; i < data.length; i++) {
                    var sex = data[i].sex==1?"男":"女";
                    var consultwayName =data[i].consultwayName==null?"暂无":data[i].consultwayName;
                    var consultLessonName =data[i].consultLessonName==null?"暂无":data[i].consultLessonName;
                    var rankName =data[i].rankName==null?"暂无":data[i].rankName;
                    var returnTime =data[i].returnTime==null?"暂无":data[i].returnTime;
                    var telphone1 =data[i].telphone1==null?"暂无":data[i].telphone1;
                    var city =data[i].city==null?"暂无":data[i].city;
                    var educationName =data[i].educationName==null?"暂无":data[i].educationName;
                    var specialty =data[i].specialty==null?"暂无":data[i].specialty;
                    var statusName =data[i].statusName==null?"暂无":data[i].statusName;

                    str +="<tr><td ><input type='checkbox' name='CheckBox' value="+data[i].id+"></td>"
                        +"<td>"+(i+1)+"</td>"
                        +"<td>"+data[i].name+"</td>"
                        +"<td>"+sex+"</td>"
                        +"<td>"+data[i].age+"</td>"
                        +"<td>"+consultwayName+"</td>"
                        +"<td>"+consultLessonName+"</td>"
                        +"<td>"+rankName+"</td>"
                        +"<td>"+returnTime+"</td>"
                        +"<td>"+telphone1+"</td>"
                        +"<td>"+city+"</td>"
                        +"<td>"+educationName+"</td>"
                        +"<td>"+specialty+"</td>"
                        +"<td>"+statusName+"</td>";              
                    }
                    str+="</td></tr>";
                }
                $("#consulters").append(str);
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
				$("#page").append("每页显示的数量：<input type='number' id='number' value="+pageSize+" onchange='show(1)'  min='1' max='100'  class='textStyle' style='width:45px;'/>条");
			} 


        /* 移交班主任 */

        function handoutall(index,handout){

            var consultTeacherid=$(handout).prev().val();
           
			
           	if(consultTeacherid==0){
                alert("请选择班主任!");
            }else {
                var a = $("input:checkbox[name='CheckBox']:checked");/* 获得所有被选中的标签(name属性为CheckBox的) */
                if(a.length==0){
                    alert("请选择要移交的咨询量!");
                }else{
                    var result = confirm("确定移交班主任吗？");
                    if(result==true){
                        var s = new Array(a.length);/* 创建数组 */
                        for(var i=0;i<s.length;i++){
                            s[i] = a[i].value;
                        }
                        $.ajax({
                            url:"teacher/classteacher",
                            type: "POST",
                            traditional:true,
                            data:{
                                s:s,
                                consultTeacherid:consultTeacherid,
                            },
                            dataType:"text",
                            success:function(data){
								
                                    show(1);
                               

                            },

                        });
                    }
                }
            }
        }
        
        
    	$(function(){
    		conId = 0;
			show(1);
			
			$("#btn").click(function(){
			
				show(1);
			
			});
	
		}); 


        /* 显示详细信息 */
        function studentInfo(id){

            var mbHeight= $(document).height();
            var mbWidth=$(window).width();
            var delHeight=$(window).height();

            $(".mbStyle").css("height",mbHeight);
            $(".popupStyle").css("left",mbWidth/2-250);
            $(".popupStyle").css("top",delHeight/0);
            $(".popupStyle").css("display","block");
            $(".mbStyle").css("display","block");

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });
        }

    </script>
</head>
<body>
<div class="rightContent" ><!-- style="width:1580px;" -->

    <div class="tabContent">
        <div class="serach">
            <div class="searchTitle">
                搜索条件
                <div class="searchShow">展开>></div>
            </div>
            <div class="searchContent">
           
                <form action="#" method="post" enctype="multipart/form-data" id="form">
                    <table  class="searchTable" >
                        <tr>
                            <td colspan="2" style="text-align: center;"><span  >查询：<input type="text" name="name" oninput="show(1)" style=" width:350px; height: 30px;" placeholder="搜索姓名，年龄，专业，联系方式，毕业院校，城市"></span></td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:100%; text-align: right ;margin-left:-25px; " >

                        <tr>
                            <td class="tdWidth">学历：
                                <select class="selectStyle" name="education" style="width:130px;">
                                    <option value="0">全部</option>
                                    <c:if test="${EducationList !=null}">

                                        <c:forEach var="edu" items="${EducationList}">
                                            <option <c:if test="${edu.id == education}">selected="selected"</c:if>
                                            value="${edu.id}">${edu.education}
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </td>
                            <td class="tdWidth">状态：
                                <select class="selectStyle" name="STATUS" style="width:130px;">
                                    <option value="0">全部</option>

                                    <c:if test="${consultStatusList !=null}">

                                        <c:forEach var="consultStatus" items="${consultStatusList}">
                                            <option <c:if test="${consultStatus.id == status}">selected="selected"</c:if>
                                            value="${consultStatus.id}">${consultStatus.status}
                                            </option>
                                        </c:forEach>
                                    </c:if>

                                </select>
                            </td>
                            <td class="tdWidth">咨询等级：
                                <select class="selectStyle" name="rank" style="width:130px;">
                                    <option value="0">全部</option>
                                    <c:if test="${rankList !=null}">
                                        <c:forEach var="ranktype" items="${rankList}">
                                            <option <c:if test="${ranktype.id == rank}">selected="selected"</c:if>
                                            value="${ranktype.id}">${ranktype.rank}
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </td>

                            <td class="tdWidth">咨询方式：
                                <select class="selectStyle" name="consultWay" style="width:130px;">
                                    <option value="0">全部</option>

                                    <c:if test="${consultWayList !=null}">

                                        <c:forEach var="OaScbConsultway" items="${consultWayList}">
                                            <option <c:if test="${OaScbConsultway.id == consultWay}">selected="selected"</c:if>
                                            value="${OaScbConsultway.id}">${OaScbConsultway.consultWay}
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </td>

                        </tr>

                        <tr>
                            <td class="tdWidth">上门：
                                <select class="selectStyle" style="width:130px;" name="come">
                                    <option value="0">全部</option>
                                    <option value="1">是</option>
                                    <option value="2">否</option>
                                </select>
                            </td>
                             <td class="tdWidth">信息来源：
                        <input type="text" list="url_list"  class="searchStyle" style="width:130px;" name="infoSource"/>
	                    <datalist id="url_list">
					    
					    <c:if test="${InfosourceList !=null}">
						
							<c:forEach var="info" items="${InfosourceList}">
								<option <c:if test="${info.id == infoSource}">selected="selected"</c:if>value="${info.infoSource}">
									${info.infoSource}
								</option>
							</c:forEach>
					    
					    </c:if>
                  		
                  		</datalist>
              	 	</td>

                            <td class="tdWidth">咨询量分类：
                                <select class="selectStyle" name="allotstatus" style="width:130px;">
                                    <option value="0">全部</option>
                                    <option value="1">常规</option>
                                    <option value="2">市场</option>
                                </select>
                            </td>

                            <td class="tdWidth">咨询课程：
                                <select class="selectStyle" name="consultLesson" style="width:130px;">
                                    <option value="0">全部</option>
                                    <c:if test="${consultLessonList !=null}">

                                        <c:forEach var="lesson" items="${consultLessonList}">
                                            <option <c:if test="${lesson.id == consultLesson}">selected="selected"</c:if>
                                            value="${lesson.id}">${lesson.consultLesson}
                                            </option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </td>
                        </tr>
                        <tr>

                        </tr>

                        <tr>
                            <td colspan="4"><input type="button" id="btn" value="搜索" class="searchBotton"/>
                        </tr>

                    </table>
                </form>
            </div>
            <hr>
            <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:70%;">
                <tr>
                    <td class="tdWidth">班主任:</td>
                    <td>
                    <select class="selectStyle" name="classteacher" style="width:130px;" id="classteacher"> 
                        <option value="0">请选择</option>
                         
                        <c:if test="${classteacherList !=null}">

                            <c:forEach var="classteacher" items="${classteacherList}">
                                <option 
                                value="${classteacher.emp_id}">${classteacher.emp_name}
                                </option>
                            </c:forEach>
                        </c:if>
                    </select>
                    &nbsp; &nbsp;&nbsp;
                    <input type="button"  value="移交班主任" onclick="handoutall('1',this)" class="searchBotton" /></td>
                </tr>
            </table>
        </div>
        <h1 class="tabTitle">基本信息</h1>
        <div class="divTable">
            <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
                <thead>
                <tr>
                    <th><input type="checkbox" id="all"/></th>
                    <th>序号</th>
                    <th>咨询者姓名</th>
                    <th>性别</th>
                    <th>年龄</th> 
                    <th>咨询方式</th>
                    <th>咨询课程</th>
                    <th>咨询量等级</th>
                    <th>回访时间</th>
                    <th>联系方式</th>
                    <th>城市</th>
                    <th>学历</th>
                    <th>专业</th>
                    <th>状态</th>
                    
                </tr>
                </thead>
                <tbody id="consulters">

                </tbody>

            </table>
            <div id="page"></div>

        </div>

    </div>
</div>

</body>
</html>

