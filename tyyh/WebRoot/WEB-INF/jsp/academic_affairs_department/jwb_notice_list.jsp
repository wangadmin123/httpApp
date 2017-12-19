<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html >
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css"
	href="statics/common/css/index.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/insert.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/all.css">
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/formStyle.css" />
<link rel="stylesheet" type="text/css" href="statics/common/css/add.css" />
<link rel="stylesheet" type="text/css"
	href="statics/common/css/switch.css">
<link rel="stylesheet" type="text/css"
	href="statics/common/css/popup.css" />
<link rel="stylesheet" type="text/css" href="statics/common/css/zt.css">
<script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="statics/common/js/globle.js"></script>
<script type="text/javascript" src="statics/common/js/tab.js"></script>
<script type="text/javascript" src="statics/common/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="statics/human_resource_department/js/getSimpleName.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/formShow.js"></script>
<style type="text/css">
.tabs{
	height:200px";

}


.div1{border:1px solid #000;
	width:100px;height:150px";
	position:absolute;
padding: 5px;
}
.div2{border:1px solid #000;
	width:100px;height:150px";
    margin-left:190px;
    /* margin-top: 50px; */ 
    position:absolute;
    left:120px;top:55px;
    padding: 5px;
}
.div3{
width:20px;
height:20px;
border-radius:10px;
border:solid rgb(20,20,20) 1px;;
background-color:red;
color:#fff;
text-align:center;
line-height: 20px; 
display: none;
 position:absolute;left:75%;top:10%;

}
.div1:hover,.div2:hover {
            color: #fff;
            border-color: #b1b0b0;
            background: #b1b0b0;
            border: none;
        }
.start
        {
            cursor: pointer;
        }

        .end
        {
            cursor: pointer;
            color: #fff;
            background: #b1b0b0;
            border: none;
        }
</style>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="js/formShow.js"></script>
<script type="text/javascript" src="layer-v3.0.1/layer/layer.js"></script>
<script type="text/javascript">

$(function(){

getNoticeCountBytime();

 $(function () {
    //加载事件
        var collection = $(".flag");
        $.each(collection, function () {
            $(this).addClass("start");
        });
    });
    //单击事件
    function dj(dom) {
        var collection = $(".flag");
        $.each(collection, function () {
            $(this).removeClass("end");
            $(this).addClass("start");
        });
        $(dom).removeClass("start");
        $(dom).addClass("end");
    }
	$(".spanclick").click(function() {
		var status=$(this).attr("status");
		var user_id=$("#user_id").val();
		
         /* alert("user_id:"+user_id); */
		if(status==2){
		 location.href="Employee/ydNotice_add.html?user_id="+user_id;
		}
		if(status==1){
		 location.href="Employee/wdNotice_add.html?user_id="+user_id;
		}
		
		/* $.ajax({
		url:"${pageContext.request.contextPath}/Employee/getnotice/"+status,
		type:"POST",
		success:function(result){	
			//console.log(result);
			$("#content tbody").empty();
			var notice=result.extend.notices;
			$.each(notice,function(index,item){
				var user_nametd=$("<td></td>").append(item.user_name);
				var titletd=$("<td></td>").append(item.title);
				var fstimedtd=$("<td></td>").append(item.fstime);
				var deletetd=$("<td></td>").append(item.id);
				$("<tr></tr>").append(user_nametd).append(titletd)
				.append(fstimedtd).append(deletetd).appendTo("#content tbody");
			}); 
		
		}
	});*/
	});
	
});

function cot(){
/* 	alert("aaaaaaaaaaaaaaaaaaaaa"); */
 	$.ajax({
		url:"${pageContext.request.contextPath}/Employee/wdNoticeCount.html/",
		type:"POST",
		success:function(result){	
			if(result!=0){
			$("#ct").show();
			}
			$("#ct").html(result);
		}
	}); 
}


