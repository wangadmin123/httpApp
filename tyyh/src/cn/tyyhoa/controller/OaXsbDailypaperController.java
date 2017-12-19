package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaXsbDailypaper;
import cn.tyyhoa.pojo.OaXsbDailypaper2;
import cn.tyyhoa.service.OaJwbGradeService;
import cn.tyyhoa.service.OaJybChronicleService;
import cn.tyyhoa.service.OaXsbDailypaperService;
import cn.tyyhoa.service.OaXsbDailypaper2Service;
import cn.tyyhoa.util.OaJzbRevoke;

@RequestMapping(value = "/xsb")
@Controller
public class OaXsbDailypaperController {

	@Autowired
	OaXsbDailypaperService oaXsbDailypaperService;
	@Autowired
	OaJwbGradeService oaJwbGradeService;
	@Autowired
	OaXsbDailypaper2Service oaXsbDailypaper2Service;

	/**
	 * 跳转添加日报表
	 */
	@RequestMapping(value = "/addDailystatement")
	public String redirectaddDailystatement(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList = oaJwbGradeService
				.selectGradeByTeacherId(user.getEmp_id());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 格式化日期
		String zhDate = sdf.format(new Date());
		request.setAttribute("gradeList", gradeList);
		request.setAttribute("createTime", zhDate);
		return "academic_department/xsb_add_dailystatement";
	}

	/**
	 * 添加日报表
	 * 
	 * @throws ParseException
	 */
	@RequestMapping(value = "/addDaily", method = RequestMethod.POST)
	public String Addtest(String createTime,
			Integer homeworkCount ,
			Integer preparationCount,
			Integer obuCount,
			@RequestParam(required = false) String[] preparation,
			@RequestParam(required = false) String[] manami,
			@RequestParam(required = false) String[] obu,
			@RequestParam(required = false) String[] homework,
			@RequestParam(required = false) String classId,
			@RequestParam(required = false) String[] studentId,
			HttpServletRequest request, HttpSession session)
			throws ParseException {
		// 创建List集合
		List<OaXsbDailypaper> reddemCodeList = new ArrayList<OaXsbDailypaper>();
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = sdf.parse(createTime);
		// 循环遍历数组
		for (int i = 0; i < studentId.length; i++) {
			if (preparation[i] == null || preparation[i].equals("")) {
				preparation[i] = "0";
			}
			if (manami[i] == null || manami[i].equals("")) {
				manami[i] = "0";
			}
			if (obu[i] == null || obu[i].equals("")) {
				obu[i] = "0";
			}
			if (homework[i] == null || homework[i].equals("")) {
				homework[i] = "0";
			}
			// 每次实例化对象
			OaXsbDailypaper test = new OaXsbDailypaper();
			// 设置值
			test.setPreparation(Integer.parseInt(preparation[i]));
			test.setManami(Integer.parseInt(manami[i]));
			test.setObu(Integer.parseInt(obu[i]));
			test.setHomework(Integer.parseInt(homework[i]));
			test.setStudentId(Integer.parseInt(studentId[i]));
			test.setClassId(Integer.parseInt(classId));
			test.setCreatetime(time);
			test.setWritetime(new Date());
			// 将对象放入集合中
			reddemCodeList.add(test);
			
			//将总个数放入对象中
			OaXsbDailypaper2 OaXsbDailypaper2 =new OaXsbDailypaper2();
			Integer grade_id=Integer.valueOf(classId);
			OaXsbDailypaper2.setGrade_id(grade_id);
			OaXsbDailypaper2.setHomeworkCount(homeworkCount);
			OaXsbDailypaper2.setObuCount(obuCount);
			OaXsbDailypaper2.setPreparationCount(preparationCount);
			OaXsbDailypaper2.setWriteTimeDate2(time);
			
			oaXsbDailypaper2Service.add(OaXsbDailypaper2);


		}

		// 判断是否添加
		boolean flag = oaXsbDailypaperService.insertDaily(reddemCodeList);
		if (flag) {
			
			List<OaJwbGrade> gradeList = oaJwbGradeService
					.selectGradeByTeacherId(user.getEmp_id());
			request.setAttribute("gradeList", gradeList);
			request.setAttribute("classId", classId);
			request.setAttribute("createTime", createTime);
			return "academic_department/xsb_show_dailystatement";
		} else {
			return "error";
		}
	}

	/**
	 * 跳转查看日报表界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/showDailystatement")
	public String redirectshowDailystatement(HttpServletRequest request,
			HttpSession session) {
		/* 预留教员ID */
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList;
		if(user.getPosition().getPosition_id() == 37 || user.getPosition().getPosition_id() == 20){
			gradeList = oaJwbGradeService.selectGradeByTeacherId(0);
		}else{
			gradeList = oaJwbGradeService.selectGradeByTeacherId(user.getEmp_id());
		}
		
				
		List<OaXsbDailypaper> oa = oaXsbDailypaperService.getAlldaily(gradeList
				.get(0).getId());
		// System.out.println(oa.size());
		Date time;
		if(oa.size()!=0){
			time = oa.get(0).getCreatetime();
		}else{
			time=new Date();
		}
		
