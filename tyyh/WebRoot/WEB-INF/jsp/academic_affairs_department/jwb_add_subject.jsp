<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改课表</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/add.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/switch.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery.jedate.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/jedate.css">
    
  
<script type="text/javascript">

/*确定保存弹出框的位置*/
$(function(){
    var saveWidth=$(window).width();
    var saveHeight=$(window).height();
	$(".saveStyle").css("left",saveWidth/2-130);
	$(".saveStyle").css("top",saveHeight/2-40);

});


/*保存读秒*/
var miao;
var myTime;
$(function(){
	$(".saveBotton").click(function(){
		miao=2;
		$(".setTime").text(miao);
		$(".saveStyle").css("display","block");
		myTime=setInterval("divHide()",1000);
	   
    });  
});
function divHide(){
	miao--;
	$(".setTime").text(miao);
	if(miao==0){
		clearInterval(myTime);
		$(".saveStyle").hide();
		location.href="SubjectTimetable.html";
	}		
}
/*保存读秒结束*/

 

</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <h1 class="tabTitle">新增课程表</h1>
      <form action="#" method="post" enctype="multipart/form-data">
      <table cellpadding="0" cellspacing="0" border="0" class="addTable">
        <tr>
          <td class="tdWidth">班级：</td>
          <td><input type="text" list="url_list"  class="textStyle" style="width:160px;"/>
            <datalist id="url_list">
                      <option label="C10" value="C10" />
                      <option label="C11" value="C11" />
                      <option label="C12" value="C12" />
                  </datalist>
               
          </td>
        </tr>
        <tr>
          <td class="tdWidth">班主任：</td>
          <td><input type="text" class="textStyle" style="width:160px;" readonly="readonly"/></td>
        </tr>
        <tr>
          <td class="tdWidth">教员：</td>
          <td><input type="text" class="textStyle" style="width:160px;" readonly="readonly"/></td>
        </tr>
        <tr>
          <td class="tdWidth">机房：</td>
          <td><input type="text" class="textStyle" style="width:160px;" readonly="readonly"/></td>
        </tr>    
        <tr>
          <td class="tdWidth">课程名称：</td>
          <td><input type="text" class="textStyle" style="width:160px;" readonly="readonly"/></td>
        </tr>
        <tr>
          <td class="tdWidth">早上课程内容：</td>
          <td><input type="text" class="textStyle" style="width:160px;"/></td>
        </tr>
        <tr>
          <td class="tdWidth">下午课程内容：</td>
          <td><input type="text" class="textStyle" style="width:160px;"/></td>
        </tr>

          <tr>
              <td class="tdWidth">授课时间：</td>
              <td>
        <input class="datainp wicon" id="inpstart" type="text" placeholder="开始日期" value=""  readonly>至
        <input class="datainp wicon" id="inpend" type="text" placeholder="结束日期"   readonly>
<script type="text/javascript">
$("#datefix").jeDate({
    //isinitVal:true,
    //festival:true,
    //ishmsVal:false,
    fixedCell:"refix",
    //isClear:false,
    //isok:false,
    hmsSetVal:{hh:00,mm:00,ss:00},
    //isvalid:["3,4,8,10",true],
    initAddVal:{MM:"+3",DD:"+2"},
    minDate: '2016-06-16',
    maxDate: '2025-06-16',
    format:"YYYY-MM-DD hh:mm:ss",
    //format:"hh:mm",
    zIndex:3000,
    choosefun:function (elem,val,date) {
        console.log(val)
        console.log(date)
        //alert(date)
    },
    okfun:function (elem,val,date) {
        console.log(val)
        console.log(date)
        //alert(date)
    }
})
//var dt = new Date(),
//    sm = dt.setMonth(13),
//    gm =  dt.getFullYear()
console.log($.timeStampDate("2017-11-16 10:35:22",false)) 
console.log($.timeStampDate("1513391722",true))
//console.log(gm)

var cancel ={
    minDate:'2015-06-16',
    maxDate:'2017-12-16'
}
var opts = $.extend({
     type:"je",
     minDate:undefined,
     maxDate:undefined
},cancel);
if (opts.type == "je") {
    $("#optsdate").jeDate({
        isinitVal: true,
        festival: true,
        trigger: "click mouseenter focus",
        isTime:false,
        ishmsVal: false,
        minDate: opts.minDate,
        maxDate: opts.maxDate,
        format: "YYYY-MM-DD hh:mm",
        zIndex: 3000,
        okfun:function (elem,val) {
            alert(elem)
        }
    })
}

