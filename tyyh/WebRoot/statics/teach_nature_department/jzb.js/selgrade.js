$(function(){
	$("#selgrad").click(function(){
		
		
		/*var datatime=document.getElementsById("Datatime").valueOf();*/
		var datatime=document.getElementById("datatime").value;
		
		
		//显示数据

		
		
	$.ajax({
		
			type:"get",
			url:"/tyyh/seltime",
			
			data:{"Datatime":datatime},
			dataType:"json",
			success:function(data){
				$("#dbsb").empty();
				$("#dbsb").append("<tr><th>学号</th><th>姓名</th><th>上午出勤</th><th>下午出勤</th><th>单词</th><th>当天课时</th><th>备注</th><th>时间</th></tr>");/* <th>操作</th> */
				for(var i = 0; i< oaJzbGradedatas.length; i++){
				var ambool=true;
				var pmbool=true;
				var tables="<tr><td>"+oaJzbGradedatas[i].stu_number+" </td><td>"+ oaJzbGradedatas[i].stu_name+"</td>";
				for(var j = 0; j< stuDks.length; j++){
					if(stuDks[j].stu_id==oaJzbGradedatas[i].student_id){
						if(stuDks[j].am_dk!=null||stuDks[j].am_dk!=""){
							tables=tables+"<td>"+ stuDks[j].am_dk +"</td>";
							ambool=false;
						}
						if(stuDks[j].pm_dk!=null||stuDks[j].pm_dk!=""){
							tables=tables+"<td>"+ stuDks[j].pm_dk +"</td>";
							pmbool=false;
						}
					}
				}
				if(ambool){
				tables=tables+"<td>"+ oaJzbGradedatas[i].amturn +"</td>";
				}
				if(pmbool){
				tables=tables+"<td>"+ oaJzbGradedatas[i].pmturn +"</td>";
				}
				var tables=tables+"<td>"+ oaJzbGradedatas[i].word +"</td><td>"+ oaJzbGradedatas[i].classHour +"</td><td>"+ oaJzbGradedatas[i].remarks +"</td><td>" + oaJzbGradedatas[i].time + " </td></tr>";
						/*if(fals1[i]){
						$("#dbsb").append("<tr><td>"+oaJzbGradedatas[i].stu_number+" </td><td>"+ oaJzbGradedatas[i].stu_name+"</td><td>"+ oaJzbGradedatas[i].amturn +"</td><td>"+ oaJzbGradedatas[i].pmturn +"</td><td>"+ oaJzbGradedatas[i].word +"</td><td>"+ oaJzbGradedatas[i].classHour +"</td><td>"+ oaJzbGradedatas[i].remarks +"</td><td>" + oaJzbGradedatas[i].time + " </td></tr>");
						}else{
						$("#dbsb").append("<tr><td>"+oaJzbGradedatas[i].stu_number+" </td><td>"+ oaJzbGradedatas[i].stu_name+"</td><td>"+ oaJzbGradedatas[i].amturn +"</td><td>"+ oaJzbGradedatas[i].pmturn +"</td><td>"+ oaJzbGradedatas[i].word +"</td><td>"+ oaJzbGradedatas[i].classHour +"</td><td>"+ oaJzbGradedatas[i].remarks +"</td><td>" + oaJzbGradedatas[i].time + " </td></tr>");/* <td><a href=\"toupdateGradeData?id=" + oaJzbGradedatas[i].student_id +"&time=" + oaJzbGradedatas[i].time + "\" >编辑</a></td> */
						/*}*/
				$("#dbsb").append(tables);
				}
		  	}
			},error:function(data){
	$("#dbsb").empty(); 
				
				var str="<tr><th>学号</th><th>姓名</th><th>上午出勤</th><th>下午出勤</th><th>单词</th><th>上机</th><th>晚自习</th><th>备注</th><th>时间</th></tr>";
				$("#dbsb").html(str);
			}
		});
		//接收数据
		
		
			/*$(this).addClass("spanHover");
			$(this).siblings().removeClass("spanHover");
			$(this).siblings().addClass("spanOut");
			
			var $text=$(this).text();
			$("h1").text($text);
			
			$(".divTable").hide();
			$(".divTable").eq($(this).index()).show();
			
			*/
			
		    
	});
	
	 

});