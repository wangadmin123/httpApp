
    
    	//绘制饼图  
       function drawCircle(canvasId, data_arr, color_arr, text_arr){  
    	   var c = document.getElementById(canvasId);  
           var ctx = c.getContext("2d");  
           ctx.font="1px Georgia";
           var radius = c.height / 2 - 10; //半径  
           var ox = radius + 10, oy = radius + 10; //圆心  
           var width = 15, height = 15; //图例宽和高  
           var posX = ox * 2 + 10, posY = 15;   //  
           var textX = posX + width + 5, textY = posY + 10;  
           var startAngle = 0; //起始弧度  
           var endAngle = 0;   //结束弧度  
           for (var i = 0; i < data_arr.length; i++)  
           {  
               //绘制饼图  
               endAngle = endAngle + data_arr[i] * Math.PI * 2; //结束弧度  
               ctx.fillStyle = color_arr[i];  
               ctx.beginPath();  
               ctx.moveTo(ox, oy); //移动到到圆心  
               ctx.arc(ox, oy, radius, startAngle, endAngle, false);  
               ctx.closePath();  
               ctx.fill();  
               startAngle = endAngle; //设置起始弧度  

               //绘制比例图及文字  
               ctx.fillStyle = color_arr[i];  
               ctx.fillRect(posX, posY + 20 * i, width, height);  
               ctx.moveTo(posX, posY + 10 * i);  
               ctx.font = 'bold 1px ';    //斜体 30像素 微软雅黑字体  
               ctx.fillStyle = color_arr[i]; //"#000000";  
               
               
               
               var percent = text_arr[i] + "：" +Math.round(100 * data_arr[i])+ "%";  
     /*          Math.round( landedEmp/ classSizeCount * 10000) / 100.00+"%"; */     
               ctx.fillText(percent, textX, textY + 20 * i);  
           }  
       }  

  

       		//访问控制器
       		function empController(){
       			var query = $("#statQuery").serialize();	
       				$.ajax({
       					type:"post",//请求类型
       					url:"employment_department/empstatistic?",//请求的url
       					dataType:"json",//ajax接口（请求url）返回的数据类型
       					data:query,
       					success: empList,
       					error:function(data){//当访问时候，404，500 等非200的错误状态码
       						alert("加载就业信息失败！");
       					}
       				});
       		}
       		
       		var classCount=0;
       		//提取分配数据
       		function empList(data){      			
       			var empStatusCount = data.empStatusCount; 
       			var classSizeCount = data.classSizeCount; 
       			
       			var empCityCount = data.empCityCount;
       			var empCity =data.empCity;
       			var record =data.record;      			
       			var empRecordCount =data.empRecordCount;
       			var empSalCount = data.empSalCount;
       			var empSalCheck = data.empSalCheck;
       			var empStuAgeCount=data.empStuAgeCount;       			
       			var empStuAgeCheck=data.empStuAgeCheck;      		
       			var empStatTalk =new Array();
       			empStatTalk[0]=empCity;
       			empStatTalk[1]=record;
       			empStatTalk[2]=empSalCheck;
       			empStatTalk[3] =empStuAgeCheck;
       			var empStatNum = new Array();     			
       			empStatNum[0]=empCityCount;
       			empStatNum[1]=empRecordCount;
       			empStatNum[2]=empSalCount;
       			empStatNum[3] =empStuAgeCount;
		
       			classShow(classSizeCount,empStatusCount,record);
       			empShow(empStatTalk,empStatNum);      		
   
       		}
       		 
       		//显示就业数据
       		function classShow(classSizeCount,empTypeCount,record){
            	$("#selectCity").click(function(){
            	
            		if($("#selectCity").val() != null &&$("#selectCity").val() != "" ){
            	    empController1();
            	    $("#h").show();
    			     $("#g").show();
    			     $("#j").show();
            		$("#selectsal").show();
       			    $("#record").show();
       			    $("#agePd").show();
            		$("#record").html("");
                	$("#agePd").html("");
                	$("#selectsal").html("");
            		options1="<option selected='selected' value='0'>--请选择--</option><option value='1'>2000-4000元</option><option value='2'>4000-6000元</option><option value='3'>6000-8000元</option><option value='4'>8000元以上</option>";
            		
            		options2=" <option selected='selected' value='0'>--请选择--</option><option value='1'>18岁以下</option><option value='2'>18到20</option><option value='3'>20到24</option><option value='4'>24岁以上</option>";           
  
            		options3="<option selected='selected' value=''>--请选择--</option>";
            		for ( var i = 0; i < record.length; i++) {
            			
            			options3+="<option value=\""+record[i]+"\">"+record[i]+"</option>";
    				}

            		$("#agePd").html(options2);
                	$("#selectsal").html(options1);
                	$("#record").html(options3);
            		}
            	});  	
       			
            	
       		 	$("#classShow").html("");
       			var options = "<tr bgcolor='#5f9ea0'><th>班级总人数</th><th>已就业</th><th>未就业</th><th>自主就业</th><th>待就业</th><th>班级就业率</th></tr>";
       			options += "<tr><td>"+classSizeCount+"</td>";
       			for(var i = 0; i < empTypeCount.length; i++){
       				options+="<td>"+empTypeCount[i]+"</td>";
       			}
       			
       			var landedEmp=empTypeCount[0]+empTypeCount[2];
       			classCount=landedEmp;
       			var classPer = Math.round( landedEmp/ classSizeCount * 10000) / 100.00+"%";      
       			options+="<td>"+classPer+"</td></tr>";
       			$("#classShow").html(options);

       		}
    		
       	 function empShow(empStatTalk,empStatNum){   
     		   $("#classStaShow1").html("");
       		   var options="<tr><td  align='center' valign='middle'>就业城市统计</td><td  align='center' valign='middle'>学历统计</td><td  align='center' valign='middle'>薪资统计</td><td  align='center' valign='middle'>年龄统计</td></tr>";
       		   $("#classStaShow1").html(options);
       		   $("#classStaShow1").append("<tr id='empStat1'></tr>");
       		   $("#classStaShow1").append("<tr id='empStat2'></tr>");  
       			for ( var i = 0; i < empStatNum.length; i++) {      			
       				var empSums=0;       				
       				for ( var j = 0; j < empStatNum[i].length; j++) {
       					empSums+=empStatNum[i][j];
					}      			
       			    var eng= new Array();
          		    var color = new Array("#EB15EE","#646697","#B4624C","#F3F809","#13EBED","#F0F0F0","#F15316","#68F00E","#122AEA"); 
       			    for ( var j = 0; j < empStatNum[i].length; j++) {
       				  var engs = empStatNum[i][j] / empSums;    				
       				  eng[j]=engs;      				
  
				    }	   
       		      $("#empStat1").append("<td><table class='selectTable'>" +
    				"<tr><td><canvas id='canvas_circle"+i+"'  width='300' height='150' >浏览器不支持canvas </canvas></td></tr></table></td>");
  		             drawCircle("canvas_circle"+i+"",eng,color, empStatTalk[i]);  
  		          $("#empStat2").append("<td><table class='selectTable' id='cc"+i+"'></table></td>");	       
  		          for ( var j = 0; j < empStatNum[i].length; j++) {
  		              $("#cc"+i+"").append("<tr><td>"+empStatTalk[i][j]+"</td><td>"+empStatNum[i][j]+"</td></tr>");  
  		          }	          
 
       			}
 
       		  }
       	 
       	 
       	    function empController1(){
   			var query = $("#statQuery2").serialize();	
   				$.ajax({
   					type:"post",//请求类型
   					url:"employment_department/empstatistic1?",//请求的url
   					dataType:"json",//ajax接口（请求url）返回的数据类型
   					data:query,
   					success: empStatData,
   					error:function(data){//当访问时候，404，500 等非200的错误状态码
   						alert("加载就业信息失败！");
   					}
   				});
   		   }
       	 function  empStatData(data){
       		
       		 var employment_city = data.employment_city; 
       		 var citySum = data.citySum;
       		 var cityStatusNum=data.cityStatusNum;
       		 var record =data.record;      		 
       		 var cityRecSum =data.cityRecSum;
       		 var cityRecSum1=data.cityRecSum1;    		 
       		 var cityRecStatuNum=data.cityRecStatuNum;
       	     var agePd = data.agePd;
       		 var cityAgeSum = data.cityAgeSum;  
       		 var cityAgeSum1 = data.cityAgeSum1; 
       		 var empsal = data.empsal;
       		 var citySalSum = data.citySalSum;  
       		 var citySalSum1 = data.citySalSum1;
       	 	
       		 empStatList(cityStatusNum,record,employment_city,citySum,cityRecSum,agePd,cityAgeSum,cityRecSum1,cityAgeSum1,empsal,citySalSum,citySalSum1);
       	
       	 }
       	 
      

       	function empStatList(cityStatusNum,record,employment_city,citySum,cityRecSum,agePd,cityAgeSum,cityRecSum1,cityAgeSum1,empsal,citySalSum,citySalSum1){
       		
       	    $("#classStaShow1").html("");      	    
       	    if(employment_city != null && employment_city != "" ){
       	    	var cityStat=0+"%";
       	    	if(cityStatusNum[0] != 0 || cityStatusNum[2] != 0){
       	    		cityStat =Math.round( (cityStatusNum[0]+cityStatusNum[2])/ citySum * 10000) / 100.00+"%"; 
       	    	}
       	      
       	      var classStat =Math.round( (cityStatusNum[0]+cityStatusNum[2])/ classCount * 10000) / 100.00+"%"; 
       	      var options="<tr><th>就业城市</th><th>已就业</th><th>未就业</th><th>自主</th><th>城市就业率</th><th>城市占班级就业率</th></tr>"; 
       	          options+="<tr><td>"+employment_city+":&nbsp;"+citySum+"</td><td>"+cityStatusNum[0]+"</td><td>"+cityStatusNum[1]+"</td><td>"+cityStatusNum[2]+"</td><td>"+cityStat+"</td><td>"+classStat+"</td></tr>";    	
       	    }

     	    if(record != null && record != ""){  
      
       	         var options="<tr><th>就业城市</th><th>学历</th><th>城市学历率</th><th>班级学历率</th></tr>"; 
       	    	 for(var i = 0 ; i <record.length;i++ ){      	    		
       	    		  var cityStat =Math.round( cityRecSum[i] / citySum * 10000) / 100.00+"%"; 
              	      var classStat =Math.round( cityRecSum1[i] / classCount * 10000) / 100.00+"%"; 
              	     options+="<tr><td>"+employment_city+":&nbsp;"+citySum+"</td><td>"+record[i]+":&nbsp;"+cityRecSum[i]+"</td><td>"+cityStat+"</td><td>"+classStat+"</td></tr>";
              	   }	
       	    }
       	  
       	
       	   if(agePd != null && agePd != ""){
       	     var options="<tr><th>就业城市</th><th>年龄</th><th>城市年龄率</th><th>班级年龄率</th></tr>";
       	       for(var i = 0 ; i <agePd.length;i++ ){
    	    		  var cityStat =Math.round( cityAgeSum[i] / citySum * 10000) / 100.00+"%"; 
              	      var classStat =Math.round( cityAgeSum1[i] / classCount * 10000) / 100.00+"%"; 
              	      var ageStu=null;
              	      if(agePd[i]==1){ageStu="18岁以下"}
              	      if(agePd[i]==2){ageStu="18-20岁"}
              	      if(agePd[i]==3){ageStu="大于20-24岁"}
              	      if(agePd[i]==4){ageStu="24岁以上"}
              	      
              	      options+="<tr><td>"+employment_city+":&nbsp;"+citySum+"</td><td>"+ageStu+":&nbsp;"+cityAgeSum[i]+"</td><td>"+cityStat+"</td><td>"+classStat+"</td></tr>";
       	    	   
       	       }
       	    }
       
       	    
     	  if(empsal != null && empsal != ""){
       	       var options="<tr><th>就业城市</th><th>薪资</th><th>薪资在城市比率</th><th>薪资在班级比率</th></tr>";
       	       for(var i = 0 ; i <empsal.length;i++ ){
       	    	   
       	    	  var salStu=null;
        	      if(empsal[i]==1){salStu="2000-4000元"}
        	      if(empsal[i]==2){salStu="4000-6000元"}
        	      if(empsal[i]==3){salStu="6000-8000元"}
        	      if(empsal[i]==4){salStu="8000元以上"}
    	    		  var cityStat =Math.round( citySalSum[i] / citySum * 10000) / 100.00+"%"; 
              	      var classStat =Math.round( citySalSum1[i] / classCount * 10000) / 100.00+"%";  
              	      options+="<tr><td>"+employment_city+":&nbsp;"+citySum+"</td><td>"+salStu+":&nbsp;"+citySalSum[i]+"</td><td>"+cityStat+"</td><td>"+classStat+"</td></tr>";
       	       }
       	    }
       	  	
          $("#classStaShow1").html(options);
       	  
       		
          }
       		$(function(){
       			empController();
       			$("#cliclStatic").click(function(){
       				empController();
       				});  
       		
       			$("#agePd").change(function(){
       				$("#selectsal").hide();
       			    $("#record").hide();
       			    $("#h").hide();
    			    $("#j").hide();
       				empController1();
       				
       			});
       			
                $("#record").change(function(){
                	$("#agePd").hide();
                	$("#selectsal").hide();
                	 $("#g").hide();
     			     $("#j").hide();
                	empController1();

       			});
            	
            	 $("#selectsal").change(function(){
            		 $("#record").hide();
            		 $("#agePd").hide();
            		 $("#h").hide();
     			     $("#g").hide();
    				  empController1();
    				 
    			  });

       		})
