<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<base href="<%=basePath%>">
<script type="text/javascript" src="statics/develop_department/js/jquery-1.8.3.js"></script>
<title>Insert title here</title>

<style type="text/css">
#gray{width:100%;height:100%;background:rgba(0,0,0,0.3);position:fixed;top:0px;display:none;z-index:99;}
.model{
	position: fixed;
    border: 1px solid #e5e5e5;
    width: 500px;
    height:auto;
    padding-top:30px;
    display: none;
    z-index: 9999;
    background-color: #fff;
    text-align:center;

}

#showgroupuser td{
height: 40px;
text-align:center;  
}
#content div{
float: left;
}
#group td:first-child{
width: 40px;
height: 40px;
text-align:center;  
}
#group td:nth-child(2){
width: 180px;
height: 40px;
text-align:center;  
}

#userdiv_0 select{
font-size:25px;
width:300px;
height:450px; 
float:left; 
border:4px #A0A0A4 outset; 
padding:4px; 
}
.btn{
    background-color: #44bb00;
    width: 80px ;           
	height:40px ;
    line-height: 30px;
    text-align: center;
    color: #fff;
    font-size: 12px;
    font-weight: bold;
    border: 0px;
    border-radius: 3px;
 	margin: 40px 10px 30px 20px;
    }