//实现日期选择联动
var start = {
    format: 'YYYY-MM-DD',
    minDate: '2014-06-16 23:59:59', //设定最小日期为当前日期
    //festival:true,
    maxDate: $.nowDate({DD:0}), //最大日期
    choosefun: function(elem,datas){
        end.minDate = datas; //开始日选好后，重置结束日的最小日期
        endDates();
    },
    okfun:function (elem,datas) {
        alert(datas)
    }
};
var end = {
    format: 'YYYY-MM-DD',
    minDate: $.nowDate({DD:0}), //设定最小日期为当前日期
    //festival:true,
    maxDate: '2099-06-16 23:59:59', //最大日期
    choosefun: function(elem,datas){
        start.maxDate = datas; //将结束日的初始值设定为开始日的最大日期
    }
};
function endDates() {
    end.trigger = false;
    $("#inpend").jeDate(end);
}
$("#inpstart").jeDate(start);
$("#inpend").jeDate(end);



$("#date01").jeDate({
    isinitVal:true,
    //festival:true,
    ishmsVal:false,
    minDate: '2016-06-16 23:59:59',
    maxDate: $.nowDate({DD:0}),
    format:"YYYY-MM-DD hh:mm:ss",
    zIndex:3000,
})
$("#date02").jeDate({
    isinitVal:true,
    //festival:true,
    ishmsVal:false,
    minDate: '2016-06-16 23:59:59',
    maxDate: $.nowDate({DD:0}),
    format:"YYYY-MM-DD hh:mm",
    zIndex:3000,
})
$("#date022").jeDate({
    isinitVal:true,
    //festival:true,
    ishmsVal:false,
    minDate: '2016-06-16 23:59:59',
    maxDate: $.nowDate({DD:0}),
    format:"YYYY-MM-DD hh:zz",
    zIndex:3000,
})
$("#date03").jeDate({
    isinitVal:true,
    //festival:true,
    ishmsVal:false,
    minDate: '2016-06-16',
    maxDate: $.nowDate({DD:0}),
    format:"YYYY-MM-DD",
    zIndex:3000,
})
$("#date04").jeDate({
    isinitVal:true,
    //festival:true,
    ishmsVal:false,
    minDate: '2016-06-16 23:59:59',
    maxDate: $.nowDate({DD:0}),
    format:"YYYY-MM",
    zIndex:3000,
})
$("#date05").jeDate({
    isinitVal:true,
    //festival:true,
    //ishmsVal:false,
    minDate: '2016-06-16 23:59:59',
    maxDate: $.nowDate({DD:0}),
    format:"hh:mm:ss",
    zIndex:3000,
})
$("#dateyyyy").jeDate({
    isinitVal:true,
    //festival:true,
    //ishmsVal:false,

    determine:false,
    format:"YYYY年",
    zIndex:3000,
})
$("#dateymdh").jeDate({
    isinitVal:true,
    //festival:true,
    //ishmsVal:false,
    minDate: '2016-06-16 23:59:59',
    maxDate: $.nowDate({DD:0}),
    format:"YYYY-MM-DD hh:zz",
    zIndex:3000,
})
$("#datehz").jeDate({
    isinitVal:true,
    //festival:true,
    //ishmsVal:false,
    minDate: '2016-06-16 23:59:59',
    maxDate: $.nowDate({DD:0}),
    format:"hh:zz",
    zIndex:3000,
})
function testShow(elem){
    $.jeDate(elem,{
        trigger:false,
        isinitVal:true, 
        minDate: '2016-06-16 23:59:59',
        maxDate: $.nowDate({DD:0}),
        format:"hh",
        zIndex:3000,
    })
}

</script></td>
          </tr> 
        <tr>
          <td class="tdWidth">备注：</td>
          <td><textarea  class="areaStyle" style="width:360px;"></textarea>
          </td> 
        </tr>
      </table>
      <h2 class="tabTitle2">&nbsp;</h2>
	  <div class="btposition1">
	    <input type="button" value="保存" class="saveBotton" />
	  </div>
     </form> 

   
</div>
</div>


<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>

  </body>
</html>
