package cn.tyyhoa.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;


import cn.tyyhoa.pojo.OaJwbCurriculum;
import cn.tyyhoa.pojo.OaJwbFuckClass;
import cn.tyyhoa.pojo.OaJwbFuckType;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJwbMotor;
import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJwbStruts;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJybEmployment;
import cn.tyyhoa.pojo.OaJybInterviewScore;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.service.OaJwbGradeService;
import cn.tyyhoa.service.OaJybEmploymentService;
import cn.tyyhoa.service.OaJybHuifangService;
import cn.tyyhoa.service.OaJybInterService;
import cn.tyyhoa.service.OaJybInterviewService;
import cn.tyyhoa.service.OaJzbHebanService;

@RequestMapping(value = "/jwb")
@Controller
public class OajwbCreatClassController {


	private Logger logger = Logger.getLogger(OajwbCreatClassController.class);
	@Autowired
	OaJwbGradeService oaJwbGradeService;

	@Autowired
	OaJybHuifangService oaJybHuifangService;

	@Autowired
	OaJybInterviewService oaJybInterviewService;
	@Autowired
	OaJybInterService oaJybInterService;
	@Resource(name="OaJzbHebanService")
	private OaJzbHebanService ojhs;

	public OaJybInterviewService getOaJybInterviewService() {
		return oaJybInterviewService;
	}
	public void setOaJybInterviewService(OaJybInterviewService oaJybInterviewService) {
		this.oaJybInterviewService = oaJybInterviewService;
	}
	public OaJybInterService getOaJybInterService() {
		return oaJybInterService;
	}
	public void setOaJybInterService(OaJybInterService oaJybInterService) {
		this.oaJybInterService = oaJybInterService;
	}
	public OaJybHuifangService getOaJybHuifangService() {
		return oaJybHuifangService;
	}
	public void setOaJybHuifangService(OaJybHuifangService oaJybHuifangService) {
		this.oaJybHuifangService = oaJybHuifangService;
	}