</style>
<script type="text/javascript">
	$(function() {
		$("#userdiv").hide();
		showgroup();
		showuser();
		/* 单击保存分组 */
		$("#save_group").click(function() {
			var groupid=$("input[name='choosegroup']:checked").val();		
			if(groupid==undefined){
				alert("没有选组");
				return false;
			}
			var users="";
			$.each($("#select2 option"),function(){
				users+=$(this).val()+"-";
			});
			 users=users.substring(0,users.length-1);
			 if(users==""){
					alert("没有选中员工");
					return false;
				}
				$.ajax({
					url:"${pageContext.request.contextPath}/KfbUser/GroupUser",
					type:"POST",
					data:{"groupid":groupid,"users":users},
					success:function(result){
						//console.log(result);
						showuser();
					}
					});
		});

		//窗口效果		
		$("#add_group").click(function(){
			$("#gray").show();
			$("#popup_add").show();//查找ID为popup的DIV show()显示#gray
			tc_center();
		});
		/* 修改分组信息 */
		$("#update_group").click(function() {
			var groupid=$("#userdiv h3").attr("group-id");
			update_group(groupid);
			
				$("#gray").show();
				$("#popup_update").show();
				tc_center();
			});
	
		//点击关闭按钮
		$(".guanbi").click(function(){
			close_model();
			return false;
		})
		function close_model() {
			$("#gray").hide();
			$("#popup_add").hide();
			$("#popup_update").hide();
		}
		/* 修改分组 */
		$("#update_group_btn").click(function() {
			var params=decodeURIComponent($("#update_group_form").serialize(),true);
			//alert(params);
			$.ajax({
				url:"${pageContext.request.contextPath}/KfbGroup/updateGroup",
				type:"POST",
				data:params,
				success:function(result){
					console.log(result);
					//alert(result.msg);
					showGroupInfo(result.extend.groupid);
					showgroup();
				}
				}); 
			close_model();
			return false;
		});
		/* 增加分组 */
		$("#add_group_btn").click(function() {
			
			var params=decodeURIComponent($("#add_group_form").serialize(),true);
			$.ajax({
				url:"${pageContext.request.contextPath}/KfbGroup/addGroup",
				type:"POST",
				data:params,
				success:function(result){
					//console.log(result);
					//alert(result.msg);
				}
				});
		});
		/* 删除小组 */
		$("#delete_group").click(function() {
			var groupid =$("#userdiv h3").attr("group-id");
			$.ajax({
				url:"${pageContext.request.contextPath}/KfbUser/findGroup/"+groupid,
				type:"POST",
				success:function(result){
					var size=result.extend.size;
					var gid=result.extend.groupid
					if(size==0){
						$.ajax({
							url:"${pageContext.request.contextPath}/KfbGroup/deleteGroup/"+gid,
							type:"POST",
							success:function(data){
								showgroup();
								showuser();
								$("#userdiv").hide();
								$("#userdiv_0").show();
								}
						});
					}else{
						alert("该小组内还有成员，不能删除");
					}
				}
				});
			});
	});
	

	$(document).on("click",".tddela",function() {
		var id=$(this).parents("tr").find("td:eq(0)").text();
		var stuid=$(this).parents("tr").find("td:eq(1)").text();
		$.ajax({
				url:"${pageContext.request.contextPath}/KfbUser/remove/"+id+"/"+stuid,
				type:"POST",
				success:function(result){
					showuser(); 
				}
				});	
		
		$(this).parents("tr").remove();
	});
	/* 显示小组情况 */
	$(document).on("click",".tda",function() {
		var groupid=$(this).parent().attr("grou-id");
		if(groupid=="0"){
			$("#userdiv").hide();
			$("#userdiv_0").show();	
		}else{
			showGroupInfo(groupid);	
		}
	});
	function showGroupInfo(groupid) {
		$.ajax({
			url:"${pageContext.request.contextPath}/KfbUser/InsertUserFromStu/"+groupid,
			type:"POST",
			success:function(result){
				//console.log(result);
				$("#userdiv_0").hide();
				$("#userdiv").show();
				$("#showgroupuser tbody").empty();
				$("#showgroupuser").show();
				var group = result.extend.users;
				$("#userdiv h3").empty().append("该小组任务为："+result.extend.Group.module)
				.attr("group-id",result.extend.Group.id);
				if(group.length==0){
					$("#showgroupuser").hide();
				}else{
				$.each(group, function(index, item) {
					var IdTD=$("<td></td>").append(item.id);
					
					var StuidTD=$("<td></td>").append(item.stu_id);
					var StuNameTD=$("<td></td>").append(item.stu_name);
					var GroupTD=$("<td></td>").append(item.groupname);
					var JobTD=$("<td></td>").append(item.jobname);
					var czTD=$("<td></td>").append("<a href='javascript:void(0)' class='tddela'>从该组移除</a>");
					$("<tr></tr>").append(IdTD).append(StuidTD).append(StuNameTD).append(GroupTD).append(JobTD).append(czTD).appendTo("#showgroupuser tbody");			
				});
				}
			}
			});
	}
		/* 显示开发部小组 */
	function showgroup() {
		$.ajax({
			url:"${pageContext.request.contextPath}/KfbGroup/getsxgroup",
			type:"GET",
			success:function(result){	
				//console.log(result);
				$("#group").empty();
				var group=result.extend.groups;
				$("<tr><td>#</td><td grou-id=0><a href='javascript:void(0)' class='tda'>未分组</a></td></tr>").appendTo("#group");
				$.each(group,function(index,item){
					var groupTD=$("<td></td>").append("<a href='javascript:void(0)' class='tda'>"+item.groupname+"</a>").attr("grou-id",item.id);
					var radioTD=$("<td></td>").append("<input name='choosegroup' type='radio' value='"+item.id+"'/>");
					$("<tr></tr>").append(radioTD).append(groupTD).appendTo("#group");
				});
			}
		});
	}
		/* 显示未分组的人员信息 */
	function showuser() {
		$.ajax({
			url:"${pageContext.request.contextPath}/KfbUser/getUserNoGroup",
			type:"GET",
			success:function(result){	
				//$("#userdiv").empty();
				$("#select1").empty();
				$("#select2").empty();
				var user=result.extend.users;
				$.each(user,function(index,item){
					var useroption=$("<option value='"+item.id+"'></option>").append(item.stu_name).appendTo("#select1");
				});
			}
		});
	}
	function update_group(groupid) {
		$.ajax({
			url:"${pageContext.request.contextPath}/KfbUser/update_group/"+groupid,
			type:"POST",
			success:function(result){
				console.log(result);
				$("#update_job_tab tbody").empty();
				var groups=result.extend.group;
				var user=result.extend.users;
				var job= result.extend.jobs;
				$("#groupid").attr("value",groups.id);
				$("#groupname").attr("value",groups.groupname);
				$("#module").attr("value",groups.module);
				$.each(user,function(index,item){
				    var Jobselect=$("<select name='job'></select>");
					$.each(job,function(index1,item1){
						$("<option></option>").append(item1.jobname).attr("value",item1.id).appendTo(Jobselect);
					});
					var IdTd=$("<td></td>").append(item.id).append("<input type='hidden' name='userid' value="+item.id+">");
					var stuTd=$("<td></td>").append(item.stu_id).append($("<input/>").attr("type","hidden").attr("name","stu_id").attr("value",item.stu_id));
					var NameTd=$("<td></td>").append(item.stu_name);
					var JobTd=$("<td></td>").append(Jobselect.val(item.jobid));
					$("<tr></tr>").append(IdTd).append(stuTd).append(NameTd).append(JobTd).appendTo("#update_job_tab tbody");
				})
			}
		});
	}
	//下拉框交换JQuery
	$(function(){
	    //移到右边
	    $('#add').click(function() {
	    //获取选中的选项，删除并追加给对方
	        $('#select1 option:selected').appendTo('#select2');
	    });
	    //移到左边
	    $('#remove').click(function() {
	        $('#select2 option:selected').appendTo('#select1');
	    });
	    //全部移到右边
	    $('#add_all').click(function() {
	        //获取全部的选项,删除并追加给对方
	        $('#select1 option').appendTo('#select2');
	    });
	    //全部移到左边
	    $('#remove_all').click(function() {
	        $('#select2 option').appendTo('#select1');
	    });
	    //双击选项
	    $('#select1').dblclick(function(){ //绑定双击事件
	        //获取全部的选项,删除并追加给对方
	        $("option:selected",this).appendTo('#select2'); //追加给对方
	    });
	    //双击选项
	    $('#select2').dblclick(function(){
	       $("option:selected",this).appendTo('#select1');
	    });
	});


	//窗口水平居中
	function tc_center(){
		var _top=($(window).height()-$(".model").height())/2;
		var _left=($(window).width()-$(".model").width())/2;
		$(".model").css({top:_top,left:_left});
	}	

