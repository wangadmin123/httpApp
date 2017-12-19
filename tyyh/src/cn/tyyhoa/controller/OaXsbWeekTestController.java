package cn.tyyhoa.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import cn.tyyhoa.pojo.OaXsbWeekTest;
import cn.tyyhoa.service.OaJwbGradeService;
import cn.tyyhoa.service.OaJybChronicleService;
import cn.tyyhoa.service.OaXsbWeekTestService;

@RequestMapping(value = "/xsb")
@Controller
public class OaXsbWeekTestController {
	@Autowired
	OaJybChronicleService oaJybChronicleService;
	@Autowired
	OaXsbWeekTestService oaXsbWeekTestService;
	@Autowired
	OaJwbGradeService oaJwbGradeService;

	/**
	 * 跳转新增周考表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addWeektest")
	public String redirectaddWeektest(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList = oaJwbGradeService
				.selectGradeByTeacherId(user.getEmp_id());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 格式化日期
		String zhDate = sdf.format(new Date());

		request.setAttribute("gradeList", gradeList);
		request.setAttribute("createTime", zhDate);
		return "academic_department/xsb_add_weekExamination";
	}

	/**
	 * 新增周考表
	 * 
	 * @throws ParseException
	 */
	@RequestMapping(value = "/insterWeektestList", method = RequestMethod.POST)
	public String insterWeek(String createTime,
			@RequestParam(required = false) String[] studentId,
			@RequestParam(required = false) String[] written,
			@RequestParam(required = false) String[] scjd,
			@RequestParam(required = false) String classId,
			HttpServletRequest request, HttpSession session)
			throws ParseException {
		// 创建List集合
		List<OaXsbWeekTest> weekCodeList = new ArrayList<OaXsbWeekTest>();
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		Integer what = oaXsbWeekTestService.selectWhatweekByClassId(Integer
				.parseInt(classId));
		if (what == null || what.equals("")) {
			what = 0;
		}
		System.out.println("!!!!!!!!!s" + what);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = sdf.parse(createTime);
		// 循环遍历数组
		for (int i = 0; i < studentId.length; i++) {
			// 为空的话给默认值，为0
			if ((written[i] == null || written[i].equals(""))) {
				written[i] = "0";
			}
			// 为空的话给默认值，为0
			if ((scjd[i] == null || scjd[i].equals(""))) {
				scjd[i] = "0";
			}
			// 每次实例化对象
			OaXsbWeekTest WeekList = new OaXsbWeekTest();
			// 设置值
			WeekList.setStudentId(Integer.parseInt(studentId[i]));
			WeekList.setWritten(Integer.parseInt(written[i]));
			WeekList.setScjd(Integer.parseInt(scjd[i]));
			WeekList.setClassId(Integer.parseInt(classId));
			WeekList.setWhatweek(what + 1);
			WeekList.setCreatetime(time);
			WeekList.setWritetime(new Date());
			// 将对象放入集合中
			weekCodeList.add(WeekList);
			
			OaJybChronicle oaJybChronicle = new OaJybChronicle();
			oaJybChronicle.setStudent_id(Integer.parseInt(studentId[i]));
			oaJybChronicle.setEvent_time(new Date());
			oaJybChronicle.setEvent_name("周考成绩："+(WeekList.getScjd()+WeekList.getWritten()));
			oaJybChronicle.setInputUser(user.getName());
			oaJybChronicle.setInput_time(new Date());
			if((WeekList.getScjd()+WeekList.getWritten())<60){
				oaJybChronicle.setIsNormal(1);
			}
			oaJybChronicleService.insertSelective(oaJybChronicle);
		}

		// 判断是否添加
		boolean flag = oaXsbWeekTestService.insertWeek(weekCodeList);
		if (flag) {
			
			List<OaJwbGrade> gradeList = oaJwbGradeService
					.selectGradeByTeacherId(user.getEmp_id());

			// List<OaXsbWeekTest> week =
			// oaXsbWeekTestService.selectAllWeekByClassId(Integer.parseInt(classId));

			/* request.setAttribute("weeks",week); */
			request.setAttribute("gradeList", gradeList);
			request.setAttribute("classId", classId);
			request.setAttribute("createTime", createTime);
			/* request.setAttribute("whatweek", what+1); */
			return "academic_department/xsb_show_weekExamination";
		} else {
			return "error";
		}
	}

