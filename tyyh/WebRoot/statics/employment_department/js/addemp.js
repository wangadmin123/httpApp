


function  getcity(){
$("#city1").change(function(){
	var $city1 = $("#city1").val();
	var city1 =$("#ctext").val();	
	if($city1 != '' && $city1 != null){
		$.ajax({
			type:"get",//请求类型
			url:"employment_department/getcity",//请求的url
			data:{ProvinceId:$city1},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）				
				$("#city2").html("");	
				var $ch=$("#ch").val();
				var options = "<option value=\"\">--请选择--</option>";
				for(var i = 0; i < data.citys.length; i++){					
					if(city1.indexOf("市") != -1){
						options += "<option selected='selected' value=\""+city1+"\">"+city1+"</option>";
						break;
					}
					if($ch==data.citys[i].city){
						options += "<option selected='selected' value=\""+data.citys[i].city+"\">"+data.citys[i].city+"</option>";
					}else{
						options += "<option value=\""+data.citys[i].city+"\">"+data.citys[i].city+"</option>";
					}
					
				}
				$("#city2").html(options);
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				alert("加载二级分类失败！");
			}
		});
		
		
	}
	
	
	
	
});

}

function  getcom(){
	
	
	
$("#unit").change(function(){
	var $unit = $("#unit").val();

	if($unit != '' && $unit != null){
		$.ajax({
			type:"get",//请求类型
			url:"employment_department/getcity",//请求的url
			data:{comName:$unit},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				var $gw=$("#gw").val();
		
			   $("#eng").html("");				
				var options = "<option value=\"\">--请选择--</option>";				
				for(var i = 0; i <data.coms.length;i++){
					
				if($gw==data.coms[i]){	
				options += "<option selected='selected' value=\""+data.coms[i]+"\">"+data.coms[i]+"</option>";		   	     			
				}else{
			    options += "<option value=\""+data.coms[i]+"\">"+data.coms[i]+"</option>";
				}
				
				}
				$("#eng").html(options);
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				alert("加载二级分类失败！");
			}
		});
		
		
	}
	
	
	
	
});

}


$(function(){

	var $city1 = $("#city1").val();	
	var city1 =$("#city1").find("option:selected").text();
	if($city1 != '' && $city1 != null){
		$.ajax({
			type:"get",//请求类型
			url:"employment_department/getcity",//请求的url
			data:{ProvinceId:$city1},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）				
				$("#city2").html("");	
				var $ch=$("#ch").val();	
				var options = "<option value=\"\">--请选择--</option>";
				for(var i = 0; i < data.citys.length; i++){	
				
					if(city1.indexOf("市") != -1){
						options += "<option selected='selected' value=\""+city1+"\">"+city1+"</option>";
						break;
					}
					if($ch==data.citys[i].city){
						options += "<option selected='selected' value=\""+data.citys[i].city+"\">"+data.citys[i].city+"</option>";
					}else{
						options += "<option value=\""+data.citys[i].city+"\">"+data.citys[i].city+"</option>";
					}
					
				}
				$("#city2").html(options);
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				alert("加载二级分类失败！");
			}
		});
		
		
	}
	
	

	var $unit = $("#unit").val();
	if($unit != '' && $unit != null){
	
	$.ajax({
		type:"get",//请求类型
		url:"employment_department/getcity",//请求的url
		data:{comName:$unit},//请求参数
		dataType:"json",//ajax接口（请求url）返回的数据类型
		success:function(data){//data：返回数据（json对象）
			var $gw=$("#gw").val();	
		   $("#eng").html("");				
			var options = "<option value=\"\">--请选择--</option>";				
			for(var i = 0; i <data.coms.length;i++){	
			if($gw==data.coms[i]){	
			options += "<option selected='selected' value=\""+data.coms[i]+"\">"+data.coms[i]+"</option>";		   	     			
			}else{
		    options += "<option value=\""+data.coms[i]+"\">"+data.coms[i]+"</option>";
			}
			
			}
			$("#eng").html(options);
		},
		error:function(data){//当访问时候，404，500 等非200的错误状态码
			alert("加载二级分类失败！");
		}
	});
	}
	
	getcity();
	
	getcom();
	
});