package cn.tyyhoa.controller;

import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import cn.tyyhoa.pojo.OaRlzybEmployee;
import cn.tyyhoa.pojo.OaRlzybUser;
import cn.tyyhoa.pojo.OaScbConsulter;
import cn.tyyhoa.pojo.OaScbConsultlesson;
import cn.tyyhoa.pojo.OaScbConsultstatus;
import cn.tyyhoa.pojo.OaScbConsultway;
import cn.tyyhoa.pojo.OaScbDaoRuCon;
import cn.tyyhoa.pojo.OaScbEducation;
import cn.tyyhoa.pojo.OaScbInfosource;
import cn.tyyhoa.pojo.OaScbMedianame;
import cn.tyyhoa.pojo.OaScbOperation;
import cn.tyyhoa.pojo.OaScbRanktype;
import cn.tyyhoa.pojo.OaScbRecord;
import cn.tyyhoa.pojo.OaScbVisit;
import cn.tyyhoa.service.OaScbConsultTeacherService;
import cn.tyyhoa.service.OaScbConsulterService;
import cn.tyyhoa.service.OaScbConsultlessonService;
import cn.tyyhoa.service.OaScbConsultstatusService;
import cn.tyyhoa.service.OaScbConsultwayService;
import cn.tyyhoa.service.OaScbEducationService;
import cn.tyyhoa.service.OaScbInfosourceService;
import cn.tyyhoa.service.OaScbMarketService;
import cn.tyyhoa.service.OaScbMedianameService;
import cn.tyyhoa.service.OaScbOperationService;
import cn.tyyhoa.service.OaScbRanktypeService;
import cn.tyyhoa.service.impl.OaScbConsulterServiceImpl;
import cn.tyyhoa.util.DaoruExcelUtil;
import cn.tyyhoa.util.Page;


@RequestMapping("/director")
@Controller
public class OaScbDirectorController {
	@Autowired
	OaScbMarketService OaScbMarketService;
	@Autowired
	OaScbConsulterService oaScbConsulterService;
	@Autowired
	OaScbEducationService oaScbEducationService;
	@Autowired
	OaScbInfosourceService oaScbInfosourceService;
	@Autowired
	OaScbConsultwayService oaScbConsultwayService;
	@Autowired
	OaScbRanktypeService oaScbRanktypeService;
	@Autowired
	OaScbConsultstatusService oaScbConsultstatusService;
	@Autowired
	OaScbConsultlessonService oaScbConsultlessonService;
	@Autowired
	OaScbMedianameService oaScbMedianameService;
	@Autowired
	OaScbConsultTeacherService oaScbConsultTeacherService;
	@Autowired
	OaScbOperationService OaScbOperationService;
	
