<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

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

    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popup-notsee.css"/>
    <link rel="stylesheet" type="text/css" href="statics/common/cssstyle/popups.css"/>

    
    <script type="text/javascript" src="statics/common/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/common/js/index.js"></script>
    <script type="text/javascript" src="statics/common/js/globle.js"></script>
    <script type="text/javascript" src="statics/common/laydate/laydate.js"></script>
    <script type="text/javascript">
    	function check(){
    		var excel_file = $("#daoru").val();
    		if(excel_file == "" || excel_file.length==0){
    			alert("请选择文件路径");
    			return false;
    		}else if(excel_file.lastIndexOf('.xls')==-1){
    			alert("上传文件格式不符，请上传Excel文档！");
    			return false;
    		}else{
    			upload();
    			return true;
    		}
    	
    	}
    	
    	function  upload() {
    	 var filefile = document.getElementById("daoru");
         var filePath = filefile.value;
			var formData = new FormData($("#upload")[0]);
			formData.append("filePath",filePath);
			$.ajax({
				url:"director/upload",
				type:"POST",
				data:formData,
				async: false,
				cache:false,
				contentType:false,
				processData:false,
				dataType:"text",
				success:function(){
				
					alert("导入成功！");
					
					window.location.href="director/historyCon";
				},
				error:function(){
					alert("导入失败！请检查Excel表中的数据");
				}
			});
		}
		   
    </script>

</head>
<body>
<div class="rightContent">
	<div class="tabContent">
    <div class="serach" id="file">
         <form id="upload"  onsubmit="return check()"   enctype="multipart/form-data">
	         <table cellpadding="0"   cellspacing="0"  class="searchTable" border="0" style="width:60%;  " >
	         	 <tr>
	 				<td class="tdWidth" ><input type="file"  id="daoru"  name="file"></td>
	 				<td><input type="submit" value="导入Excel" class="searchBotton" id="daoru_btn"></td>
	            </tr>
			</table>
			<input  type="hidden"    id="filePath"   name="filePath"/>
        </form>
    </div>

   <!--  <div class="divTable">
      <table cellpadding="0" cellspacing="0" border="0" class="selectTable">
        <thead>
        	<tr>
         		<th>序号</th>
				<th>时间</th>
				<th>咨询师姓名</th>
				<th>咨询方式</th>
				<th>咨询课程</th>
				<th>咨询量等级</th>
				<th>咨询者姓名</th>
				<th>性别</th>
				<th>年龄</th>
				<th>联系方式</th>
				<th>QQ/微信</th>
				<th>城市</th>
				<th>区域</th>
				<th>学历</th>
				<th>专业</th>
				<th>状态</th>
				<th>信息来源</th>
				<th>关键词</th>
        	</tr>
		</thead>
		<tbody id="consulters">
		
		
	     </tbody>
     </table>
     
	  <div id="page"></div>
   
    </div> -->

  </div>
</div>
	
</body>

</html>
