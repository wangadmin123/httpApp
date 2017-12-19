package cn.tyyhoa.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJwbStruts;
import cn.tyyhoa.pojo.OaJzbClassplan;
import cn.tyyhoa.pojo.OaJzbClassplansum;
import cn.tyyhoa.pojo.OaJzbGradedata;
import cn.tyyhoa.pojo.OaJzbIndividualinterview;
import cn.tyyhoa.pojo.OaJzbPatrolgrade;
import cn.tyyhoa.pojo.OaJzbProject;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaXsbWeek;
import cn.tyyhoa.service.GrandDateadd;
import cn.tyyhoa.service.OaJzbClassplanService;
import cn.tyyhoa.service.OaJzbClassplansumsService;
import cn.tyyhoa.service.OaJzbIndividualinterviewService;
import cn.tyyhoa.service.OaJzbOpenClassService;
import cn.tyyhoa.service.OaJzbPatrolgradeService;
import cn.tyyhoa.service.OaJzbProjectService;
import cn.tyyhoa.service.OaJzbQuestionService;
import cn.tyyhoa.service.OaJzbSpecialtyService;
import cn.tyyhoa.service.OaRlzybEmployeeService;
import cn.tyyhoa.util.OaJzbRevoke;
@Controller
public class OaJzbGradesController {

	@Autowired
	OaJzbSpecialtyService oaJzbSpecialtyService;
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	@Autowired
	OaJzbClassplanService oaJzbClassplanService;
	@Autowired
	OaJzbClassplansumsService oaJzbClassplansumsService;
	@Autowired
	OaJzbIndividualinterviewService oaJzbIndividualinterviewService;
	@Autowired
	OaJzbOpenClassService openclassSer;
	@Autowired
	OaJzbProjectService oaJzbProjectService;
	@Autowired
	OaJzbPatrolgradeService patrolgradeservice;
	@Autowired
	GrandDateadd granddate;
	@Autowired
	OaJzbQuestionService oaJzbQuestionService;
	//显示班级列表
	@RequestMapping(value="/oaJwbGradeslist.html")
	public String OaJwbGradeList(
			@RequestParam(required=false)String Teacher,
			@RequestParam(required=false)String strutsId,
			HttpServletRequest requset,HttpSession session){
		//所有的班级状态
		List<OaJwbStruts> OaJwbStruts = oaJzbClassplanService.getGradeStruts();
		
		//得到所有的班级
		String login_name = null;
		if(strutsId==null || strutsId.equals("")){ 
			strutsId="0";
		}
		int a = Integer.parseInt(strutsId);
		
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> OaJwbGrades= null;
		
		if(loginUser.getPosition().getPosition_id()==22||loginUser.getPosition().getPosition_id()==1||loginUser.getPosition().getPosition_id()==37||loginUser.getPosition().getPosition_id()==20||loginUser.getPosition().getPosition_id()==25){
			OaJwbGrades = oaJzbClassplanService.getGrades(login_name, Teacher, a,0);
		}else{
			OaJwbGrades = oaJzbClassplanService.getGrades(login_name, Teacher, a,loginUser.getEmp_id());
		}
		
		requset.setAttribute("OaJwbGrades", OaJwbGrades);
		requset.setAttribute("OaJwbStruts", OaJwbStruts);
		session.setAttribute("index",0);
		return "teach_nature_department/jzb/gradeShowList";
	}
	//显示班级列表
		@RequestMapping(value="/oaJwbGradesDaylist.html")
		public String OaJwbGradeDayList(
				@RequestParam(required=false)String Teacher,
				@RequestParam(required=false)String strutsId,
				HttpServletRequest requset,HttpSession session){
			//所有的班级状态
			List<OaJwbStruts> OaJwbStruts = oaJzbClassplanService.getGradeStruts();
			
			//得到所有的班级
			String login_name = null;
			if(strutsId==null || strutsId.equals("")){ 
				strutsId="0";
			}
			int a = Integer.parseInt(strutsId);
			
			OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
			List<OaJwbGrade> OaJwbGrades= null;
			
			if(loginUser.getPosition().getPosition_id()==22||loginUser.getPosition().getPosition_id()==1||loginUser.getPosition().getPosition_id()==37||loginUser.getPosition().getPosition_id()==20||loginUser.getPosition().getPosition_id()==25){
				OaJwbGrades = oaJzbClassplanService.getGrades(login_name, Teacher, a,0);
			}else{
				OaJwbGrades = oaJzbClassplanService.getGrades(login_name, Teacher, a,loginUser.getEmp_id());
			}
			
			requset.setAttribute("OaJwbGrades", OaJwbGrades);
			requset.setAttribute("OaJwbStruts", OaJwbStruts);
			session.setAttribute("index",0);
			return "teach_nature_department/jzb/gradeShowDayList";
		}
		
