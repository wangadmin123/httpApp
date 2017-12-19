var nameSA="";


	//访问控制器
	function empController(index){
		var query = $("#queryshowemp").serialize();	
			query+="&currentPageNo="+index;
			$.ajax({
				type:"post",//请求类型
				data:query,
				url:"employment_department/employmentdaiList",//请求的url
				dataType:"json",//ajax接口（请求url）返回的数据类型
				success: empList
			});
	}	
	
	function empController1(index){
		var query = $("#queryshowyiemp").serialize();	
			query+="&currentPageNo="+index;
			$.ajax({
				type:"post",//请求类型
				data:query,
				url:"employment_department/employmentyiList",//请求的url
				dataType:"json",//ajax接口（请求url）返回的数据类型
				success: empList1
			});
	}
		
	//提取分配数据
	function empList(data){
	   var currentPageNo = data.currentPageNo;
		var totalPageCount = data.totalPageCount;
		var totalCount = data.totalCount;
		var employmentList = data.employmentList;
		showEmpList(employmentList);
		page(currentPageNo,totalPageCount,totalCount);
	}
	
	
	function empList1(data){
		var currentPageNo = data.currentPageNo;
		var totalPageCount = data.totalPageCount;
		var totalCount = data.totalCount;
		var employmentList = data.employmentList;		
		showEmpList1(employmentList);
		page1(currentPageNo,totalPageCount,totalCount);
	}
	

	
	//显示就业数据
	function showEmpList(employmentList){
		
	 	$("#empList").html(""); 
		var options = "<tr><th>编号</th><th>姓名</th><th>班级</th><th>性别</th><th>年龄</th><th>身份证号</th><th>籍贯</th><th>联系方式</th><th>学历</th><th>意向城市</th><th>操作</th></tr>";
		for(var i = 0; i < employmentList.length; i++){
			var address= employmentList[i].employment_studentId.address==null? "":employmentList[i].employment_studentId.address ;
			var intentional_City=employmentList[i].employment_studentId.intentional_City==null ? "":employmentList[i].employment_studentId.intentional_City;
			options += "<tr><td>"+(i+1)+"</td><td>"+employmentList[i].employment_studentId.stu_name+"</td><td>"+employmentList[i].className+"</td><td>"+employmentList[i].employment_studentId.stu_sex+"</a></td>";
			if(employmentList[i].employment_studentId.stu_age!=null){
				options += "<td>"+employmentList[i].employment_studentId.stu_age+"</td>";
			}else{
				options += "<td></td>";
			}
			if(employmentList[i].employment_studentId.iD_number!=null){
				options += "<td>"+employmentList[i].employment_studentId.iD_number+"</td>";
			}else{
				options += "<td></td>";
			}
			options += "<td>"+address+"</td>";
			if(employmentList[i].employment_studentId.contact_way!=null){
				options += "<td>"+employmentList[i].employment_studentId.contact_way+"</td>"
			}else{
				options += "<td></td>";
			}
			if(employmentList[i].record!=null){
				options +="<td>"+employmentList[i].record+"</td>";
			}else{
				options += "<td></td>";
			}
			options +="<td>"+intentional_City+"</td>";
			if(nameSA=="校长"){
				options +="<td><span style='font-size:8px;color:#666;'>（当前用户只支持查看）</span></td></tr>";
			}else{
				options +="<td><a href='employment_department/logaddemployment?stuName="+employmentList[i].employment_studentId.stu_name+"&empNo="+employmentList[i].employment_id+"&stuid="+employmentList[i].employment_studentId.stu_Id+"' class='edit'>就业</a></td></tr>";
			}		
		}
		$("#empList").html(options);

	}
	
	
