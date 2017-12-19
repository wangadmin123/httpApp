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
import cn.tyyhoa.pojo.OaXsbMonthly;
import cn.tyyhoa.pojo.OaXsbWeekTest;
import cn.tyyhoa.service.OaJwbGradeService;
import cn.tyyhoa.service.OaJybChronicleService;
import cn.tyyhoa.service.OaXsbMonthTestService;

@RequestMapping(value = "/xsb")
@Controller
public class OaXsbMonthTestController {
	@Autowired
	OaJybChronicleService oaJybChronicleService;
	@Autowired
	OaXsbMonthTestService oaXsbMonthTestService;
	@Autowired
	OaJwbGradeService oaJwbGradeService;

	/**
	 * 跳转新增月考表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addMonthtest")
	public String redirectaddMonthtest(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList = oaJwbGradeService
				.selectGradeByTeacherId(user.getEmp_id());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 格式化日期
		String zhDate = sdf.format(new Date());
		request.setAttribute("gradeList", gradeList);
		request.setAttribute("createTime", zhDate);
		return "academic_department/xsb_add_MonthExamination";
	}

	/**
	 * 添加月考表
	 * 
	 * @throws ParseException
	 */
	@RequestMapping(value = "/insterMonthlyList", method = RequestMethod.POST)
	public String insertMonthly(
			@RequestParam(required = false) String[] studentId,
			@RequestParam(required = false) String[] written,
			@RequestParam(required = false) String[] scjd,
			@RequestParam(required = false) String classId,
			HttpServletRequest request, HttpSession session)
			throws ParseException {

		List<OaXsbMonthly> MonthlyCodeList = new ArrayList<OaXsbMonthly>();
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
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
			OaXsbMonthly MonthlyList = new OaXsbMonthly();
			// 设置值
			MonthlyList.setStudentId(Integer.parseInt(studentId[i]));
			MonthlyList.setWritten(Integer.parseInt(written[i]));
			MonthlyList.setScjd(Integer.parseInt(scjd[i]));
			MonthlyList.setClassId(Integer.parseInt(classId));
			MonthlyList.setCreatetime(new Date());
			MonthlyList.setWritetime(new Date());
			// 将对象放入集合中
			MonthlyCodeList.add(MonthlyList);
			
			OaJybChronicle oaJybChronicle = new OaJybChronicle();
			oaJybChronicle.setStudent_id(Integer.parseInt(studentId[i]));
			oaJybChronicle.setEvent_time(new Date());
			oaJybChronicle.setEvent_name("月考笔试成绩："+written[i]+"，月考机试成绩："+scjd[i]);
			oaJybChronicle.setInputUser(user.getName());
			oaJybChronicle.setInput_time(new Date());
			if(MonthlyList.getWritten()<60||MonthlyList.getScjd()<60){
				oaJybChronicle.setIsNormal(1);
			}
			oaJybChronicleService.insertSelective(oaJybChronicle);
		}

		// 判断是否添加.insertMonthly(weekCodeList);
		boolean flag = oaXsbMonthTestService.insertMonthly(MonthlyCodeList);
		if (flag) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			String zhDate = sdf.format(new Date());
			
			List<OaJwbGrade> gradeList = oaJwbGradeService
					.selectGradeByTeacherId(user.getEmp_id());
			request.setAttribute("gradeList", gradeList);
			request.setAttribute("classId", classId);
			request.setAttribute("createTime", zhDate);
			return "academic_department/xsb_show_MonthExamination";
		} else {
			return "error";
		}
	}

	/**
	 * 跳转查看月考表界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/showMonthtest")
	public String redirectgetMonthtest(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList;
		List<OaXsbMonthly> list;
		String zhDate;
		if(user.getPosition().getPosition_id() == 37 || user.getPosition().getPosition_id() == 20){
			gradeList = oaJwbGradeService.selectGradeByTeacherId(0);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			zhDate = sdf.format(new Date());
		}else{
			gradeList = oaJwbGradeService.selectGradeByTeacherId(user.getEmp_id());
			list = oaXsbMonthTestService.getMonthtest(gradeList
					.get(0).getId());
			Date createTime;
			if(list.size()!=0){
				createTime= list.get(0).getCreatetime();
			}else{
				createTime=new Date();
			}
			

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			zhDate = sdf.format(createTime);
		}
		

		request.setAttribute("createTime", zhDate);
		request.setAttribute("gradeList", gradeList);

		return "academic_department/xsb_show_MonthExamination";
	}

	/**
	 * 跳转查看月考表界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/showMonthtest1")
	public String redirectgetMonthtest1(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList;
		List<OaXsbMonthly> list;
		String zhDate;
		
			gradeList = oaJwbGradeService.selectGradeByTeacherId(0);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			zhDate = sdf.format(new Date());
		

		request.setAttribute("createTime", zhDate);
		request.setAttribute("gradeList", gradeList);

		return "academic_department/xsb_show_MonthExamination";
	}

	/**
	 * 获取月考表数据
	 * 
	 * @param createTime
	 * @param request
	 * @return
	 * @throws ParseException
	 */

	@RequestMapping(value = "/getMonthByClassIdAndCreateTime", method = RequestMethod.POST)
	@ResponseBody
	public Object selectMonthByCreateTime(String studentClassId,
			String createTime) throws ParseException {

		System.out.println(studentClassId);
		System.out.println(createTime);
		/* createTime=createTime.substring(0,7); */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		Date time = sdf.parse(createTime);
		List<OaXsbMonthly> list = oaXsbMonthTestService
				.selectMonthByClassIdAndCreateTime(
						Integer.parseInt(studentClassId), createTime);
		System.out.println(time);
		return JSONArray.toJSONStringWithDateFormat(list, "yyyy-MM-dd");

	}
	
	/**
	 * 修改成绩
	 * @param id
	 * @param score
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="xgyk",produces="application/json;charset=utf-8")
	public Object xgyk(Integer id,String time,Integer gradeId,Integer score,Integer i){
		Integer ii = oaXsbMonthTestService.xgyk(id, time, gradeId, score, i);
		System.out.println(ii);
		return ii;
	}
}
