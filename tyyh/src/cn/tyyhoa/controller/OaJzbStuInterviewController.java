package cn.tyyhoa.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJzbInterviewtype;
import cn.tyyhoa.pojo.OaJzbPatriarchInterview;
import cn.tyyhoa.pojo.OaJzbStuInterview;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaXsbMonthly;
import cn.tyyhoa.service.OaJzbChronicleService;
import cn.tyyhoa.service.OaJzbPatriarchInterviewService;
import cn.tyyhoa.service.OaJzbStuInterviewService;
import cn.tyyhoa.service.OaXsbMonthTestService;

@Controller
public class OaJzbStuInterviewController {
	@Autowired
	OaJzbPatriarchInterviewService oaJzbPatriarchInterviewService;
	@Autowired
	OaJzbStuInterviewService stuInterviewSer;
	@Autowired
	OaJzbChronicleService oaJzbChronicleService;
	@Autowired
	OaXsbMonthTestService oaxsbMonthService;
	
	//添加跳转页面
	@RequestMapping(value="/addInterview")
	public String addTzInterview(String grade_id,HttpServletRequest request,HttpSession session){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		//new Date()为获取当前系统时间
		String zhDate=sdf.format(new Date());
		Date date=null;
		try {
			date=sdf.parse(zhDate);//转换为默认Date格式
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Timestamp time=new Timestamp(date.getTime());//转换为日期格式
		String stuid=(String)session.getAttribute("stuid");
		System.out.println(stuid);
		//根据班级查询学生ID
		List<OaJzbStudent> list1=stuInterviewSer.findStuId(Integer.parseInt(stuid));
		//查询学期ID
		List<OaJwbSemester> list2=stuInterviewSer.findSesmId(Integer.parseInt(stuid));
		//查询访谈类型
		List<OaJzbInterviewtype> list3=stuInterviewSer.findInterviewId();
		//查询实体，把当前时间的实体属性
		List<OaJzbStuInterview> list4=stuInterviewSer.findInterview_empname();
		//根据学生id查询最近一次月考成绩
		OaXsbMonthly stuMonth = oaxsbMonthService.selectMonthByStuId(Integer.parseInt(stuid));
		
		/*OaJzbStuInterview stuInter=list4.get(1);*/
		System.out.println(list4+"输出");
		/*stuInter.setEnteringTime(time);//当前时间
*/		if(list1.size()>0){
			request.setAttribute("stuID", list1.get(0));
		}
		if(list2.size()>0){
			request.setAttribute("semId", list2.get(0));
		}
		
		if(list4.size()>0){
			OaJzbStuInterview stuInter=list4.get(0);
			stuInter.setEnteringTime(time);//当前时间
			System.out.println(stuInter.getId());
			request.setAttribute("stuEnteringTime", stuInter);
		}
		if(stuMonth!=null){
			request.setAttribute("month", stuMonth);
		}
		request.setAttribute("interview", list3);
		
		return "teach_nature_department/jzb/add_talk_S";
	}
	//添加学生访谈
	@RequestMapping(value="/addTjInterview.html")
	public String addTjInterview(@ModelAttribute OaJzbStuInterview stuInterview,HttpServletRequest request,HttpSession session){
		
		String str1=request.getParameter("a_interviewTime");//jsp页面设置和实体不一致的属性，然后set写入实体
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date=null;
		try {
			date=sdf.parse(str1.toString());//转换为默认Date格式
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//Timestamp time=new Timestamp(date.getTime());
		String zhDate=sdf1.format(new Date());
		Date date1=null;
		try {
			date1=sdf1.parse(zhDate.toString());//转换为默认Date格式
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String stuid=(String)session.getAttribute("stuid");
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		stuInterview.setInterviewName_id(loginUser.getEmp_id());//访谈人ID--
		stuInterview.setStudentName_id(Integer.parseInt(stuid));//学生Id
		
		stuInterview.setInterviewTime(date);//访谈时间
		stuInterview.setEnteringTime(date1);//录入时间
		boolean flag=stuInterviewSer.findAddStuInterview(stuInterview);
		if(flag){
			OaJybChronicle oaJybChronicle = new OaJybChronicle();			
			oaJybChronicle.setStudent_id(Integer.parseInt(stuid));
			oaJybChronicle.setEvent_time(date);
			oaJybChronicle.setInput_time(date1);
			oaJybChronicle.setEvent_name("学生访谈");
			//登录人名字
			oaJybChronicle.setInputUser(loginUser.getName()+"老师");
			oaJzbChronicleService.insertSelective(oaJybChronicle);
			return "redirect:/oaJzbStudentInfo/"+stuid;
		}else{
			return "redirect:/addInterview.html";
		}
	}
	//修改跳转页面
	@RequestMapping(value="/editStuInterview")
	public String editTzInterview(String id,HttpServletRequest request,HttpSession session){
		String stuid=(String)session.getAttribute("stuid");
		List<OaJzbStuInterview> list=stuInterviewSer.findInterview(Integer.parseInt(id));
		//循环访谈人
		request.setAttribute("Interview", list);
		//放入实体
		request.setAttribute("stuInterview", list.get(0));
		//查询学期ID
		List<OaJwbSemester> list2=stuInterviewSer.findSesmId(Integer.parseInt(stuid));
		//查询访谈类型
		List<OaJzbInterviewtype> list3=stuInterviewSer.findInterviewId();
		request.setAttribute("semId", list2.get(0));
		session.setAttribute("semId", list2.get(0));//学期
		request.setAttribute("interview", list3);
		return "teach_nature_department/jzb/update_talk_s";
	}
	//修改数据
	@RequestMapping(value="/updateInterview")
	public String editInterview(@ModelAttribute OaJzbStuInterview stuInterview,HttpServletRequest request,HttpSession session){
		String stuid=(String)session.getAttribute("stuid");
		stuInterview.setStudentName_id(Integer.parseInt(stuid));//学生id
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		stuInterview.setInterviewName_id(loginUser.getEmp_id());//访谈人id--
		OaJwbSemester semId=(OaJwbSemester)session.getAttribute("semId");
		stuInterview.setTerm_id(semId.getId());//学期
		boolean flag=stuInterviewSer.findeditStuInterview(stuInterview);
		if(flag){
			return "redirect:/oaJzbStudentInfo/"+stuid;
		}else{
			return "redirect:/editStuInterview";
		}
	}
	//删除
	@RequestMapping(value="/deleteStuInterview")
	public String deleteInterview(String id,HttpSession session){
		String stuid=(String)session.getAttribute("stuid");
		int row=stuInterviewSer.deleteInterview(Integer.parseInt(id));
		if(row!=0){
			return "redirect:/oaJzbStudentInfo/"+stuid;
		}else{
			return "redirect:/oaJzbStudentInfo/"+stuid;
		}
		
	}
}
