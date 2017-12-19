
var path = $("#path").val();	
$(function(){
			$(".gradeonclick").on("click",function(){
			
				var obj = $(this);
				var uid = obj.attr("gradelistid");
					$.ajax({
						type:"post",
						url:path+"/selectstudentlist/"+uid,
						dataType:"text",
						success:function(data){	
//							$(".dowetable").html("");
//						
//					     	$(".dowetable").html(data);
							    $(".dowetable").html(data);
							    var selector=$(".dowetable");
							    data.appendTo(selector);
							
						}
						
					});
			});
		});