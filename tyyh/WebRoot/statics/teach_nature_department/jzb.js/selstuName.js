$(function(){
	$(".selnamestu").on("click",function(){
		alert("a");
			/*alert(selValue.length);*/
		/*var datatime=document.getElementsById("Datatime").valueOf();*/
	var gradeid= document.getElementById("aaa").value;
		
		//显示数据

		$.ajax({
			type:"get",
			url:"/tyyh/selnamestu",
			data:{"gradeid":gradeid},
			dataType:"json",
			success:function(data){
			
				$("#nullgrade").html("");
					var firstTr="<tr><th>学号</th><th>姓名</th><th>上午出勤</th>  <th>下午出勤</th><th>单词</th><th>上机</th><th>晚自习出勤</th><th>备注</th></tr>";
					var table = "";
					for(var i = 0; i <data.length; i++){
					
						table +=
							
							"<tr>"+
							"<td style='width: 150px;'><input type='text'  value="+data[i].student_id+"  readonly='readonly'  name='student_id'  style='border: none';></td>"+
							"<td style='width: 150px;'><input type='text'  value="+data[i].name+"  readonly='readonly'  name='Name'  style='border: none';></td>" +
							"<td><select name='amturn'><option>√</option><option>０</option><option>￠</option><option>×</option><option>#</option><option>Δ</option></select></td>" +
							"<td><select name='pmturn'><option>√</option><option>０</option><option>￠</opti	on><option>×</option><option>#</option><option>Δ</option></select></td>" +
									"<td style='width: 150px;'><input type='text' class='' name='word'  style='border: none;'placeholder='单词正确数'></td>" +
									"<td style='width: 150px;'><input type='text' name='OBU' class='' style='border: none;'placeholder='上机正确数'></td>" +
									"<td><select name='night'><option>√</option><option>０</option><option>￠</option><option>×</option><option>#</option><option>Δ</option></select></td>" +
									"<td   style='width: 150px;'><input type='text'  class='' name='remarks' style='border: none; 'placeholder='备注'></td>" ;
									
					}
					$("#nullgrade").html(firstTr+table);
				
			},error:function(data){
				alert("错误呀")
	/*$("#dbsb").empty(); 
				
				var str="<tr><th>学号</th><th>姓名</th><th>上午出勤</th><th>下午出勤</th><th>单词</th><th>上机</th><th>晚自习</th><th>备注</th><th>时间</th></tr>";
				$("#dbsb").html(str);*/
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