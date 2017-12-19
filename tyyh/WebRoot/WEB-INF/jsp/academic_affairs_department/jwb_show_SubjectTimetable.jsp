<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>课程表</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/index.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/insert.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/all.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/zt.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/search.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/formStyle.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/switch.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.8.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/globle.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/academic_affairs_department/js/jquery.jedate.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/jedate.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/popup.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/statics/academic_affairs_department/css/add.css"/>
<script type="text/javascript">
/*确定保存弹出框的位置*/


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
    miao=1;
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
    /* location.href="SubjectTimetable.html"; */
  }   
}
/*保存读秒结束*/

$(function(){
            /*点击显示弹出框*/
            $(".edit").click(function(){
                $(".mbStyle").css("display","block");
                $(".popupStyle").css("display","block");

            });

            /*关闭*/
            $(".closeX").click(function(){
                $(".mbStyle").css("display","none");
                $(".popupStyle").css("display","none");
            });

        });
        /*确定保存弹出框的位置*/
        $(function(){
            var mbHeight= $(document).height();
            var delHeight=$(window).height();
            var saveWidth=$(window).width();

            $(".mbStyle").css("height",mbHeight);


            $(".popupStyle").css("left",saveWidth/2-250);
            $(".popupStyle").css("top",delHeight/2-220);


        });
        
        //
		function sousuo() {
			alert("fdfdffdfdfdfdf");
		}

</script>
</head>
<body>
<div class="rightContent">

  <div class="tabContent">
    <div class="serach">
    <form action="jwb/jwb_show_SubjectTimetable" method="get">
         <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;">
        <tr>
		  <td>班级：</td> <td><input type="search"  name="name" class="searchStyle" style="width:150px;" value="${name}" /></td>
          <td>授课人：</td> <td><input type="search" name="lecturer" class="searchStyle" style="width:150px;"value="${lecturer}" /></td>
          <td>课程时间段：</td> 
                        <td>
        <input class="datainp wicon" id="inpstart" name="bieTime" type="date" placeholder="开始日期" value="${bieTime}"  readonly style="height:27px;">至
        <input class="datainp wicon" id="inpend" name="outTime" type="date" placeholder="结束日期"   value="${outTime}"  readonly style="height:27px;">
        </td>
           <td><input type="submit"  value="搜索" id="btn"  class="searchBotton" /></td>
        </tr>    
       </table>
       </form>
    </div>

<script type="text/javascript">
$("#datefix").jeDate({
    
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

console.log($.timeStampDate("2017-11-16 10:35:22",false)) 
console.log($.timeStampDate("1513391722",true))


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

</script>

    <h1 class="tabTitle" >课程表信息</h1>
    <div class="divTable" >
      <table cellpadding="0" cellspacing="0" border="1" class="selectTable" style="font-size: 13px";>
        <tr>
          <th>周期</th>
          <th>日期</th>
          <th>机房</th>
          <th>班级</th>
          <th>授课人</th>
          <th>课程内容</th>
          <th>课时</th>   
        </tr>
        
        
        <c:forEach var="curriculum" items="${curriculumList }" varStatus="status">
      <tr>	
										<td>${curriculum.cycle}</td>
										<td>${curriculum.classdate }</td>
										<td>${curriculum.motor }</td>
										<td>${curriculum.name}</td>										
										<td>${curriculum.lecturer }</span></td>
										<td>${curriculum.course}</td>
										<td>${curriculum.classhour }</td>
      </tr>
	</c:forEach>

   
      </table>
	  <div id="page">当前1-10条 <span>1</span><span>2</span><span>3</span><span>4</span><span>5</span>共13页</div>
        <div class="btposition2">
	  </div>
    </div>

  </div>
</div>


</body>
</html>
