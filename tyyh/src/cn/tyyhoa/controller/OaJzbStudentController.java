package cn.tyyhoa.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



import Decoder.BASE64Decoder;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJzbMembership;
import cn.tyyhoa.pojo.OaJzbPatriarchInterview;
import cn.tyyhoa.pojo.OaJzbPunish;
import cn.tyyhoa.pojo.OaJzbSpecialty;
import cn.tyyhoa.pojo.OaJzbStuInterview;
import cn.tyyhoa.pojo.OaJzbStudent;
import cn.tyyhoa.pojo.OaJzbStudentstatus;
import cn.tyyhoa.pojo.OaJzbWorkcondition;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbPayfeesway;
import cn.tyyhoa.service.OaJzbPatriarchInterviewService;
import cn.tyyhoa.service.OaJzbPunishService;
import cn.tyyhoa.service.OaJzbReceiveConsultService;
import cn.tyyhoa.service.OaJzbStuInterviewService;
import cn.tyyhoa.service.OaJzbStudentService;
import cn.tyyhoa.service.OaScbConsulterService;
import cn.tyyhoa.util.OaJzbRevoke;

@Controller
public class OaJzbStudentController {
	private Logger logger = Logger.getLogger("OaJzbStudentController.class");
	
	@Autowired
	OaJzbStudentService oaJzbStudentService;
	@Autowired
	OaJzbPatriarchInterviewService oaJzbPatriarchInterviewService;
	@Autowired
	OaJzbStuInterviewService stuInterviewSer;
	@Autowired
	OaJzbPunishService oaJzbPunishService;
	@Autowired
	OaJzbReceiveConsultService receiveConsultSer;
	@Autowired
	OaScbConsulterService OaScbConsulterService;
	
	
	//查询学员来源
		@ResponseBody
		@RequestMapping(value = "ConsultDirectorCome")
		public String ConsultDirectorCome(String name) throws UnsupportedEncodingException{
			String sum=new String(name.getBytes("ISO-8859-1"),"UTF-8");
			OaScbConsulter list=OaScbConsulterService.ConsultDirectorCome(sum);
			String num=JSON.toJSONString(list);
			System.out.println(num);
			return num;
		}
		
		
	//跳转学员信息列表页面
	@RequestMapping(value="toJzbStudent")
	public String toJzbStudent(HttpSession session){
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		/*班级下拉列表*/
 		List<OaJwbGrade> grades=null;
		if(loginUser.getPosition().getPosition_id()==22||loginUser.getPosition().getPosition_id()==36){
			grades = oaJzbStudentService.gradeList(0);
		}else{
			grades = oaJzbStudentService.gradeList(loginUser.getEmp_id());
		}
		 
		session.setAttribute("grades", grades);
		
		/*学员状态下拉列表*/
		List<OaJzbStudentstatus> status = oaJzbStudentService.statusList();
		session.setAttribute("status", status);
		session.setAttribute("index", 0);
 		return "teach_nature_department/jzb/Stu_info";
 	}
	