	/**
	 * 跳转查看周考表界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/showWeektest")
	public String redirectgetWeektest(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList;
		List<OaXsbWeekTest> weeklist;
		String zhDate;
		if(user.getPosition().getPosition_id() == 37 || user.getPosition().getPosition_id() == 20){
			gradeList = oaJwbGradeService.selectGradeByTeacherId(0);
			weeklist = oaXsbWeekTestService
					.getWeektest(gradeList.get(0).getId());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			zhDate = sdf.format(new Date());
		}else{
			gradeList = oaJwbGradeService.selectGradeByTeacherId(user.getEmp_id());
			weeklist = oaXsbWeekTestService
					.getWeektest(gradeList.get(0).getId());
			Date createTime;
			if(weeklist.size()!=0){
				createTime= weeklist.get(0).getCreatetime();
			}else{
				createTime=new Date();
			}
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			zhDate = sdf.format(createTime);
		}
		

		/* request.setAttribute("weeks",week); */
		request.setAttribute("createTime", zhDate);
		request.setAttribute("gradeList", gradeList);
		/* request.setAttribute("whatweek",whatweek); */

		return "academic_department/xsb_show_weekExamination";
	}

	/**
	 * 跳转查看周考表界面1
	 * 
	 * @return
	 */
	@RequestMapping(value = "/showWeektest1")
	public String redirectgetWeektest1(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList;
		List<OaXsbWeekTest> weeklist;
		String zhDate;
		
			gradeList = oaJwbGradeService.selectGradeByTeacherId(0);
			weeklist = oaXsbWeekTestService
					.getWeektest(gradeList.get(0).getId());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			zhDate = sdf.format(new Date());
		

		/* request.setAttribute("weeks",week); */
		request.setAttribute("createTime", zhDate);
		request.setAttribute("gradeList", gradeList);
		/* request.setAttribute("whatweek",whatweek); */

		return "academic_department/xsb_show_weekExamination";	}

	
	/**
	 * 获取周考数据
	 * 
	 * @param studentClassId
	 * @param createTime
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/getByClassIdAndTime", method = RequestMethod.POST)
	@ResponseBody
	public String showWeektest(String studentClassId, String whatweek)
			throws ParseException {
		// System.out.println(studentClassId);
		// System.out.println(createTime);
		// System.out.println("++++++++++++"+whatweek);
		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// Date time = sdf.parse(createTime);
		// System.out.println(createTime);
		System.out.println("fsddddddddddddddddddddd" + whatweek);
		int www = Integer.parseInt(whatweek);
		System.out.println(www);
		List<OaXsbWeekTest> list = oaXsbWeekTestService
				.selectWeekByClassIdAndCreateTime(
						Integer.parseInt(studentClassId), www);

		System.out.println(JSONArray.toJSONStringWithDateFormat(list,
				"yyyy-MM-dd"));
		return JSONArray.toJSONStringWithDateFormat(list, "yyyy-MM-dd");
	}

	/**
	 * 二级列表
	 */
	@RequestMapping(value = "/gradeLevelAll", method = RequestMethod.POST)
	@ResponseBody
	public String gradeLevelAll(String pid) {
		System.out.println(pid);
		List<OaXsbWeekTest> weekList = oaXsbWeekTestService
				.selectAllWeekByClassId(Integer.parseInt(pid));
		System.out.println(weekList.size());
		System.out.println(JSONArray.toJSONString(weekList));
		return JSONArray.toJSONString(weekList);
	}

	/**
	 * 修改成绩
	 * @param id
	 * @param score
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="xgzk",produces="application/json;charset=utf-8")
	public Object xgzk(Integer id,Integer jc,Integer gradeId,Integer score,Integer i){
		Integer ii = oaXsbWeekTestService.xgzk(id, jc, gradeId, score,i);
		System.out.println(ii);
		return ii;
	}
}
