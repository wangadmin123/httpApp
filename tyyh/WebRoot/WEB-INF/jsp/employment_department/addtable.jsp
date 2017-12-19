<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>列表模板</title>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/search.css"/>
    <link rel="stylesheet" type="text/css" href="statics/employment_department/css/formStyle.css"/>
    <script type="text/javascript" src="statics/employment_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/employment_department/js/globle.js"></script>
   	<script type="text/javascript" src="statics/employment_department/js/back.js"></script>
    <script type="text/javascript" src="statics/employment_department/laydate/laydate.js"></script>
    <script type="text/javascript">
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
   
   
      function showw(ww){
	var emp_name_in = $(ww).val();
	if(emp_name_in==null||emp_name_in==""){$(ww).attr("style","border:red 1px solid");};
	    if(emp_name_in!=""){$(ww).attr("style","border:black 1px solid");};
	    
	
	}
 
     function www(from){
      showw(from.createtime);
      showw(from.report_people);
      showw(from.plantime);
      
      
               
 
    
      if( from.createtime.value=="" || from.createtime.value==null){
           return false;
      }
      if( from.report_people.value=="" || from.report_people.value==null){
           return false;
      }
      if( from.plantime.value=="" || from.plantime.value==null){
           return false;
      
       return true;
    
    }
    }
    </script>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <div class="serach">
        <form action="${pageContext.request.contextPath }/employment_department/tabletianjiaa" method="post" onsubmit="return www(this)" >
            <table cellpadding="0" cellspacing="0"  class="searchTable" border="0" style="width:80%;"  >
                <tr>
                    <td class="tdWidth">时间：</td>
                    <td><input type="date" class="dateStyle"  style="width:160px;" name="createtime"/></td>

                   <!--  <td><input type="button"  value="搜索" class="searchBotton" /></td> -->


                </tr>


            </table>
        </div>

        <h1 class="tabTitle">基本信息</h1>
        <div class="divTable" >

           <!--  <table width="1190" height="661" border="1" align="center">

                <tr>
                    <td height="40" colspan="14" align="center" valign="middle">就业部工作日报</td>
                </tr>


                <tr>
                    <td colspan="2" align="center" valign="middle">时间</td>
                    <td colspan="12" align="center" valign="middle">&nbsp;</td>
                </tr>



                <tr>
                    <td colspan="2" rowspan="3" align="center" valign="middle">负责人</td>
                    <td height="47" colspan="2" align="center" valign="middle">企业</td>
                    <td colspan="5" align="center" valign="middle">基础就业</td>
                    <td colspan="5" align="center" valign="middle">责任区域学员就业情况统计</td>
                </tr>




                <tr>

                    <td width="66"  rowspan="2" align="center" valign="middle">开拓企业</td>
                    <td width="66"  rowspan="2" align="center" valign="middle">维护企业</td>
                    <td width="129" rowspan="2" align="center" valign="middle">面试安排（家/人）</td>
                    <td width="133" rowspan="2" align="center" valign="middle">入职学员（人数）</td>
                    <td width="66" rowspan="2" align="center" valign="middle">就业确认</td>
                    <td width="62" rowspan="2" align="center" valign="middle">照片</td>
                    <td width="60" rowspan="2" align="center" valign="middle">感言</td>
                    <td width="93" rowspan="2" align="center" valign="middle">负责就业学员总人数</td>
                    <td colspan="2" align="center" valign="middle">已就业</td>
                    <td colspan="2" align="center" valign="middle">未就业</td>
                </tr>



                <tr>

                    <td width="33" align="center" valign="middle" >入职</td>
                    <td width="33" align="center" valign="middle" >放弃</td>
                    <td width="66" align="center" valign="middle" >正在推荐</td>
                    <td width="146" align="center" valign="middle" >延迟</td>

                </tr>

                <tr>
                    <td height="108" colspan="2" align="center" valign="middle">&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                    <td align="center" valign="middle" >&nbsp;</td>
                </tr>


                <tr>
                    <td colspan="2"  rowspan="3" align="center" valign="middle">田鑫鑫</td>
                    <td align="center" valign="middle" >入职</td>
                    <td colspan="11" align="center" valign="middle">面试</td>
                </tr>




                <tr>

                    <td align="center" valign="middle" >面试</td>
                    <td colspan="11" align="center" valign="middle">&nbsp;</td>
                </tr>



                <tr>

                    <td align="center" valign="middle" >其他工作</td>
                    <td colspan="11" align="center" valign="middle">&nbsp;</td>
                </tr>



                <tr>
                    <td colspan="10" align="center" valign="middle">工作计划</td>
                    <td align="center" valign="middle" >时间</td>
                    <td colspan="3" align="center" valign="middle">&nbsp;</td>
                </tr>


                <tr>

                    <td width="51" height="45" align="center" valign="middle" >序号</td>
                    <td width="98" align="center" valign="middle" >姓名</td>
                    <td colspan="3" align="center" valign="middle">工作内容</td>
                    <td colspan="4" align="center" valign="middle">需要提供的援助</td>
                    <td colspan="5" align="center" valign="middle">备注</td>
                </tr>


                <tr>

                    <td height="68" >&nbsp;</td>
                    <td >&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="4">&nbsp;</td>
                    <td colspan="5">&nbsp;</td>
                </tr>

                <tr>

                    <td height="104" >&nbsp;</td>
                    <td >&nbsp;</td>
                    <td colspan="3">&nbsp;</td>
                    <td colspan="4">&nbsp;</td>
                    <td colspan="5">&nbsp;</td>
                </tr>


            </table> -->
            
            
            
            
            
            
            
            
            
            
             <table width="1201" height="825" border="1" align="center" cellspacing="0">

                    <tr>
                        <td height="40" colspan="14" align="center" valign="middle">就业部工作${oaJybReport.report_type}
                         <!-- <input type="text" style="border:0; width:40px; height:35px; text-align: center;" name="report_type"/> -->
                                <input type="radio" style="border:0;  text-align: center;" name="report_type" value="周报"><span style="color:#EF4712;font-weight: bolder;">周报</span></input>
                                 <input type="radio" style="border:0;  text-align: center;"name="report_type" value="日报"><span style="color:#83639B;font-weight: bolder;">日报</span></input>
                         
                        </td>
                    </tr>


                  <%--   <tr>
                        <td height="61" colspan="2" align="center" valign="middle"  >时间</td>
                        <td colspan="12" align="center" valign="middle">

                            <input type="text" style="border:0; width:100%; height:100%; text-align: center;" value="${time}"/>

                        </td>
                    </tr> --%>



                    <tr>
                        <td colspan="2" rowspan="3" align="center" valign="middle">负责人</td>
                        <td height="47" colspan="2" align="center" valign="middle">企业</td>
                        <td colspan="5" align="center" valign="middle">基础就业</td>
                        <td colspan="5" align="center" valign="middle">责任区域学员就业情况统计</td>
                    </tr>




                    <tr>

                        <td width="91"  rowspan="2" align="center" valign="middle">开拓企业</td>
                        <td width="100"  rowspan="2" align="center" valign="middle">维护企业</td>
                        <td width="78" rowspan="2" align="center" valign="middle">面试安排（家/人）</td>
                        <td width="76" rowspan="2" align="center" valign="middle">入职学员（人数）</td>
                        <td width="115" rowspan="2" align="center" valign="middle">就业确认</td>
                        <td width="62" rowspan="2" align="center" valign="middle">照片</td>
                        <td width="76" rowspan="2" align="center" valign="middle">感言</td>
                        <td width="77" rowspan="2" align="center" valign="middle">负责就业学员总人数</td>
                        <td colspan="2" align="center" valign="middle">已就业</td>
                        <td colspan="2" align="center" valign="middle">未就业</td>
                    </tr>



                    <tr>

                        <td width="53" align="center" valign="middle" >入职</td>
                        <td width="52" align="center" valign="middle" >放弃</td>
                        <td width="84" align="center" valign="middle" >正在推荐</td>
                        <td width="100" align="center" valign="middle" >延迟</td>

                    </tr>

                    <tr>
                        <td colspan="2" rowspan="4" align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_people" value="${ename}"/>
                        </td>
                        <td height="97" align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_pioneer_enterprise" value="${oaJybReport.report_pioneer_enterprise}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_maintenance_enterprise" value="${oaJybReport.report_maintenance_enterprise}" />
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_interview" value="${oaJybReport.report_interview}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_entrystu" value="${oaJybReport.report_entrystu}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_employment" value="${oaJybReport.report_employment}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_photo" value="${oaJybReport.report_photo}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;"  name="report_testimonials" value="${oaJybReport.report_testimonials}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_employment_statistics" value="${oaJybReport.report_employment_statistics}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_entrystu" value="${oaJybReport.report_entrystu}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_abandonstu" value="${oaJybReport.report_abandonstu}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="report_recommendstu" value="${oaJybReport.report_recommendstu}"/>
                        </td>
                        <td align="center" valign="middle" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;"  name="report_deferstu" value="${oaJybReport.report_deferstu}"/>
                        </td>
                    </tr>


                    <tr>
                        <td height="81" align="center" valign="middle" >入职</td>
                        <td colspan="11" align="center" valign="middle">
                            <textarea  style="overflow-y: scroll; width: 960px; height: 76px; border:0; text-align: center;" name="report_entry_summary" >${oaJybReport.report_entry_summary}</textarea>

                        </td>
                    </tr>




                    <tr>

                        <td height="72" align="center" valign="middle" >面试</td>
                        <td colspan="11" align="center" valign="middle">
                            <textarea  style="overflow-y: scroll; width: 960px; text-align: center; height: 76px; border:0;" name="report_interview_summary" >${oaJybReport.report_interview_summary}</textarea>
                        </td>
                    </tr>



                    <tr>

                        <td height="79" align="center" valign="middle" >其他工作</td>
                        <td colspan="11" align="center" valign="middle">
                            <textarea  style="overflow-y: scroll; text-align: center; width: 960px; height: 76px; border:0;" name="report_otherjob" >${oaJybReport.report_otherjob}</textarea>
                        </td>
                    </tr>



                    <tr>
                        <td colspan="10" align="center" valign="middle">工作计划</td>
                        <td align="center" valign="middle" >时间</td>
                        <%-- <td colspan="3" align="center" valign="middle">
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="plantime" value="${timee}"/>
                        </td> --%>
                          <td colspan="3" align="center" valign="middle">
                          <input type="date" class="dateStyle"  style="width:160px;border:0; width:80%; text-align:center;" name="plantime"/></td>
                    </tr>


                    <tr>

                        <td width="51" height="45" align="center" valign="middle" >序号</td>
                        <td width="98" align="center" valign="middle" >姓名</td>
                        <td colspan="3" align="center" valign="middle">工作内容</td>
                        <td colspan="4" align="center" valign="middle">需要提供的援助</td>
                        <td colspan="6" align="center" valign="middle">备注</td>
                    </tr>


                    <tr>

                        <td height="68" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" value="1"/>
                        </td>
                         <td >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" value="${ename }"/>
                        </td> 
                        <td colspan="3">
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="work_plan_job_content" value="${oaJybReport.work_plan_job_content}"/>
                        </td>
                        <td colspan="4">
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="work_plan_needhelp" value="${oaJybReport.work_plan_needhelp}"/>
                        </td>
                        <td colspan="5">
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name="work_plan_remarks" value="${oaJybReport.work_plan_remarks}"/>
                        </td>
                    </tr>

                    <!-- <tr>

                        <td height="104" >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" value="2"/>
                        </td>
                        <td >
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;" name=""/>
                        </td>
                        <td colspan="3">
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;"/>
                        </td>
                        <td colspan="4">
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;"/>
                        </td>
                        <td colspan="5">
                            <input type="text" style="border:0; width:100%; height:100%; text-align:center;"/>
                        </td>
                    </tr> -->


                </table>
            
            
            
            
            
            
            
            <div class="btposition2">
                <div><input type="submit" class="saveBotton" value="添加" />
                </form>
               
                 
	    <input type="button" class="BackBotton" value="返回"/>
	  
                </div>
               
            </div>
        </div>

    </div>
</div>
<div class="mbStyle">&nbsp;</div>
<!--<div class="deleteStyle">
    <h3>操作提示</h3>
    <h2>确定要删除吗？</h2>
    <div class="btn">
        <div class="bottomStyle1">确定</div>
        <div class="bottomStyle2">取消</div>
    </div>
</div>-->
</body>
</html>