	/*查看学员信息*/
	@RequestMapping(value="/oaJzbStudentlist",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object oaJzbStudentlist(
			String queryGrade,
			String searchName,
			String queryStatus,
			String index,
			HttpSession session,
			HttpServletRequest request){
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		if (queryGrade == null || queryGrade.equals("")) {
			queryGrade = "0";
		}
		if (queryStatus == null || queryStatus.equals("")) {
			queryStatus = "0";
		}
		/*当前页*/
		if(index == null){
			index = "1";
		}
		
		Map<String,Object> maps = new HashMap<String, Object>();
		List<OaJzbStudent> stuList= null;
		int count = 0;
		 List<Object> fals = new ArrayList<>();
		 
		 OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
		if(loginUser.getPosition().getPosition_id()==22 ||loginUser.getPosition().getPosition_id()==36){
			/*学员档案信息*/
			 stuList = oaJzbStudentService.stuList(Integer.parseInt(queryGrade), searchName, Integer.parseInt(queryStatus),0,Integer.parseInt(index),10);
			
				for (int i = 0; i < stuList.size(); i++) {
					boolean a =true;
					if(stuList.get(i).getEntry_date()!=null){
						a = oaJzbRevoke.Revoke(stuList.get(i).getEntry_date());
					}
					fals.add(a);
				}
			 
			 /*总记录数*/
			 count = oaJzbStudentService.getStuCount(Integer.parseInt(queryGrade), searchName, Integer.parseInt(queryStatus), 0);
		}else{
			/*学员档案信息*/
			 stuList = oaJzbStudentService.stuList(Integer.parseInt(queryGrade), searchName, Integer.parseInt(queryStatus),loginUser.getEmp_id(),Integer.parseInt(index),10);
			 for (int i = 0; i < stuList.size(); i++) {
					boolean a = oaJzbRevoke.Revoke(stuList.get(i).getEntry_date());
					fals.add(a);
				}
			 /*总记录数*/
			 count = oaJzbStudentService.getStuCount(Integer.parseInt(queryGrade), searchName, Integer.parseInt(queryStatus), loginUser.getEmp_id());
		}
		/*总页数*/
		int pageCount = count % 10 == 0 ? count / 10 : count / 10 + 1;
		maps.put("fals", fals);
		maps.put("index", Integer.parseInt(index));
		maps.put("stuList", stuList);
		maps.put("pageCount", pageCount);
		
		
		return JSONArray.toJSONString(maps);
	}
	
	
	// 跳转全部学员信息列表页面
	@RequestMapping(value = "toJzbAllStudent")
	public String toJzbAllStudent(HttpSession session) {
		session.setAttribute("index", 0);
		/* 班级下拉列表 */
		List<OaJwbGrade> grades = oaJzbStudentService.gradeList(0);
		session.setAttribute("grades", grades);

		/* 学员状态下拉列表 */
		List<OaJzbStudentstatus> status = oaJzbStudentService.statusList();
		session.setAttribute("status", status);
		return "teach_nature_department/jzb/allStu_info";
	}
	
	/*查看全部学员信息*/
	@RequestMapping(value="/oaJzbAllStudentlist",produces="application/json;charset=utf-8")
	@ResponseBody
	public Object oaJzbAllStudentlist(
			String queryGrade,
			String searchName,
			String queryStatus,
			String index,
			HttpSession session,
			HttpServletRequest request){
		if (queryGrade == null || queryGrade.equals("")) {
			queryGrade = "0";
		}
		if (queryStatus == null || queryStatus.equals("")) {
			queryStatus = "0";
		}
		/*当前页*/
		if(index == null){
			index = "1";
		}
		
		
		Map<String,Object> maps = new HashMap<String, Object>();
		/*学员档案信息*/
		List<OaJzbStudent> stuList = oaJzbStudentService.stuList(Integer.parseInt(queryGrade), searchName, Integer.parseInt(queryStatus),0,Integer.parseInt(index),10);
		for (OaJzbStudent oaJzbStudent : stuList) {
			System.out.println(oaJzbStudent.getStu_name());
		}
		/*总记录数*/
		int count = oaJzbStudentService.getStuCount(Integer.parseInt(queryGrade), searchName, Integer.parseInt(queryStatus), 0);
		
		/*总页数*/
		int pageCount = count % 10 == 0 ? count / 10 : count / 10 + 1;
		
		maps.put("index", Integer.parseInt(index));
		maps.put("stuList", stuList);
		maps.put("pageCount", pageCount);

		
		/*查询条件*/
		request.setAttribute("queryGrade", queryGrade);
		request.setAttribute("searchName", searchName);
		request.setAttribute("queryStatus", queryStatus);
		
		return JSONArray.toJSONString(maps);
	}
	
	
	/*查看学员详情*/
	@RequestMapping(value="/oaJzbStudentInfo/{stuid}")
	public String tostuInfo(
			@PathVariable String stuid,
			HttpSession session,HttpServletRequest request
			){
		session.setAttribute("stuid", stuid);
		if (stuid == null || stuid.equals("")) {
			stuid = "0";
		}
		//家长访谈
		List<OaJzbPatriarchInterview> oaJzbPatriarchInterviews = oaJzbPatriarchInterviewService.getJZFTSById(Integer.parseInt(stuid));
		for (int i = 0; i < oaJzbPatriarchInterviews.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(oaJzbPatriarchInterviews.get(i).getEntering_time());
			oaJzbPatriarchInterviews.get(i).setFlas(a);
		}
		request.setAttribute("oaJzbPatriarchInterviews", oaJzbPatriarchInterviews);
		//学生访谈
		List<OaJzbStuInterview> list=stuInterviewSer.findSelect(Integer.parseInt(stuid));
		for (int i = 0; i < list.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(list.get(i).getEnteringTime());
			list.get(i).setFlas(a);
			System.out.println(list);
		}
		request.setAttribute("stuInterviewlist", list);
		//查看详情
				OaJzbStudent studentInfo = oaJzbStudentService.getStuInfo(Integer.parseInt(stuid));
				/*照片*/
				String photograph = oaJzbStudentService.getStuPhoto(Integer.parseInt(stuid));
				if(photograph != null && photograph !=""){
					int photoPath_index = photograph.lastIndexOf("\\");
					photograph = photograph.substring(photoPath_index+1);
					photograph = "/uploadfiles/"+photograph;
					studentInfo.setPhotograph(photograph);
				}
				session.setAttribute("studentInfo", studentInfo);
		//惩罚信息
		List<OaJzbPunish> oaJzbPunishList=oaJzbPunishService.queryOaJzbPunishListByStuName(Integer.parseInt(stuid));
		for (int i = 0; i < oaJzbPunishList.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(oaJzbPunishList.get(i).getEntering_time());
			oaJzbPunishList.get(i).setFlas(a);
		}
		request.setAttribute("oaJzbPunishList", oaJzbPunishList);
		return "teach_nature_department/jzb/tab";
	}
	
	/*查看学员并跳转到分析页面*/
	@RequestMapping(value="/addtiaozhuan/{stuid}")
	public String addtiaozhuan(
			@PathVariable String stuid,
			HttpSession session,HttpServletRequest request
			){
		session.setAttribute("stuid", stuid);
		if (stuid == null || stuid.equals("")) {
			stuid = "0";
		}
		//家长访谈
		List<OaJzbPatriarchInterview> oaJzbPatriarchInterviews = oaJzbPatriarchInterviewService.getJZFTSById(Integer.parseInt(stuid));
		for (int i = 0; i < oaJzbPatriarchInterviews.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(oaJzbPatriarchInterviews.get(i).getEntering_time());
			oaJzbPatriarchInterviews.get(i).setFlas(a);
		}
		request.setAttribute("oaJzbPatriarchInterviews", oaJzbPatriarchInterviews);
		//学生访谈
		List<OaJzbStuInterview> list=stuInterviewSer.findSelect(Integer.parseInt(stuid));
		for (int i = 0; i < list.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(list.get(i).getEnteringTime());
			list.get(i).setFlas(a);
		}
		request.setAttribute("stuInterviewlist", list);
		//查看详情
				OaJzbStudent studentInfo = oaJzbStudentService.getStuInfo(Integer.parseInt(stuid));
				/*照片*/
				String photograph = oaJzbStudentService.getStuPhoto(Integer.parseInt(stuid));
				if(photograph != null && photograph !=""){
					int photoPath_index = photograph.lastIndexOf("\\");
					photograph = photograph.substring(photoPath_index+1);
					photograph = "/uploadfiles/"+photograph;
					studentInfo.setPhotograph(photograph);
				}
				session.setAttribute("studentInfo", studentInfo);
		//惩罚信息
		List<OaJzbPunish> oaJzbPunishList=oaJzbPunishService.queryOaJzbPunishListByStuName(Integer.parseInt(stuid));
		for (int i = 0; i < oaJzbPunishList.size(); i++) {
			OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
			boolean a = oaJzbRevoke.Revoke(oaJzbPunishList.get(i).getEntering_time());
			oaJzbPunishList.get(i).setFlas(a);
		}
		request.setAttribute("oaJzbPunishList", oaJzbPunishList);
		return "redirect:/addtiaozhuan.html";
	}
	
	
	/*跳转到编辑学员*/
	@RequestMapping(value="/editStuInfo/{stuid}")
	public String editStuInfo(
			@PathVariable String stuid,
			HttpSession session
			){
		
		/*班级下拉列表*/
		List<OaJwbGrade> grades = oaJzbStudentService.gradeList(0);
		/*所学专业下拉列表*/
		List<OaJzbSpecialty> specialtys = oaJzbStudentService.specialtyList();
		/*学历下拉列表*/
		List<OaScbEducation> educations = oaJzbStudentService.educations();
		/*信息来源*/
		List<OaScbInfosource> infoSources = oaJzbStudentService.infoSources();
		/*成员关系下拉列表*/
		List<OaJzbMembership> memberships = oaJzbStudentService.memberships();
		
		session.setAttribute("educations", educations);
		
		session.setAttribute("grades", grades);
		
		session.setAttribute("specialtys", specialtys);
		
		session.setAttribute("infoSources", infoSources);
		
		session.setAttribute("memberships", memberships);
		
		if (stuid == null || stuid.equals("")) {
			stuid = "0";
		}
		OaJzbStudent studentInfo = oaJzbStudentService.getStuInfo(Integer.parseInt(stuid));
		studentInfo.setStu_Id(Integer.parseInt(stuid));
		/*照片*/
		String photograph = oaJzbStudentService.getStuPhoto(Integer.parseInt(stuid));
		if(photograph != null && photograph !=""){
			int photoPath_index = photograph.lastIndexOf("\\");
			photograph = photograph.substring(photoPath_index+1);
			photograph = "/uploadfiles/"+photograph;
			studentInfo.setPhotograph(photograph);
		}
		session.setAttribute("studentInfo", studentInfo);
		return "teach_nature_department/jzb/update";
	}

	
	/*编辑学员*/
	@RequestMapping(value="/modifyStuInfo",method=RequestMethod.POST)
	@ResponseBody
	public Object modifyStuInfo(
			@ModelAttribute OaJzbStudent oaJzbStudent,
			HttpServletRequest request,HttpSession session
			){
		String stu_id = oaJzbStudent.getStu_Id().toString();
		oaJzbStudentService.updateWeiXin(oaJzbStudent.getWechat(), stu_id);
		boolean flag = oaJzbStudentService.updateStuInfo(oaJzbStudent);
		if(flag){
			return "redirect:/editStuInfo/"+stu_id;
		}else{
			return "redirect:/oaJzbStudentlist";
		}
		
	}
	/*编辑学员详细信息*/
	@RequestMapping(value="/editAdddetailedStuInfo",method=RequestMethod.POST)
	@ResponseBody
	public Object editAdddetailedStuInfo(@ModelAttribute OaJzbStudent oaJzbStudent,HttpSession session){
		String stu_id = (String) session.getAttribute("stuid");
		boolean flag = oaJzbStudentService.modifyAdddetailedStuInfo(oaJzbStudent);
		if(flag){
			return "redirect:/editStuInfo/"+stu_id;
		}else{
			return "redirect:/oaJzbStudentlist";
		}
	}
	
	/*编辑学员成员信息*/
	@RequestMapping(value="/editAddMemberStuInfo",method=RequestMethod.POST)
	@ResponseBody
	public Object editAddMemberStuInfo(@ModelAttribute OaJzbStudent oaJzbStudent){
		boolean flag = oaJzbStudentService.modifyAddMemberStuInfo(oaJzbStudent);
		if(flag){
			return "redirect:/oaJzbStudentlist";
		}else{
			return "redirect:/oaJzbStudentlist";
		}
	}
	
	
	/*跳转到添加学员*/
	@RequestMapping(value="/toAddStuInfo.html")
	public String toAddStuInfo(HttpSession session){
		/*班级下拉列表*/
		List<OaJwbGrade> grades = oaJzbStudentService.gradeList(0);
		/*所学专业下拉列表*/
		List<OaJzbSpecialty> specialtys = oaJzbStudentService.specialtyList();
		/*学历下拉列表*/
		List<OaScbEducation> educations = oaJzbStudentService.educations();
		/*信息来源*/
		List<OaScbInfosource> infoSources = oaJzbStudentService.infoSources();
		/*成员关系下拉列表*/
		List<OaJzbMembership> memberships = oaJzbStudentService.memberships();
		/*缴费方式*/
		List<OaScbPayfeesway> payfeesways = oaJzbStudentService.payfeesways();
		/*工作状态*/
		List<OaJzbWorkcondition> workconditions = oaJzbStudentService.workconditions();
		
		session.setAttribute("educations", educations);
		
		session.setAttribute("grades", grades);
		
		session.setAttribute("specialtys", specialtys);
		
		session.setAttribute("infoSources", infoSources);
		
		session.setAttribute("memberships", memberships);
		
		session.setAttribute("payfeesways", payfeesways);
		
		session.setAttribute("workconditions", workconditions);
		
		return "teach_nature_department/jzb/add_StuInfo";
	}
	
	
	/*添加学员基本信息*/
	@RequestMapping(value="/addStuInfo",method=RequestMethod.POST)
	@ResponseBody
	public Object addStuInfo(
			String grade_id,
			String stu_age,
			OaJzbStudent oaJzbStudent,
			HttpServletRequest request,HttpSession session){
		/*年龄*/
		oaJzbStudent.setStu_age(Integer.parseInt(stu_age));
		Date date = new Date();
		oaJzbStudent.setEntry_date(date);
		boolean flag = oaJzbStudentService.addStudent(oaJzbStudent);
		if(flag){
			int stuid = oaJzbStudentService.getLastInsert();
			session.setAttribute("InsstuId", stuid);
			return "redirect:/toAddStuInfo.html";
		}else{
			return "redirect:/oaJzbStudentlist";
		}
	}
	
	
	/*所在班级*/
	@RequestMapping(value ="/gradeinfolist", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String datadictionarylist() {
		List<OaJwbGrade> grades = oaJzbStudentService.gradeList(0);
		System.out.println(grades.get(0).getName()+"*****************");
		return JSONArray.toJSONString(grades);
	}
	
	/*所学专业*/
	@RequestMapping(value = "/specialtylist", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String specialtylist() {
		List<OaJzbSpecialty> specialtys = oaJzbStudentService.specialtyList();
		return JSONArray.toJSONString(specialtys);
	}
	
	
	/*学历*/
	@RequestMapping(value = "/educationlist", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String educationlist() {
		List<OaScbEducation> educations = oaJzbStudentService.educations();
		return JSONArray.toJSONString(educations);
	}
	
	/*成员关系*/
	@RequestMapping(value = "/membershiplist", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String membershiplist() {
		List<OaJzbMembership> memberships = oaJzbStudentService.memberships();
		return JSONArray.toJSONString(memberships);
	}
	
	
	/*信息来源*/
	@RequestMapping(value = "/infoSourcelist", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String infoSourcelist() {
		List<OaScbInfosource> infoSources = oaJzbStudentService.infoSources();
		return JSONArray.toJSONString(infoSources);
	}
	
	
	/*缴费方式*/
	@RequestMapping(value = "/payfeeslist", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String payfeeslist() {
		List<OaScbPayfeesway> payfeesways = oaJzbStudentService.payfeesways();
		return JSONArray.toJSONString(payfeesways);
	}
	
	/*工作状态*/
	@RequestMapping(value = "/workconditionlist", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String workconditionlist() {
		List<OaJzbWorkcondition> workconditions = oaJzbStudentService.workconditions();
		return JSONArray.toJSONString(workconditions);
	}
	
	
	/*编辑添加学员详细信息*/
	@RequestMapping(value="/modifyAdddetailedStuInfo",method=RequestMethod.POST)
	@ResponseBody
	public Object modifyAdddetailedStuInfo(OaJzbStudent oaJzbStudent,HttpServletRequest request,HttpSession session){
		int stuid=(int) session.getAttribute("InsstuId");
		oaJzbStudent.setStu_Id(stuid);
		boolean flag = oaJzbStudentService.modifyAdddetailedStuInfo(oaJzbStudent);
		if(flag){
			int sid = oaJzbStudentService.getLastInsert();
			return "redirect:/toAddStuInfo.html";
		}else{
			return "redirect:/oaJzbStudentlist";
		}
	}
	
	/*编辑添加学员成员详细信息*/
	@RequestMapping(value="/modifyAddMemberStuInfo",method=RequestMethod.POST)
	@ResponseBody
	public Object modifyAddMemberStuInfo(
			String member_age,
			OaJzbStudent oaJzbStudent,
			HttpServletRequest request,HttpSession session){
		int stuid=(int) session.getAttribute("InsstuId");
		oaJzbStudent.setStu_Id(stuid);
		
		/*曲线救国*/
		String a_memberBirthday = request.getParameter("a_memberBirthday");
		System.out.println(a_memberBirthday);
		Date date=null;
		if(!a_memberBirthday.equals("")&&a_memberBirthday!=null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式		
			try {
				date=sdf.parse(a_memberBirthday.toString());
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//转换为默认Date格式
		}
		oaJzbStudent.setMemberBirthday(date);
		oaJzbStudent.setMember_age(Integer.parseInt(member_age));
		boolean flag = oaJzbStudentService.modifyAddMemberStuInfo(oaJzbStudent);
		if(flag){
			return "redirect:/toJzbStudent";
		}else{
			return "redirect:/toJzbStudent";
		}
	}
	
	/*删除学员档案*/
	@RequestMapping(value="/deleteStuInfo/{stuid}")
	public String deleteStuInfo(
			@PathVariable String stuid
			){
		System.out.println(stuid);
		boolean flag = oaJzbStudentService.deleteStuInfo(Integer.parseInt(stuid));
		if(flag){
			return "redirect:/toJzbStudent";
		}else{
			return "redirect:/toJzbStudent";
		}
		
	}
	
	
	/*上传图片*/
	@RequestMapping(value = "/UploadPersonPhoto", produces = "text/html;charset=UTF-8;")
	@ResponseBody
	public String UploadPersonPhoto(
			@RequestParam("UUserCard") String UUserCard,
			@RequestParam("imgRecord") String imgRecord,
			HttpServletRequest request) {
		String path = request.getSession().getServletContext()
				.getRealPath("statics" + File.separator + "uploadfiles");
		String fileName = System.currentTimeMillis()// 系统时间及随机数拼接文件名
				+ RandomUtils.nextInt(10000000) + ".jpg";
		String logoLocPath = path + File.separator + fileName;
		/* System.out.println(logoLocPath); */
		if (GenerateImage(imgRecord, logoLocPath)) {
			    boolean flag = oaJzbStudentService.updateStuPhoto(logoLocPath, UUserCard);
				return "上传成功！";	
		}else{
			return "上传失败！";	
		}
	
	}

	// base64字符串转化成图片
	public static boolean GenerateImage(String imgRecord, String filePath) { // 对字节数组字符串进行Base64解码并生成图片
		if (imgRecord == null) // 图像数据为空
			return false;
		BASE64Decoder decoder = new BASE64Decoder();
		try {
			// Base64解码
			byte[] b = decoder.decodeBuffer(imgRecord);
			for (int i = 0; i < b.length; ++i) {
				if (b[i] < 0) {// 调整异常数据
					b[i] += 256;
				}
			}
			// 生成jpeg图片
			String imgFilePath = filePath;// 新生成的图片
			OutputStream out = new FileOutputStream(imgFilePath);
			out.write(b);
			out.flush();
			out.close();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	/*查看全部学员详情*/
	@RequestMapping(value="/oaJzbAllStudentInfo/{stuid}")
	public String toallstuInfo(
			@PathVariable String stuid,
			HttpSession session,HttpServletRequest request
			){
		if (stuid == null || stuid.equals("")) {
			stuid = "0";
		}
		OaJzbStudent studentInfo = oaJzbStudentService.getStuInfo(Integer.parseInt(stuid));
		studentInfo.setStu_Id(Integer.parseInt(stuid));
		/*照片*/
		String photograph = oaJzbStudentService.getStuPhoto(Integer.parseInt(stuid));
		if(photograph != null && photograph !=""){
			int photoPath_index = photograph.lastIndexOf("\\");
			photograph = photograph.substring(photoPath_index+1);
			photograph = "/uploadfiles/"+photograph;
			studentInfo.setPhotograph(photograph);
		}
		session.setAttribute("studentInfo", studentInfo);
		return "teach_nature_department/jzb/stu_tab";
	}
	/**
	 * 根据班级ID查询学生
	 * @param studentClassId
	 * @return
	 */
	@RequestMapping(value = "/getStudentByClassId")
	@ResponseBody
	public String getStudentByClassId(String studentClassId) {
		List<OaJzbStudent> list = oaJzbStudentService
				.getStudentByClassId(Integer.parseInt(studentClassId));
		return JSONArray.toJSONString(list);
	}
}
