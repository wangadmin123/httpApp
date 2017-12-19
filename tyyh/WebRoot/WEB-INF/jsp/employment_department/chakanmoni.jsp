<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>选项卡模板</title>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css" />
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/add.css"/>
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/back.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/tab.js"></script>
    <script type="text/javascript">
        /*确定保存弹出框的位置*/
        $(function(){
            var saveWidth=$(window).width();
            var saveHeight=$(window).height();
            $(".saveStyle").css("left",saveWidth/2-130);
            $(".saveStyle").css("top",saveHeight/2-40);

        });
        $(function(){
            /*点击删除*/
            $(".deleteBotton").click(function(){
                $(".mbStyle").css("display","block");
                $(".deleteStyle").css("display","block");
            });
            /*确定删除*/
            $(".bottomStyle1").click(function(){
                $(".mbStyle").css("display","none");
                $(".deleteStyle").css("display","none");
                alert('你点击了确定')
            });
            /*删除取消*/
            $(".bottomStyle2").click(function(){
                $(".mbStyle").css("display","none");
                $(".deleteStyle").css("display","none");
                alert('你点击了取消')
            });
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
                location.href="welcome.html";
            }
        }
        /*保存读秒结束*/

        /*表格全选*/
        $(function(){
            $("#all").click(function(){
                var checked=$(this).is(":checked");
                $(".selectTable tr td").children().attr("checked",checked);
            });
            //判断是否全选
            function ifAllChecked(){
                var checkedBoxs=$(".selectTable tr td").children();
                var sum=checkedBoxs.size();
                var k=0;
                checkedBoxs.each(function(index,dom){
                    if($(dom).is(":checked")) k++;
                });
                if(k==sum){
                    $("#all").attr("checked",true);
                }else{
                    $("#all").attr("checked",false);
                }
            }
            ifAllChecked();//页面加载完后运行

        });
        /*表格全选结束*/

    </script>
</head>
<body>
<div class="rightContent">
    <div class="tabContent">
        <h1 class="tabTitle">查看面试成绩</h1>
        
        <div class="divTable">
          <div class="serach">
                <!-- <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%; "align="center">
                    <tr>

                        <td class="tdWidth">班级：</td>
                        <td><select class="selectStyle" style="width:120px;">
                            <option>不限</option>
                            <option>c11</option>
                            <option>c12</option>
                            <option>a13</option>
                            <option>c14</option>


                        </select></td>

                        <td class="tdWidth">面试日期：</td>
                        <td><input type="date" class="dateStyle"  style="width:160px;"/></td>


                        <td><input type="button"  value="搜索" class="searchBotton" /></td>


                    </tr>


                </table> -->
            </div>
          <table width="1268"  border="1"  cellpadding="0" cellspacing="0" align="center">
  <tr>
    <th colspan="13" align="center" valign="middle"><font>北大青鸟模拟面试评分表</font></th>
  </tr>

  <tr>
    <td width="52" rowspan="3" align="center" valign="middle" bgcolor="#7fffd4">序号</td>
    <td width="88" rowspan="3" align="center" valign="middle" bgcolor="#7fffd4">姓名</td>
    <td colspan="4" align="center" valign="middle"  bgcolor="#ffd700">面试礼仪（20分）</td>
    <td colspan="4" align="center" valign="middle" bgcolor="#7fffd4">面试技巧（50分）</td>
    <td colspan="2" align="center" valign="middle"  bgcolor="#ffd700">简历（30分）</td>
    <td width="52" rowspan="3" align="center" valign="middle" bgcolor="#7fffd4">总分</td>
  </tr>
  <tr>
    <td width="81" align="center" valign="middle"  bgcolor="#ffd700">基本礼仪</td>
    <td width="73" align="center" valign="middle"  bgcolor="#ffd700">衣着</td>
    <td align="center" valign="middle"  bgcolor="#ffd700">仪表</td>
    <td width="73" align="center" valign="middle"  bgcolor="#ffd700">场外表现</td>
    <td width="67" align="center" valign="middle" bgcolor="#7fffd4">基本技巧</td>
    <td width="89" align="center" valign="middle" bgcolor="#7fffd4">自我介绍</td>
    <td align="center" valign="middle" bgcolor="#7fffd4">面试技巧要点考察</td>
    <td width="137" align="center" valign="middle" bgcolor="#7fffd4">综合性考察</td>
    <td width="95" align="center" valign="middle"  bgcolor="#ffd700">外观</td>
    <td width="103" align="center" valign="middle"  bgcolor="#ffd700">内容</td>
  </tr>
  <tr>
    <td align="center" valign="middle"  bgcolor="#ffd700">5分</td>
    <td align="center" valign="middle"  bgcolor="#ffd700">5分</td>
    <td align="center" valign="middle"  bgcolor="#ffd700">5分</td>
    <td align="center" valign="middle"  bgcolor="#ffd700">5分</td>
    <td align="center" valign="middle" bgcolor="#7fffd4">7分</td>
    <td align="center" valign="middle" bgcolor="#7fffd4">8分</td>
    <td align="center" valign="middle" bgcolor="#7fffd4">30分</td>
    <td align="center" valign="middle" bgcolor="#7fffd4">5分</td>
    <td align="center" valign="middle"  bgcolor="#ffd700">10分</td>
    <td align="center" valign="middle"  bgcolor="#ffd700">20分</td>
  </tr>
  <!-- <tr>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
    <td align="center" valign="middle">&nbsp;</td>
  </tr> -->
  
      <c:if test="${interviews != null }">
      <c:forEach items="${interviews }" var="stu" varStatus="status">
   <tr> <td align="center" valign="middle">${ status.index + 1}</td>
    <td align="center" valign="middle">${stu.studentname }</td>
    <td align="center" valign="middle">${stu.interview_score_basic_etiquette }</td>
    <td align="center" valign="middle">${stu.interview_score_clothing }</td>
    <td align="center" valign="middle">${stu.interview_score_appearance }</td>
    <td align="center" valign="middle">${stu.interview_score_expression }</td>
    <td align="center" valign="middle">${stu.interview_score_skill }</td>
    <td align="center" valign="middle">${stu.interview_score_self_introduction }</td>
    <td align="center" valign="middle">${stu.interview_score_skill_main }</td>
    <td align="center" valign="middle">${stu.interview_score_synthesize }</td>
    <td align="center" valign="middle">${stu.interview_score_surface }</td>
    <td align="center" valign="middle">${stu.interview_score_content }</td>
    <td align="center" valign="middle">${stu.interview_score_totalscore }</td>
    </tr>
      </c:forEach>
      
      
      </c:if>
  
</table>
            <div class="btposition2">
              <div><input type="button" class="BackBotton" value="返回"/></div>
          </div>
        </div>
        <!-- <div class="divTable" style="display:none;"> 333333 </div>
        <div class="divTable" style="display:none;"> 444444 </div><div class="divTable" 

style="display:none;">xxxxxxxxxxxxxxxxxx</div>
        <div class="divTable" style="display:none;"> 55555 </div> -->
    </div>
</div>

<!--保存-->
<div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
<!--结束-->

<!--删除开始-->
<div class="mbStyle">&nbsp;</div>
<div class="deleteStyle">
    <h3>操作提示</h3>
    <h2>确定要删除吗？</h2>
    <div class="btn">
        <div class="bottomStyle1">确定</div>
        <div class="bottomStyle2">取消</div>
    </div>
</div>
<!--删除结束-->
</body>
</html>