	//删除咨询量
		@RequestMapping(value="/ConsulterDelete")
		public String ConsulterDelete(Integer id,String employee_id ){
			 OaScbOperation operation=new OaScbOperation();
			   operation.setEmployee_id(Integer.parseInt(employee_id));
			   String Consult_name=OaScbOperationService.operationSelect(id);
				operation.setTime(new Date());
				operation.setContent("进行了删除,删除的咨询量是"+Consult_name);
				OaScbOperationService.Insertoperation(operation);
				OaScbOperationService.operationDelete(id);
			OaScbMarketService.ConsulterDelete(id);
			return "redirect:/director/consultDirectorQuery";
		};
	/**
	 * 进入新增页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/consultDirectorAdd", method = RequestMethod.GET)
	public String addConsulterPage(HttpServletRequest request) {
		List<OaScbEducation> EducationList = oaScbEducationService
				.selectEducationList();
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService
				.selectInfoSource();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService
				.selectConsultWay();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService
				.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService
				.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService
				.selectMediaNameList();
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService
				.ConsultTeacherFind();

		request.setAttribute("EducationList", EducationList);
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);
		request.setAttribute("empList", empList);
		return "marketDepartment/consultDirectorAdd";
	}

	/**
	 * 新增咨询量
	 * 
	 * @param oaScbConsulter
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/addConnsulter.html", method = RequestMethod.POST)
	public String addConsulter(OaScbConsulter oaScbConsulter,String employee_id,HttpSession session) throws ParseException {
		if (oaScbConsulter.getProvince().equals("省份")) {
			oaScbConsulter.setProvince("未知");
			oaScbConsulter.setCity("未知");
			oaScbConsulter.setDistrict("未知");
		}
		
		if(oaScbConsulter.getCity().equals("地级市")){
			oaScbConsulter.setCity("未知");
			oaScbConsulter.setDistrict("未知");
		}
		
		if(oaScbConsulter.getDistrict().equals("市、县级市、县")){
			
			oaScbConsulter.setDistrict("未知");
		}
		
		

		if (oaScbConsulter.getConsultTeacher() == 0) {
			oaScbConsulter.setAllotstatus(2);
		} else {
			oaScbConsulter.setAllotstatus(1);
			oaScbConsulter.setAllotTime(new Date());
		}
		oaScbConsulter.setInfoStatus(2);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		oaScbConsulter.setFirstConsultTime(sdf.parse(oaScbConsulter.getFirstConsultTimes()));
		
			boolean flag = oaScbConsulterService.addConsulter(oaScbConsulter);

		int id = oaScbConsulterService.maxId();
		OaScbRecord oaScbRecord = new OaScbRecord();
		oaScbRecord.setConsulterId(id);
		OaRlzybUser user = (OaRlzybUser) session.getAttribute("loginUser");
		
		oaScbRecord.setEnterPeople(user.getEmp_name());
		oaScbRecord.setEnterTime(new Date());
		oaScbRecord.setEventName("首次咨询");
		oaScbRecord.setEventTime(new Date());
		oaScbConsulterService.insertRecord(oaScbRecord);
		
		
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		String consulter_id=OaScbOperationService.consulter_id(oaScbConsulter);
		operation.setConsulter_id(Integer.parseInt(consulter_id));
		operation.setTime(new Date());
		operation.setContent("新增了咨询量");
		OaScbOperationService.Insertoperation(operation);
		if (flag) {
			return "marketDepartment/consultDirectorWelcome";
		} else {
			return "marketDapartment/consultDirectorAdd";
		}

	}

	/**
	 * 跳转查询页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/consultDirectorQuery", method = RequestMethod.GET)
	public String queryConsulter(HttpServletRequest request) {
		List<OaScbEducation> EducationList = oaScbEducationService
				.selectEducationList();
		List<OaScbInfosource> InfosourceList = oaScbInfosourceService
				.selectInfoSource();
		List<OaScbConsultway> consultWayList = oaScbConsultwayService
				.selectConsultWay();
		List<OaScbRanktype> rankList = oaScbRanktypeService.selectRankList();
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService
				.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService
				.selectConsultLessonList();
		List<OaScbMedianame> mediaNameList = oaScbMedianameService
				.selectMediaNameList();
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService
				.ConsultTeacherFind();
		request.setAttribute("EducationList", EducationList);
		request.setAttribute("InfosourceList", InfosourceList);
		request.setAttribute("consultWayList", consultWayList);
		request.setAttribute("rankList", rankList);
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("mediaNameList", mediaNameList);
		request.setAttribute("empList", empList);
		return "marketDepartment/consultDirectorQuery";
	}

	/**
	 * 查询咨询量
	 * 
	 * @param oaScbConsulter
	 * @param OaScbVisit
	 * @param firstConsultTimes
	 * @param enrollTimes
	 * @param nextvisitTimes
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/conquery", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object conquery(OaScbConsulter oaScbConsulter,
			OaScbVisit OaScbVisit, String firstConsultTimes, /* 首次咨询日期 */
			String enrollTimes, /* 报名日期 */
			String nextvisitTimes, @RequestParam String index,
			@RequestParam String pageSize,Integer orderId /*表头排序id*/) throws ParseException {
		if(orderId==null || orderId==0){
			orderId=1;
		}
		if (index == null || index.equals("")) {
			index = "1";
		}

		if (pageSize == null || pageSize.equals("")) {
			pageSize = "10";
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date firstConsultTimesDate = null;
		if (firstConsultTimes != null && !firstConsultTimes.equals("")) {
			firstConsultTimesDate = sdf.parse(firstConsultTimes); /*
																 * 首次咨询日期--
																 * String转Date类型
																 */
		}

		Date enrollTimesDate = null;
		if (enrollTimes != null && !enrollTimes.equals("")) {
			enrollTimesDate = sdf.parse(enrollTimes); /* 报名日期--String转Date类型 */

		}

		Date nextvisitTimesDate = null;
		if (nextvisitTimes != null && !nextvisitTimes.equals("")) {
			nextvisitTimesDate = sdf.parse(nextvisitTimes); /*
															 * 下次回访时间--String转Date类型
															 */
		}

		oaScbConsulter.setFirstConsultTime(firstConsultTimesDate);// 赋值报名日期
		oaScbConsulter.setEnrollTime(enrollTimesDate);// 赋值报名日期
		OaScbVisit.setNextvisitTime(nextvisitTimesDate);// 赋值下次回访时间
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("consulter", oaScbConsulter);
		map.put("visit", OaScbVisit);
		int totalCount = oaScbConsulterService.selectconsultercount(map);
		int pageNum = Integer.parseInt(pageSize);
		int pageCount = totalCount % pageNum == 0 ? totalCount / pageNum
				: totalCount / pageNum + 1;
		map.put("index", (Integer.parseInt(index) - 1) * pageNum);
		map.put("pageSize", pageNum);
		map.put("orderId", orderId);
		List<OaScbConsulter> consulterList = oaScbConsulterService
				.queryConsulters(map);
		for (OaScbConsulter oaScbConsulter2 : consulterList) {
			if(oaScbConsulter2.getFirstConsultTime()!=null){
				oaScbConsulter2.setFirstConsultTimes(sdf.format(oaScbConsulter2.getFirstConsultTime()));
			}else{
				oaScbConsulter2.setFirstConsultTimes("暂无");
				
			}
		}
		
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("consulterList", consulterList);
		hashmap.put("index", Integer.parseInt(index));
		hashmap.put("pageCount", pageCount);
		hashmap.put("totalCount", totalCount);
		return JSONArray.toJSONString(hashmap);
	}

	/**
	 * 跳转审核页面
	 */
	@RequestMapping(value = "/consultDirectorCheck", method = RequestMethod.GET)
	public String directorCheck(HttpServletRequest request) {
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService
				.ConsultTeacherFind();
		request.setAttribute("empList", empList);
		return "marketDepartment/consultDirectorCheck";
	}

	//
	/**
	 * 查询待审核无效量
	 * 
	 * @param consultTeacher
	 * @return
	 */
	@RequestMapping(value = "/checkquery", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object checkquery(
			@RequestParam(required = false) String consultTeacher,
			@RequestParam String index, @RequestParam String pageSize) {
		if (index == null || index.equals("")) {
			index = "1";
		}
		if (pageSize == null || pageSize.equals("")) {
			pageSize = "10";
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("consultTeacher", Integer.parseInt(consultTeacher));
		int totalCount = oaScbConsulterService.selectCheckCount(Integer
				.parseInt(consultTeacher));
		int pageNum = Integer.parseInt(pageSize);
		int pageCount = totalCount % pageNum == 0 ? totalCount / pageNum
				: totalCount / pageNum + 1;

		map.put("index", (Integer.parseInt(index) - 1) * pageNum);
		map.put("pageSize", pageNum);
		List<OaScbConsulter> checkList = oaScbConsulterService.selectCheck(map);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("checkList", checkList);
		hashmap.put("index", Integer.parseInt(index));
		hashmap.put("pageCount", pageCount);
		hashmap.put("totalCount", totalCount);
		return JSONArray.toJSONString(hashmap);
	}

	/**
	 * 审核有效无效量
	 * 
	 * @param status
	 * @param num
	 * @return
	 */
	@RequestMapping(value = "/checkStatus/{status}/{num}", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object checkStatus(@PathVariable String status,
			@PathVariable String num) {

		oaScbConsulterService.checkconsulter(Integer.parseInt(status),
				Integer.parseInt(num));
		return "审核成功！";
	}

	/**
	 * 
	 * 咨询主管回收
	 * 
	 * @param num
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/retrieveConsulter/{num}", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object retrieveConsulter(@PathVariable String num, String employee_id, String consultTeacherName) throws UnsupportedEncodingException {
		oaScbConsulterService.retrieveconsulter(Integer.parseInt(num));
		String emp_name=new String(consultTeacherName.getBytes("ISO-8859-1"),"UTF-8");
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setConsulter_id(Integer.parseInt(num));
		if(emp_name!=null){
			OaRlzybEmployee employee=new OaRlzybEmployee();
			employee.setEmp_name(emp_name);
			String name=OaScbOperationService.Emp_id(employee);
			Integer emp_id=Integer.parseInt(name);
			operation.setEmp_id(emp_id);
		}
		operation.setTime(new Date());
		operation.setContent("回收了");
		OaScbOperationService.Insertoperation(operation);
		
		return "回收成功！";
	}

	/**
	 * 咨询主管查看咨询量信息
	 * 
	 * @param num
	 * @return
	 */
	/*
	 * @RequestMapping(value="/lookconInfo/{num}",produces=
	 * "application/json;charset=utf-8")
	 * 
	 * @ResponseBody public Object lookconInfo(@PathVariable String num){
	 * System.out.println(num); OaScbConsulter oaScbConsulter
	 * =oaScbConsulterService.lookConInfo(Integer.parseInt(num)); return
	 * JSONArray.toJSONString(oaScbConsulter); }
	 */

	/**
	 * 跳转分发页面
	 * 
	 */
	@RequestMapping(value = "/consultDirectorHandout")
	public String handOut(HttpServletRequest request) {
		List<OaScbConsultstatus> consultStatusList = oaScbConsultstatusService
				.selectConsultstatusList();
		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService
				.selectConsultLessonList();
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService
				.ConsultTeacherFind();
		request.setAttribute("consultStatusList", consultStatusList);
		request.setAttribute("consultLessonList", consultLessonList);
		request.setAttribute("empList", empList);
		return "marketDepartment/consultDirectorHandout";
	}

	/**
	 * 分发页面查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "/findHandout", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object findHandout(@RequestParam String name,
			@RequestParam String consultLesson, @RequestParam String status,
			@RequestParam String index, @RequestParam String pageSize,
			HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (index == null || index.equals("")) {
			index = "1";
		}
		if (pageSize == null || pageSize.equals("")) {
			pageSize = "10";
		}
		map.put("name", name);
		map.put("consultLesson", consultLesson);
		map.put("status", status);
		int totalCount = oaScbConsulterService.selectHandoutConsulterCount(map);
		int pageNum = Integer.parseInt(pageSize);
		int pageCount = totalCount % pageNum == 0 ? totalCount / pageNum
				: totalCount / pageNum + 1;

		map.put("index", (Integer.parseInt(index) - 1) * pageNum);

		map.put("pageSize", pageNum);
		List<OaScbConsulter> handOutList = oaScbConsulterService
				.selectHandoutConsulter(map);

		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("handOutList", handOutList);
		hashmap.put("totalCount", totalCount);
		hashmap.put("index", Integer.parseInt(index));
		hashmap.put("pageCount", pageCount);

		return JSONArray.toJSONString(hashmap);
	}

	/**
	 * 分发咨询量
	 */
	@RequestMapping(value = "/handoutcon/{consultTeacherid}/{data}", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object handoutcon(@PathVariable String consultTeacherid,
			@PathVariable String data,String employee_id) {
		oaScbConsulterService.handoutCon(Integer.parseInt(consultTeacherid),
				Integer.parseInt(data));
		OaScbOperation operation=new OaScbOperation();
		operation.setEmployee_id(Integer.parseInt(employee_id));
		operation.setTime(new Date());
		operation.setConsulter_id(Integer.parseInt(data));
		operation.setEmp_id(Integer.parseInt(consultTeacherid));
		operation.setContent("分发给了");
		OaScbOperationService.Insertoperation(operation);
		return "分发成功！";
	}

	@RequestMapping(value = "/lookResult", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object lookResult(@RequestParam String id) {
		OaScbConsulter oaScbConsulter = oaScbConsulterService
				.selectResult(Integer.parseInt(id));
		return JSONArray.toJSONString(oaScbConsulter);
	}

	/**
	 * 批量继续跟进
	 * 
	 * @param s
	 * @return
	 */
	@RequestMapping(value = "/checksome", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object checksome(@RequestParam String[] s,String employee_id) {

		int[] id = new int[s.length];

		for (int i = 0; i < s.length; i++) {
			id[i] = Integer.parseInt(s[i].substring(0, s[i].indexOf("|")));
			OaScbOperation operation=new OaScbOperation();
			operation.setEmployee_id(Integer.parseInt(employee_id));
			operation.setTime(new Date());
			operation.setConsulter_id(Integer.parseInt(s[i].substring(0, s[i].indexOf("|"))));
			operation.setContent("审核无效量不通过");
			OaScbOperationService.Insertoperation(operation);
		}
		oaScbConsulterService.checkSome(id);

		return "审核成功";

	}

	/**
	 * 批量审核无效
	 * 
	 * @param str
	 * @return
	 */
	@RequestMapping(value = "/checkinvalid", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object checkinvalid(@RequestParam String[] str,String employee_id) {
		int[] id = new int[str.length];

		for (int i = 0; i < str.length; i++) {
			id[i] = Integer.parseInt(str[i].substring(0, str[i].indexOf("|")));
			OaScbOperation operation=new OaScbOperation();
			operation.setEmployee_id(Integer.parseInt(employee_id));
			operation.setTime(new Date());
			operation.setConsulter_id(Integer.parseInt(str[i].substring(0, str[i].indexOf("|"))));
			operation.setContent("审核无效量通过");
			OaScbOperationService.Insertoperation(operation);
		}
		oaScbConsulterService.checkinvalid(id);

		return "标记无效成功！";

	}

	/**
	 * 批量分发
	 * 
	 * @param s
	 * @param consultTeacherid
	 * @return
	 */
	@RequestMapping(value = "/handoutall", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object handoutall(@RequestParam String[] s,
			@RequestParam String consultTeacherid,String employee_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		int[] id = new int[s.length];

		for (int i = 0; i < s.length; i++) {
			id[i] = Integer.parseInt(s[i]);
			OaScbOperation operation=new OaScbOperation();
			operation.setEmployee_id(Integer.parseInt(employee_id));
			operation.setTime(new Date());
			operation.setConsulter_id(Integer.parseInt(s[i]));
			operation.setEmp_id(Integer.parseInt(consultTeacherid));
			operation.setContent("分发给了");
			OaScbOperationService.Insertoperation(operation);
		}
		map.put("array", id);
		map.put("consultTeacher", Integer.parseInt(consultTeacherid));
		Date allotTime = new Date();
		map.put("allotTime", allotTime);
		oaScbConsulterService.handoutall(map);
		return "分发成功！";
	}

	/**
	 * 编辑页面
	 * 
	 * @param id
	 * @param request
	 * @return
	 */
	/*
	 * @RequestMapping(value="/editCon") public String editCon(@RequestParam
	 * String id,HttpServletRequest request){
	 * 
	 * 信息来源 List<OaScbInfosource> InfosourceList =
	 * oaScbInfosourceService.selectInfoSource();
	 * 
	 * 咨询方式 List<OaScbConsultway> consultWayList =
	 * oaScbConsultwayService.selectConsultWay();
	 * 
	 * 咨询量等级 List<OaScbRanktype> rankList =
	 * oaScbRanktypeService.selectRankList();
	 * 
	 * 查询学历信息 List<OaScbEducation> EducationList =
	 * oaScbEducationService.selectEducationList();
	 * 
	 * 查询所有咨询量状态 List<OaScbConsultstatus> consultStatusList =
	 * oaScbConsultstatusService.selectConsultstatusList();
	 * 
	 * 课程信息 List<OaScbConsultlesson> consultLessonList =
	 * oaScbConsultlessonService.selectConsultLessonList();
	 * 
	 * 媒体名称 List<OaScbMedianame> MedianameList=
	 * oaScbMedianameService.selectMediaNameList();
	 * 
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); OaScbConsulter
	 * OaScbConsulterinfo=
	 * oaScbConsulterService.DirectorReviseFind(Integer.parseInt(id));
	 * OaScbConsulterinfo.setId(Integer.parseInt(id));
	 * if(OaScbConsulterinfo.getFirstComeTime()!=null){
	 * OaScbConsulterinfo.setFirstComeTimes
	 * (sdf.format(OaScbConsulterinfo.getFirstComeTime()));首次上门日期 }
	 * if(OaScbConsulterinfo.getFirstConsultTime()!=null){
	 * OaScbConsulterinfo.setFirstConsultTimes
	 * (sdf.format(OaScbConsulterinfo.getFirstConsultTime()));首次资讯日期 }
	 * request.setAttribute("InfosourceList", InfosourceList);
	 * request.setAttribute("consultwayLsit", consultWayList);
	 * request.setAttribute("RanktypeList", rankList);
	 * request.setAttribute("EducationList", EducationList);
	 * request.setAttribute("consultStatusList", consultStatusList);
	 * request.setAttribute("SpecialtyList", consultLessonList);
	 * request.setAttribute("mediaNameList", MedianameList); 媒体名称
	 * request.setAttribute("consulter", OaScbConsulterinfo);
	 * request.setAttribute("consultWay", OaScbConsulterinfo.getStatus());咨询方式
	 * request.setAttribute("type", OaScbConsulterinfo.getType());咨询量分类
	 * request.setAttribute("rank", OaScbConsulterinfo.getRank());咨询量等级
	 * request.setAttribute("name", OaScbConsulterinfo.getName());姓名
	 * request.setAttribute("sex", OaScbConsulterinfo.getSex());性别
	 * request.setAttribute("education", OaScbConsulterinfo.getEducation());学历
	 * request.setAttribute("status", OaScbConsulterinfo.getStatus());状态
	 * request.setAttribute("consultLesson",
	 * OaScbConsulterinfo.getConsultLesson());咨询课程
	 * request.setAttribute("mediaName", OaScbConsulterinfo.getMediaName());媒体名称
	 * return "marketDepartment/consultDirectorRevise"; }
	 */
	/**
	 * 查看页面
	 * 
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "/lookconInfo/{data}", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object lookInfo(@PathVariable String data,
			OaScbConsulter OaScbConsulter, OaScbVisit OaScbVisit,
			String firstConsultTimes, /* 首次咨询日期 */
			String enrollTimes, /* 报名日期 */
			String nextvisitTimes) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date firstConsultTimesDate = null;
		if (firstConsultTimes != null && !firstConsultTimes.equals("")) {
			firstConsultTimesDate = sdf.parse(firstConsultTimes); /*
																 * 首次咨询日期--
																 * String转Date类型
																 */
		}

		Date enrollTimesDate = null;
		if (enrollTimes != null && !enrollTimes.equals("")) {
			enrollTimesDate = sdf.parse(enrollTimes); /* 报名日期--String转Date类型 */

		}
		Date nextvisitTimesDate = null;
		if (nextvisitTimes != null && !nextvisitTimes.equals("")) {
			nextvisitTimesDate = sdf.parse(nextvisitTimes); /*
															 * 下次回访时间--String转Date类型
															 */

		}

		OaScbConsulter.setId(Integer.parseInt(data));

		OaScbConsulter.setFirstConsultTime(firstConsultTimesDate);// 赋值报名日期
		OaScbConsulter.setEnrollTime(enrollTimesDate);// 赋值报名日期
		OaScbVisit.setNextvisitTime(nextvisitTimesDate);// 赋值下次回访时间

		OaScbConsulter oaScbConsulter = oaScbConsulterService
				.lookConInfo(Integer.parseInt(data));

		return JSONArray.toJSONString(oaScbConsulter);
	}

	/**
	 * 跟踪-回访表查询
	 */
	@RequestMapping(value = "/directorFollowCon", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object AssistantOaScbVisitFind(@RequestParam String id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		List<OaScbVisit> OaScbVisit = oaScbConsulterService
				.DirectorOaScbVisitFind(Integer.parseInt(id));
		OaScbConsulter OaScbConsulter = new OaScbConsulter();
		OaScbConsulter.setId(Integer.parseInt(id));

		OaScbConsulter oaScbConsulter = oaScbConsulterService
				.lookConInfo(Integer.parseInt(id));

		String consultTeacherName = null;

		consultTeacherName = oaScbConsulter.getConsultTeacherName();

		for (OaScbVisit oaScbVisit2 : OaScbVisit) {
			oaScbVisit2.setConsultTeacherName(consultTeacherName);/* 当前负责咨询师 */
			if (oaScbVisit2.getReturnvisitTime() != null) {/* 本次回访时间 */
				oaScbVisit2.setReturnvisitTimes(sdf.format(oaScbVisit2
						.getReturnvisitTime()));
			} else {
				oaScbVisit2.setReturnvisitTimes("暂无");
			}
			if (oaScbVisit2.getNextvisitTime() != null) {/* 下次回访时间 */
				oaScbVisit2.setNextvisitTimes(sdf.format(oaScbVisit2
						.getNextvisitTime()));
			} else {
				oaScbVisit2.setNextvisitTimes("暂无");
			}
			if (oaScbVisit2.getConsultName() == null
					|| oaScbVisit2.getConsultName().equals("")) {/* 咨询量姓名 */
				oaScbVisit2.setConsultName("未获得");
			}
			if (oaScbVisit2.getReturnvisitPeopleName() == null
					|| oaScbVisit2.getReturnvisitPeopleName().equals("")) {/* 回访人 */
				oaScbVisit2.setReturnvisitPeopleName("暂无");
			}
			if (oaScbVisit2.getReturnvisitRecord() == null
					|| oaScbVisit2.getReturnvisitRecord().equals("")) {

				oaScbVisit2.setReturnvisitRecord("无回访记录");
			}

		}

		return JSONArray.toJSONString(OaScbVisit);
	}

	/**
	 * 无效量页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/consultDirectorUseless", method = RequestMethod.GET)
	public String consultDirectorUseless(HttpServletRequest request) {
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService
				.ConsultTeacherFind();
		request.setAttribute("empList", empList);
		return "marketDepartment/consultDirectorUseless";
	}
	/**
	 * 跳转咨询助理无销量
	 */
	@RequestMapping(value = "/consultAssistantUseless", method = RequestMethod.GET)
	public String consultAssistantUseless(HttpServletRequest request){
		
		List<OaRlzybEmployee> empList = oaScbConsultTeacherService
				.ConsultTeacherFind();
		request.setAttribute("empList", empList);
		return "marketDepartment/consultAssistantUseless";
	}

	/**
	 * 无效量页面
	 * 
	 * @param name
	 * @param consultTeacher
	 * @param index
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(value = "/uselessquery", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object uselessquery(@RequestParam String name,
			@RequestParam String consultTeacher, @RequestParam String index,
			@RequestParam String pageSize) {
		if (index == null || index.equals("")) {
			index = "0";
		}

		if (pageSize == null || pageSize.equals("")) {
			pageSize = "10";
		}
		Map<String, Comparable> map = new HashMap<String, Comparable>();
		map.put("name", name);
		map.put("consultTeacher", Integer.parseInt(consultTeacher));
		int pageNum = Integer.parseInt(pageSize);
		int totalCount = oaScbConsulterService.selectUselessCount(map);
		int pageCount = totalCount % pageNum == 0 ? totalCount / pageNum
				: totalCount / pageNum + 1;
		map.put("pageSize", pageNum);
		map.put("index", (Integer.parseInt(index) - 1) * pageNum);
		List<OaScbConsulter> uselessList = oaScbConsulterService
				.selectUseless(map);
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("uselessList", uselessList);
		hashmap.put("index", Integer.parseInt(index));
		hashmap.put("totalCount", totalCount);
		hashmap.put("pageCount", pageCount);
		return JSONArray.toJSONString(hashmap);
	}

	/**
	 * 跳转课程页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/conDirectorlesson", method = RequestMethod.GET)
	public String conDirectorlesson() {

		return "marketDepartment/consultDirectorLesson";

	}

	/**
	 * 
	 * 课程管理页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/lessonquery", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object lessonquery() {

		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService
				.selectConsultLessonList();

		return JSONArray.toJSONString(consultLessonList);
	}

	/**
	 * 
	 * 课程冻结
	 */
	@RequestMapping(value = "/unUseLesson", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object unUseLesson(@RequestParam String[] str) {
		int[] id = new int[str.length];

		for (int i = 0; i < str.length; i++) {
			id[i] = Integer.parseInt(str[i]);
		}
		oaScbConsultlessonService.checkUnuseLesson(id);
		return "成功！";

	}

	/**
	 * 添加课程
	 */
	@RequestMapping(value = "/addlesson", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object addlesson(OaScbConsultlesson oaScbConsultlesson) {
		oaScbConsultlessonService.addLesson(oaScbConsultlesson);
		return "成功！";
	}

	/**
	 * 修改课程名称
	 * 
	 * @param oaScbConsultlesson
	 * @return
	 */
	@RequestMapping(value = "/editLessonName", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object editLessonName(OaScbConsultlesson oaScbConsultlesson) {
		oaScbConsultlessonService.editLessonName(oaScbConsultlesson);
		return "成功！";
	}

	/**
	 * 跳转失效课程页面
	 */

	@RequestMapping(value = "/unUseLessonquery", method = RequestMethod.GET)
	public String unUseLessonquery() {
		return "marketDepartment/consultDirectorUnLesson";
	}

	/**
	 * 
	 * 失效课程
	 * 
	 * @return
	 */
	@RequestMapping(value = "/Unuselessonquery", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object Unuselessonquery() {

		List<OaScbConsultlesson> consultLessonList = oaScbConsultlessonService
				.selectConsultUnLessonList();

		return JSONArray.toJSONString(consultLessonList);
	}

	/**
	 * 
	 * 批量解冻
	 * 
	 * @param str
	 * @return
	 */
	@RequestMapping(value = "/moveunUseLesson", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object moveunUseLesson(@RequestParam String[] str) {
		int[] id = new int[str.length];

		for (int i = 0; i < str.length; i++) {
			id[i] = Integer.parseInt(str[i]);
		}
		oaScbConsultlessonService.moveUnuseLesson(id);
		return "成功！";

	}

	/**
	 * 跳转方式页面
	 * 
	 */
	@RequestMapping(value = "/conDirectorway", method = RequestMethod.GET)
	public String conDirectorway() {

		return "marketDepartment/consultDirectorWay";

	}

	/**
	 * 查询方式列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "/conWayquery", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object conWayquery() {

		List<OaScbConsultway> consultWayList = oaScbConsultwayService
				.selectConsultWay();
		return JSONArray.toJSONString(consultWayList);
	}

	/**
	 * 添加方式
	 * 
	 * @param oaScbConsultway
	 * @return
	 */
	@RequestMapping(value = "/addWay", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object addWay(OaScbConsultway oaScbConsultway) {
		oaScbConsultwayService.addconsultway(oaScbConsultway);
		return "成功！";
	}

	/**
	 * 
	 * 批量冻结方式
	 * 
	 * @param str
	 * @return
	 */
	@RequestMapping(value = "/unUseWay", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object unUseWay(@RequestParam String[] str) {
		int[] id = new int[str.length];

		for (int i = 0; i < str.length; i++) {
			id[i] = Integer.parseInt(str[i]);
		}
		oaScbConsultwayService.checkUnuseWay(id);
		return "成功！";

	}

	/**
	 * 修改方式名称
	 * 
	 * @param oaScbConsultway
	 * @return
	 */
	@RequestMapping(value = "/editWayName", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object editWayName(OaScbConsultway oaScbConsultway) {
		oaScbConsultwayService.editWayName(oaScbConsultway);
		return "成功！";
	}

	/**
	 * 跳转无效方式页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/moveUnWay", method = RequestMethod.GET)
	public String moveUnWay() {
		return "marketDepartment/consultDirectorUnWay";

	}

	/**
	 * 无效页面显示
	 */
	@RequestMapping(value = "/conUnWayquery", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object conUnWayquery() {

		List<OaScbConsultway> consultWayList = oaScbConsultwayService
				.selectConsultUnWay();
		return JSONArray.toJSONString(consultWayList);
	}

	/**
	 * 批量解除冻结
	 * 
	 * @param str
	 * @return
	 */
	@RequestMapping(value = "/moveunUseWay", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object moveunUseWay(@RequestParam String[] str) {
		int[] id = new int[str.length];

		for (int i = 0; i < str.length; i++) {
			id[i] = Integer.parseInt(str[i]);
		}
		oaScbConsultwayService.moveUnuseWay(id);
		return "成功！";

	}

	/**
	 * 导入咨询量
	 * 
	 */
	@RequestMapping(value = "/daoruconsulter", method = RequestMethod.GET)
	public String daoruconsulter() {

		return "marketDepartment/DaoRu";
	}

	/**
	 * 导入
	 * 
	 * @throws IOException
	 * @throws ParseException
	 * 
	 */

	@RequestMapping(value = "/upload", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object daoruCon(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException, ParseException {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM");

		// 构建文件保存的目录 /

		String logoPathDir = "/upload/" + dateformat.format(new Date());
		// 得到文件保存目录的真实路径 /

		String logoRealPathDir = request.getSession().getServletContext()
				.getRealPath(logoPathDir);
		// 根据真实路径创建目录 /

		File logoSaveFile = new File(logoRealPathDir);
		if (!logoSaveFile.exists())
			logoSaveFile.mkdirs();
		// 页面控件的文件流 /

		// MultipartFile multipartFile = multipartRequest.getFile("file");
		file = multipartRequest.getFile("file");
		// 获取文件的后缀 /

		String suffix = file.getOriginalFilename().substring(
				file.getOriginalFilename().lastIndexOf("."));
		// 使用UUID生成文件名称 /

		String logImageName = UUID.randomUUID().toString() + suffix;// 构建文件名称
		// 拼成完整的文件保存路径加文件 /

		String filePath = logoRealPathDir + File.separator + logImageName;
		File file1 = new File(filePath);
		try {
			file.transferTo(file1);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 打印出上传到服务器的文件的绝对路径 /

		List<OaScbDaoRuCon> list = DaoruExcelUtil.readXls(filePath);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		OaScbDaoRuCon oaScbDaoRuCon = null;
		OaScbConsulter oaScbConsulter = null;
		int sex;
		int consultTeacher;
		int consultWay;
		int consultLesson;
		int rank;
		int education;
		int status;
		for (int i = 0; i < list.size(); i++) {
			oaScbDaoRuCon = list.get(i);
			oaScbConsulter = new OaScbConsulter();
			
			oaScbConsulter.setId(Integer.parseInt(oaScbDaoRuCon.getId()));
			oaScbConsulter.setName(oaScbDaoRuCon.getName());
			if(oaScbDaoRuCon.getAge()==null || oaScbDaoRuCon.getAge().equals("")){
				oaScbConsulter.setAge(1);
			}else{
				oaScbConsulter.setAge(Integer.parseInt(oaScbDaoRuCon.getAge()));
			}
			
			sex = oaScbDaoRuCon.getSex().equals("男")?1:2;
			oaScbConsulter.setSex(sex);
			oaScbConsulter.setTelphone1(oaScbDaoRuCon.getTelphone1());
			if(oaScbDaoRuCon.getTelphone2()==null || oaScbDaoRuCon.getTelphone2().equals("")){
				
			}else{
				oaScbConsulter.setTelphone2(oaScbDaoRuCon.getTelphone2());
			}
			if(oaScbDaoRuCon.getFirstConsultTime()==null || oaScbDaoRuCon.getFirstConsultTime().equals("")){
			
			}else{
				oaScbConsulter.setFirstConsultTime(sdf.parse(oaScbDaoRuCon.getFirstConsultTime()));
			}
			if(oaScbDaoRuCon.getWechat()==null || oaScbDaoRuCon.getWechat().equals("")){
				
			}else{
				oaScbConsulter.setWechat(oaScbDaoRuCon.getWechat());
			}
			if(oaScbDaoRuCon.getCity()==null || oaScbDaoRuCon.getCity().equals("")){
				
			}else{
				oaScbConsulter.setCity(oaScbDaoRuCon.getCity());
			}
			if(oaScbDaoRuCon.getDistrict()==null || oaScbDaoRuCon.getDistrict().equals("")){
				
			}else{
				oaScbConsulter.setDistrict(oaScbDaoRuCon.getDistrict());
			}
			if(oaScbDaoRuCon.getSpecialty()==null || oaScbDaoRuCon.getSpecialty().equals("")){
				oaScbConsulter.setSpecialty(null);
			}else{
				oaScbConsulter.setSpecialty(oaScbDaoRuCon.getSpecialty());
			}
			if(oaScbDaoRuCon.getKeywords()==null || oaScbDaoRuCon.getKeywords().equals("")){
				
			}else{
				oaScbConsulter.setKeywords(oaScbDaoRuCon.getKeywords());
			}
			if(oaScbDaoRuCon.getInfoSource()==null || oaScbDaoRuCon.getInfoSource().equals("")){
				
			}else{
				oaScbConsulter.setInfoSource(oaScbDaoRuCon.getInfoSource());
			}
			
			if(oaScbDaoRuCon.getConsultTeacher()==null || oaScbDaoRuCon.getConsultTeacher().equals("无")){
				oaScbConsulter.setConsultTeacherName(null);
				oaScbConsulter.setConsultTeacher(0);
			}else{
				consultTeacher = oaScbConsulterService.selectTeacherIdByName(oaScbDaoRuCon.getConsultTeacher());
				oaScbConsulter.setConsultTeacherName(oaScbDaoRuCon.getConsultTeacher());
				oaScbConsulter.setConsultTeacher(consultTeacher);
			}
			consultWay = oaScbConsulterService.selectWayIdByName(oaScbDaoRuCon.getConsultWay());
			oaScbConsulter.setConsultwayName(oaScbDaoRuCon.getConsultWay());
			oaScbConsulter.setConsultWay(consultWay);
			if(oaScbDaoRuCon.getConsultLesson()==null || oaScbDaoRuCon.getConsultLesson().equals("")){
				oaScbConsulter.setConsultLessonName(null);
				oaScbConsulter.setConsultLesson(0);
			}else{
				consultLesson = oaScbConsulterService.selectLessonIdByName(oaScbDaoRuCon.getConsultLesson());
				
			}
			if(oaScbDaoRuCon.getRank()==null || oaScbDaoRuCon.getRank().equals("")){
				oaScbConsulter.setRankName(null);
				oaScbConsulter.setRank(0);
			}else{
				rank = oaScbConsulterService.selectRankIdByName(oaScbDaoRuCon.getRank());
				oaScbConsulter.setRankName(oaScbDaoRuCon.getRank());
				oaScbConsulter.setRank(rank);
			}
			
			if(oaScbDaoRuCon.getEducation()==null || oaScbDaoRuCon.getEducation().equals("")){
				oaScbConsulter.setEducation(0);
			}else{
				education = oaScbConsulterService.selectEducationIdByName(oaScbDaoRuCon.getEducation());
				oaScbConsulter.setEducationName(oaScbDaoRuCon.getEducation());
				oaScbConsulter.setEducation(education);
			}
			if(oaScbDaoRuCon.getStatus()==null || oaScbDaoRuCon.getStatus().equals("")){
				oaScbConsulter.setStatus(0);
			}else{
				status = oaScbConsulterService.selectStatusIdByName(oaScbDaoRuCon.getStatus());
				oaScbConsulter.setStatus(status);
			}
			
			oaScbConsulter.setAllotstatus(1);
			oaScbConsulter.setEnrollStatus(1);
			oaScbConsulter.setDeclareStatus(1);
			oaScbConsulter.setInfoStatus(2);
			oaScbConsulter.setIdentityStatus(2);
			oaScbConsulterService.daoruCon(oaScbConsulter);	
		}
		return "成功！";
	}
	@RequestMapping(value="/historyCon",method=RequestMethod.GET)
	public String historyCon(){
		return "marketDepartment/consultDirectorHistory";
	}
	
	@RequestMapping(value="/marketLSSelect",method=RequestMethod.GET)
	public String historyConss(){
		return "marketDepartment/marketLSSelect";
	}
	
	/**
	 * 跳转咨询助理的历史量
	 * @param index
	 * @param pageSize
	 * @param firstConsultTimes
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value="/consultAssistanthistoryCon",method=RequestMethod.GET)
	public String consultAssistanthistoryCon(){
		return "marketDepartment/consultAssistantHistory";
	}
	
	/**
	 * 跳转重复量
	 */
	@RequestMapping(value="/consultDirectorChongfu")
	public String chongfu(){
		return "marketDepartment/consultDirectorChongfu";
	}
	
	@RequestMapping(value = "/historyquery", produces = "application/json;charset=utf-8")
	@ResponseBody
	public Object historyquery(@RequestParam String index,@RequestParam String pageSize,
			String firstConsultTimes) throws ParseException{
		
		
		if (index == null || index.equals("")) {
			index = "0";
		}

		if (pageSize == null || pageSize.equals("")) {
			pageSize = "10";
		}
		Map<String, Integer> map = new HashMap<String, Integer>();
		int pageNum = Integer.parseInt(pageSize);
		int totalCount = oaScbConsulterService.selectHistoryCount();
		int pageCount= totalCount%pageNum==0?totalCount/pageNum:totalCount/pageNum+1;
		map.put("index",(Integer.parseInt(index) - 1) * pageNum);
		map.put("pageSize", pageNum);
		List<OaScbConsulter> hisList = oaScbConsulterService.selectHistoryCon(map);
		
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("hisList", hisList);
		hashmap.put("index", Integer.parseInt(index));
		hashmap.put("totalCount", totalCount);
		hashmap.put("pageCount", pageCount);
		
		return JSONArray.toJSONString(hashmap);
		
		
	}
	/**
	 * 查询重复量
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/chongfu")
	public Object chongfu1(String pagecount,String pagesize){
		if(pagecount!=null){
			Integer num=Integer.valueOf(pagecount);
			Integer pagesize1=Integer.valueOf(pagesize);
			List<OaScbConsulter> oas=oaScbConsulterService.chongfu((num-1)*pagesize1, pagesize1);
			List<OaScbConsulter> count=oaScbConsulterService.chongfuTotacount();
			Page p=new Page();
			 p.setPageSize(pagesize1);
	            p.setTotalCount(count.size());
            p.setCurrentPageNo(num);
           
            p.setOsa(oas);
        
    	    return JSON.toJSON(p);
		}
	  return "";
	}
	/**
	 * 查询重复de人
	 * @return
	 */

	@RequestMapping(value="/chong")
	public String chongfu2(String name,HttpSession session){
		session.setAttribute("name", name);
	  return "marketDepartment/consultDirectorselectCF";
	}
	@ResponseBody
	@RequestMapping(value="/selectCF")
	public Object chongfu3(	HttpSession session,String pagecount,String pagesize) throws UnsupportedEncodingException{
		if(pagecount!=null){
			int num=Integer.valueOf(pagecount);
			Integer pageSize=Integer.valueOf(pagesize);
			String name=(String) session.getAttribute("name");
		/*    String asd=new String(name.getBytes("ISO-8859-1"),"UTF-8");*/
			List<OaScbConsulter> oas=oaScbConsulterService.selectCF(name,(num-1)*pageSize, pageSize);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

			for (OaScbConsulter oaScbConsulter2 : oas) {
				if(oaScbConsulter2.getFirstConsultTime()!=null){
					oaScbConsulter2.setFirstConsultTimes(sdf.format(oaScbConsulter2.getFirstConsultTime()));
				}else{
					oaScbConsulter2.setFirstConsultTimes("暂无");
				}
			}
			Integer count=oaScbConsulterService.CFtotacount(name);
			Page p=new Page();
		    p.setPageSize(Integer.valueOf(pageSize));
            p.setTotalCount(count);
            p.setCurrentPageNo(num);
        
            p.setOsa(oas);

    	    return JSON.toJSON(p);
		}
	  return "";
	}
	/**
	 * 是否重复
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@RequestMapping(value="/updexsist")
	public Object regsi( Integer id,String employee_id, String repetitionStatus,HttpServletRequest resquest,HttpServletResponse response) throws UnsupportedEncodingException{
		Integer count;
		if(repetitionStatus=="1"){
			repetitionStatus="0";
			 count=oaScbConsulterService.updexsist(id, repetitionStatus);
		}else{
			repetitionStatus="1";
			 OaScbOperation operation=new OaScbOperation();
			   operation.setEmployee_id(Integer.parseInt(employee_id));
				operation.setTime(new Date());
				operation.setConsulter_id(id);
				operation.setContent("确定不是重复量");
				OaScbOperationService.Insertoperation(operation);
			 count=oaScbConsulterService.updexsist(id, repetitionStatus);
		}
		if(count>0){
			return 1;
		}else{
			return 0;
		}
		
	}

	/*
	 * 删除
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@RequestMapping(value="/delete1")
	public Object delete( String employee_id,Integer id) {
		 OaScbOperation operation=new OaScbOperation();
		   operation.setEmployee_id(Integer.parseInt(employee_id));
		   String Consult_name=OaScbOperationService.operationSelect(id);
			operation.setTime(new Date());
			operation.setContent("进行了删除,删除的咨询量是"+Consult_name);
			OaScbOperationService.Insertoperation(operation);
			OaScbOperationService.operationDelete(id);
	   Integer count=oaScbConsulterService.delete(id);
	  
		if(count>0){
			return 1;
		}else{
			return 0;
		}
	}

	 /**
	     * 批量删除
	     */
	   @ResponseBody
		@RequestMapping(value="delAll")
		public Object dedl(@RequestParam(value = "array[]") Integer[] array,String employee_id) throws IOException{
		   String flag=null;
	     for (int i = 0; i < array.length; i++) {
	    	 OaScbOperation operation=new OaScbOperation();
			 String Consult_name=OaScbOperationService.operationSelect(array[i]);
			   operation.setEmployee_id(Integer.parseInt(employee_id));
				operation.setTime(new Date());
			operation.setContent("进行了删除,删除的咨询量是"+Consult_name);
			OaScbOperationService.Insertoperation(operation);
	    OaScbOperationService.operationDelete(array[i]);
	    	    if(oaScbConsulterService.delete(array[i])>0){
	    	    	flag="true";
	    	    }else{
	    	    	flag="false";
	    	    }
					
		}
	     return flag;
		}
}

