<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
	<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>添加学生档案信息</title>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/index.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/insert.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/all.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/zt.css">
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/formStyle.css"/>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/add.css"/>
    <link rel="stylesheet" type="text/css" href="statics/teach_nature_department/css/switch.css">
    <script type="text/javascript" src="statics/teach_nature_department/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="statics/teach_nature_department/js/globle.js"></script>
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
                location.href="selstu.jsp";
            }
        }
        /*保存读秒结束*/
    </script>
</head>
<body>
<div class="rightContent">

    <div class="tabContent">
        <h1 class="tabTitle">学生报档信息查看</h1>
        <form action="#" method="post" enctype="multipart/form-data">
            <table cellpadding="0" cellspacing="0" border="0" class="addTable">
                <tr>
                    <td class="tdWidth">中心代码：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder=""  value="123"/></td>
                    </tr>
                <tr>
                    <td class="tdWidth">学员学号：</td>
                     
                    
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="132" /></td>
                    </tr>
                   
                   
                    <tr>
                      
                    <td class="tdWidth">学员姓名：</td>
                     
                    
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="啊啊" /></td>
                   
                   </tr>
                    <tr>
                       
                    <td class="tdWidth">姓名拼音：</td>
                     
                    
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="jksjdk" /></td>
                   
                   </tr>
                    <tr>
                    <td class="tdWidth">性别：</td>
                    <td><select class="selectStyle" style="width:160px;">
                        <option>男</option>
                        <option>女</option>
              	  </select>
                  </td>
                    
                  
                    </tr>
                     <tr>
                    <td class="tdWidth">证件号码:</td>
                     
                    
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="45456478484541"  /></td>
                   
                   </tr>
                   
                    <tr>
                    <td class="tdWidth">教材编码：</td>
                     
                    
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名" value="12345" /></td>
                   
                   </tr>
                    <tr>
                    <td class="tdWidth">班级编号：</td>
                     
                    
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="79"  />
                    </td>
                   
                   </tr>
                    <tr>
                    <td class="tdWidth">班主任姓名：</td>
                     
                    
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="商店"  /></td>
                   
                   </tr>
                     <tr>
                    <td class="tdWidth">学员状态：</td>
                     
                    
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="在读"  /></td>
                   
                   </tr>
                   
                    <tr>
                    <td class="tdWidth">学员状态：</td>
                    <td><select class="selectStyle" style="width:160px;">
                        <option>在读</option>
                        <option>借读</option>
              	  </select>
                  </td>
                    
                   </tr>
					<tr>
                    <td class="tdWidth">最高学历：</td>
                    <td><select class="selectStyle" style="width:160px;">
                        <option>高中</option>
                        <option>大专</option>
              	  </select>
                  </td>
                    
                   </tr>
                   <tr>
                   <td class="tdWidth">专业：</td>
                     <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名" value="查看" /></td>
                </tr>
                <tr>
                   <td class="tdWidth">毕业学校：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="请输入姓名" value="as空间的"  /></td>
                </tr>
                
                 <tr>
                    <td class="tdWidth">工作状态：</td>
                    <td><select class="selectStyle" style="width:160px;">
                        <option>待业</option>
                        <option>就业</option>
              	  </select>
                  </td>
                    
                   </tr>
                    <tr>
                   <td class="tdWidth">工作单位：</td>
                     <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="232"  /></td>
                </tr>
                   

                   
                  
                    <td class="tdWidth">工作种类：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="232sad"  /></td>
                </tr>
                    
                      <tr>
                    <td class="tdWidth">手机号码：</td>
                    <td><input type="text" class="textStyle" style="width:160px;" placeholder=""  value="12545112"/></td>
              		 <tr>
              		   <tr>
                    
                  
                    <td class="tdWidth">通信地址：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="多喝水那次"  /></td>
                    </td>
                </tr>
                  <tr>
                    
                  
                    <td class="tdWidth">邮政编码：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="sadasdas"
                        /></td>
                    </td>
                </tr>
                  <tr>
                    
                  
                    <td class="tdWidth">就业意向城市：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="sad"  /></td>
                    </td>
                </tr>
                  <tr>
                    
                  
                    <td class="tdWidth">就业意向岗位：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="撒"  /></td>
                    </td>
                    </tr>
                    <tr>
                     <td class="tdWidth">备注：</td>
                     <td><textarea  class="areaStyle" style="width:360px;"></textarea>
                    </td>
                    </tr>
                    <tr>
                     <td class="tdWidth">产品编码：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="123"  /></td>
                    </tr>
                    <tr>
                     <td class="tdWidth">学员类型：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="学员"  /></td>
                    </tr>
                    <tr>
                     <td class="tdWidth">通行证：</td>
                      <td><input type="text" class="textStyle" style="width:160px;" placeholder="" value="zhangpengaccp1@sina.com"  /></td>
                    </tr>
                    <tr>
                     <td class="tdWidth">学历毕业时间：</td>

                      <td><input type="date" class="dateStyle"  style="width:160px;"/></td>
                    </tr>
                </table>
                    
                       <div class="btposition1">
                 <a href="selstu.jsp"></a><input type="button" value="保存" class="saveBotton"  /></a>
          		  </div>
                  </form>  
                   <div class="saveStyle"> 保存成功！（<span class="setTime"></span>） </div>
                
             
                
 
</body>
</html>