</script>

</head>
<body>

	<h2>小组管理</h2>
	<hr />
	<div id="content">
		<div id="groupdiv">
		
				<table border="1" cellspacing="0" id="group">
				</table>
			</div>
		<div style='width:0px;border: 1px solid #9A9A9A;background-color:#9A9A9A; height:500px; margin:-10px 20px ;'></div>
		  <div id="userdiv" style="width: 75%;">
		<h3></h3><button class="btn" id="update_group">修改</button><button class="btn" id="delete_group">删除</button>
		<div class="model" id="popup_update">
		<form id="update_group_form">
			<input type="hidden" name="id" id="groupid"/>
			<p>小组名称<input type="search" name="groupname" id="groupname"/></p>
			<p>小组任务<input type="search" name="module" id="module"/></p>
			<table id="update_job_tab" border="1" cellspacing="0" style="width: 80%;margin:auto;">
			<thead><tr><th>ID</th><th>学号</th><th>姓名</th><th>职务</th></tr></thead>
			<tbody></tbody>
			</table>
			<p><button class="guanbi btn">关闭</button><button id="update_group_btn" class="btn">保存</button></p>
		</form>
		</div>
			<table border="1" cellspacing="0" style="width: 100%;" id="showgroupuser">
			<thead>
				<tr>
				<th> </th>
				<th>学号</th>
				<th>姓名</th>
				<th>组名</th>
				<th>职务</th>
				<th>操作</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
			</table>
			</div>
		 <div id="userdiv_0">
		 	<div>
        <div>
          <select multiple="multiple" id="select1" >  
          </select>
        </div>
        <div> <span id="add">
          <input type="button" class="btn" value=">"/>
          </span><br />
          <span id="add_all">
          <input type="button" class="btn" value=">>"/>
          </span> <br />
          <span id="remove">
          <input type="button" class="btn" value="<"/>
          </span><br />
          <span id="remove_all">
          <input type="button" class="btn" value="<<"/>
          </span> </div>
        <div>
          <select multiple="multiple" id="select2" >
          </select>
         
        </div>
                <button class="btn" id="save_group">保存</button></br>
                <button class="btn" id="add_group">增加组</button></div>
        <div>
        </div>
      </div>
		 </div>
		 <div id="gray"></div>
		<div class="model" id="popup_add">
		<form id="add_group_form">
			<p>请输入小组名称<input type="search" name="groupname" id="groupname"/></p>
			<p>请输入小组任务<input type="search" name="module"/></p>
			<p><input type="hidden" name="stageid" value="1"/></p>
			<p><button class="guanbi btn">关闭</button><button id="add_group_btn" class="btn">保存</button></p>
		</form>
		</div>
</body>
</html>