		// System.out.println(time);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 格式化日期
		String zhDate = sdf.format(time);

		request.setAttribute("createTime", zhDate);
		request.setAttribute("gradeList", gradeList);
		return "academic_department/xsb_show_dailystatement";
	}

	/**
	 * 获取日报表数据
	 * 
	 * @return
	 * @throws ParseException
	 */

	@RequestMapping(value = "/getDailyByClassIdAndCreateTime", method = RequestMethod.POST)
	@ResponseBody
	public String showDailystatement(String studentClassId, String createTime,
			 Integer classId,
			HttpServletRequest request) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = sdf.parse(createTime);
		List<OaXsbDailypaper> list = oaXsbDailypaperService
				.selectDailyByClassIdAndCreatetime(
						Integer.parseInt(studentClassId), time);
		List fals = new ArrayList<>();
		//Integer grade_id=Integer.valueOf(classId);
		
		List<OaXsbDailypaper2> OaXsbDailypaper2=oaXsbDailypaper2Service.selectOaXsbDailypaper2(classId, time);
		String xsb=JSONArray.toJSONString(OaXsbDailypaper2);
		
		if(list.size()!=0){

			for (int i = 0; i < list.size(); i++) {
				OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
				boolean flag = oaJzbRevoke.Revoke(list.get(i).getWritetime());
				System.out.println(list.get(i).getWritetime());
				fals.add(flag);
				request.setAttribute("bianji",false); 
			}
		}else{
				request.setAttribute("bianji",true); 
		}
		
		// System.out.println(list.size());
		
		 /* OaJzbRevoke oaJzbRevoke = new OaJzbRevoke();
		  boolean flag=oaJzbRevoke.Revoke(list.get(0).getWritetime()); 
		  if(flag){
			  request.setAttribute("bianji",true); 
		  }else{
			  request.setAttribute("bianji",false); 
		  }*/
		 
		// System.out.println(JSONArray.toJSONStringWithDateFormat(list,"yyyy-MM-dd"));
		String dailyList = JSONArray.toJSONStringWithDateFormat(list,
				"yyyy-MM-dd");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("dailyList", dailyList);
		map.put("fals", fals);
		map.put("xsb",xsb );
		return JSONArray.toJSONString(map);
	}

	/**
	 * 跳转到编辑界面
	 */
	/*
	 * @RequestMapping(value="/selectDailyById")
	 * 
	 * @ResponseBody public String redUpdateDailystatement(int dailyId){
	 * OaXsbDailypaper oaXsbDailypaper=
	 * oaXsbDailypaperService.selectDailyById(dailyId);
	 * System.out.println(JSONArray.toJSONString(oaXsbDailypaper)); return
	 * JSONArray.toJSONString(oaXsbDailypaper); }
	 */
	@RequestMapping(value = "/selectDailyById")
	public String redUpdateDailystatement(String dailyId,
			HttpServletRequest request, HttpSession session) {
		OaXsbDailypaper oaXsbDailypaper = oaXsbDailypaperService
				.selectDailyById(Integer.parseInt(dailyId));
		List<OaXsbDailypaper> oa = oaXsbDailypaperService
				.getAlldaily(oaXsbDailypaper.getClassId());
		Date time = oa.get(0).getCreatetime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 格式化日期
		String zhDate = sdf.format(time);
		session.setAttribute("createTime", zhDate);
		session.setAttribute("classId", oaXsbDailypaper.getClassId());
		request.setAttribute("oaXsbDailypaper", oaXsbDailypaper);
		return "academic_department/xsb_update_dailystatement";
	}

	/**
	 * 修改日报表
	 * 
	 * @param oaXsbDailypaper
	 * @return
	 */
	@RequestMapping(value = "/updateDailystatement", method = RequestMethod.POST)
	public String updateDailystatement(OaXsbDailypaper oaXsbDailypaper,
			HttpServletRequest request, HttpSession session) {
		oaXsbDailypaper.setModifytime(new Date());
		boolean flag = oaXsbDailypaperService
				.updateDailystatement(oaXsbDailypaper);

		if (flag) {

			OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
			List<OaJwbGrade> gradeList = oaJwbGradeService
					.selectGradeByTeacherId(user.getEmp_id());
			String creatTime = (String) request.getAttribute("createTime");
			// System.out.println(creatTime);
			request.setAttribute("createTime", creatTime);
			request.setAttribute("gradeList", gradeList);
			request.setAttribute("classId", session.getAttribute("classId"));
			return "academic_department/xsb_show_dailystatement";
		} else {
			return "academic_department/xsb_update_dailystatement";
		}

	}
	
	/**
	 * 查看今天是否录入作业
	 * @param studentClassId
	 * @param dateStyle
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="zy",produces="application/json;charset=utf-8")
	public Object zy(Integer studentClassId,String dateStyle){
		Integer i = oaXsbDailypaperService.zy(studentClassId, dateStyle);
		System.out.println(i);
		return i;
	}
}

/* onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" */