	/**
	 * 添加
	 * @param record
	 * @return
	 */
	@RequestMapping(value="/classProject",method=RequestMethod.GET)
	public String AddClass(HttpServletRequest request){


		//查询产品
		List<OaJzbSpecialty> specialtys =oaJwbGradeService.selectSpecialty();
		request.setAttribute("specialtyList", specialtys);

		//查询机房
		List<OaJwbMotor> motors=oaJwbGradeService.selectMotor();
		request.setAttribute("motorList", motors);


		//查询班主任
		List<OaRlzybEmployee> classteacher=oaJwbGradeService.selectClassTeacher();
		request.setAttribute("classTeacherList", classteacher);
		System.out.println(classteacher.get(0).getEmp_id());
		//查询教员
		List<OaRlzybEmployee> teacher=oaJwbGradeService.selectTeacher();
		request.setAttribute("teacherList", teacher);


		//查询就业专员
		List<OaRlzybEmployee> obtains=oaJwbGradeService.selectObtain();
		request.setAttribute("obtainList", obtains);

		//添加
		return "/academic_affairs_department/jwb_add_classProject";
	}
	/**
	 * 根据ID获取班级信息
	 * @param gid
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/updateProject.do")
	@ResponseBody
	public String userView(String gid,HttpServletRequest request){
		OaJwbGrade list=oaJwbGradeService.selectProject(Integer.parseInt(gid),null,0,0).get(0);
		return JSONArray.toJSONString(list);
	}

	/**
	 * 添加班级
	 * @param record
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/addProject", produces = "application/json;charset=utf-8")
	public String AddProject(@ModelAttribute OaJwbGrade record,
			HttpServletRequest request){
		if(record.getSpecialtyID()==1){
			record.setStage(1);
		}else{
			record.setStage(4);
		}
		record.setStruts(1);
		int row = oaJwbGradeService.insert(record);
		int rowm= oaJwbGradeService.updatemotor(1,record.getMotorid());
		System.out.println(rowm);
		if(row==1&&rowm==1){
			oaJwbGradeService.insertFuckClass();
			return "redirect:/jwb/class_info1.html";
		}else{
			return "/academic_affairs_department/jwb_add_classProject";
		}	
	}

	/**
	 * 跳转到班级基本信息
	 * @return
	 */
	@RequestMapping(value="/class_info1.html",method=RequestMethod.GET)
	public String showGrade(@RequestParam(required=false) String sname,
			@RequestParam(required=false) String steacher,
			@RequestParam(required=false) String sclassTeacher,
			HttpServletRequest request){
		if(sname !=null && !sname.equals("")){
			request.setAttribute("sname", sname);
		}

		//查询班主任
		int teacherID=0;
		if(steacher != null && !steacher.equals("")){
			//转乱码
			try {
				steacher=new String(steacher.getBytes("ISO8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			request.setAttribute("steacher", steacher);
			teacherID=oaJwbGradeService.selectById(steacher);
		}
		//查询教员
		int classTeacherID=0;
		if(sclassTeacher != null && !sclassTeacher.equals("")){
			try {
				sclassTeacher=new String(sclassTeacher.getBytes("ISO8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			request.setAttribute("sclassTeacher", sclassTeacher);
			classTeacherID=oaJwbGradeService.selectById(sclassTeacher);
		}

		List<OaJwbGrade> list=oaJwbGradeService.selectProject(0,sname,teacherID,classTeacherID);		

		request.setAttribute("gradeList", list);

		//查询阶段
		List<OaJwbSemester> semesters = ojhs.selectsemester();
		request.setAttribute("semestersList", semesters);

		//查询产品
		List<OaJzbSpecialty> specialtys =oaJwbGradeService.selectSpecialty();
		request.setAttribute("specialtyList", specialtys);

		//查询机房
		List<OaJwbMotor> motors=oaJwbGradeService.selectMotor();
		request.setAttribute("motorList", motors);


		//查询班主任
		List<OaRlzybEmployee> classteacherList=oaJwbGradeService.selectClassTeacher();
		request.setAttribute("classTeacherList", classteacherList);

		//查询教员
		List<OaRlzybEmployee> teacherList=oaJwbGradeService.selectTeacher();
		request.setAttribute("teacherList", teacherList);


		//查询班级状态
		List<OaJwbStruts> statusList=oaJwbGradeService.selectStatus();
		request.setAttribute("statusList", statusList);


		//查询就业专员
		List<OaRlzybEmployee> obtains=oaJwbGradeService.selectObtain();
		request.setAttribute("obtainList", obtains);
		return "/academic_affairs_department/jwb_show_class_info1";



	}


	/**
	 * 就业部添加
	 */
	private ApplicationContext count = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
	private OaJybEmploymentService oaJybEmp = (OaJybEmploymentService) count.getBean("OaJybEmploymentService");	


	/**
	 * 根据ID修改班级信息
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/updateGrade.html",method=RequestMethod.POST)
	public String UpdateGrade1(@RequestParam(required=false)String id,
			@RequestParam(required=false)String name,
			@RequestParam(required=false)String specialtyID,
			@RequestParam(required=false)String semestersID,
			@RequestParam(required=false)String status,
			@RequestParam(required=false)String classTeacher,
			@RequestParam(required=false)String teacher,
			@RequestParam(required=false)String obtain,
			@RequestParam(required=false)String motor,
			@RequestParam(required=false)String motorHidden,
			@RequestParam(required=false)String createTime,
			HttpServletRequest request) throws ParseException{
		int teacherID=oaJwbGradeService.selectById(teacher);
		int classTeacherID=oaJwbGradeService.selectById(classTeacher);
		int obtainID=oaJwbGradeService.selectById(obtain);
		if(status.equals("3")){
			int grade_id = oaJwbGradeService.selectGradeid(name);
			int upsta = oaJwbGradeService.updateStusta(grade_id);
			System.out.println("修改后学生状态："+upsta);
		}
		if(motor==null){
			motor=motorHidden;
		}
		int motorID=Integer.parseInt(motor);

		int statusid=Integer.parseInt(status);

		OaJwbGrade OaJwbGrade=new OaJwbGrade();
		OaJwbGrade.setId(Integer.parseInt(id));
		OaJwbGrade.setName(name);
		OaJwbGrade.setSpecialtyID(Integer.parseInt(specialtyID));
		OaJwbGrade.setStage(Integer.parseInt(semestersID));
		OaJwbGrade.setClassTeacherID(classTeacherID);
		OaJwbGrade.setTeacherID(teacherID);
		OaJwbGrade.setObtainID(obtainID);
		OaJwbGrade.setMotorid(motorID);
		OaJwbGrade.setStruts(statusid);
		Date createDate=new java.sql.Date(new SimpleDateFormat("yyyy-MM-dd").parse(createTime).getTime());
		OaJwbGrade.setCreateTime(createDate);

		if(statusid !=1){
			oaJwbGradeService.updatemotor(0, motorID);
		}else{
			oaJwbGradeService.updatemotor(1, motorID);
		}
		int row=oaJwbGradeService.updateGrade(OaJwbGrade);
		int gradeStatus=oaJwbGradeService.selectStrutsById(Integer.parseInt(id));
		if(row>0){
			if(statusid ==3){
				List<OaJzbStudent> empList2 =oaJybEmp.selectDaiStu2(Integer.parseInt(id));
				for (OaJzbStudent oaJzbStudent2 : empList2) {
					OaJybEmployment o= new OaJybEmployment();
					o.setEmployment_studentId(oaJzbStudent2);
					oaJybEmp.empinsertSelective(o);
				}
			}
			return "redirect:/jwb/class_info1.html";
		}else{
			return "error";
		}
	}


	/**
	 * 跳转到带班数据表
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws ParseException 
	 */
	@RequestMapping(value="/class_info.html")
	public String showClass(@RequestParam(required=false)String grade,
			@RequestParam(required=false)String selectDate,
			HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
	
		if(selectDate==null || selectDate.equals("")){
			selectDate=null;
		}
		request.setAttribute("selectDate", selectDate);
		if(grade !=null && !grade.equals("")){
				request.setAttribute("grade", grade);
			if(grade.equals("请选择")){
				grade = null;
			}
		}
		List<OaJwbGrade> list=oaJwbGradeService.selectGrade2(null,grade, selectDate);
		List<OaJwbGrade> list1=oaJwbGradeService.selectGrade(null,grade, selectDate);
		SimpleDateFormat df1=new SimpleDateFormat("yyyy-MM");
		for(OaJwbGrade oa:list){
			oa.setClassHourPT(0);
		}
		for(OaJwbGrade oa1:list1){
			boolean tf=true;
			for(OaJwbGrade oa:list){
				String dt1=df1.format(oa1.getCreateTime());
				String dt2=df1.format(oa.getCreateTime());
				if(dt1.equals(dt2) && oa.getId()==oa1.getId()){
					oa.setClassHourPT(oa1.getClassHourPT());
					tf=false;
					break;
				}
			}
			if(tf){
				oa1.setPreparationPT(0);
				oa1.setManamiPT(0);
				oa1.setHomeworkPT(0);
				oa1.setObuPT(0);
				list.add(oa1);
			}
		}
		for(int i=0;i<list.size();i++){
			String dt=df1.format(list.get(i).getCreateTime());
			for(int j=0;j<list.size();j++){
				String dt2=df1.format(list.get(j).getCreateTime());
				if(dt.compareTo(dt2)>0){
					OaJwbGrade oa=list.get(i);
					list.set(i, list.get(j));  
                    list.set(j, oa);  
				}
			}
		}
		request.setAttribute("ObJwblist", list);
		return "academic_affairs_department/jwb_show_Class_info";

	}
	/**
	 * 跳转到A班数据表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/class_A.html")
	public String showClassA(@RequestParam(required=false)String grade,
			@RequestParam(required=false)String selectDate,
			HttpServletRequest request){
		if(selectDate==null || selectDate.equals("")){
			selectDate=null;
		}
		request.setAttribute("selectDate", selectDate);
		if(grade !=null && !grade.equals("")){
			try {
				grade=new String(grade.getBytes("ISO8859-1"),"UTF-8");
				request.setAttribute("grade", grade);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
		}
		List<OaJwbGrade> list1 =oaJwbGradeService.selectGrade("1",grade,selectDate);
		request.setAttribute("ObJwblist", list1);
		return "academic_affairs_department/jwb_show_class_A";

	}
	/**
	 * 跳转到个人月考数据表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/showScore.html")
	public String showScore(@RequestParam(required=false)String grade,
			@RequestParam(required=false)String name,
			@RequestParam(required=false)String selectDate,
			HttpServletRequest request,HttpSession session){
		if(grade==null||grade.equals("")){
			session.setAttribute("index", 0);
		}
		if(selectDate==null || selectDate.equals("")){
			selectDate=null;
		}
		request.setAttribute("selectDate", selectDate);
		if(grade !=null && !grade.equals("")){
			try {
				grade=new String(grade.getBytes("ISO8859-1"),"UTF-8");
				request.setAttribute("grade", grade);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
		}
		List<OaJwbGrade> list=oaJwbGradeService.selectMonthStudent(grade, selectDate);
		request.setAttribute("ObJwblist", list);

		if(name !=null && !name.equals("")){
			try {
				name=new String(name.getBytes("ISO8859-1"),"UTF-8");
				request.setAttribute("name", name);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
		}
		List<OaJwbGrade> listG=oaJwbGradeService.selectScoreGrade(name);
		request.setAttribute("ObJwblistG", listG);



		return "academic_affairs_department/jwb_show_score";

	}

	/**
	 * 跳转到C班数据表
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/class_C.html")
	public String showClassC(@RequestParam(required=false)String grade,
			@RequestParam(required=false)String selectDate,
			HttpServletRequest request){
		if(selectDate==null || selectDate.equals("")){
			selectDate=null;
		}
		request.setAttribute("selectDate", selectDate);
		if(grade !=null && !grade.equals("")){
			try {
				grade=new String(grade.getBytes("ISO8859-1"),"UTF-8");
				request.setAttribute("grade", grade);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
		}
		List<OaJwbGrade> list1 =oaJwbGradeService.selectGrade("2",grade,selectDate);
		request.setAttribute("ObJwblist", list1);
		return "academic_affairs_department/jwb_show_class_C";

	}

	/**
	 * 跳转到教师课时统计表
	 * @return
	 */
	@RequestMapping(value="/HeadMaster_hour.html",method=RequestMethod.GET)
	public String showTeacherhour(
			@RequestParam(required=false)String selectDate,
			@RequestParam(required=false)String lecturer,
			HttpServletRequest request){
		if(selectDate==null || selectDate.equals("")){
			selectDate=null;
		}
		request.setAttribute("selectDate", selectDate);
		if(lecturer !=null && !lecturer.equals("")){
			try {
				lecturer=new String(lecturer.getBytes("ISO8859-1"),"UTF-8");
				request.setAttribute("lecturer", lecturer);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
		}
		List<OaJwbCurriculum> list=oaJwbGradeService.selectclassTeacherGrade(selectDate,lecturer);
		request.setAttribute("ClassTeacherGradeList", list);
		return "/academic_affairs_department/jwb_show_HeadMaster_hour";

	}
	/**
	 * 跳转到教员课时统计表
	 * @return
	 */
	@RequestMapping(value="/Teacher_hour.html",method=RequestMethod.GET)
	public String showTeacher(
			@RequestParam(required=false)String selectDate,
			@RequestParam(required=false)String lecturer,
			HttpServletRequest request){
		if(selectDate==null || selectDate.equals("")){
			selectDate=null;
		}
		request.setAttribute("selectDate", selectDate);
		if(lecturer !=null && !lecturer.equals("")){
			try {
				lecturer=new String(lecturer.getBytes("ISO8859-1"),"UTF-8");
				request.setAttribute("lecturer", lecturer);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}			
		}
		List<OaJwbCurriculum> list=oaJwbGradeService.selectTeacherGrade(selectDate,lecturer);
		request.setAttribute("TeacherGradeList", list);
		return "/academic_affairs_department/jwb_show_Teacher_hour";

	}


	/**
	 * 跳转添加通知
	 */
	@RequestMapping(value="/notice_add" ,method=RequestMethod.GET )
	public String AddNotic(HttpServletRequest request){

		System.out.println("添加++++++++++");
		return "academic_affairs_department/jwb_notice_add";

	}

	/**
	 * 跳转查看通知
	 */
	@RequestMapping(value="/notice_list" ,method=RequestMethod.GET)
	public String showNotic(HttpServletRequest request){
		System.out.println("查看++++++++++++++");
		return "academic_affairs_department/jwb_notice_list";

	}

	
	@RequestMapping("/addClass.html")
	public String addClass(HttpServletRequest request){
		List<OaJwbFuckClass> listClass=oaJwbGradeService.selFuckClass();
		List<OaJwbFuckType> listType=oaJwbGradeService.selFuckType();
		request.setAttribute("class", listClass);
		request.setAttribute("type", listType);
		return "academic_affairs_department/jwb_addClass";
	}
	
	@RequestMapping("/updateClass.html")
	@ResponseBody
	public Object updateClass(
			@RequestParam(required=false)String gradeId,
			@RequestParam(required=false)String mon,
			@RequestParam(required=false)String tue,
			@RequestParam(required=false)String wed,
			@RequestParam(required=false)String thu,
			@RequestParam(required=false)String tri,
			@RequestParam(required=false)String sat
			){
		Map<String,String> map=new HashMap<String, String>();
		map.put("gradeId", gradeId);
		map.put("mon", mon);
		map.put("tue", tue);
		map.put("wed", wed);
		map.put("thu", thu);
		map.put("tri", tri);
		map.put("sat", sat);
		int update=oaJwbGradeService.updateFuckClass(map);
		return JSON.toJSONString(update);
	}
}
