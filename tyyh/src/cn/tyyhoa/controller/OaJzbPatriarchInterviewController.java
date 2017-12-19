package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJzbInterview;
import cn.tyyhoa.pojo.OaJzbInterviewtype;
import cn.tyyhoa.pojo.OaJzbPatriarchInterview;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaJzbChronicleService;
import cn.tyyhoa.service.OaJzbPatriarchInterviewService;
import cn.tyyhoa.service.OaJzbStuInterviewService;

@Controller
public class OaJzbPatriarchInterviewController {
	
	@Autowired
	OaJzbPatriarchInterviewService oaJzbPatriarchInterviewService;
	@Autowired
	OaJzbStuInterviewService oaJzbStuInterviewService;
	@Autowired
	OaJzbChronicleService oaJzbChronicleService;

	
	//跳转add家长访谈页面
	@RequestMapping("/addJZFT")
	public String addJZFT(HttpSession session,HttpServletRequest request){
		 //查询所有的状态
		 List<OaJzbInterview> OaJzbInterviews= oaJzbPatriarchInterviewService.getInterview();
		 request.setAttribute("OaJzbInterviews", OaJzbInterviews);
		 //查询出当前学生所在的班级学期
		 String stuid=(String) session.getAttribute("stuid");
		 OaJwbSemester oaJwbSemester = oaJzbPatriarchInterviewService.getsemesterById(Integer.parseInt(stuid));
		
		 session.setAttribute("oaJwbSemester", oaJwbSemester);
		 return "teach_nature_department/jzb/add_talk_p";
	}
	//添加家长访谈
	@RequestMapping("/add_talk_p")
	public String add_talk_p(String interview_name,String interview_time,String interview_way
			,String interview_content,String remarks,HttpSession session){
		OaJwbSemester oaJwbSemester = (OaJwbSemester) session.getAttribute("oaJwbSemester");
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		//1为访谈人ID ---登录人ID
		//0是删除状态
		//1学生ID 查看时传过来的ID
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		Date date=null;
		try {
			date=sdf.parse(interview_time.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//转换为默认Date格式
		String stu_id = (String) session.getAttribute("stuid");
		//14为登录人ID
		int row = oaJzbPatriarchInterviewService.addJZFT(interview_name, loginUser.getEmp_id(), oaJwbSemester.getId(), 
				date, new Date(), Integer.parseInt(interview_way), interview_content, remarks, 0, Integer.parseInt(stu_id));
		if(row==1){
			OaJybChronicle oaJybChronicle = new OaJybChronicle();		
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			String date1 = df.format(new Date());// new Date()为获取当前系统时间
			Date date2 = null; 
			try {
				date2=df.parse(date1.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//转换为默认Date格式
			
			oaJybChronicle.setStudent_id(Integer.parseInt(stu_id));
			oaJybChronicle.setEvent_time(date);
			oaJybChronicle.setEvent_name("家长访谈");
			oaJybChronicle.setInput_time(date2);
			//登录人名字
			oaJybChronicle.setInputUser(loginUser.getEmp()+"老师");
			oaJzbChronicleService.insertSelective(oaJybChronicle);
			return "redirect:/oaJzbStudentInfo/"+stu_id;
		}else{
			return "redirect:/addJZFT";
		}		
	}
	//跳转修改页面
	@RequestMapping("/updateJZFT")
	public String updateJZF(String id,HttpSession session,HttpServletRequest request,HttpServletResponse re){
	
		session.setAttribute("JZFT_ID", Integer.parseInt(id));
		String stu_id = (String) session.getAttribute("stuid");
		List<OaJzbInterview> OaJzbInterviews= oaJzbPatriarchInterviewService.getInterview();
		 OaJzbPatriarchInterview oaJzbPatriarchInterview  = oaJzbPatriarchInterviewService.getJZFTByID(Integer.parseInt(id));
		 request.setAttribute("OaJzbInterviews", OaJzbInterviews);
		 request.setAttribute("oaJzbPatriarchInterview", oaJzbPatriarchInterview);
		 OaJwbSemester oaJwbSemester = oaJzbPatriarchInterviewService.getsemesterById(Integer.parseInt(stu_id));
		 session.setAttribute("oaJwbSemester", oaJwbSemester);
		 return "teach_nature_department/jzb/update_talk_p";
	}	
	//修改
	@RequestMapping("/updateJZFTview")
	public String updateJZFTview(String interview_name,String interview_way,String interview_content,HttpSession session,HttpServletResponse re){
		
		
		int id = (int) session.getAttribute("JZFT_ID");
		
		String stu_id = (String) session.getAttribute("stuid");
		int row = oaJzbPatriarchInterviewService.UpdateJZFT(interview_name, Integer.parseInt(interview_way), interview_content, id);
		if(row==1){
			return "redirect:/oaJzbStudentInfo/"+stu_id;
		}
		    return "redirect:/updateJZFT";
	}
	//删除家长访谈
	@RequestMapping("/deleteJZFT")
	public String deleteJZFT(String id,String entering_time,HttpSession session){
		/*SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		Date date2 = null; 
		try {
			date2=df.parse(entering_time.toString());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//转换为默认Date格式
		System.out.println(date2+"**********************");
		oaJzbChronicleService.deletea(Integer.parseInt(id), date2);*/
		oaJzbPatriarchInterviewService.deleteJZFT(Integer.parseInt(id));
		String stu_id = (String) session.getAttribute("stuid");
		return "redirect:/oaJzbStudentInfo/"+stu_id;
	}
}
