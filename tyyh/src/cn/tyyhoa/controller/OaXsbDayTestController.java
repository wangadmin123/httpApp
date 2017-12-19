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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaJwbGrade;
import cn.tyyhoa.pojo.OaJybChronicle;
import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaXsbDayTest;
import cn.tyyhoa.service.OaJwbGradeService;
import cn.tyyhoa.service.OaJybChronicleService;
import cn.tyyhoa.service.OaXsbDayTestService;

@RequestMapping(value = "/xsb")
@Controller
public class OaXsbDayTestController {

	@Autowired
	OaXsbDayTestService oaXsbDayTestService;
	@Autowired
	OaJwbGradeService oaJwbGradeService;
	@Autowired
	OaJybChronicleService oaJybChronicleService;
	/**
	 * 跳转新增日考表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/addDaytest")
	public String redirectaddAlldaytest(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList = oaJwbGradeService
				.selectGradeByTeacherId(user.getEmp_id());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
		// 格式化日期
		String zhDate = sdf.format(new Date());
		request.setAttribute("createTime", zhDate);
		request.setAttribute("gradeList", gradeList);
		return "academic_department/xsb_add_dayExamination";
	}

	/**
	 * 新增日考表
	 */
	@RequestMapping(value = "/addDaytestList", method = RequestMethod.POST)
	public String addAlldaytest(String createTime,
			@RequestParam(required = false) String[] studentId,
			@RequestParam(required = false) String[] written,
			@RequestParam(required = false) String classId,
			HttpServletRequest request, HttpSession session)
			throws ParseException {

		List<OaXsbDayTest> DatCodelist = new ArrayList<OaXsbDayTest>();
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = sdf.parse(createTime);

		// 循环遍历数组
		for (int i = 0; i < studentId.length; i++) {
			// 判断插入的数据是否都为空，如果都不为空，插入
			// 为空的话给默认值，为0
			if ((written[i] == null || written[i].equals(""))) {
				written[i] = "0";
			}
			// 每次实例化对象
			OaXsbDayTest DatList = new OaXsbDayTest();
			// 设置值
			DatList.setStudentId(Integer.parseInt(studentId[i]));
			DatList.setWritten(Integer.parseInt(written[i]));
			DatList.setClassId(Integer.parseInt(classId));
			DatList.setCreatetime(time);
			DatList.setWritetime(new Date());
			// 将对象放入集合中
			DatCodelist.add(DatList);
			
			OaJybChronicle oaJybChronicle = new OaJybChronicle();
			oaJybChronicle.setStudent_id(Integer.parseInt(studentId[i]));
			oaJybChronicle.setEvent_time(new Date());
			oaJybChronicle.setEvent_name("日测成绩："+written[i]);
			oaJybChronicle.setInputUser(user.getName());
			oaJybChronicle.setInput_time(new Date());
			
			if(DatList.getWritten()<60){
				oaJybChronicle.setIsNormal(1);
				oaJybChronicleService.insertSelective(oaJybChronicle);
			}

		}
		boolean flag = oaXsbDayTestService.insertDay(DatCodelist);
		if (flag) {
			
			List<OaJwbGrade> gradeList = oaJwbGradeService
					.selectGradeByTeacherId(user.getEmp_id());
			request.setAttribute("gradeList", gradeList);
			request.setAttribute("classId", classId);
			request.setAttribute("createTime", createTime);
			return "academic_department/xsb_show_daytest";
		} else {
			return "error";
		}
	}

	/**
	 * 跳转查看日考表界面
	 * @return
	 */
	@RequestMapping(value = "/showDaytest")
	public String redirectgetAlldaytest(HttpServletRequest request,
			HttpSession session) {
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		List<OaJwbGrade> gradeList;
		List<OaXsbDayTest> list;
		String zhDate;
		if(user.getPosition().getPosition_id() == 37 || user.getPosition().getPosition_id() == 20){
			gradeList = oaJwbGradeService.selectGradeByTeacherId(0);
			//Date createTime = list.get(0).getCreatetime();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			zhDate = sdf.format(new Date());
		}else{
			gradeList = oaJwbGradeService.selectGradeByTeacherId(user.getEmp_id());
			list= oaXsbDayTestService.getAlldaytest(gradeList
					.get(0).getId());
			Date createTime = list.get(0).getCreatetime();

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 设置日期格式
			// 格式化日期
			zhDate = sdf.format(createTime);
		}
		request.setAttribute("createTime", zhDate);
		request.setAttribute("gradeList", gradeList);
		return "academic_department/xsb_show_daytest";
	}

	/**
	 * 获取日报表数据
	 * 
	 * @param studentClassId
	 * @param createTime
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/getDayByClassIdAndCreateTime", method = RequestMethod.POST)
	@ResponseBody
	public String selectDatByCreateTime(String studentClassId, String createTime)
			throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date time = sdf.parse(createTime);
		List<OaXsbDayTest> list = oaXsbDayTestService
				.selectDatByClassIdAndCreateTime(
						Integer.parseInt(studentClassId), time);
		return JSONArray.toJSONStringWithDateFormat(list, "yyyy-MM-dd");
	}
	
	/**
	 * 修改成绩
	 * @param id
	 * @param score
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="xg",produces="application/json;charset=utf-8")
	public Object xg(Integer id,Integer score,String time){
		Integer i = oaXsbDayTestService.xg(id, score,time);
		System.out.println(i);
		return i;
	}
	
	/**
	 * 查看今天是否录入日考
	 * @param studentClassId
	 * @param dateStyle
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="ck",produces="application/json;charset=utf-8")
	public Object ck(Integer studentClassId,String dateStyle){
		Integer i = oaXsbDayTestService.ck(studentClassId, dateStyle);
		System.out.println(i);
		return i;
	}
	

}