	//查看班级（进入班级的选项卡）
	@RequestMapping(value="/gradeShowListLink/{gradeid}")
	public String gradeShowListLink(@PathVariable String gradeid,String searchName,HttpSession session,HttpServletRequest requset){
		//显示班级详细信息
		session.setAttribute("gradeid", gradeid);
		gradeid=(String) session.getAttribute("gradeid");
		int id = Integer.parseInt(gradeid);
		//得到该班总人数
		int num = oaJzbClassplanService.getGradeCountById(id);
		session.setAttribute("num", num);
		OaJwbGrade  oaJwbGrade  = oaJzbClassplanService.ShowGradeByID(id);
		session.setAttribute("oaJwbGrade", oaJwbGrade);
		//显示班级带班计划
		/*根据班级得到该班的带班计划*/
		List<OaJzbClassplan> OaJzbClassplans = oaJzbClassplanService.getClassPlansById(id);
		for (int i = 0; i < OaJzbClassplans.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(OaJzbClassplans.get(i).getEnteringTime());
			OaJzbClassplans.get(i).setFlas(a);
		}
		requset.setAttribute("OaJzbClassplans", OaJzbClassplans);
		/*根据班级得到该班的老师总结*/
		
		List<OaJzbClassplansum> OaJzbClassplansums = oaJzbClassplansumsService.ShowClassplanSum(id);
		for (int i = 0; i < OaJzbClassplansums.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(OaJzbClassplansums.get(i).getEnteringTime());
			OaJzbClassplansums.get(i).setFlas(a);
		}
		requset.setAttribute("OaJzbClassplansums", OaJzbClassplansums);
		//个性访谈
		
		List<OaJwbSemester> semesters = oaJzbIndividualinterviewService.semesters();
		List<OaJzbIndividualinterview> stus = oaJzbIndividualinterviewService.stuList(searchName,0,null,id);
		session.setAttribute("semesters", semesters);
		session.setAttribute("stuI nfoList", stus);
		//开班情况分析表
		//项目答辩表
		List<OaJzbProject> oaJzbProject=oaJzbProjectService.getProjdectsByGrade_id(id);
		/*for (int i = 0; i < oaJzbProject.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(oaJzbProject.get(i).getEntering_time());
			oaJzbProject.get(i).setFlas(a);
		}*/
		requset.setAttribute("oaJzbProjectList", oaJzbProject);
		//巡班记录
		 List<OaJzbPatrolgrade> list1=patrolgradeservice.selectpatrolgrade(id);
		 for (int i = 0; i < list1.size(); i++) {
				OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
				boolean a = oaJzbRevoke.Revoke(list1.get(i).getEnteringTime());
				list1.get(i).setFlas(a);
			}
		 requset.setAttribute("patrolgradeList", list1);
		//班级数据
		 List<OaJzbGradedata> oajzb=granddate.selectgranddate(Integer.parseInt(gradeid));
		 requset.setAttribute("oajzb", oajzb);
	     //周考
	  	List<OaXsbWeek> weeklists=oaJzbClassplanService.getWhatweek();
	  	requset.setAttribute("weeklists",weeklists);
	  	int roaa = oaJzbClassplanService.getClassPlanCount(id);
	  	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		String zhDate = sdf1.format(new Date());
	  	requset.setAttribute("roaa", roaa);
	  	requset.setAttribute("createTime", zhDate);
	  	
		return "teach_nature_department/jzb/selectgrade";
	}
//	进入巡班记录
	@RequestMapping("joinxbjl/{gradeid}")
	public String joinxbjl(@PathVariable Integer gradeid,Model model,HttpSession session){
		session.setAttribute("gradeid", gradeid);
		//巡班记录
		 List<OaJzbPatrolgrade> list1=patrolgradeservice.selectpatrolgrade(gradeid);
		 for (int i = 0; i < list1.size(); i++) {
				OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
				boolean a = oaJzbRevoke.Revoke(list1.get(i).getEnteringTime());
				list1.get(i).setFlas(a);
			}
		 model.addAttribute("patrolgradeList", list1);
		 
		return "teach_nature_department/jzb/xunbanjilu";
	}
	@RequestMapping("/addquestion")
	public String addquestion(String specialty_name){
		int row = oaJzbQuestionService.addQuestion(specialty_name);
		if(row==1){
			return "teach_nature_department/welcome";
		}else{
			return "teach_nature_department/jzb/addquestion";
		}
		
	}
	@RequestMapping("jintonggang2B.html")
	public String jintonggang2B(HttpSession session){
		String gradeid = (String) session.getAttribute("gradeid");
		return "redirect:/gradeShowListLink/"+gradeid;
	}
}