function showEmpList1(employmentList){
	 	$("#empyiList").html("");
		var options = "<tr><th>编号</th><th>姓名</th><th>班级</th><th>联系电话</th><th>就业时间</th><th>就业城市</th><th>就业单位</th><th>从事岗位</th><th>试用期薪资</th><th>转正薪资</th><th>福利待遇</th><th>操作</th></tr>";
		for(var i = 0; i < employmentList.length; i++){
			var time= employmentList[i].employment_time==null? "无":employmentList[i].employment_time ;
			var ssal=employmentList[i].employment_Salary_probation==null ? "无":employmentList[i].employment_Salary_probation;
			var zsal=employmentList[i].employment_Salary_worker==null ? "无":employmentList[i].employment_Salary_worker ;
			options += "<tr><td>"+(i+1)+"</td><td>"+employmentList[i].employment_studentId.stu_name+"</td><td><a href='employment_department/logEmpstatistic?claName="+employmentList[i].className+"'>"+employmentList[i].className+"</a></td>";
			if(employmentList[i].employment_studentId.contact_way!=null){
				options +="<td>"+employmentList[i].employment_studentId.contact_way+"</td>";
			}else{
				options +="<td></td>";
			}
			options +="<td>"+time+"</td>"
				+"<td>"+employmentList[i].employment_city+"</td><td>"+employmentList[i].employment_unit+"</td>"
				+"<td>"+employmentList[i].employment_engaged+"</td><td>"+ssal+"</td>"
				+"<td>"+zsal+"</td><td>"+employmentList[i].employment_welfare+"</td>";	
			if(nameSA=="校长"){
				options +="<td><span style='font-size:8px;color:#666;'>（当前用户只支持查看）</span></td></tr>";
			}else{
				options +="<td><a href='employment_department/logupEmployment?empid="+employmentList[i].employment_id+"&stuName="+employmentList[i].employment_studentId.stu_name+"&stuNo="+employmentList[i].employment_studentId.stu_Id+"' class='edit'>编辑</a></td></tr>";
			}
		}
		$("#empyiList").html(options);

	}
	
	//分页
	function page(currentPageNo,totalPageCount,totalCount){
		   $("#page").html("");
		
		  if(totalPageCount !=0){ var options="";
		   var indexPage =parseInt(currentPageNo);
		   options+="<span><a href='javascript: onclick=empController(1)'>首页</a></span>";
		   if(currentPageNo !=1){
			   options+="<span><a href='javascript: onclick=empController("+(indexPage-1)+")'>上一页</a></span>";			   
		   }

		   for(var i = 1; i <= totalPageCount; i++){
			   options+="<span><a href='javascript: onclick=empController("+i+")'>"+i+"</a></span>";
		   }   
		   
		   if(currentPageNo != totalPageCount){
			   options+="<span><a href='javascript: onclick=empController("+(indexPage+1)+")'>下一页</a></span>";
			   			   
		   }
		   options+="<span><a href='javascript: onclick=empController("+totalPageCount+")'>最后一页</a></span>";
	
		   options+="当前第"+currentPageNo+"页，共"+totalPageCount+"页";
		   $("#page").html(options);}
		  else{$("#page").html("共0页");}
	}
	
	
	
	       function page1(currentPageNo,totalPageCount,totalCount){
		   $("#page1").html("");
		
		   if(totalPageCount !=0){
		   var indexPage =parseInt(currentPageNo);
		   var   options="<span><a href='javascript: onclick=empController1(1)'>首页</a></span>";
		   if(currentPageNo !=1){
			   options+="<span><a href='javascript: onclick=empController1("+(indexPage-1)+")'>上一页</a></span>";			   
		   }

		   for(var i = 1; i <= totalPageCount; i++){
			   options+="<span><a href='javascript: onclick=empController1("+i+")'>"+i+"</a></span>";
		   }   
		   
		   if(currentPageNo != totalPageCount){
			   options+="<span><a href='javascript: onclick=empController1("+(indexPage+1)+")'>下一页</a></span>";
			   			   
		   }
		   options+="<span><a href='javascript: onclick=empController1("+totalPageCount+")'>最后一页</a></span>";
	
		   options+="当前第"+currentPageNo+"页，共"+totalPageCount+"页";
		   $("#page1").html(options);}
		   else{$("#page1").html("共0页");}
	}
	
	
	
	
	 
	       
    
	//页面加载数据提交数据
       		$(function(){
       			nameSA=$("input#xiaozhang").val();
			empController(1);
			empController1(1);
			
			$("#queryclickemp").click(function(){
			empController(1);
			});	
			$("#queryyiemp").click(function(){
				
				empController1(1);
				});	
			
			
			$("#sname1").keyup(function(){
				
				empController(1);
		    });
			
			
            $("#sname2").keyup(function(){
				
				empController1(1);
		    });
			
			

});
	
	
	
	
	