function sc(notice_uid,iid){
	layer.open({
			type:1,
			title:'删除',
			area: ['400px', '200px'],
			time : 0, //不自动关闭
			btn : [ '确定', '取消' ],
			yes : function(index) {
				layer.close(index);
				location.href="deleteEmailstart?id="+id+"&dd="+dd+"&iid="+iid;
			},
			content:'<p style="text-align:center;font-size: 24px">确认要删除吗？</p>'
		});	
		

}

function getNoticeCountBytime(){
 setInterval(function(){cot();},500);
 }
</script>

</head>

<body style="width:98%;" >
    <br/>
	<div class="titleStyle">&nbsp;&nbsp;  通知提醒列表</div>
	<br/>
	<div class="page-table">
	

	
	
	
	<div class="tabs">
				<input class="user_id" type="hidden"  id="user_id"  name="user_id" value="${user_id}">
				<div class="flag div1 spanclick" onclick="dj(this);" status="2">已读通知</div> 
				<div class="flag div2 spanclick" onclick="dj(this);" status="1">未读通知
				<div class="div3" id="ct" ></div>
				
				</div> 
			</div>
			<table id="content" border="1" cellpadding="0" cellspacing="0">
				<thead>
				<tr>
					<th width="10%" >发件人</th>
					<th width="10%">标题</th>
					
					<th width="10%">发送时间</th>
					<th width="10%">操作</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${noticeList}" var="em">
					<tr style="height: 80px">
						<td>
							${em.user_name}
						</td>
						<td>${em.title}</td>
						
						<td>
							<fmt:formatDate value="${em.fstime}" pattern="yyyy-MM-dd hh:mm:ss" />
						</td>
						<td><a href="Employee/xqNotice.html?id=${em.id }&&user_id=${user_id}">详情</a>
						<%-- <a href="#" onclick="sc('${em.notice_uid}','${em.id}')">删除</a> --%>
							
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	<%-- 	<div class="page-style">
			<c:if test="${pgyd.pageCount>1 }">
				<div class="page-left">
					<span>
						<a href="selectAllEmailstartRead?no=1&id=${admin.countyinfo.cid }" class="pagehover">&lt;首页</a>
					</span> 
					<span>
						<c:if test="${pgyd.pageyema==1}">
							<a href="selectAllEmailstartRead?no=1&id=${admin.countyinfo.cid }" class="pagehover">&lt;上一页</a>
						</c:if>
						<c:if test="${pgyd.pageyema>1}">
							<a href="selectAllEmailstartRead?no=${pgyd.pageyema-1}&id=${admin.countyinfo.cid }" 
							class="pagehover">&lt;上一页</a>
						</c:if>
					</span>
						<c:forEach begin="1" end="${pgyd.pageCount }" var="s">
	    				<a href="selectAllEmailstartRead?no=${s }&id=${admin.countyinfo.cid }" class="numhover">${s }</a>
	    				</c:forEach>
					<span>
						<c:if test="${pgyd.pageyema==pgyd.pageCount}">
							<a href="selectAllEmailstartRead?no=${pgyd.pageCount }&id=${admin.countyinfo.cid }"
							class="pagehover">下一页&gt;</a>
						</c:if>
						<c:if test="${pgyd.pageyema<pgyd.pageCount}">
							<a href="selectAllEmailstartRead?no=${pgyd.pageyema+1 }&id=${admin.countyinfo.cid }"
							class="pagehover">下一页&gt;</a>
						</c:if>
					</span>
					<span>
						<a href="selectAllEmailstartRead?no=${pgyd.pageCount }&id=${admin.countyinfo.cid }"
						class="pagehover">尾页&gt;</a>
					</span>
				</div>
			</c:if>
			<c:if test="${pgyd.totalCount>0}">
				<div class="page-right">
					当前页数：
					${pgyd.pageyema }
					/
					${pgyd.pageCount}
					&nbsp;共
					${pgyd.totalCount}
					条记录 &nbsp;每页显示5条记录
				</div>
			</c:if>
		</div> --%>
		<c:if test="">
			<h1 style="margin-left:300px;"><img src="images/zwsj.png"/></h1>
		</c:if>
</body>
</html>
<!-- class="page-left" -->