package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import cn.tyyhoa.pojo.OaJwbSemester;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaJzbPunish;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.service.OaJzbChronicleService;
import cn.tyyhoa.service.OaJzbPatriarchInterviewService;
import cn.tyyhoa.service.OaJzbPunishService;
import cn.tyyhoa.service.OaRlzybEmployeeService;

@RequestMapping(value="OaJzbPunish")
@Controller
public class OaJzbPunishController {
	@Autowired
	OaJzbPunishService oaJzbPunishService;
	@Autowired
	OaRlzybEmployeeService oaRlzybEmployeeService;
	@Autowired
	OaJzbChronicleService oaJzbChronicleService;
	@Autowired
	OaJzbPatriarchInterviewService oaJzbPatriarchInterviewService;
	
	//获得所有班主任，实施人下拉显示
	@RequestMapping(value="selectClassTeacherList",method=RequestMethod.GET)
	public String selectClassTeacherList(HttpServletRequest request,HttpSession session){
		String stuid=(String) session.getAttribute("stuid");
		OaJwbSemester oaJwbSemester = oaJzbPatriarchInterviewService.getsemesterById(Integer.parseInt(stuid));
		 session.setAttribute("oaJwbSemester", oaJwbSemester);
		return "teach_nature_department/jzb/add_jfinfo_S";
	}
	//添加学生的奖惩信息
	@RequestMapping(value="addOaJzbPunish",method=RequestMethod.POST)
	public String addOaJzbPunish(@RequestParam String punish_time,
														@RequestParam String punish_cause,
														@RequestParam String punish_way,
														@RequestParam String remarks,
														HttpSession session) throws ParseException{
		OaJwbSemester oaJwbSemester = (OaJwbSemester) session.getAttribute("oaJwbSemester");
		OaJzbPunish oaJzbPunish=new OaJzbPunish();
		String stu_id = (String) session.getAttribute("stuid");
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//当前系统时间
		String time=dateFormat1.format(new Date());
		Date dqTime=dateFormat1.parse(time);
		boolean fals =false;
		Date jqDate = null;
		if(StringUtils.isNotEmpty(punish_time)){
			//奖惩时间
			jqDate=dateFormat.parse(punish_time);;
		}
		oaJzbPunish.setEntering_time(dqTime);
		oaJzbPunish.setPunish_time(jqDate);
		oaJzbPunish.setPunish_cause(punish_cause);
		oaJzbPunish.setPunish_way(punish_way);
		oaJzbPunish.setTerm_id(oaJwbSemester.getId());
		oaJzbPunish.setRemarks(remarks);
		//12为登录人的ID
		OaRlzybUser loginUser = (OaRlzybUser) session.getAttribute("loginUser");
		oaJzbPunish.setImplement_id(loginUser.getEmp_id());
		oaJzbPunish.setStudent_id(Integer.parseInt(stu_id));
		fals = oaJzbPunishService.addOaJzbPunish(oaJzbPunish);
		if(fals){
			OaJybChronicle oaJybChronicle = new OaJybChronicle();		
			oaJybChronicle.setStudent_id(Integer.parseInt(stu_id));
			oaJybChronicle.setEvent_time(jqDate);
			oaJybChronicle.setEvent_name("奖惩信息");
			oaJybChronicle.setInput_time(dqTime);
			//登录人名字
			oaJybChronicle.setInputUser(loginUser.getName()+"老师");
			oaJybChronicle.setIsNormal(1);
			oaJzbChronicleService.insertSelective(oaJybChronicle);
			
			return "redirect:/oaJzbStudentInfo/"+stu_id;
		}else{
			return "teach_nature_department/jzb/add_jfinfo_S";
		}	
	}

	//跳转修改页面，显示修改信息
	@RequestMapping(value="showOaJzbPunish/{punishId}",method=RequestMethod.GET)
	public String showOaJzbPunish(@PathVariable String punishId,HttpServletRequest request,HttpSession session ){
		session.setAttribute("punishId", Integer.parseInt(punishId));
		OaJzbPunish  oaJzbPunish =oaJzbPunishService.queryOaJzbPunishById(Integer.parseInt(punishId));
		request.setAttribute("oaJzbPunish", oaJzbPunish);
		return "teach_nature_department/jzb/update_jc";
	}
	//修改奖惩信息
	@RequestMapping(value="updateOaJzbPunish/{id}",method=RequestMethod.POST)
	public String updateOaJzbPunish(@RequestParam String punish_time,
															@RequestParam String punish_cause,
															@RequestParam String punish_way,
															@RequestParam String remarks,
															@PathVariable String id,
															HttpServletRequest request,HttpSession session ) throws ParseException{
		
		OaJzbPunish oaJzbPunish=new OaJzbPunish();
		Integer punish_id=(Integer) session.getAttribute("punishId");
		
		String stu_id = (String) session.getAttribute("stuid");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		Date date=null;
		if(punish_time!=null&&punish_time!=""){
			try {
				date=sdf.parse(punish_time.toString());//转换为默认Date格式
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		}
			//奖惩时间
			oaJzbPunish.setId(Integer.parseInt(id));
			oaJzbPunish.setPunish_time(date);
			oaJzbPunish.setPunish_cause(punish_cause);
			oaJzbPunish.setPunish_way(punish_way);
			oaJzbPunish.setRemarks(remarks);
			boolean flas = oaJzbPunishService.changeOaJzbPunishById(oaJzbPunish);
			if(flas){
				return "redirect:/oaJzbStudentInfo/"+stu_id;
			}else{
				return "redirect:/showOaJzbPunish/"+punish_id;
			}
	}

	//删除奖惩信息
		@RequestMapping(value="deleteOaJzbPunish/{id}")
		public String deleteOaJzbPunish(@PathVariable int id,HttpServletRequest request,HttpSession session ){
			String stu_id = (String) session.getAttribute("stuid");
			OaJzbPunish oaJzbPunish=new OaJzbPunish();
			oaJzbPunish.setId(id);
			oaJzbPunishService.deleteOaJzbPunishDeleteStatus(oaJzbPunish);
			return "redirect:/oaJzbStudentInfo/"+Integer.parseInt(stu_id);
		}
}
